library DataElements version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'
codesystem "ICD-9": 'http://hl7.org/fhir/sid/icd-9-cm'
codesystem "ICD-10": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "CONDCLINSTATUS": 'http://terminology.hl7.org/CodeSystem/condition-clinical'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "v3-RoleCode": 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'

code "Condition active code": 'active' from "CONDCLINSTATUS" display 'Active'
code "Condition inactive code": 'inactive' from "CONDCLINSTATUS" display 'Inactive'
code "Condition remission code": 'remission' from "CONDCLINSTATUS" display 'Remission'
code "Condition resolved code": 'resolved' from "CONDCLINSTATUS" display 'Resolved'
code "Reduced life expectancy indicator": 'ReducedLifeExpectancyIndicator' from "LOCAL" display 'Reduced life expectancy indicator'
code "father": 'FTH' from "v3-RoleCode" display 'father'
code "mother": 'MTH' from "v3-RoleCode" display 'mother'
code "child": 'CHILD' from "v3-RoleCode" display 'child'
code "son": 'SONC' from "v3-RoleCode" display 'son'
code "daughter": 'DAUC' from "v3-RoleCode" display 'daughter'
code "natural father": 'NFTH' from "v3-RoleCode" display 'natural father'
code "natural mother": 'NMTH' from "v3-RoleCode" display 'natural mother'
code "natural mother of fetus": 'NMTH' from "v3-RoleCode" display 'natural mother of fetus'
code "natural child": 'NCHILD' from "v3-RoleCode" display 'natural child'
code "natural son": 'SON' from "v3-RoleCode" display 'natural son'
code "natural daughter": 'DAU' from "v3-RoleCode" display 'natural daughter'
code "FAP SNOMED CT": '72900001' from "SNOMED-CT" display 'Familial multiple polyposis syndrome (disorder)'
code "FAP ICD-10-CM": 'D13.91' from "ICD-10" display 'Familial adenomatous polyposis'
code "AFAP SNOMED CT": '715866009' from "SNOMED-CT" display 'Attenuated familial adenomatous polyposis (disorder)'
code "AFAP ICD-10-CM": 'D13.91' from "ICD-10" display 'Familial adenomatous polyposis'

concept "Condition inactive": { "Condition inactive code" } display 'Inactive'
concept "Condition remission": { "Condition remission code" } display 'Remission'
concept "Condition resolved": { "Condition resolved code" } display 'Resolved'
concept "Condition Active": { "Condition active code" } display 'Active'
concept "FTH": { "father", "natural father" } display 'father'
concept "MTH": { "mother", "natural mother" } display 'mother'
concept "CHILD": { "child", "natural child" } display 'child'
concept "SON": { "son", "natural son" } display 'son'
concept "DAU": { "daughter", "natural daughter" } display 'daughter'
concept "FAP": {"FAP SNOMED CT", "FAP ICD-10-CM"} display 'Familial adenomatous polyposis'
concept "AFAP": {"AFAP SNOMED CT", "AFAP ICD-10-CM"} display 'Attenuated familial adenomatous polyposis'

// Colorectal diagnoses, procedures, and observations
valueset "COLORECTAL CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1001' 
//TODO: I tried 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.325' but does not exist on vsac
valueset "TOTAL COLECTOMY PROCEDURE": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1019'
valueset "ULCERATIVE COLITIS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1078.879' 
valueset "CROHNS DISEASE": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1078.879' 
valueset "POTENTIALLY PRECANCEROUS POLYPS FINDINGS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
// TODO: replace placeholder  
valueset "COLORECTAL CANCER FINDINGS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1001' 
// TODO: replace placeholder 
valueset "VSACColonoscopy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1020'
valueset "VSACsDNAFIT": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1145'
valueset "VSACCTC": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1038'
valueset "VSACFlexSig": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1010'
valueset "COLONOSCOPY ORDERS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1020'
// TODO: replace placeholder  

