Alias: $PDACS = http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system
Alias: $PDARCS = http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system
Alias: $SOCS = http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/screening-observation-code-system

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: PlanDefinitionActionCodeSystem
Id: plan-definition-action-code-system
Title: "Plan Definition Action Code System"
Description: "Code representing plan definition action codes"

* ^experimental = true

* #eligible "Eligible for screening"
* #noteligible "Not eligible for screening"
* #error "An error occurred"
* #sdmcontinue "Shared decision making to continue screening"
* #stopscreen "Recommendation to stop screening"

ValueSet:    PlanDefinitionActionCodes
Id:          plan-definition-action-codes
Title:       "Plan Definition Action Codes"
Description: "This value set includes action codes for Plan Definitions within this implementation guide."
* ^experimental = true
* include codes from system $PDACS

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: PlanDefinitionActionReasonCodeSystem
Id: plan-definition-action-reason-code-system
Title: "Plan Definition Action Reason Code System"
Description: "Code representing plan definition action reason codes"

* ^experimental = true

* #eligibleforscreening "Eligible for screening"
* #missingageorbirthdate "Missing patient age in years or birth date"
* #currentcolorectalcancer "Current colorectal cancer"
* #totalcolectomy "Total colectomy"
* #diagtesting "Diagnostic testing"
* #ageover86 "Age over 86 years"
* #lifeexp "Reduced life expectancy indicator"
* #age76to86 "Age 76 to 86 years"

ValueSet:    PlanDefinitionActionReasonCodes
Id:          plan-definition-action-reason-codes
Title:       "Plan Definition Action Reason Codes"
Description: "This value set includes action reason codes for Plan Definitions within this implementation guide."
* ^experimental = true
* include codes from system $PDARCS

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: ScreeningObservationCodeSystem
Id: screening-observation-code-system
Title: "Screening Observation Code System"
Description: "Code representing cancer screening related observations"

* ^experimental = true

* #ColorectalSymptoms "New or worsening colorectal symptoms"
* #ReducedLifeExpectancyIndicator "Reduced life expectancy indicator"

//-------------------------------------
// VSAC VALUE SETS
//-------------------------------------

Alias:  VSACNonBleedingSignsSymptoms = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.336
Alias:  VSACBloodInStool = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.330
Alias:  VSACIBD = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1078.879
Alias:  VSACColonoscopy = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1020
Alias:  VSACsDNAFIT = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1145
Alias:  VSACCTC = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1038
Alias:  VSACFlexSig = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1010

ValueSet:       NonBleedingColorectalSignsSymptoms
Id:             non-bleeding-colorectal-signs-symptoms
Title:          "Non Bleeding Colorectal Cancer Signs and Symptoms"
Description:    "Concepts for non-bleeding signs and symptoms often associated with colorectal cancer. Includes diarrhea, constipation, tenesmus, abdominal pain or cramping, fatigue or weakness, unintended or unexplained weight loss, change in bowel habits or stool shape."

* include codes from valueset VSACNonBleedingSignsSymptoms


ValueSet:       BloodInStool
Id:             blood-in-stool
Title:          "Blood in Stool"
Description:    "This value set includes concepts for the presence of blood in stool. Includes concepts for signs of blood in stool, including melena and hematoschezia. Excludes concepts for Blood in stool due to inflammatory bowel disease, hematoma, or neonatal/perinatal."

* include codes from valueset VSACBloodInStool


//#TODO Move to VSAC
//Can be used in risk factors logic path instead of individual codes for each hereditary syndrome (slight departure from L2)
ValueSet:       CRCHereditarySyndrome
Id:             crc-hereditary-syndrome
Title:          "Hereditary Syndrome Associated with Colorectal Cancer"
Description:    "Includes concepts for hereditary syndromes associated with colorectal cancer"

* SCT#716318002 "Lynch syndrome (disorder)"
* SCT#72900001 "Familial multiple polyposis syndrome (disorder)"
* SCT#715866009 "Attenuated familial adenomatous polyposis (disorder)"
* SCT#423471004 "MYH-associated polyposis (disorder)"
* SCT#763536006 "Hyperplastic polyposis syndrome (disorder)"
* SCT#9273005 "Juvenile polyposis syndrome (disorder)"
* SCT#54411001 "Peutz-Jeghers syndrome (disorder)"
* SCT#58037000 "Cowden syndrome (disorder)"
* SCT#1197359006 "Familial colorectal cancer type X (disorder)"


