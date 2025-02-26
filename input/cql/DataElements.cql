/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2025 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

library DataElements version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommon

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'
codesystem "ICD-9": 'http://hl7.org/fhir/sid/icd-9-cm'
codesystem "ICD-10": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "CONDCLINSTATUS": 'http://terminology.hl7.org/CodeSystem/condition-clinical'
codesystem "v3-RoleCode": 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'

// Local code systems
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "CRADS2005CodeSystem": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/c-rads-2005-code-system'
codesystem "CRADS2023CodeSystem": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/c-rads-2023-code-system'

// Condition status
code "Condition active code": 'active' from "CONDCLINSTATUS" display 'Active'
code "Condition inactive code": 'inactive' from "CONDCLINSTATUS" display 'Inactive'
code "Condition remission code": 'remission' from "CONDCLINSTATUS" display 'Remission'
code "Condition resolved code": 'resolved' from "CONDCLINSTATUS" display 'Resolved'
concept "Condition inactive": { "Condition inactive code" } display 'Inactive'
concept "Condition remission": { "Condition remission code" } display 'Remission'
concept "Condition resolved": { "Condition resolved code" } display 'Resolved'
concept "Condition Active": { "Condition active code" } display 'Active'

code "Reduced life expectancy indicator": 'ReducedLifeExpectancyIndicator' from "LOCAL" display 'Reduced life expectancy indicator'

// Signs and symptoms
valueset "Non Bleeding Colorectal Cancer Signs and Symptoms": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.336'
valueset "Blood in Stool": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.330'
code "New or worsening colorectal symptoms": 'ColorectalSymptoms' from "LOCAL" display 'New or worsening colorectal symptoms'
// valueset "Iron Decifiency Anemia without Specified Cause": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.332'

// Colorectal diagnoses and procedures
valueset "Colorectal Cancer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.325' 
valueset "Total Colectomy Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1019'
valueset "Colorectal Cancer Resection Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.705' // PLACEHOLDER value set. TODO: replace with procedures specific to CRC resection, add rectal procedures

// Hereditary syndromes
code "FAP SNOMED CT": '72900001' from "SNOMED-CT" display 'Familial multiple polyposis syndrome (disorder)'
code "FAP ICD-10-CM": 'D13.91' from "ICD-10" display 'Familial adenomatous polyposis'
concept "FAP": {"FAP SNOMED CT", "FAP ICD-10-CM"} display 'Familial adenomatous polyposis'

code "AFAP SNOMED CT": '715866009' from "SNOMED-CT" display 'Attenuated familial adenomatous polyposis (disorder)'
code "AFAP ICD-10-CM": 'D13.91' from "ICD-10" display 'Familial adenomatous polyposis'
concept "AFAP": {"AFAP SNOMED CT", "AFAP ICD-10-CM"} display 'Attenuated familial adenomatous polyposis'

code "Lynch Syndrome": '716318002' from "SNOMED-CT" display 'Lynch syndrome (disorder)' // no specific code available in ICD-10-CM
code "MUTYH-Associated Polyposis Syndrome": '423471004' from "SNOMED-CT" display 'MYH-associated polyposis (disorder)' // no specific code available in ICD-10-CM
code "Serrated Polyposis Syndrome": '763536006' from "SNOMED-CT" display 'Hyperplastic polyposis syndrome (disorder)' // no specific code available in ICD-10-CM
code "Juvenile Polyposis Syndrome": '9273005' from "SNOMED-CT" display 'Juvenile polyposis syndrome (disorder)' // no specific code available in ICD-10-CM
code "Peutz-Jegher Syndrome": '54411001' from "SNOMED-CT" display 'Peutz-Jeghers syndrome (disorder)' // no specific code available in ICD-10-CM

code "Cowden Syndrome SNOMED CT": '58037000' from "SNOMED-CT" display 'Cowden syndrome (disorder)'
code "Cowden Syndrome ICD-10-CM": 'Q85.81' from "ICD-10" display 'PTEN hamartoma tumor syndrome'
concept "Cowden Syndrome": {"Cowden Syndrome SNOMED CT", "Cowden Syndrome ICD-10-CM"} display 'Cowden Syndrome'