// Standard codes
code "COLONOSCOPY STUDY": '18746-8' from LOINC display 'Colonoscopy study'
code "FIT TEST": '29771-3' from LOINC display 'Hemoglobin.gastrointestinal.lower [Presence] in Stool by Immunoassay'
code "gFOBT TEST": '2335-8' from LOINC display 'Hemoglobin.gastrointestinal [Presence] in Stool'
code "LYNCH SYNDROME": '716318002' from "SNOMED-CT" display 'Lynch syndrome (disorder)'
code "MUTYH-ASSOCIATED POLYPOSIS SYNDROME": '423471004' from "SNOMED-CT" display 'MYH-associated polyposis (disorder)'
code "SERRATED POLYPOSIS SYNDROME": '763536006' from "SNOMED-CT" display 'Hyperplastic polyposis syndrome (disorder)'
code "JUVENILE POLYPOSIS SYNDROME": '9273005' from "SNOMED-CT" display 'Juvenile polyposis syndrome (disorder)'
code "PEUTZ-JEGHER SYNDROME": '54411001' from "SNOMED-CT" display 'Peutz-Jeghers syndrome (disorder)'
code "COWDEN SYNDROME": '58037000' from "SNOMED-CT" display 'Cowden syndrome (disorder)'
code "FAMILIAL COLORECTAL CANCER TYPE X": '1197359006' from "SNOMED-CT" display 'Familial colorectal cancer type X (disorder)'
code "FAMILY HISTORY OF POTENTIALLY PRECANCEROUS POLYPS": '429969003' from "SNOMED-CT" display 'Family history of polyp of colon (situation)'
code "POTENTIALLY PRECANCEROUS POLYPS CONDITION": '68496003' from "SNOMED-CT" display 'Polyp of colon (disorder)'
code "HISTORY OF COLORECTAL CANCER": '1286880003' from "SNOMED-CT" display 'History of malignant neoplasm of cecum and/or colon and/or rectum (situation)'
code "FAMILY HISTORY OF COLORECTAL CANCER": '312824007' from "SNOMED-CT" display 'Family history of cancer of colon (situation)'
code "Effective bowel preparation for procedure": ' 703141002 ' from "SNOMED-CT" display 'Effective bowel preparation for procedure (finding)'

// Non-standard or "local" codes
code "New or worsening colorectal symptoms": 'ColorectalSymptoms' from "LOCAL" display 'New or worsening colorectal symptoms'
code "Relative with hereditary syndrome": 'RelativeHereditarySyndrome' from "LOCAL" display 'Relative with hereditary syndrome'
code "CRADSC0": 'CRADSC0' from "LOCAL" display 'C-RADS category C0'
code "CRADSC2a": 'CRADSC2a' from "LOCAL" display 'C-RADS category C2a'
code "CRADSC2": 'CRADSC2' from "LOCAL" display 'C-RADS category C2'
code "CRADSC3": 'CRADSC3' from "LOCAL" display 'C-RADS category C3'
code "CRADSC4": 'CRADSC4' from "LOCAL" display 'C-RADS category C4'

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

parameter ObservationLookbackPeriod default 14 days
parameter SymptomaticLookBack default 14 days

/***** BEGIN CDS LOGIC ********************************************************/

context Patient


define function ValuesFromObservation(D DiagnosticReport, ObsList List<Observation>):
  (ObsList) O
  where
    Exists( (D.result ) R where Last(Split(R.reference,'/')) =  O.id ) or
    Exists( (O.basedOn) oB where AnyTrue((D.basedOn) dB return dB = oB ) )
  return O.value as FHIR.CodeableConcept

define function CollateConclusionCodes(D DiagnosticReport, ObsList List<Observation>):
  D.conclusionCode union
  ValuesFromObservation(D, ObsList)