// #TODO replace placeholder value set
ValueSet:       UlcerativeColitis
Id:             ulcerative-colitis
Title:          "Ulcerative Colitis"
Description:    "Concepts identifying conditions indicative of ulcerative colitis."

* include codes from valueset VSACIBD


// #TODO replace placeholder value set
ValueSet:       CrohnsDisease
Id:             crohns-disease
Title:          "Crohn's Disease"
Description:    "Concepts identifying conditions indicative of Crohn's Disease"

* include codes from valueset VSACIBD


// #TODO Add value set for hereditary syndromes with explicit family history context


// #TODO Move to VSAC
// #TODO Validate SCT and add ICD-10-CM codes
ValueSet:       HistoryCRC
Id:             history-crc
Title:          "History of Colorectal Cancer"
Description:    "Concepts for colorectal cancer with specific context of past history."

* include codes from system SCT where concept is-a #1286880003 "History of malignant neoplasm of cecum and/or colon and/or rectum (situation)"


// #TODO Move to VSAC
// #TODO Validate SCT codes and add ICD-10-CM codes
ValueSet:       FamilyHistoryCRC
Id:             family-history-crc
Title:          "Family History of colorectal cancer"
Description:    "Concepts for family history of colorectal cancer."

* include codes from system SCT where concept is-a #312824007 "Family history of cancer of colon (situation)"


// #TODO Move to VSAC
// #TODO Validate SCT codes and add ICD-10-CM codes
ValueSet:       FamilyHistoryPolyps
Id:             family-history-polyps
Title:          "Family History of Potentially Precancerous Polyps"
Description:    "Concepts for family history of polyps of colon."

* include codes from system SCT where concept is-a #429969003 "Family history of polyp of colon (situation)"

// #TODO Move to VSAC
// #TODO Validate SCT and add ICD-10-CM codes
ValueSet:       PotentiallyPrecancerousPolypsCondition
Id:             potentially-precancerous-polyps-condition
Title:          "Potentially Precancerous Polyp Conditions"
Description:    "Concepts for potentially precancerous polyps disorders or conditions."

* include codes from system SCT where concept is-a #68496003 "Polyp of colon (disorder)"


// #TODO Move to VSAC
// #TODO Validate SCT and add ICD-10-CM codes
ValueSet:       PotentiallyPrecancerousPolypFindings
Id:             potentially-precancerous-polyp-findings
Title:          "Potentially Precancerous Polyp Findings"
Description:    "Concepts for potentially precancerous polyp findings."

* include codes from system SCT where concept is-a #399432003 "Adenoma of large intestine (disorder)"
* include codes from system SCT where concept is-a #449855005 "Serrated polyp of colon (disorder)"


// #TODO Verify if a diagnostic colonoscopy should be counted for screening history.
ValueSet:       ColonoscopyProcedure
Id:             colonoscopy-procedure
Title:          "Colonoscopy Procedure"
Description:    "Concepts for a colonoscopy procedure intended for routine screening purposes or follow-up after an abnormal stool test."

* include codes from valueset VSACColonoscopy


// #TODO Placeholder
// #TODO Investigate if can distinguish FIT from gFOBT in LOINC
ValueSet:       FecalImmunochemicalTest
Id:             fit
Title:          "Fecal immunochemical test (FIT)"
Description:    "Concepts for a fecal immunochemical test."

* LNC#29771-3 "Hemoglobin.gastrointestinal.lower [Presence] in Stool by Immunoassay"


// #TODO Placeholder
// #TODO Investigate if can distinguish FIT from gFOBT in LOINC
ValueSet:       GuaicFecalOccultBloodTest
Id:             gFOBT
Title:          "Guaiac fecal occult blood test (gFOBT)"
Description:    "Concepts for a fecal immunochemical test."

* LNC#2335-8 "Hemoglobin.gastrointestinal [Presence] in Stool"


// #TODO Validate
ValueSet:       StoolDNAFecalImmunochemicalTest
Id:             sDNAFIT
Title:          "Stool DNA FIT Test"
Description:    "Concepts for a stool DNA-FIT test."

* include codes from valueset VSACsDNAFIT


// #TODO Validate
ValueSet:       CTColonography
Id:             ct-colonography
Title:          "CT Colonography"
Description:    "Concepts for computed tomographic (CT) colonography."

* include codes from valueset VSACCTC


// #TODO Validate
ValueSet:       FlexibleSigmoidoscopy
Id:             flexible-sigmoidoscopy
Title:          "Flexible Sigmoidoscopy"
Description:    "Concepts for a flexible sigmoidoscopy."

* include codes from valueset VSACFlexSig