code "Familial Colorectal Cancer Type X": '1197359006' from "SNOMED-CT" display 'Familial colorectal cancer type X (disorder)' // no specific code available in ICD-10-CM
// TODO add local code for "Genetic Marker or Syndrome Associated with Colorectal Cancer" // for use with questionnaire/observation/toggle button in dashboard

code "Relative with hereditary syndrome": 'RelativeHereditarySyndrome' from "LOCAL" display 'Relative with hereditary syndrome'
// TODO add local code for "First degree relative with genetic marker or syndrome" // for use with questionnaire/observation/toggle button in dashboard

// IBD
valueset "Ulcerative Colitis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.345' 
valueset "Cronh's Disease": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.348'

// History of colorectal cancer or polyps
valueset "History of Colorectal Cancer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.349'
valueset "Potentially Precancerous Polyp Condition": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.353' // ICD-10CM and SNOMED CT TODO: replace with http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.404 when published (2/27)
// TODO: add value set for colorectal cancer resection

// Family history of colorectal cancer or polyps
valueset "Family History of Colorectal Cancer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.351' // SNOMED only (no ICD-10-CM codes specific to colorectal cancer)
valueset "Family History of Potentially Precancerous Polyps": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.403'
valueset "First Degree Family Member": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.92'
valueset "Second Degree Family Member": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.401'
code "Number of affected family members": '104899-0' from "LOINC" display 'Number of affected family members'

// Colorectal cancer screening modalities (use with DiagnosticReport)
valueset "Colorectal Screening Modalities": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.361'
valueset "Fecal Occult Blood Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.11.1020' // Includes FIT and gFOBT, which cannot always be distinguished in LOINC; Steward: NCQA
valueset "Stool DNA-FIT": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1145' // Steward: NCQA
valueset "Colonoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.356' // for use with document type/diagnostic report
valueset "CT Colonography Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.118.11.1097' // For use with document type/diagnostic report. Steward: NCQA Phemur
valueset "Flexible Sigmoidoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.359' // for use with document type/diagnostic report

// Colorectal cancer screening modalities (use with Procedure)
valueset "Colonoscopy Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1020' // Steward: NCQA Phemur
valueset "CT Colonography Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1144' // SNOMED-CT only. Steward: NCQA Phemur | #TODO replace with grouping of SNOMED and CPT. NCQA value sets marked as not maintained.
valueset "Flexible Sigmoidoscopy Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1010' // Steward: NCQA. Includes CPT, HCPCS and SNOMED-CT.

// Colorectal cancer screening modality results (use with DiagnosticReport.conclusionCode or Observation)
code "Colonoscopy Study Observation": '28023-0' from "LOINC" display 'Colonoscopy Study observation'
code "Flexible Sigmoidoscopy Study Observation": '28027-1' from "LOINC" display 'Flexible Sigmoidoscopy Study observation'
code "Follow-up Plan": '470191000124102' from "SNOMED-CT" display 'Colorectal cancer screening follow-up planning (procedure)'
//TODO add code for CT Colonography Observation

// Modalities - must be individual codes for ServiceRequest
code "Colonoscopy": '18746-8' from "LOINC" display 'Colonoscopy study'
code "Flexible Sigmoidoscopy": '18753-4' from "LOINC" display 'Flexible sigmoidoscopy study'
code "CT Colonography": '425666002' from "SNOMED-CT" display 'Computed tomography of colon (procedure)'
code "FOBT": '2335-8' from "LOINC" display 'Hemoglobin.gastrointestinal [Presence] in Stool'
code "sDNA-FIT": '77354-9' from "LOINC" display 'Noninvasive colorectal cancer DNA and occult blood screening [Presence] in Stool'

// Colorectal cancer screening findings (Flex sig and colonoscopy)
valueset "Potentially Precancerous Polyp SNOMED": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.353' // Using SNOMED CT only since no expectation of ICD-10-CM associated with DiagnosticReport or Observation
valueset "Colorectal Cancer SNOMED": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.326' // Using SNOMED CT only since no expectation of ICD-10-CM associated with DiagnosticReport or Observation