// if a DiagnosticReport.code has target code, then call orignial CollateConclusionCodes
// if a DiagnosticReport.code does not have target code, then return values from matched Observations
define function CollateConclusionCodes(D DiagnosticReport, ObsList List<Observation>, code System.Code):
  if FHIRHelpers.ToConcept(D.code) ~ code then
    CollateConclusionCodes(D, ObsList)
  else
    ValuesFromObservation(D, ObsList)  

define AllCompletedDiagnosticReport:
  Common.CompletedDiagnosticReport([DiagnosticReport])    

//------------------------------------------------------------------------------
// Current colorectal cancer
//------------------------------------------------------------------------------

// Conditions relevant to colorectal cancer
//    No lookback restriction

define "de-CurrentCRC":
  exists ColorectalCancerDiagnoses C
    where C.clinicalStatus !~ "Condition inactive"
      and C.clinicalStatus !~ "Condition remission"
      and C.clinicalStatus !~ "Condition resolved"

define ColorectalCancerDiagnoses:
  Common.ValidCondition([Condition: "COLORECTAL CANCER"]) 

//------------------------------------------------------------------------------
// History of total colectomy procedure
//------------------------------------------------------------------------------

define "de-TotalColectomy":
  exists TotalColectomyProcedures

define TotalColectomyProcedures:
  C3F.Completed([Procedure: "TOTAL COLECTOMY PROCEDURE"])

//------------------------------------------------------------------------------
// Colorectal symptoms
//------------------------------------------------------------------------------

// TODO: move this to events
define "de-ColorectalSignsSymptoms":
  NewOrWorseningColorectalSymptoms


// TODO: look into how to associate with current encounter rather than arbitrary lookback period
define NewOrWorseningColorectalSymptoms:
  C3F.MostRecent(
    C3F.ObservationLookBack(
      NewOrWorseningColorectalSymptomsObservations R
        where R.value is true,
      SymptomaticLookBack
    )
  ) is not null  

define NewOrWorseningColorectalSymptomsObservations:
  C3F.ObservationLookBack(
    [Observation: "New or worsening colorectal symptoms"],
    ObservationLookbackPeriod
  )  

//------------------------------------------------------------------------------
// Life expectancy
//------------------------------------------------------------------------------

define "de-lifeexp":
  ReducedLifeExpectancy

define ReducedLifeExpectancy:
  C3F.MostRecent(
    C3F.ObservationLookBack(
      ReducedLifeExpectancyObservations R
        where R.value is true,
      SymptomaticLookBack
    )
  ) is not null

define ReducedLifeExpectancyObservations:
  C3F.ObservationLookBack(
    [Observation: "Reduced life expectancy indicator"],
    ObservationLookbackPeriod
  )   

//define "de-hospice":
  // TODO: Implement logic for de-hospice

//define "de-palliative":
  // TODO: Implement logic for de-palliative

//define "de-snpltc":
  // TODO: Implement logic for de-snpltc

//define "de-frailtydementiamed":
  // TODO: Implement logic for de-frailtydementiamed

//define "de-frailtyadvillness":
  // TODO: Implement logic for de-frailtyadvillness

//------------------------------------------------------------------------------
// Personal or family history of hereditary syndrome
//------------------------------------------------------------------------------
define "de-personalHxHereditarySyndrome":
  exists LynchSyndromeConditions or exists FamilialAdenomatousPolyposisConditions or
    exists AttenuatedFamilialAdenomatousPolyposisConditions or exists MUTYHAssociatedPolyposisConditions or
    exists SerratedPolyposisConditions or exists JuvenilePolyposisConditions or exists PeutzJegherSyndromeConditions or
    exists CowdenSyndromeConditions

define LynchSyndromeConditions:
  Common.ValidCondition([Condition: code ~ "LYNCH SYNDROME"])

define FamilialAdenomatousPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "FAP"])

define AttenuatedFamilialAdenomatousPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "AFAP"])

define MUTYHAssociatedPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "MUTYH-ASSOCIATED POLYPOSIS SYNDROME"])

define SerratedPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "SERRATED POLYPOSIS SYNDROME"])

