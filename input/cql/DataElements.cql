library DataElements version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include FHIRHelpers  version '4.0.1' called FHIRHelpers

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

concept "Condition inactive": { "Condition inactive code" } display 'Inactive'
concept "Condition remission": { "Condition remission code" } display 'Remission'
concept "Condition resolved": { "Condition resolved code" } display 'Resolved'
concept "FTH": { "father", "natural father" } display 'father'
concept "MTH": { "mother", "natural mother" } display 'mother'
concept "CHILD": { "child", "natural child" } display 'child'
concept "SON": { "son", "natural son" } display 'son'
concept "DAU": { "daughter", "natural daughter" } display 'daughter'

// Colorectal diagnoses, procedures, and observations
valueset "COLORECTAL CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1001'
valueset "HISTORY OF COLORECTAL CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022' 
// TODO: replace placeholder value set OID
valueset "TOTAL COLECTOMY PROCEDURE": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1019'
valueset "ULCERATIVE COLITIS ICD": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.3072' 
valueset "ULCERATIVE COLITIS SNOMED": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.6262'
valueset "CROHNS DISEASE ICD": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.3079' 
valueset "CROHNS DISEASE SNOMED": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.6091'
valueset "POTENTIALLY PRECANCEROUS POLYPS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
//valueset "LYNCH SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
//valueset "FAMILIAL ADENOMATOUS POLYPOSIS SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "ATTENUATED FAMILIAL ADENOMATOUS POLYPOSIS SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "MUTYH-ASSOCIATED POLYPOSIS SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "SERRATED POLYPOSIS SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "JUVENILE POLYPOSIS SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "PEUTZ-JEGHER SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "COWDEN SYNDROME": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "FAMILY HISTORY OF COLORECTAL CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "FAMILY HISTORY OF POTENTIALLY PRECANCEROUS POLYPS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "HISTORY OF POTENTIALLY PRECANCEROUS POLYPS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "INVASIVE BREAST CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1116.185'
// TODO: replace placeholder value set OID
valueset "NON-INVASIVE BREAST CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'


// Standard codes
code "Colonoscopy Report": '18746-8' from "LOINC" display 'Colonoscopy study'
code "LYNCH SYNDROME": '716318002' from "SNOMED-CT" display 'Lynch syndrome (disorder)'
code "FAMILIAL ADENOMATOUS POLYPOSIS SYNDROME": '72900001' from "SNOMED-CT" display 'Familial multiple polyposis syndrome (disorder)'
// TODO: verify if this is the right code for colonoscopy report

// Non-standard or "local" codes
code "New or worsening colorectal symptoms": 'ColorectalSymptoms' from "LOCAL" display 'New or worsening colorectal symptoms'
code "Relative with hereditary syndrome": 'RelativeHereditarySyndrome' from "LOCAL" display 'Relative with hereditary syndrome'

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
  Common.ValidCondition([Condition: code ~ "FAMILIAL ADENOMATOUS POLYPOSIS SYNDROME"])

define AttenuatedFamilialAdenomatousPolyposisConditions:
  Common.ValidCondition([Condition: code in "ATTENUATED FAMILIAL ADENOMATOUS POLYPOSIS SYNDROME"])

define MUTYHAssociatedPolyposisConditions:
  Common.ValidCondition([Condition: code in "MUTYH-ASSOCIATED POLYPOSIS SYNDROME"])

define SerratedPolyposisConditions:
  Common.ValidCondition([Condition: code in "SERRATED POLYPOSIS SYNDROME"])

define JuvenilePolyposisConditions:
  Common.ValidCondition([Condition: code in "JUVENILE POLYPOSIS SYNDROME"])

define PeutzJegherSyndromeConditions:
  Common.ValidCondition([Condition: code in "PEUTZ-JEGHER SYNDROME"])