// Colorectal cancer screening findings (CT Colography)
code "C-RADS 2005 C0": 'C0' from "CRADS2005CodeSystem" display 'C-RADS Category 0 - Inadequate study/awaiting prior comparisons'
code "C-RADS 2023 C0": 'C0' from "CRADS2023CodeSystem" display 'C-RADS Category 0 - Inadequate study/awaiting prior comparisons'
code "C-RADS 2005 C2": 'C2' from "CRADS2005CodeSystem" display 'C-RADS Category 2 - Intermediate polyp or indeterminate finding: surveillance or colonoscopy recommended'
code "C-RADS 2023 C2a": 'C2a' from "CRADS2023CodeSystem" display 'C-RADS Category 2a - Intermediate polyp or indeterminate finding'
code "C-RADS 2005 C3": 'C3' from "CRADS2005CodeSystem" display 'C-RADS Category 3 - Polyp, possibly advanced adenoma: follow-up colonoscopy recommended'
code "C-RADS 2023 C3": 'C3' from "CRADS2023CodeSystem" display 'C-RADS Category 3 - Polyp, possibly advanced adenoma'
code "C-RADS 2005 C4": 'C4' from "CRADS2005CodeSystem" display 'C-RADS Category 4 - Colonic mass, likely malignant: surgical consultation recommended'
code "C-RADS 2023 C4": 'C4' from "CRADS2023CodeSystem" display 'C-RADS Category 4 - Colonic mass, likely malignant'

// Pregnancy
valueset "Pregnancy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.378'
valueset "Pregnancy (New ICD10 codes published in 2018 and 2020)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.80'
code "Pregnancy Status": '82810-3' from "LOINC" display 'Pregnancy status'
code "Patient currently pregnant": '77386006' from "SNOMED-CT" display 'Patient currently pregnant (finding)'
code "Pregnancy Episode Of Care": '424525001' from "SNOMED-CT" display 'Antenatal care (regime/therapy)'

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

parameter encounter String default null
parameter ObservationLookbackPeriod default 14 days
parameter SymptomaticLookBack default 1 days //TODO: verify if change from 14 to 1 day per alignment with Breast is correct
parameter ScreeningHistoryLookback default 10 years

/***** BEGIN CDS LOGIC ********************************************************/

context Patient

//------------------------------------------------------------------------------
// Patient demographics
//------------------------------------------------------------------------------

define BirthSex:
  (Patient.extension) E
    where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex'
  
define BirthSexPresent:
  Exists(BirthSex)

define UnknownBirthSex:
  exists(
    (BirthSex) E
      where (
        E.value = 'ASKU' or
        E.value = 'OTH' or
        E.value = 'UNK'
      )
  )

define BirthSexMissingOrUnknown:
  not BirthSexPresent or
  UnknownBirthSex

define BirthSexCode:
  if BirthSexMissingOrUnknown then 'Unknown'
  else Coalesce(BirthSex.value.value)

define GenderIdentityExtension:
  (Patient.extension) E
    where
      E.url = 'http://hl7.org/fhir/StructureDefinition/patient-genderIdentity' or
      E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity'
  
define Pregnant:
  // IF any Epsidose of care with status = active
  //    Pregnant = true
  // If any Episode of care with status = finished
  //    Pregnant = false
  // Use existing logic with conditions and observations
  if (HasActivePregnancyEpisodesOfCare) then
    true
  else if (HasFinishedPregnancyEpisodesOfCare) then
    false
  else
    Exists(PregnancyDiagnoses) or Exists(PregnancyObservations)

define PregnancyDiagnoses:
  C3F.Confirmed(
    C3F.ActiveCondition(
      C3F.ConditionLookBack(
        [Condition: "Pregnancy"] union [Condition: "Pregnancy (New ICD10 codes published in 2018 and 2020)"],
        42 weeks
      )
    )
  )

define PregnancyObservations:
  C3F.ObservationLookBack(
    C3F.Verified(
      [Observation: "Pregnancy Status"] P
        where P.value ~ "Patient currently pregnant"
    ),
    42 weeks
  )  

