library Terminology version '1.0.0'

using FHIR version '4.0.1'

//------------------------------------------------------------------------------
// CODE SYSTEMS
//------------------------------------------------------------------------------

codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "C-RADS 2005": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/c-rads-2005-code-system'
codesystem "C-RADS 2023": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/c-rads-2023-code-system'

//------------------------------------------------------------------------------
// SCREENING ELIGIBLE LOGIC PATH
//------------------------------------------------------------------------------

valueset "Colorectal Cancer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.325'
valueset "Total Colectomy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1019'

// Colorectal signs and symptoms
valueset "Non Bleeding Colorectal Cancer Signs and Symptoms": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.336'
valueset "Blood in Stool": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.330'
valueset "Iron Decifiency Anemia without Specified Cause": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.332' // #TODO needs validation


//------------------------------------------------------------------------------
// DECISION TO SCREEN LOGIC PATH
//------------------------------------------------------------------------------

// TODO Align with Breast Cancer S&M terminology

//------------------------------------------------------------------------------
// RISK FACTORS LOGIC PATH
//------------------------------------------------------------------------------

valueset "Hereditary Syndrome Associated with Colorectal Cancer VS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.342'
valueset "Ulcerative Colitis VS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.345'
valueset "Crohn's Disease VS": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.348'
valueset "History of Colorectal Cancer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.349'
valueset "Family History of Colorectal Cancer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.351'
valueset "Family History of Colon Polyps": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.351'
valueset "Potentially Precancerous Polyp": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.355'


//------------------------------------------------------------------------------
// DUE FOR SCREENING
//------------------------------------------------------------------------------

// Codes for actions/recommendations
code "Due for Screening": '171112000' from "SNOMED-CT" display 'Screening due (finding)'
code "Colorectal Cancer Screening": '268548003' from "SNOMED-CT" display 'Screening for malignant neoplasm of large intestine (procedure)'

// May come in handy - TBD
code "Referral for Colonoscopy": '183875006' from "SNOMED-CT" display 'Referral for colonoscopy (procedure)'
code "Referral for Flexible Sigmoidoscopy": '183876007' from "SNOMED-CT" display 'Referral for sigmoidoscopy (procedure)'

//------------------------------------------------------------------------------
// SCREENING TEST INCOMPLETE
//------------------------------------------------------------------------------

// See data elements

//------------------------------------------------------------------------------
// FOLLOW-UP AFTER NON-COLONOSCOPY TEST
//------------------------------------------------------------------------------

//See data elements

//------------------------------------------------------------------------------
// FOLLOW-UP AFTER COLONOSCOPY
//------------------------------------------------------------------------------

// TODO Complete colonoscopy
code "Follow-up Plan": '470191000124102' from "SNOMED-CT" display 'Colorectal cancer screening follow-up planning (procedure)'

//------------------------------------------------------------------------------
// INCREASED RISK: PERSONAL HISTORY OF POLYPS
//------------------------------------------------------------------------------

// See risk factors

//------------------------------------------------------------------------------
// INCREASED RISK: FAMILY HISTORY OF COLORECTAL CANCER/POLYPS
//------------------------------------------------------------------------------


valueset "First Degree Family Member": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.92'
code "Number of affected family members": '104899-0' from "LOINC" display 'Number of affected family members'

// Might come in handy - TBD
// code "Family history of colorectal cancer over age 50": '154051000119101' from "SNOMED-CT" display 'Family history of malignant neoplasm of colon over age 50 (situation)'
// code "Unspecified First Degree Biological Relative": '125678001' from "SNOMED-CT" display 'First degree blood relative (person)'

//------------------------------------------------------------------------------
// INCREASED RISK: HEREDITARY SYNDROMES
//------------------------------------------------------------------------------

// *** Hereditary Syndromes ***

code "Lynch Syndrome": '716318002' from "SNOMED-CT" display 'Lynch syndrome (disorder)' // no specific code available in ICD-10-CM

