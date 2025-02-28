library ScreeningDueActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "See 'Decision to Screen' logic path": 'seedecisiontoscreenpath' from "ActCode" display 'See Decision to Screen logic path'

// Reason Codes
code "Next due date not available": 'nextduedatenotavailable' from "ReasonCode" display 'Next due date not available'

context Patient

define "act-determinedue":
{
    code: "See 'Decision to Screen' logic path",
    reason: "Next due date not available",
    documentation: CRCSMCommonFunctions.SourceDocumentationOther
}

//define "act-patientOutreach" - TODO: not used in breast, flags are used for overdue instead. We should go back to L2 to align