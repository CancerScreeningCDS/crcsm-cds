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

library USPSTFAvgRiskActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions
include DetermineNextDueDate version '1.0.0' called DetermineNextDueDate

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Colorectal Cancer Screening": '268548003' from "SNOMED-CT" display 'Screening for malignant neoplasm of large intestine (procedure)'

// TODO: Consider attributing a reason code to each action
// Reason Codes
code "USPSTF average risk": 'USPSTFaveragerisk' from "ReasonCode" display 'USPSTF average risk'

context Patient

// CALCULATE DUE DATES

define DueDateWhenPatientIs45:
  Patient.birthDate + 45 years


define NextDueDate:
  DetermineNextDueDate."flow-DetermineNextDueDate"
  
// ACTIONS

// TODO: Use only timingTiming within Actions, since only one action.timing[x] element is allowed in a Request Group.
// We should consider removing timingAge.

define "act-RecommendStartScreeningAt45":
  CRCSMCommonFunctions.SetRecommendation("Colorectal Cancer Screening", "USPSTF average risk", CRCSMCommonFunctions.SourceDocumentationUSPSTF, {value: 45.0, code: 'a'}, DueDateWhenPatientIs45, null)

// TODO: update L2 to use date patient turns 45 as due date. When a patient has not had any screening in the past, and they're over the start screening age, their due date is _still_ the same. If we set the due date to Now(), they will appear as due instead of overdue.
define "act-updateDueDateNow":
  CRCSMCommonFunctions.SetRecommendation("Colorectal Cancer Screening", "USPSTF average risk", CRCSMCommonFunctions.SourceDocumentationUSPSTF, {value: 45.0, code: 'a'}, DueDateWhenPatientIs45, null)

define "act-determineDueDate":
  CRCSMCommonFunctions.SetRecommendation("Colorectal Cancer Screening", "USPSTF average risk", CRCSMCommonFunctions.SourceDocumentationUSPSTF, {value: 45.0, code: 'a'}, NextDueDate, null)


