/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2024 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

library PertinentHistory version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommon
include FHIRHelpers version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include ScreeningDue version '1.0.0'
include ScreeningIncomplete version '1.0.0'

context Patient

define PertinentHistory:
{
  patientInfo: {
    name: PatientName,
    id: Patient.identifier,
    isPregnant: DataElements.Pregnant,
    dateOfBirth: Patient.birthDate,
    sexAtBirth: BirthSexText,
    age: AgeInYears(),
    gender: GenderText,
    primaryLanguage: LanguageText,
    race: RaceText + '; ' + EthnicityText
  },
  patientHistory: {
    conditions: PertinentConditionsSummary,
    familyMemberHistory: PertinentFamilyMemberHistorySummary,
    observations: PertinentObservationsSummary,
    procedures: PertinentProceduresSummary,
    diagnosticReports: DiagnosticReportsSummary,
    encounters: PertinentEncountersSummary,
    episodeOfCares: PertinentEpisodesOfCareSummary,
    requests: PertinentRequestsSummary
  }
}

//------------------------------------------------------------------------------
// PERTINENT DEMOGRAPHICS
//------------------------------------------------------------------------------

define PatientName:
  if Exists(UsualPatientName) then
    FormatPatientName(First(UsualPatientName))
  else if Exists(OfficialPatientName) then
    FormatPatientName(First(OfficialPatientName))
  else
    FormatPatientName(First(Patient.name))

define UsualPatientName:
  Patient.name N
    where N.use = 'usual'
    return N

define OfficialPatientName:
  Patient.name N
    where N.use = 'official'
    return N

define function FormatPatientName(name FHIR.HumanName):
  First(name.given) + ' ' + name.family

define BirthSexText:
  if DataElements.BirthSexCode = 'F' then 'Female'
  else if DataElements.BirthSexCode = 'M' then 'Male'
  else 'Unknown'  

define GenderText:
  if Exists(DataElements.GenderIdentityExtension) 
  then DataElements.GenderIdentityExtension[0].value.coding[0].code.value
  else Patient.gender.value  

define LanguageText:
  case
    when LanguageTextAbbreviated = 'en' then 'English'
    when LanguageTextAbbreviated = 'es' then 'Spanish'
    when LanguageTextAbbreviated = 'zh' then 'Chinese'
    when LanguageTextAbbreviated = 'fr' then 'French'
    when LanguageTextAbbreviated = 'tl' then 'Tagalog'
    when LanguageTextAbbreviated = 'vi' then 'Vietnamese'
    else 'Unknown'
  end  

define LanguageTextAbbreviated:
  Coalesce( {CommunicationLanguageCode, CommunicationLanguageText, LanguageCode} )

define CommunicationLanguageCode:
  Patient.communication.language.coding.code.value[0]

define CommunicationLanguageText:
  Patient.communication.language.text.value[0]

define LanguageCode:
  Patient.language.value

define RaceText:
  Coalesce(Coalesce(RaceExtensionValues))

define RaceExtensionValues:
  (Patient.extension) E 
    where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'
    return (E.extension) X where X.url = 'text' return FHIRHelpers.ToString(X.value as FHIR.string)

define EthnicityText:
  Coalesce(Coalesce(EthnicityExtensionValues))

define EthnicityExtensionValues:
  (Patient.extension) E
    where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity'
    return (E.extension) X where X.url = 'text' return FHIRHelpers.ToString(X.value as FHIR.string)  

//------------------------------------------------------------------------------
// PERTINENT CONDITIONS
//------------------------------------------------------------------------------

define PertinentConditions:
  DataElements.ColorectalCancerDiagnoses union
  DataElements.ColorectalCancerConditions union
  DataElements.LynchSyndromeConditions union
  DataElements.FamilialAdenomatousPolyposisConditions union
  DataElements.AttenuatedFamilialAdenomatousPolyposisConditions union
  DataElements.MUTYHAssociatedPolyposisConditions union
  DataElements.SerratedPolyposisConditions union
  DataElements.JuvenilePolyposisConditions union
  DataElements.PeutzJegherSyndromeConditions union
  DataElements.CowdenSyndromeConditions union
  DataElements.UlcerativeColitisConditions union
  DataElements.CrohnsDiseaseConditions union
  DataElements.PotentiallyPrecancerousPolypsConditions 