code "FAP SNOMED CT": '72900001' from "SNOMED-CT" display 'Familial multiple polyposis syndrome (disorder)'
code "FAP ICD-10-CM": 'D13.91' from "ICD-10-CM" display 'Familial adenomatous polyposis'
concept "FAP": {"FAP SNOMED CT", "FAP ICD-10-CM"} display 'Familial adenomatous polyposis'

code "AFAP SNOMED CT": '715866009' from "SNOMED-CT" display 'Attenuated familial adenomatous polyposis (disorder)'
code "AFAP ICD-10-CM": 'D13.91' from "ICD-10-CM" display 'Familial adenomatous polyposis'
concept "AFAP": {"AFAP SNOMED CT", "AFAP ICD-10-CM"} display 'Attenuated familial adenomatous polyposis'

code "MAP SNOMED CT": '423471004' from "SNOMED-CT" display 'MYH-associated polyposis (disorder)' // no specific code available in ICD-10-CM

code "Peutz-Jegher syndrome": '54411001' from "SNOMED-CT" display 'Peutz-Jeghers syndrome (disorder)' // no specific code available in ICD-10-CM

code "Juvenile Polyposis Syndrome": '9273005' from "SNOMED-CT" display 'Juvenile polyposis syndrome (disorder)' // no specific code available in ICD-10-CM

code "Serrated polyposis syndrome": '763536006' from "SNOMED-CT" display 'Hyperplastic polyposis syndrome (disorder)' // no specific code available in ICD-10-CM 

code "Cowden Syndrome SNOMED CT": '58037000' from "SNOMED-CT" display 'Cowden syndrome (disorder)'
code "Cowden Syndrome ICD-10-CM": 'Q85.81' from "ICD-10-CM" display 'PTEN hamartoma tumor syndrome' // #TODO check if more ICD-10-CM Codes exist for Cowden
concept "Cowden Syndrome": {"Cowden Syndrome SNOMED CT", "Cowden Syndrome ICD-10-CM"} display 'Cowden Syndrome'

code "Familial Colorectal Cancer Type X": '1197359006' from "SNOMED-CT" display 'Familial colorectal cancer type X (disorder)' // no specific code available in ICD-10-CM

//------------------------------------------------------------------------------
// INCREASED RISK: PERSONAL HISTORY OF COLORECTAL CANCER
//------------------------------------------------------------------------------

valueset "Colorectal Cancer Resection Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.705' // PLACEHOLDER value set. #TODO replace with procedures specific to CRC resection, add rectal procedures

//------------------------------------------------------------------------------
// INCREASED RISK: IBD
//------------------------------------------------------------------------------

// #TODO Primary Sclerosing Cholangitis
// #TODO Microscopic Colitis
// #TODO Indeterminate Colitis

//------------------------------------------------------------------------------
// GENETIC/FAMILIAL RISK REFERRAL
//------------------------------------------------------------------------------

//#TODO

//------------------------------------------------------------------------------
// DATA ELEMENTS
//------------------------------------------------------------------------------


// Colorectal cancer screening modalities
valueset "Colonoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.356' // for use with document type/diagnostic report
valueset "Colonoscopy Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1020' // Steward: NCQA Phemur
valueset "Fecal Occult Blood Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.11.1020' // Includes FIT and gFOBT, which cannot always be distinguished in LOINC; Steward: NCQA
valueset "Stool DNA-FIT": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1145' // Steward: NCQA
valueset "CT Colonography Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.118.11.1097' // For use with document type/diagnostic report. Steward: NCQA Phemur
valueset "CT Colonography Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1144' // SNOMED-CT only. Steward: NCQA Phemur | #TODO replace with grouping of SNOMED and CPT. NCQA value sets marked as not maintained.
valueset "Flexible Sigmoidoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.359' // for use with document type/diagnostic report
valueset "Flexible Sigmoidoscopy Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1010' // Steward: NCQA. Includes CPT, HCPCS and SNOMED-CT.

