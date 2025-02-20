Instance: HighLevelFlow
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "High Level Flow"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "HighLevelFlow"
* description = "High Level Flow pathway."
* type = $PDTYPE#eca-rule "ECA Rule"

// -----------------------------------------------------------------------------
// FollowupScreeningResult
// -----------------------------------------------------------------------------
* action[+].title = "Followup Screening Result"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "hasFollowUpRecommendation"
* action[=].definitionCanonical = Canonical(flow-FollowUp|1.0.0)
// -----------------------------------------------------------------------------
// PrimaryScreeningDecision
// -----------------------------------------------------------------------------
* action[+].title = "Primary Screening Decision"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "noFollowUpRecommendation"
* action[=].definitionCanonical = Canonical(PrimaryScreeningDecision|1.0.0)

