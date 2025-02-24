
Instance: PrimaryScreeningDecision
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Primary Screening Decision"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "PrimaryScreeningDecision"
* description = "Primary Screening Decision pathway."
* type = $PDTYPE#eca-rule "ECA Rule"
* library[+] = "Library/PrimaryScreeningDecision|1.0.0"

// -----------------------------------------------------------------------------
// Action #1: Not Screening Eligible
// -----------------------------------------------------------------------------
* insert IsNotScreeningEligible

// -----------------------------------------------------------------------------
// DECISION TO SCREEN
// -----------------------------------------------------------------------------
* insert SDMContinueScreeningAge
* insert Applicability
* insert SDMContinueScreeningLifeExp
* insert Applicability
* insert StopScreeningAge
* insert Applicability

// -----------------------------------------------------------------------------
// INCREASED RISK SCREENING/SURVEILLANCE
// -----------------------------------------------------------------------------

* insert HereditarySyndromesSurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert Applicability
* insert IBDSurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert Applicability
* insert PostCRCSurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert Applicability
* insert FamHxCRCIncreasedRiskScreening
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert Applicability
* insert PostPolypectomySurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert Applicability

// -----------------------------------------------------------------------------
// AVERAGE RISK
// -----------------------------------------------------------------------------

* insert StartScreeningAt45YearsOld
* insert ApplicabilityAverageRiskRecommendations
* insert Applicability
* insert StartScreening
* insert ApplicabilityAverageRiskRecommendations
* insert Applicability
* insert ContinueRoutineScreening
* insert ApplicabilityAverageRiskRecommendations
* insert Applicability

RuleSet: Applicability
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "IsScreeningEligible"