define PregnancyEpisodesOfCare:
  [EpisodeOfCare] E where
    AnyTrue(
      (E.type) t
        return t ~ "Pregnancy Episode Of Care"
    )

define ActivePregnancyEpisodesOfCare:
  PregnancyEpisodesOfCare P
  where P.status ~ 'active'

define FinishedPregnancyEpisodesOfCare:
  PregnancyEpisodesOfCare P
  where P.status ~ 'finished'

define HasActivePregnancyEpisodesOfCare:
  Exists(ActivePregnancyEpisodesOfCare)

define HasFinishedPregnancyEpisodesOfCare:
  Exists(FinishedPregnancyEpisodesOfCare)  

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
  Common.ValidCondition([Condition: "Colorectal Cancer"]) 

define DateOfCRCDiagnosis:
  Common.DateOfFirstCondition(ColorectalCancerDiagnoses)

//------------------------------------------------------------------------------
// History of total colectomy procedure
//------------------------------------------------------------------------------

define "de-TotalColectomy":
  exists TotalColectomyProcedures

define TotalColectomyProcedures:
  C3F.Completed([Procedure: "Total Colectomy Procedure"])

//------------------------------------------------------------------------------
// Colorectal symptoms
//------------------------------------------------------------------------------

define "de-ColorectalSignsSymptoms":
  MostRecentNewOrWorseningColorectalSymptoms.value is true
    or exists EncounterColorectalSymptomConditions
    or EncounterReasonColorectalSymptoms

define EncounterReasonColorectalSymptoms:
  encounter is not null and 
    exists AllColorectalSymptomEncounters E where encounter = 'Encounter/' + E.id

define AllColorectalSymptomEncounters:
  Common.RelevantEncounterStatus(
    [Encounter] E
      where
        (E.reasonCode in "Non Bleeding Colorectal Cancer Signs and Symptoms" or E.reasonCode in "Blood in Stool") // or E.reasonCode in "Iron Decifiency Anemia without Specified Cause")     
  )

define EncounterColorectalSymptomConditions:
  ColorectalSymptomConditions C
    where C.encounter.reference = encounter

define ColorectalSymptomConditions:
  Common.ValidCondition([Condition: "Non Bleeding Colorectal Cancer Signs and Symptoms"]) union Common.ValidCondition([Condition: "Blood in Stool"]) // union Common.ValidCondition([Condition: "Iron Decifiency Anemia without Specified Cause"]) 

define MostRecentNewOrWorseningColorectalSymptoms:
  C3F.MostRecent(
    Flatten({
      NewOrWorseningColorectalSymptomsEncounter,
      NewOrWorseningColorectalSymptomsLookback
    }) except {null}
  )

define NewOrWorseningColorectalSymptomsEncounter:
  NewOrWorseningColorectalSymptomsObservations O where O.encounter.reference = encounter

define NewOrWorseningColorectalSymptomsLookback:
  C3F.ObservationLookBack(
    NewOrWorseningColorectalSymptomsObservations,
    SymptomaticLookBack
  ) 

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
  Common.ValidCondition([Condition: code ~ "Lynch Syndrome"])

define FamilialAdenomatousPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "FAP"])

define AttenuatedFamilialAdenomatousPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "AFAP"])

define MUTYHAssociatedPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "MUTYH-Associated Polyposis Syndrome"])

define SerratedPolyposisConditions:
  Common.ValidCondition([Condition: code ~ "Serrated Polyposis Syndrome"])

define JuvenilePolyposisConditions:
  Common.ValidCondition([Condition: code ~ "Juvenile Polyposis Syndrome"])

define PeutzJegherSyndromeConditions:
  Common.ValidCondition([Condition: code ~ "Peutz-Jegher Syndrome"])

