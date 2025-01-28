library ScreeningDueActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "See 'Decision to Screen' logic path": 'seedecisiontoscreenpath' from "ActCode" display 'See Decision to Screen logic path'
code "Patient outreach": 'patientoutreach' from "ActCode" display 'Patient outreach'
code "Order screening test": 'orderscreeningtest' from "ActCode" display 'Order screening test'

// Reason Codes
code "Next due date not available": 'nextduedatenotavailable' from "ReasonCode" display 'Next due date not available'
code "Overdue for screening": 'overdueforscreening' from "ReasonCode" display 'Overdue for screening'
code "Due or overdue": 'dueoroverdue' from "ReasonCode" display 'Due or overdue for screening'

context Patient

define "act-determinedue":
{
    code: "See 'Decision to Screen' logic path",
    reason: "Next due date not available",
    documentation: CRCSMCommonFunctions.SourceDocumentationOther
}

define "act-patientOutreach":
{
    code: "Patient outreach",
    reason: "Overdue for screening",
    documentation: CRCSMCommonFunctions.SourceDocumentationOther
}

define "act-orderTest":
  //if DataElements."de-pendingOrderReferralForCRCTest" is false 
  //then
  {
    code: "Order screening test",
    reason: "Due or overdue",
    documentation: CRCSMCommonFunctions.SourceDocumentationOther
  }  
