library DetermineNextDueDateActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED-CT": 'http://snomed.info/sct'

// CODES

// Single Code for test
code "FIT TEST": '29771-3' from "LOINC" display 'Hemoglobin.gastrointestinal.lower [Presence] in Stool by Immunoassay'
code "gFOBT TEST": '2335-8' from "LOINC" display 'Hemoglobin.gastrointestinal [Presence] in Stool'

// Code from Value Set
// valueset "VSACColonoscopy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1020'
code "Colonoscopy Code": '235150006' from "SNOMED-CT" display 'Total colonoscopy (procedure)'

// valueset "VSACsDNAFIT": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1145'
code "sDNAFIT Code": '77354-9' from "LOINC" display 'Noninvasive colorectal cancer DNA and occult blood screening [Presence] in Stool'

// valueset "VSACCTC": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1038'
code "CTC Code": '60515-4' from "LOINC" display 'CT Colon and Rectum W air contrast PR'

// valueset "VSACFlexSig": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1010'
code "FlexSig Code": '396226005' from "SNOMED-CT" display 'Flexible fiberoptic sigmoidoscopy with biopsy (procedure)'



//------------------------------------------------------------------------------
// Define Code and Timing for each test
//------------------------------------------------------------------------------

// define "act-ColonoscopyEvery10":
//   // TODO: Implement logic for act-ColonoscopyEvery10

// define "act-FitEveryYear":
//   // TODO: Implement logic for act-FitEveryYear

// define "act-gFOBTEveryYear":
//   // TODO: Implement logic for act-gFOBTEveryYear

// define "act-sDNAFITEvery1to3":
//   // TODO: Implement logic for act-sDNAFITEvery1to3

// define "act-CTColonographyEvery5":
//   // TODO: Implement logic for act-CTColonographyEvery5

// define "act-FlexSigEvery5":
//   // TODO: Implement logic for act-FlexSigEvery5

// define "act-FlexSigFIT":
//   // TODO: Implement logic for act-FlexSigFIT


//------------------------------------------------------------------------------
// Call CRCSMCommonFunctions.SetRecommendation for each test
//------------------------------------------------------------------------------

// define "act-ColonoscopyEvery10":
//   // TODO: Implement logic for act-ColonoscopyEvery10

// define "act-FitEveryYear":
//   // TODO: Implement logic for act-FitEveryYear

// define "act-gFOBTEveryYear":
//   // TODO: Implement logic for act-gFOBTEveryYear

// define "act-sDNAFITEvery1to3":
//   // TODO: Implement logic for act-sDNAFITEvery1to3

// define "act-CTColonographyEvery5":
//   // TODO: Implement logic for act-CTColonographyEvery5

// define "act-FlexSigEvery5":
//   // TODO: Implement logic for act-FlexSigEvery5

// define "act-FlexSigFIT":
//   // TODO: Implement logic for act-FlexSigFIT

