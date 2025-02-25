Instance: HighLevel
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "High Level Flow"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "HighLevel"
* description = "Brings together recommendations from Primary Screening Decision and Follow-up Screening Result."
* type = $PDTYPE#eca-rule "ECA Rule"
* library[+] = "Library/HighLevel|1.0.0"

// -----------------------------------------------------------------------------
// FollowupScreeningResult
// -----------------------------------------------------------------------------
* action[+].title = "Followup Screening Result"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowUpRecommendation"
* action[=].definitionCanonical = Canonical(flow-FollowUp|1.0.0)
// -----------------------------------------------------------------------------
// PrimaryScreeningDecision
// -----------------------------------------------------------------------------
* action[+].title = "Primary Screening Decision"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsPrimaryScreeningDecisionRecommendation"
* action[=].definitionCanonical = Canonical(PrimaryScreeningDecision|1.0.0)
// -----------------------------------------------------------------------------
// GeneticRiskReferral
// -----------------------------------------------------------------------------
// TODO: add genetic risk referral as a third top-level recommendation