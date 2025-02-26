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

library IncreasedRiskExclusionsActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Surveillance for Colorectal Cancer": '452071000124102' from "SNOMED-CT" display 'Surveillance for colorectal cancer (regime/therapy)'
code "Screening for Colorectal Cancer": '268548003' from "SNOMED-CT" display 'Screening for malignant neoplasm of large intestine (procedure)' // TODO: roll back to Average risk screening for clarity
code "Increased Risk Screening for Colorectal Cancer": 'increasedriskscreening' from "ActCode" display 'Increased risk screening for colorectal cancer'

// Reason Codes
code "Hereditary Syndrome": '699346009' from "SNOMED-CT" display 'Hereditary cancer-predisposing syndrome (disorder)'
code "Inflammatory Bowel Disease": '24526004' from "SNOMED-CT" display 'Inflammatory bowel disease (disorder)'
code "History of Colorectal Cancer": '1286880003' from "SNOMED-CT" display 'History of malignant neoplasm of cecum and/or colon and/or rectum (situation)'
code "Family History of Colorectal Cancer": '1421000119104' from "SNOMED-CT" display 'Family history of colorectal cancer (situation)'
code "History of Potentially Precancerous Polyps": 'historyofprecancerouspolyps' from "ReasonCode" display 'History of potentially precancerous polyps'
code "Average Risk for Colorectal Cancer": 'averagerisk' from "ReasonCode" display 'At average risk for colorectal cancer'

context Patient

// TODO: add references

define "act-CRCHereditarySyndrome":
  {
	code: "Surveillance for Colorectal Cancer",
  reason: "Hereditary Syndrome"
  }

define "act-IBD":
  {
	code: "Surveillance for Colorectal Cancer",
  reason: "Inflammatory Bowel Disease"
  }

define "act-HxCRC":
  {
	code: "Surveillance for Colorectal Cancer",
  reason: "History of Colorectal Cancer"
  }

define "act-FamilyHxCRC":
  {
	code: "Increased Risk Screening for Colorectal Cancer",
  reason: "Family History of Colorectal Cancer"
  }

define "act-HxPolyps":
  {
	code: "Increased Risk Screening for Colorectal Cancer",
  reason: "History of Potentially Precancerous Polyps"
  }