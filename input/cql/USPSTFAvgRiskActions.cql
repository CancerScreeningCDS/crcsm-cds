library USPSTFAvgRiskActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "avg risk screening": 'avgriskscreening' from "ActCode" display 'Average risk screening'
// Reason Codes
code "USPSTF average risk": 'USPSTFaveragerisk' from "ReasonCode" display 'USPSTF average risk'

context Patient

define avg_risk_screening:
  {
		code: "avg risk screening",
    timingTiming: {
      event: {},
      repeat: {
        frequency: 1,
        period: 1.0,
        periodUnit: 'a'
      }
    }
	}   

define "act-RecommendStartScreeningAt45":
  CRCSMCommonFunctions.SetRecommendation(avg_risk_screening.code, "USPSTF average risk", 
    CRCSMCommonFunctions.SourceDocumentationUSPSTF, 
    {value: 45.0, code: 'a'}, {}, avg_risk_screening.timingTiming.repeat) 

define "act-updateDueDateNow":
  CRCSMCommonFunctions.SetRecommendation(avg_risk_screening.code, "USPSTF average risk", 
    CRCSMCommonFunctions.SourceDocumentationUSPSTF, 
    {value: AgeInYears() * 1.0, code: 'a'}, {}, avg_risk_screening.timingTiming.repeat) 

define "act-determineDueDate":
  CRCSMCommonFunctions.SetRecommendation(avg_risk_screening.code, "USPSTF average risk", 
    CRCSMCommonFunctions.SourceDocumentationUSPSTF, 
    {value: AgeInYears() * 1.0, code: 'a'}, {}, avg_risk_screening.timingTiming.repeat) 
  // TODO: Implement logic for act-determineDueDate