define CowdenSyndromeConditions:
  Common.ValidCondition([Condition: code ~ "Cowden Syndrome"])

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
          C.code ~ "Lynch Syndrome" or C.code ~ "FAP" or
          C.code ~ "AFAP" or C.code ~ "MUTYH-Associated Polyposis Syndrome" or 
          C.code ~ "Serrated Polyposis Syndrome" or C.code ~ "Juvenile Polyposis Syndrome" or
          C.code ~ "Peutz-Jegher Syndrome" or C.code ~ "Cowden Syndrome" or C.code ~ "Familial Colorectal Cancer Type X"
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
  Common.ValidCondition([Condition: "Ulcerative Colitis"]) 

define "de-CrohnsDisease":
  exists CrohnsDiseaseConditions C
    where C.clinicalStatus ~ "Condition Active"
      or C.clinicalStatus ~ "Condition remission"

define CrohnsDiseaseConditions:
  Common.ValidCondition([Condition: "Cronh's Disease"]) 

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
  Common.ValidCondition([Condition: "Colorectal Cancer"])

define HistoryOfColorectalCancerConditions:
  Common.ValidCondition([Condition: "History of Colorectal Cancer"])

//------------------------------------------------------------------------------
// Family history of colorectal cancer or advanced polyps
//------------------------------------------------------------------------------
define "de-FamilyHxCRC":
  exists FamilyHxCRCConditions 
  or exists FamilyHxDiagnosisOfCRC or exists FamilyHxDiagnosisOfHistoryOfCRC

define FamilyHxCRCConditions:
  Common.ValidCondition([Condition: "Family History of Colorectal Cancer"])

define FamilyHxDiagnosisOfCRC:
  [FamilyMemberHistory] F
    let
      CRCConditions: F.condition C
        where         
          C.code in "Colorectal Cancer"
    where exists CRCConditions
    return {
      familyMemberHistory: F,
      conditions: CRCConditions
    }

define FamilyHxDiagnosisOfHistoryOfCRC:
  [FamilyMemberHistory] F
    let
      CRCConditions: F.condition C
        where         
          C.code in "History of Colorectal Cancer"
    where exists CRCConditions
    return {
      familyMemberHistory: F,
      conditions: CRCConditions
    }

define "de-FamHxAdvancedPolyps":
  exists FamilyHxPrecancerousPolypConditions 
  or exists FamilyHxDiagnosisOfPrecancerousPolyp

define FamilyHxPrecancerousPolypConditions:
  Common.ValidCondition([Condition: "Family History of Potentially Precancerous Polyps"])

define FamilyHxDiagnosisOfPrecancerousPolyp:
  [FamilyMemberHistory] F
    let
      CRCConditions: F.condition C
        where         
          C.code in "Potentially Precancerous Polyp Condition"
    where exists CRCConditions
    return {
      familyMemberHistory: F,
      conditions: CRCConditions
    }

//------------------------------------------------------------------------------
// Personal history of potentially precancerous polyps
//------------------------------------------------------------------------------
define "de-HxPolyps":
  exists PotentiallyPrecancerousPolypsConditions or exists PrecancerousPolypsInAnyPreviousColonoscopy

define PotentiallyPrecancerousPolypsConditions:
  Common.ValidCondition([Condition: "Potentially Precancerous Polyp Condition"])

define PrecancerousPolypsInAnyPreviousColonoscopy:
  ColonoscopyDiagnosticReportsWithResults D
    let cC: CRCSMCommon.CollateConclusionCodes(D,ColonoscopyObservations)
    where cC in "Potentially Precancerous Polyp SNOMED"
//TODO consider whether lookback of 10 years is appropriate
//TODO generalize to include history of precancerous polyps from other modalities (CT colonography and flex sig)

//------------------------------------------------------------------------------
// Colorectal screening modalities
//------------------------------------------------------------------------------

//TODO Use single retrieve for all completed Diagnostic reports in lookback and then filter by modality.
define ColorectalCancerScreeningDiagnosticReports:
  Common.CompletedDiagnosticReport([DiagnosticReport: "Colorectal Screening Modalities"])  

define AllCompletedDiagnosticReport:
  Common.CompletedDiagnosticReport([DiagnosticReport])    

define ColorectalCancerScreeningObservations:
  FOBTObservations union StoolDNAFITObservations union ColonoscopyObservations union CTColonographyObservations union FlexSigObservations