define JuvenilePolyposisConditions:
  Common.ValidCondition([Condition: code ~ "JUVENILE POLYPOSIS SYNDROME"])

define PeutzJegherSyndromeConditions:
  Common.ValidCondition([Condition: code ~ "PEUTZ-JEGHER SYNDROME"])

define CowdenSyndromeConditions:
  Common.ValidCondition([Condition: code ~ "COWDEN SYNDROME"])

define "de-famHxSyndrome":
  RelativeSyndromeObservation or exists RelativeWithSyndrome

define "RelativeSyndromeObservation":
  C3F.MostRecent(
      [Observation: "Relative with hereditary syndrome"] R
        where R.value is true
  ) is not null

define "RelativeWithSyndrome":
  [FamilyMemberHistory] F
    where 
        exists (F.condition C
          where 
          C.code ~ "LYNCH SYNDROME" or C.code ~ "FAP" or
          C.code ~ "AFAP" or C.code ~ "MUTYH-ASSOCIATED POLYPOSIS SYNDROME" or 
          C.code ~ "SERRATED POLYPOSIS SYNDROME" or C.code ~ "JUVENILE POLYPOSIS SYNDROME" or
          C.code ~ "PEUTZ-JEGHER SYNDROME" or C.code ~ "COWDEN SYNDROME" or C.code ~ "FAMILIAL COLORECTAL CANCER TYPE X"
        )

//define "de-SyndromeGeneticMarker":
//TODO: define genetic marker

//define "de-famHxGeneticMarkerSyndrome":
//TODO: define genetic marker

//------------------------------------------------------------------------------
// Personal history of IBD
//------------------------------------------------------------------------------
define "de-IBD":
  "de-UlcerativeColitis" or "de-CrohnsDisease"

define "de-UlcerativeColitis":
  exists UlcerativeColitisConditions C
    where C.clinicalStatus ~ "Condition Active"
      or C.clinicalStatus ~ "Condition remission"

define UlcerativeColitisConditions:
  Common.ValidCondition([Condition: "ULCERATIVE COLITIS"]) 

define "de-CrohnsDisease":
  exists CrohnsDiseaseConditions C
    where C.clinicalStatus ~ "Condition Active"
      or C.clinicalStatus ~ "Condition remission"

define CrohnsDiseaseConditions:
  Common.ValidCondition([Condition: "CROHNS DISEASE"]) 

//------------------------------------------------------------------------------
// Personal history of colorectal cancer
//------------------------------------------------------------------------------
define "de-HxCRC":
  InactiveOrRemissionColorectalCancerConditions or exists HistoryOfColorectalCancerConditions

define InactiveOrRemissionColorectalCancerConditions:
  exists ColorectalCancerConditions C
    where C.clinicalStatus ~ "Condition inactive"
      or C.clinicalStatus ~ "Condition remission"

define ColorectalCancerConditions:
  Common.ValidCondition([Condition: "COLORECTAL CANCER"])

define HistoryOfColorectalCancerConditions:
  Common.ValidCondition([Condition: "HISTORY OF COLORECTAL CANCER"])

//------------------------------------------------------------------------------
// Family history of colorectal cancer or advanced polyps
//------------------------------------------------------------------------------
define "de-FamilyHxCRC":
  exists FamilyHxCRCConditions 
  or exists FamilyHxDiagnosisOfCRC or exists FamilyHxDiagnosisOfHistoryOfCRC

define FamilyHxCRCConditions:
  Common.ValidCondition([Condition: "FAMILY HISTORY OF COLORECTAL CANCER"])

define FamilyHxDiagnosisOfCRC:
  [FamilyMemberHistory] F
    where 
      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
      and (
        exists (F.condition C
          where 
          C.code in "COLORECTAL CANCER"
        )
      )

define FamilyHxDiagnosisOfHistoryOfCRC:
  [FamilyMemberHistory] F
    where 
      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
      and (
        exists (F.condition C
          where 
          C.code ~ "HISTORY OF COLORECTAL CANCER"
        )
      )