// Observation.code for stool test results (FIT/gFOBT and sDNA-FIT)
code "Inconclusive": '419984006' from "SNOMED-CT" display 'Inconclusive (qualifier value)'
code "Invalid": '455371000124106' from "SNOMED-CT" display 'Invalid result (qualifier value)'
code "Negative": '260385009' from "SNOMED-CT" display 'Negative (qualifier value)'
code "Positive": '10828004' from "SNOMED-CT" display 'Positive (qualifier value)'

// Observation.code for colonoscopy/flexible sigmoidoscopy results/findings
code "Colonoscopy Study Observation": '28023-0' from "LOINC" display 'Colonoscopy Study observation'
code "Flexible Sigmoidoscopy Study Observation": '28027-1' from "LOINC" display 'Flexible Sigmoidoscopy Study observation'

// DiagnosticReport.conclusionCode Observation.code for findings associated with colonoscopy or flexible sigmoidoscopy
valueset "Colorectal Cancer SNOMED": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.326' // Using SNOMED CT only since no expectation of ICD-10-CM associated with DiagnosticReport or Observation
valueset "Potentially Precancerous Polyp SNOMED": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.353' // Using SNOMED CT only since no expectation of ICD-10-CM associated with DiagnosticReport or Observation

// QuestionnaireResponse.item.answer.valueCoding for colonoscopy and flexible sigmoidoscopy results  
code "Colorectal Cancer Code": '1286877004' from "SNOMED-CT" display 'Malignant neoplasm of cecum and/or colon and/or rectum (disorder)'
code "Polyp of Large Intestine Code": '399505005' from "SNOMED-CT" display 'Polyp of large intestine (disorder)'

// DiagnosticReport.conclusionCode or Observation.code for findings associated with CT colonoscopy
// Intermediate Polyp
code "C-RADS 2005 C2": 'C2' from "C-RADS 2005" display 'C-RADS Category 2 - Intermediate polyp or indeterminate finding: surveillance or colonoscopy recommended'
code "C-RADS 2023 C2a": 'C2a' from "C-RADS 2023" display 'C-RADS Category 2a - Intermediate polyp or indeterminate finding'
concept "C-RADS C2/C2a": {"C-RADS 2005 C2", "C-RADS 2023 C2a"} display 'Intermediate polyp or indeterminate finding'

// Possibly advanced polyp
code "C-RADS 2005 C3": 'C3' from "C-RADS 2005" display 'C-RADS Category 3 - Polyp, possibly advanced adenoma: follow-up colonoscopy recommended'
code "C-RADS 2023 C3": 'C3' from "C-RADS 2023" display 'C-RADS Category 3 - Polyp, possibly advanced adenoma'
concept "C-RADS C3": {"C-RADS 2005 C3", "C-RADS 2023 C3"} display 'C-RADS Category 3 - Polyp, possibly advanced adenoma'

// Colorectal cancer
code "C-RADS 2005 C4": 'C4' from "C-RADS 2005" display 'C-RADS Category 4 - Colonic mass, likely malignant'
code "C-RADS 2023 C4": 'C4' from "C-RADS 2023" display 'C-RADS Category 4 - Colonic mass, likely malignant: surgical consultation recommended'
concept "C-RADS C4": {"C-RADS 2005 C4", "C-RADS 2023 C4"} display 'C-RADS Category 4 - Colonic mass, likely malignant'


//#TODO: add to L2. Codes for normal direct visualization tests as explicit findings 
// code "Normal Colonoscopy": '313170008' from "SNOMED-CT" display 'Colonoscopy normal (finding)'
// code "Normal Flexible Sigmoidoscopy": '415527002' from "SNOMED-CT" display 'Sigmoidoscopy normal (finding)'
// code "Normal CT Colonoscopy": 'C1' from "C-RADS 2023" display 'C-RADS Category 1 - Normal colon or benign lesion'

// #TODO Observation.code and Observation.valueCodeableConcept for colonoscopy quality
    // Bowel preparation adequacy assessment
    // Colonoscopy completeness assessment
    // Inadequate bowel preparation
    // Complete/total colonoscopy