define CowdenSyndromeConditions:
  Common.ValidCondition([Condition: code in "COWDEN SYNDROME"])

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
//      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
//      and (
        exists (F.condition C
          where 
          C.code ~ "LYNCH SYNDROME" or C.code ~ "FAMILIAL ADENOMATOUS POLYPOSIS SYNDROME" or
          C.code in "ATTENUATED FAMILIAL ADENOMATOUS POLYPOSIS SYNDROME" or C.code in "MUTYH-ASSOCIATED POLYPOSIS SYNDROME" or 
          C.code in "SERRATED POLYPOSIS SYNDROME" or C.code in "JUVENILE POLYPOSIS SYNDROME" or
          C.code in "PEUTZ-JEGHER SYNDROME" or C.code in "COWDEN SYNDROME"
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
    where C.clinicalStatus ~ C3F."Condition Active"
      or C.clinicalStatus ~ "Condition remission"

define UlcerativeColitisConditions:
  (Common.ValidCondition([Condition: "ULCERATIVE COLITIS ICD"]) union
  Common.ValidCondition([Condition: "ULCERATIVE COLITIS SNOMED"]))

define "de-CrohnsDisease":
  exists CrohnsDiseaseConditions C
    where C.clinicalStatus ~ C3F."Condition Active"
      or C.clinicalStatus ~ "Condition remission"

define CrohnsDiseaseConditions:
  (Common.ValidCondition([Condition: "CROHNS DISEASE ICD"]) union
  Common.ValidCondition([Condition: "CROHNS DISEASE SNOMED"]))

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
  or exists FamilyHxCRCDiagnosis or exists FamilyHxHistoryOfCRCDiagnosis

define FamilyHxCRCConditions:
  Common.ValidCondition([Condition: "FAMILY HISTORY OF COLORECTAL CANCER"])

define FamilyHxCRCDiagnosis:
  [FamilyMemberHistory] F
    where 
      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
      and (
        exists (F.condition C
          where 
          C.code in "COLORECTAL CANCER"
        )
      )

define FamilyHxHistoryOfCRCDiagnosis:
  [FamilyMemberHistory] F
    where 
      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
      and (
        exists (F.condition C
          where 
          C.code in "HISTORY OF COLORECTAL CANCER"
        )
      )

define "de-FamHxAdvancedPolyps":
  exists FamilyHxPrecancerousPolypConditions 
  or exists FamilyHxHistoryOfPrecancerousPolypDiagnosis

define FamilyHxPrecancerousPolypConditions:
  Common.ValidCondition([Condition: "FAMILY HISTORY OF POTENTIALLY PRECANCEROUS POLYPS"])

define FamilyHxHistoryOfPrecancerousPolypDiagnosis:
  [FamilyMemberHistory] F
    where 
      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
      and (
        exists (F.condition C
          where 
          C.code in "HISTORY OF POTENTIALLY PRECANCEROUS POLYPS"
        )
      )

//------------------------------------------------------------------------------
// Personal history of potentially precancerous polyps
//------------------------------------------------------------------------------
define "de-HxPolyps":
  exists HistoryOfPotentiallyPrecancerousPolypsConditions or exists PrecancerousPolypsColonoscopyFindings

define "de-FindingPolyps":
  exists PrecancerousPolypsColonoscopyFindings
//TODO: this data element should be generalized to polyps from any modality, not just colonoscopy

define HistoryOfPotentiallyPrecancerousPolypsConditions:
  Common.ValidCondition([Condition: "HISTORY OF POTENTIALLY PRECANCEROUS POLYPS"])

define PrecancerousPolypsColonoscopyFindings:
  ColonoscopyDiagnosticReports D
    let cC: CollateConclusionCodes(D,ColonoscopyObservations)
    where cC in "POTENTIALLY PRECANCEROUS POLYPS"

define ColonoscopyDiagnosticReports:
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, ColonoscopyObservations, "Colonoscopy Report")
    ) > 0

define ColonoscopyObservations:
  [Observation: "Colonoscopy Report"]