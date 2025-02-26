Alias: $PDACS = http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system
Alias: $PDARCS = http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system
Alias: $SOCS = http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/screening-observation-code-system

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: PlanDefinitionActionCodeSystem
Id: plan-definition-action-code-system
Title: "Plan Definition Action Code System"
Description: "Code representing plan definition action codes"

* ^experimental = true

* #eligible "Eligible for screening"
* #noteligible "Not eligible for screening"
* #error "An error occurred"
* #sdmcontinue "Shared decision making to continue screening"
* #stopscreen "Recommendation to stop screening"
// * #avgriskscreening "Average risk screening"
* #startscreeningat45yearsold "Start screening at 45 years old"
* #startscreening "Start screening"
* #continueroutinescreening "Continue routine screening"
* #continueroutinescreeninghighqualitytest "Continue routine screening if high-quality test"
* #orderfollowupcolonoscopy "Order follow-up colonoscopy"
* #specialtyreferral "Refer to specialist recommendations"
* #increasedriskscreening "Increased risk screening for colorectal cancer"


ValueSet:    PlanDefinitionActionCodes
Id:          plan-definition-action-codes
Title:       "Plan Definition Action Codes"
Description: "This value set includes action codes for Plan Definitions within this implementation guide."
* ^experimental = true
* include codes from system $PDACS

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: PlanDefinitionActionReasonCodeSystem
Id: plan-definition-action-reason-code-system
Title: "Plan Definition Action Reason Code System"
Description: "Code representing plan definition action reason codes"

* ^experimental = true

* #eligibleforscreening "Eligible for screening"
* #missingageorbirthdate "Missing patient age in years or birth date"
* #currentcolorectalcancer "Current colorectal cancer"
* #totalcolectomy "Total colectomy"
* #diagtesting "Diagnostic testing"
* #ageover86 "Age over 86 years"
* #lifeexp "Reduced life expectancy indicator"
* #age76to86 "Age 76 to 86 years"
* #USPSTFaveragerisk "USPSTF average risk"
* #negativescreening "Non-colonoscopy colorectal cancer screening negative"
* #negativehighqualityscreening "Negative or normal non-colonoscopy test with high-quality exam"
* #inconclusivescreening "Inconclusive non-colonoscopy screening"
* #positiveabnormalscreening "Positive or abnormal non-colonoscopy screening"
* #historyofprecancerouspolyps "History of potentially precancerous polyps"
* #averagerisk "At average risk for colorectal cancer"
* #eligibleforscreening "Eligible for screening"
* #totalcolectomy "Total colectomy"
* #diagtesting "Diagnostic testing"


ValueSet:    PlanDefinitionActionReasonCodes
Id:          plan-definition-action-reason-codes
Title:       "Plan Definition Action Reason Codes"
Description: "This value set includes action reason codes for Plan Definitions within this implementation guide."
* ^experimental = true
* include codes from system $PDARCS

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: ScreeningObservationCodeSystem
Id: screening-observation-code-system
Title: "Screening Observation Code System"
Description: "Code representing cancer screening related observations"

* ^experimental = true

* #ColorectalSymptoms "New or worsening colorectal symptoms"
* #ReducedLifeExpectancyIndicator "Reduced life expectancy indicator"

////////////////////////////////////////////////////////////////////////////////////////////////////

// C-RADS is not part of Radlex. Source: https://www.acr.org/Clinical-Resources/Reporting-and-Data-Systems/C-Rads
CodeSystem: CRADS2005CodeSystem
Id: c-rads-2005-code-system
Title: "CT Colonography Reporting and Data System (C-RADS)"
Description: "Codes for C-RADS v2005 colorectal finding categories."

* ^version = "v2023"
* ^status = $PUBSTAT#active

* #C0 "C-RADS Category 0 - Inadequate study/awaiting prior comparisons"
* #C1 "C-RADS Category 1 - Normal colon or benign lesion"
* #C2a "C-RADS Category 2a - Intermediate polyp or indeterminate finding"
* #C2b "C-RADS Category 2b - Likely benign diverticular finding"
* #C3 "C-RADS Category 3 - Polyp, possibly advanced adenoma"
* #C4 "C-RADS Category 4 - Colonic mass, likely malignant"

CodeSystem: CRADS2023CodeSystem
Id: c-rads-2023-code-system
Title: "CT Colonography Reporting and Data System (C-RADS)"
Description: "Codes for C-RADS v2023 colorectal finding categories."

* ^version = "v2005"
* ^status = $PUBSTAT#retired

* #C0 "C-RADS Category 0 - Inadequate study/awaiting prior comparisons"
* #C1 "C-RADS Category 1 - Normal colon or benign lesion: continue routine screening"
* #C2 "C-RADS Category 2 - Intermediate polyp or indeterminate finding: surveillance or colonoscopy recommended"
* #C3 "C-RADS Category 3 - Polyp, possibly advanced adenoma: follow-up colonoscopy recommended"
* #C4 "C-RADS Category 4 - Colonic mass, likely malignant: surgical consultation recommended"

///////////////////////////////////////////////////////////////////////////////////////////////////

/*
CodeSystem: FamilyHistoryColorectalCancerQuestionnaireItems
Id: fam-hx-crc-questionnaire
Title: "Family History of Colorectal Cancer Questionnaire"
Description: "Codes for questions "

* #PolypsInFirstDegreeRelative "Any first-degree relative (mother, father, sibling or child) with confirmed potentially precancerous colorectal polyp(s)?"
 */

 ///////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: RecommendationFlagCodeSystem
Id: recommendation-flag-code-system
Title: "Recommendation Flag Code System"
Description: "Code representing due/overdue flags"

* ^experimental = true

* #overdue "Overdue"
* #due "Due"
* #not-due "Not due"

ValueSet:    RecommendationFlagCodes
Id:          recommendation-flag-codes
Title:       "Recommendation Flag Codes"
Description: "This value set includes flag codes for recommendation actions within this implementation guide."
* ^experimental = true
* include codes from system $RecommendationFlagCS

///////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: ColonoscopyResultObservationCodeSystem
Id: colonoscopy-result-observation-system
Title: "Colonoscopy Result Observation Code System"
Description: "Code representing cancer screening related observations"

* ^experimental = true

* #crcfinding "Colorectal cancer finding"
* #missingrec "Missing endoscopist recommendation for potentially precancerous polyp finding"