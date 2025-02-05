library FollowUpActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Continue routine screening": 'continueroutinescreening' from "ActCode" display 'Continue routine screening'
code "Continue routine screening if high-quality test": 'continueroutinescreeninghighqualitytest' from "ActCode" display 'Continue routine screening if high-quality test'
code "Repeat screening": 'repeatscreening' from "ActCode" display 'Repeat screening'
code "Order follow-up colonoscopy": 'orderfollowupcolonoscopy' from "ActCode" display 'Order follow-up colonoscopy'

// Reason Codes
code "Screening negative": 'negativescreening' from "ReasonCode" display 'Non-colonoscopy colorectal cancer screening negative'
code "Inconclusive non-colonoscopy test result": 'inconclusivescreening' from "ReasonCode" display 'Inconclusive non-colonoscopy screening'
code "Positive or abnormal noncolonoscopy test": 'positiveabnormalscreening' from "ReasonCode" display 'Positive or abnormal non-colonoscopy screening'
code "Negative or normal non-colonoscopy test with high-quality exam": 'negativehighqualityscreening' from "ReasonCode" display 'Negative or normal non-colonoscopy test with high-quality exam'

context Patient

define "act-continueRoutineScreening":
  //TODO: Add calculated next due date. Determine if need to check for average risk.
  {
		code: "Continue routine screening",
    reason: "Screening negative",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF
  }

define "act-repeatScreening":
  {
    code: "Repeat screening",
    reason: "Inconclusive non-colonoscopy test result",
    documentation: CRCSMCommonFunctions.SourceDocumentationOther
  }

define "act-continueRoutineScreeningDirectViz":
  //TODO: Add calculated next due date. Determine if need to check for average risk.
  {
    code: "Continue routine screening if high-quality test",
    reason: "Negative or normal non-colonoscopy test with high-quality exam",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF
  }

//todo: this should use SetRecommendation
define "act-FollowUpColonoscopy":
  {
		code: "Order follow-up colonoscopy",
    reason: "Positive or abnormal noncolonoscopy test",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF
  }

