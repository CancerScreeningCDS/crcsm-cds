library USPSTFAvgRiskActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions
include DetermineNextDueDate version '1.0.0' called DetermineNextDueDate

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
// code "avg risk screening": 'avgriskscreening' from "ActCode" display 'Average risk screening'
code "Start screening at 45 years old": 'startscreeningat45yearsold' from "ActCode" display 'Start screening at 45 years old'
code "Start screening": 'startscreening' from "ActCode" display 'Start screening'
code "Continue routine screening": 'continueroutinescreening' from "ActCode" display 'Continue routine screening'

// TODO: Consider attributing a reason code to each action
// Reason Codes
code "USPSTF average risk": 'USPSTFaveragerisk' from "ReasonCode" display 'USPSTF average risk'

context Patient

// define avg_risk_screening:
//   {
// 		code: "avg risk screening",
//     timingTiming: {
//       event: {},
//       repeat: {
//         frequency: 1,
//         period: 1.0,
//         periodUnit: 'a'
//       }
//     }
// 	}   

// CALCULATE DUE DATES

define "DueDateWhenPatientIs45":
  Patient.birthDate + 45 years

define "DueDateNow":
  Now()

define "NextDueDate":
  DetermineNextDueDate."flow-DetermineNextDueDate"

// ACTIONS

// TODO: Use only timingTiming within Actions, since only one action.timing[x] element is allowed in a Request Group.
// We should consider removing timingAge.

define "act-RecommendStartScreeningAt45":
  // CRCSMCommonFunctions.SetRecommendation(avg_risk_screening.code, "USPSTF average risk", 
  //   CRCSMCommonFunctions.SourceDocumentationUSPSTF, 
  //   {value: 45.0, code: 'a'}, {}, avg_risk_screening.timingTiming.repeat)
  {
		code: "Start screening at 45 years old",
    reason: "USPSTF average risk",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF,
    timingAge: {value: 45.0, code: 'a'},
    timingTiming: {
      event: "DueDateWhenPatientIs45"
    }
  }

define "act-updateDueDateNow":
  // CRCSMCommonFunctions.SetRecommendation(avg_risk_screening.code, "USPSTF average risk", 
  //   CRCSMCommonFunctions.SourceDocumentationUSPSTF, 
  //   {value: AgeInYears() * 1.0, code: 'a'}, null, avg_risk_screening.timingTiming.repeat)
  {
		code: "Start screening",
    reason: "USPSTF average risk",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF,
    timingAge: {value: 45.0, code: 'a'},
    timingTiming: {
      event: "DueDateNow"
    }
  }

define "act-determineDueDate":
  // CRCSMCommonFunctions.SetRecommendation(avg_risk_screening.code, "USPSTF average risk", 
  //   CRCSMCommonFunctions.SourceDocumentationUSPSTF, 
  //   {value: AgeInYears() * 1.0, code: 'a'}, null, avg_risk_screening.timingTiming.repeat) 
  {
		code: "Continue routine screening",
    reason: "USPSTF average risk",
    documentation: CRCSMCommonFunctions.SourceDocumentationUSPSTF,
    timingAge: {value: 45.0, code: 'a'},
    timingTiming: {
      event: "NextDueDate"
    }
  }

