library decisionToScreenActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Eligible for average risk screening": 'avgriskeligible' from "ActCode" display 'Eligible for average risk screening'
code "Eligible for increased risk screening": 'incriskeligible' from "ActCode" display 'Eligible for increased risk screening'
// Reason Codes
code "Eligible for average risk screening reason": 'eligibleforavgscreening' from "ReasonCode" display 'Eligible for average screening'
code "Eligible for increased risk screening reason": 'eligibleforincscreening' from "ReasonCode" display 'Eligible for increased screening'

context Patient

define "act-AvgRiskEligible":
  {
    result: true,
		code: "Eligible for average risk screening",
    reason: "Eligible for average risk screening reason"
	}

define "act-HarmsLikelyOutweighBenefits":
  {
    result: false,
		code: "Not eligible for screening",
    reason: "Diagnostic testing"
	} 

define "act-SelectivelyOfferScreening":
  // TODO: Implement logic for act-SelectivelyOfferScreening

define "act-sdmcontinuelifexp":
  // TODO: Implement logic for act-sdmcontinuelifexp

define "act-incRiskEligible":
  {
    result: true,
		code: "Eligible for increased risk screening",
    reason: "Eligible for increased risk screening reason"
	}