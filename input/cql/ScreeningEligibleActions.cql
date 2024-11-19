library ScreeningEligibleActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements


codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Eligible for screening": 'eligible' from "ActCode" display 'Eligible for screening'
code "Not eligible for screening": 'noteligible' from "ActCode" display 'Not eligible for screening'
// Reason Codes
code "Eligible for screening reason": 'eligibleforscreening' from "ReasonCode" display 'Eligible for screening'
code "Current colorectal cancer": 'currentcolorectalcancer' from "ReasonCode" display 'Current colorectal cancer'
code "Total colectomy":  'totalcolectomy' from "ReasonCode" display 'Total colectomy'

context Patient

define "act-eligible":
  {
    result: true,
		code: "Eligible for screening",
    reason: "Eligible for screening reason"
	}

define "end-noteligible-currentcolorectalcancer":
  {
    result: false,
		code: "Not eligible for screening",
    reason: "Current colorectal cancer"
	}  

define "end-noteligible-colectomy":  
  {
    result: false,
		code: "Not eligible for screening",
    reason: "Total colectomy"
	} 

//define "act-Diagnostic":
  // TODO: Implement logic for act-dxtesting