define "de-FamHxAdvancedPolyps":
  exists FamilyHxPrecancerousPolypConditions 
  or exists FamilyHxDiagnosisOfPrecancerousPolyp

define FamilyHxPrecancerousPolypConditions:
  Common.ValidCondition([Condition: "FAMILY HISTORY OF POTENTIALLY PRECANCEROUS POLYPS"])

define FamilyHxDiagnosisOfPrecancerousPolyp:
  [FamilyMemberHistory] F
    where 
      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
      and (
        exists (F.condition C
          where 
          C.code ~ "POTENTIALLY PRECANCEROUS POLYPS CONDITION"
        )
      )

//------------------------------------------------------------------------------
// Personal history of potentially precancerous polyps
//------------------------------------------------------------------------------
define "de-HxPolyps":
  exists PotentiallyPrecancerousPolypsConditions or exists PrecancerousPolypsColonoscopyFindings

define "de-FindingPolyps":
  exists PrecancerousPolypsColonoscopyFindings
//TODO: this data element should be generalized to polyps from any modality, not just colonoscopy

define PotentiallyPrecancerousPolypsConditions:
  Common.ValidCondition([Condition: "POTENTIALLY PRECANCEROUS POLYPS CONDITION"])

define PrecancerousPolypsColonoscopyFindings:
  ColonoscopyDiagnosticReports D
    let cC: CollateConclusionCodes(D,ColonoscopyObservations)
    where cC in "POTENTIALLY PRECANCEROUS POLYPS FINDINGS"

define ColonoscopyDiagnosticReports:
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, ColonoscopyObservations, "COLONOSCOPY STUDY")
    ) > 0

define ColonoscopyObservations:
  [Observation: code ~ "COLONOSCOPY STUDY"]

//------------------------------------------------------------------------------
// Types of testing reports
//------------------------------------------------------------------------------
define "de-FIT":
  exists FITDiagnosticReports

define FITDiagnosticReports:
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, FITObservations, "FIT TEST")
    ) > 0

define FITObservations:
  [Observation: code ~ "FIT TEST"]

define "de-gFOBT": 
  exists gFOBTDiagnosticReports

define gFOBTDiagnosticReports:
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, gFOBTObservations, "gFOBT TEST")
    ) > 0

define gFOBTObservations:
  [Observation: code ~ "gFOBT TEST"]

define "Stool DNA-FIT test": 
  exists sDNAFITDiagnosticReports
  
define sDNAFITDiagnosticReports:  
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, sDNAFITObservations)
    ) > 0

define sDNAFITObservations:
  [Observation: code in "VSACsDNAFIT"]

define "de-Colonoscopy": 
  exists ColonoscopyDiagnosticReports

define "de-CTColonography":
  exists CTColonographyDiagnosticReports
  
define CTColonographyDiagnosticReports:  
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, CTColonographyObservations)
    ) > 0

define CTColonographyObservations:
  [Observation: code in "VSACCTC"]

define "de-FlexSig":
  exists FlexSigDiagnosticReports
  
define FlexSigDiagnosticReports:  
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, FlexSigObservations)
    ) > 0

define FlexSigObservations:
  [Observation: code in "VSACFlexSig"]

//------------------------------------------------------------------------------
// Most recent testing reports
//------------------------------------------------------------------------------

define allCRCDiagnosticReports:
  ColonoscopyDiagnosticReports union FITDiagnosticReports union gFOBTDiagnosticReports union sDNAFITDiagnosticReports union FlexSigDiagnosticReports union CTColonographyDiagnosticReports

define "de-MostRecentTestIsColonoscopy":
  Common.MostRecentDiagnosticReport(allCRCDiagnosticReports) in ColonoscopyDiagnosticReports

define "de-MostRecentTestIsCTC":
  Common.MostRecentDiagnosticReport(allCRCDiagnosticReports) in CTColonographyDiagnosticReports

