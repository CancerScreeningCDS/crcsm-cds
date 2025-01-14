library FollowUpActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Pick screening method - non tiered": 'screeningmethodnontiered' from "ActCode" display 'Pick screening method - non tiered'
code "Pick screening method - tiered": 'screeningmethodtiered' from "ActCode" display 'Pick screening method - tiered'
code "See Decision to Screen logic path": 'seedecisiontoscreenpath' from "ActCode" display 'See Decision to Screen logic path'
code "Follow-up with endoscopist to consider repeat testing": 'followupendoscopist' from "ActCode" display 'Follow-up with endoscopist to consider repeat testing'
code "Order follow-up colonoscopy": 'orderfollowupcolonoscopy' from "ActCode" display 'Order follow-up colonoscopy'

// Reason Codes
code "non tiered configuration parameter": 'nontiered' from "ReasonCode" display 'non tiered configuration parameter'
code "tiered configuration parameter": 'tiered' from "ReasonCode" display 'tiered configuration parameter'
code "Continue routine screening": 'continueroutinescreening' from "ReasonCode" display 'Continue routine screening'
code "Inadequate bowel prep": 'inadequatebowelprep' from "ReasonCode" display 'Inadequate bowel prep'
code "Positive or abnormal noncolonoscopy test": 'positiveabnormalnoncolontest' from "ReasonCode" display 'Positive or abnormal noncolonoscopy test'

context Patient

define "act-continueRoutineScreening":
  {
		code: "See Decision to Screen logic path",
    reason: "Continue routine screening"
  }

define "act-followUpEndoscopist":
  {
		code: "Follow-up with endoscopist to consider repeat testing",
    reason: "Inadequate bowel prep"
  }

define "act-PickScreeningMethodNonTiered":
  {
		code: "Pick screening method - non tiered",
    reason: "non tiered configuration parameter",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF
  }

define "act-PickScreeningMethodTiered":
  {
		code: "Pick screening method - tiered",
    reason: "tiered configuration parameter",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSMSTF
  }

//todo: this should use SetRecommendation
define "act-FollowUpColonoscopy":
  {
		code: "Order follow-up colonoscopy",
    reason: "Positive or abnormal noncolonoscopy test",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF
  }

