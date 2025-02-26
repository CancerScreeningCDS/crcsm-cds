library DecisionToScreenActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Discuss decision to continue screening": 'sdmcontinue' from "ActCode" display 'Shared decision making to continue screening'
code "Stop screening": 'stopscreening' from "ActCode" display 'Stop screening'

// Reason Codes
code "Age 76 to 86 years": 'age76to86' from "ReasonCode" display 'Age 76 to 86 years'
code "Age over 86 years": 'ageover86' from "ReasonCode" display 'Age over 86 years'
code "Reduced life expectancy indicator": 'lifeexp' from "ReasonCode" display 'Reduced life expectancy indicator'

context Patient

define "act-HarmsLikelyOutweighBenefits":
  {
		code: "Stop screening",
    reason: "Age over 86 years"
	} 

define "act-SelectivelyOfferScreening":
  {
		code: "Discuss decision to continue screening",
    reason: "Age 76 to 86 years"
  }

define "act-sdmcontinuelifexp":
  {
		code: "Discuss decision to continue screening",
    reason: "Reduced life expectancy indicator"
  }