define PertinentConditionsSummary:
  (PertinentConditions) C
  return {
    name: Common.ConceptText(C.code),
    value: C.clinicalStatus.coding[0].code.value,
    date: Common.DateTimeText(
      Coalesce(
        C.onset as FHIR.dateTime,
        C.recordedDate
      )
    ),
    reference: 'Condition/' + C.id,
    edited: HasBeenLocallyEdited(C)
  }
  sort by (date as String) desc

//------------------------------------------------------------------------------
// PERTINENT FAMILY MEMBER HISTORY
//------------------------------------------------------------------------------  

define PertinentFamilyMemberHistory:
  DataElements.FamilyHxCRCConditions union
  DataElements.FamilyHxPrecancerousPolypConditions union 
  DataElements.FamilyHxDiagnosisOfCRC union
  DataElements.FamilyHxDiagnosisOfHistoryOfCRC union
  DataElements.FamilyHxDiagnosisOfPrecancerousPolyp

define PertinentFamilyMemberHistorySummary:
  (PertinentFamilyMemberHistory) FMH
    return
      FMH.conditions C return {
        name: Common.ConceptText(FMH.familyMemberHistory.relationship),
        value: Common.ConceptText(C.code),
        onset: Onset(C),
        reference: 'FamilyMemberHistory/' + FMH.familyMemberHistory.id,
        edited: HasBeenLocallyEdited(FMH.familyMemberHistory)
  }
  
//------------------------------------------------------------------------------
// PERTINENT OBSERVATIONS
//------------------------------------------------------------------------------

define PertinentObservations:
  (DataElements.NewOrWorseningColorectalSymptomsObservations union
  DataElements.ReducedLifeExpectancyObservations)
  except {null}

define PertinentObservationsSummary:
  (PertinentObservations) Obs
  return {
    name: Common.ConceptText(Obs.code),
    value: Common.ConceptText(Obs.value),
    date: Common.ObservationDateString(Obs),
    reference: 'Observation/' + Obs.id,
    edited: HasBeenLocallyEdited(Obs)
  }
  sort by (date as String) desc

//------------------------------------------------------------------------------
// PERTINENT PROCEDURES
//------------------------------------------------------------------------------

define PertinentProcedures:
  DataElements.TotalColectomyProcedures 

define PertinentProceduresSummary:
  (PertinentProcedures) P
  return {
    name: Common.ConceptText(P.code),
    value: P.status.value,
    date: Common.ProcedureDateString(P),
    reference: 'Procedure/' + P.id,
    edited: HasBeenLocallyEdited(P)
  } sort by date desc  

//------------------------------------------------------------------------------
// PERTINENT DIAGNOSTIC REPORTS
//------------------------------------------------------------------------------

define DiagnosticReportsSummary:
  (
    FOBTDiagnosticReportsSummary
    union sDNAFITDiagnosticReportsSummary
    union ColonoscopyDiagnosticReportsSummary
    union CTColonographyDiagnosticReportsSummary
    union FlexSigDiagnosticReportsSummary
  ) D
  sort by date desc

define FOBTDiagnosticReportsSummary:
  FormatReports(DataElements.FOBTDiagnosticReports, DataElements.FOBTObservations, 'Fecal Occult Blood Test')

define sDNAFITDiagnosticReportsSummary:
  FormatReports(DataElements.StoolDNAFITDiagnosticReports, DataElements.StoolDNAFITObservations, 'Stool DNA FIT Test')

define ColonoscopyDiagnosticReportsSummary:
  FormatReports(DataElements.ColonoscopyDiagnosticReports, DataElements.ColonoscopyObservations, 'Colonoscopy')

define CTColonographyDiagnosticReportsSummary:
  FormatReports(DataElements.CTColonographyDiagnosticReports, DataElements.CTColonographyObservations, 'CT Colonography')

define FlexSigDiagnosticReportsSummary:
  FormatReports(DataElements.FlexSigDiagnosticReports, DataElements.FlexSigObservations, 'Flexible Sigmoidoscopy')


