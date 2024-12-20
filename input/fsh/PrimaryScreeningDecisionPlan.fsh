
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
// Action #1: Screening Eligible
// -----------------------------------------------------------------------------
* action[+].title = "Screening Eligible"
* action[=].definitionCanonical = Canonical(flow-ScreeningEligible|1.0.0)
// -----------------------------------------------------------------------------
// Action #2: Decision to Screen
// -----------------------------------------------------------------------------
* action[+].title = "Decision to Screen"
* action[=].definitionCanonical = Canonical(flow-DecisionToScreen|1.0.0)
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "IsScreeningEligible"