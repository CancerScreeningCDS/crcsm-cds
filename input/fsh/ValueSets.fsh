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