define "de-MostRecentTestIsFlexSig":
  Common.MostRecentDiagnosticReport(allCRCDiagnosticReports) in FlexSigDiagnosticReports

define "de-MostRecentTestIsFIT":
  Common.MostRecentDiagnosticReport(allCRCDiagnosticReports) in FITDiagnosticReports

define "de-MostRecentTestIsgFOBT":
  Common.MostRecentDiagnosticReport(allCRCDiagnosticReports) in gFOBTDiagnosticReports

define "de-MostRecentTestIssDNAFIT":
  Common.MostRecentDiagnosticReport(allCRCDiagnosticReports) in sDNAFITDiagnosticReports

define "de-pendingOrderReferralForCRCTest":
  exists pendingColonoscopyOrders

define pendingColonoscopyOrders:
  PendingColonoscopyOrdersWithoutSubsequentReport O
    return O.request

define PendingColonoscopyOrdersWithoutSubsequentReport:
  PendingColonoscopyOrdersReportDate O
    where O.lastReportDate is null
    or (O.request.occurrence as FHIR.dateTime is not null and O.lastReportDate <= O.request.occurrence as FHIR.dateTime)
    or (O.request.occurrence as FHIR.Period is not null 
      and (O.lastReportDate in C3F.PeriodToInterval(O.request.occurrence as FHIR.Period)) is not true
    )

//TODO: determine how to look for non-test result, like specialty consult note
define PendingColonoscopyOrdersReportDate:
  ActiveColonoscopyOrders O
  let lastReport: CRCSMCommonFunctions.MostRecentDiagnosticReportByCode(O.code),
  lastReportDate: Common.DiagnosticReportDate(lastReport)
  return {
    request: O,
    lastReportDate: lastReportDate
  }

define ActiveColonoscopyOrders:
  [ServiceRequest: "COLONOSCOPY ORDERS"] O
    where O.status in {'active'}
    and O.intent in {'order'}

//------------------------------------------------------------------------------
// Findings of testing reports
//------------------------------------------------------------------------------

define "de-FindingPolypsFlexSig":
  FlexSigDiagnosticReports D
    let cC: CollateConclusionCodes(D,FlexSigObservations)
    where cC in "POTENTIALLY PRECANCEROUS POLYPS FINDINGS"
//TODO: this is a spinoff of de-FindingPolyps, which should be generalized for any modality

define "de-FindingCRCFlexSig":
  FlexSigDiagnosticReports D
    let cC: CollateConclusionCodes(D,FlexSigObservations)
    where cC in "COLORECTAL CANCER FINDINGS"
//TODO: this is a spinoff of de-FindingCRC, which should be generalized for any modality

define "de-AdequateBowelPrepFlexSig":
  FlexSigDiagnosticReports D
    let cC: CollateConclusionCodes(D,FlexSigObservations)
    where exists(cC.coding C where FHIRHelpers.ToCode(C) ~ "Effective bowel preparation for procedure") 
//TODO: this is a spinoff of de-AdequateBowelPrep, which should be generalized for any modality

define "de-CTCInconclusive":
  CTColonographyDiagnosticReports D
    let cC: CollateConclusionCodes(D,CTColonographyObservations)
    where exists(cC.coding C where FHIRHelpers.ToCode(C) ~ "CRADSC0") 

define "de-CTCFindingPolyps":
  CTColonographyDiagnosticReports D
    let cC: CollateConclusionCodes(D,CTColonographyObservations)
    where exists(cC.coding C where (FHIRHelpers.ToCode(C) ~ "CRADSC2a" or FHIRHelpers.ToCode(C) ~ "CRADSC3" or FHIRHelpers.ToCode(C) ~ "CRADSC2")) 

define "de-CTCFindingCRC":
  CTColonographyDiagnosticReports D
    let cC: CollateConclusionCodes(D,CTColonographyObservations)
    where exists(cC.coding C where FHIRHelpers.ToCode(C) ~ "CRADSC4") 