//FOBT (includes FIT and gFOBT)
define "de-FOBT":
  exists FOBTDiagnosticReportsWithResults

define FOBTDiagnosticReportsWithResults:
  FOBTDiagnosticReports D
  where
    exists CRCSMCommon.CollateConclusionCodes(D, FOBTObservations)

define FOBTDiagnosticReports:
  CRCSMCommon.CompletedDiagnosticReportsByLookback("Fecal Occult Blood Test", ScreeningHistoryLookback)

define FOBTObservations:
  CRCSMCommon.VerifiedObservations("Fecal Occult Blood Test", ScreeningHistoryLookback)

// Stool DNA-FIT
define "de-stoolDNAFIT":
    exists StoolDNAFITDiagnosticReportsWithResults

define StoolDNAFITDiagnosticReportsWithResults:
   StoolDNAFITDiagnosticReports D
    where
      exists CRCSMCommon.CollateConclusionCodes(D, StoolDNAFITObservations)

define StoolDNAFITDiagnosticReports:
  CRCSMCommon.CompletedDiagnosticReportsByLookback("Stool DNA-FIT", ScreeningHistoryLookback)

define StoolDNAFITObservations:
  CRCSMCommon.VerifiedObservations("Stool DNA-FIT", ScreeningHistoryLookback)

// Colonoscopy
define "de-Colonoscopy": 
  exists ColonoscopyDiagnosticReportsWithResults

define ColonoscopyDiagnosticReportsWithResults:
  ColonoscopyDiagnosticReports D
    where
      exists CRCSMCommon.CollateConclusionCodes(D,ColonoscopyObservations) or
      exists CRCSMCommon.ValueQuantityFromObservation(D,FollowUpObservations)

define ColonoscopyDiagnosticReports:
  CRCSMCommon.CompletedDiagnosticReportsByLookback("Colonoscopy Study", ScreeningHistoryLookback)

define ColonoscopyObservations:
  CRCSMCommon.VerifiedObservations("Colonoscopy Study", ScreeningHistoryLookback)
  union
  CRCSMCommon.VerifiedObservations("Colonoscopy Study Observation", ScreeningHistoryLookback)

// CT Colonography
define "de-CTColonography":
  exists CTColonographyDiagnosticReportsWithResults
  
define CTColonographyDiagnosticReportsWithResults:
  CTColonographyDiagnosticReports D
    where
      exists CRCSMCommon.CollateConclusionCodes(D, CTColonographyObservations)

define CTColonographyDiagnosticReports:
  CRCSMCommon.CompletedDiagnosticReportsByLookback("CT Colonography Study", ScreeningHistoryLookback)

define CTColonographyObservations:
  CRCSMCommon.VerifiedObservations("CT Colonography Study", ScreeningHistoryLookback)

// Flex Sig
define "de-FlexSig":
  exists FlexSigDiagnosticReportsWithResults

define FlexSigDiagnosticReportsWithResults:
   FlexSigDiagnosticReports D
    where
      exists CRCSMCommon.CollateConclusionCodes(D, FlexSigObservations) or
      exists CRCSMCommon.ValueQuantityFromObservation(D,FollowUpObservations)

define FlexSigDiagnosticReports:
  CRCSMCommon.CompletedDiagnosticReportsByLookback("Flexible Sigmoidoscopy Study", ScreeningHistoryLookback)

define FlexSigObservations:
  CRCSMCommon.VerifiedObservations("Flexible Sigmoidoscopy Study", ScreeningHistoryLookback)
  union
  CRCSMCommon.VerifiedObservations("Flexible Sigmoidoscopy Study Observation", ScreeningHistoryLookback)

//Follow Up
define FollowUpObservations:
  CRCSMCommon.VerifiedObservations("Follow-up Plan", ScreeningHistoryLookback)

//------------------------------------------------------------------------------
// Most recent colorectal screening/surveillance test
//------------------------------------------------------------------------------

define "de-MostRecentTestIsColonoscopy":
  MostRecentColorectalScreeningTestResults.modality ~ "Colonoscopy"

define "de-MostRecentTestIsCTC":
  MostRecentColorectalScreeningTestResults.modality ~ "CT Colonography"