//TODO: These are in Breast, could consider equivalents needed for colorectal - like polypectomy?
//define BiopsyDiagnosticReportsSummary:
//  FormatReports(DataElements.BiopsyDiagnosticReports, DataElements.BiopsyObservations, 'Breast Biopsy')  

//define IncompleteBiopsyDiagnosticReportsSummary:
//  FormatReports(ScreeningTestIncomplete.IncompleteScreeningPathology, DataElements.BiopsyObservations, 'Breast Biopsy')    

//------------------------------------------------------------------------------
// PERTINENT ENCOUNTERS
//------------------------------------------------------------------------------

define PertinentEncounters:
  DataElements.AllColorectalSymptomEncounters

define PertinentEncountersSummary:
  (PertinentEncounters) E
  return {
    name: Common.ConceptText(E.reasonCode[0]),
    value: E.status,
    date: Common.DateTimeText((E.period as FHIR.Period)."start") +
      ' to ' +
      Common.DateTimeText((E.period as FHIR.Period)."end"),
    reference: 'Encounter/' + E.id
  }

//------------------------------------------------------------------------------
// PERTINENT EPISODES OF CARE
//------------------------------------------------------------------------------
  define PertinentEpisodesOfCare:
    DataElements.PregnancyEpisodesOfCare

define PertinentEpisodesOfCareSummary:
  (PertinentEpisodesOfCare) E
  return {
    name: Common.ConceptText(E.type[0]),
    value: E.status.value,
    date:
      displayStartDate(Common.PeriodObject(E.period)."Start") +
      ' to ' +
      displayEndDate(Common.PeriodObject(E.period)."End"),
    reference: 'EpisodeOfCare/' + E.id,
    edited: HasBeenLocallyEdited(E)
  }
  sort by (date as String) desc


//------------------------------------------------------------------------------
// PERTINENT REQUESTS
//------------------------------------------------------------------------------  

define DueOrOverdueScreeningSummary:
  (ScreeningDue.DueOrOverdue) R
    return
  {
    name: Common.ConceptText(R.code),
    intent: R.intent, 
    occurrence: R.nextDue,
    flag: R.flag.display,
    plannedRepeat: R.plannedRepeat
  }  

define IncompleteScreeningOrdersSummary:
  (ScreeningIncomplete.IncompleteScreeningOrders) R
    return
  {
    name: Common.ConceptText(R.code),
    intent: R.intent, 
    occurence: R.occurrence as FHIR.dateTime,
    flag: null,
    plannedRepeat: null
  }      

define PertinentRequestsSummary:
  DueOrOverdueScreeningSummary union
    IncompleteScreeningOrdersSummary

//------------------------------------------------------------------------------
// FUNCTIONS
//------------------------------------------------------------------------------

define function HasBeenLocallyEdited(R FHIR.DomainResource):
  R.extension ext
    where
      ext.url = 'http://cancerscreeningcds.github.io/crcsm-cds/StructureDefinition/crcsm-edited'
      and ext.value as FHIR.boolean = true

define function Onset(c FHIR.FamilyMemberHistory.Condition):
  Coalesce( List{
    Common.QuantityText(c.onset as FHIR.Age),
    Common.PeriodObject(c.onset as FHIR.Period),
    Common.RangeObject(c.onset as FHIR.Range),
    (c.onset as FHIR.string).value
  })      

define function FormatReports(DrList List<DiagnosticReport>, ObsList List<Observation>, ReportType String):
  (DrList) D
  let CollatedCodes: CRCSMCommon.CollateConclusionCodes(D,ObsList)
  return {
    name: ReportType,
    longName: Common.ConceptText(D.code),
    value: CollatedCodes, //TODO: what to return for report value??
    date: Common.DiagnosticReportDateString(D),
    reference: 'DiagnosticReport/' + D.id,
    edited: HasBeenLocallyEdited(D)
  }      

define function displayStartDate(startDate String):
  if startDate is not null then
    startDate
  else
    'no start date available'

define function displayEndDate(endDate String):
  if endDate is not null then
    endDate
  else
    'no end date available'