define "de-MostRecentTestIsFlexSig":
  MostRecentColorectalScreeningTestResults.modality ~ "Flexible Sigmoidoscopy"

define "de-MostRecentTestIsFOBT":
  MostRecentColorectalScreeningTestResults.modality ~ "FOBT"

define "de-MostRecentTestIssDNAFIT":
  MostRecentColorectalScreeningTestResults.modality ~ "sDNA-FIT"

define MostRecentColorectalScreeningTestResults:
  MostRecentColorectalScreeningDiagnosticReport D
    return
      case
        when D.code in "Colonoscopy Study" then
          { modality: "Colonoscopy",
            results: CRCSMCommon.CollateConclusionCodes(D, ColonoscopyObservations)
          }
        when D.code in "CT Colonography Study" then
          { modality: "CT Colonography",
            results: CRCSMCommon.CollateConclusionCodes(D, CTColonographyObservations)
          }
        when D.code in "Fecal Occult Blood Test" then
          { modality: "FOBT",
            results: CRCSMCommon.CollateConclusionCodes(D, FOBTObservations)
          }
        when D.code in "Stool DNA-FIT" then
          { modality: "sDNA-FIT",
            results: CRCSMCommon.CollateConclusionCodes(D, StoolDNAFITObservations)
          }
        when D.code in "Flexible Sigmoidoscopy Study" then
          { modality: "Flexible Sigmoidoscopy",
            results: CRCSMCommon.CollateConclusionCodes(D, FlexSigObservations)
          }
        else null
      end

define MostRecentColorectalScreeningDate:
  Common.DiagnosticReportDate(MostRecentColorectalScreeningDiagnosticReport)

define MostRecentColorectalScreeningDiagnosticReport:
  Common.MostRecentDiagnosticReport(CRCScreeningHistory)

define CRCScreeningHistory:
  FOBTDiagnosticReportsWithResults
  union
  StoolDNAFITDiagnosticReportsWithResults
  union
  ColonoscopyDiagnosticReportsWithResults
  union
  FlexSigDiagnosticReportsWithResults
  union
  CTColonographyDiagnosticReportsWithResults

//------------------------------------------------------------------------------
// Findings of testing reports
//------------------------------------------------------------------------------

//TODO Add CollateConclusionCodes function that takes list<FHIR.CodeableConcept> as argument?
define "de-FindingPolyps":
  exists MostRecentColorectalScreeningTestResults.results R
    where AnyTrue(
      R.coding C
        return FHIRHelpers.ToCode(C) in "Potentially Precancerous Polyp SNOMED"
      )

define "de-FindingCRC":
  exists MostRecentColorectalScreeningTestResults.results R 
      where
        AnyTrue(
          R.coding C
            return FHIRHelpers.ToCode(C) in "Colorectal Cancer SNOMED"
        )

define "de-CTCInconclusive":
  exists MostRecentColorectalScreeningTestResults.results R
    where
      AnyTrue(
        R.coding C
          return FHIRHelpers.ToCode(C) in
            {"C-RADS 2005 C0",
            "C-RADS 2023 C0"
      })

define "de-CTCFindingPolyps":
  exists MostRecentColorectalScreeningTestResults.results R
    where
      AnyTrue(R.coding C
        return FHIRHelpers.ToCode(C) in {
          "C-RADS 2005 C2",
          "C-RADS 2023 C2a",
          "C-RADS 2005 C3",
          "C-RADS 2023 C3"
      })

define "de-CTCFindingCRC":
  exists MostRecentColorectalScreeningTestResults.results R
    where
      AnyTrue(R.coding C
        return FHIRHelpers.ToCode(C) ~ "C-RADS 2023 C4"
        )

define "de-RecommendedInterval":
  FollowUpIntervalFromEndoscopist is not null

define FollowUpIntervalFromEndoscopist:
  MostRecentColorectalScreeningDiagnosticReport D
    return First(CRCSMCommon.ValueQuantityFromObservation(D,FollowUpObservations)) //Unlikely there would be multiple intervals, but should this be first or last?