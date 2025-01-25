////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-DetermineNextDueDate
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Determine Next Due Date"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-DetermineNextDueDate"
* description = "Determine next due date logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/DetermineNextDueDate|1.0.0"
// -----------------------------------------------------------------------------
// Action #1: ColonoscopyEvery10
// -----------------------------------------------------------------------------

// TODO: Fill in actions

// * action[+].id = "ACSMammoAvgRiskAgeUnder45"
// * action[=].title = "Annual screeening mammo starting age 40"
// * action[=].description = "Annual screeening mammo starting age 40"
// * action[=] insert ACSCitationActionDocumentation
// * action[=].condition[+].kind = $ACKIND#applicability "Applicability"
// * action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
// * action[=].condition[=].expression.expression = "ExistsACSMammoAvgRiskAgeUnder45"
// * action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
// * action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
// * action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
// * action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Code"
// * action[=].dynamicValue[+].path = "%action.timingTiming"
// * action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
// * action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Timing"
// * action[=].dynamicValue[+].path = "code.coding[0]"
// * action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
// * action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Code"
// * action[=].dynamicValue[+].path = "occurrenceDateTime"
// * action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
// * action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45TimingEvent"
// // -----------------------------------------------------------------------------
// Action #2: FitEveryYear
// -----------------------------------------------------------------------------
* action[+].id = "ACSMammoAvgRiskAgeUnder45"
* action[=].title = "Annual screeening mammo starting age 40"
* action[=].description = "Annual screeening mammo starting age 40"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMammoAvgRiskAgeUnder45"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Code"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Timing"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Code"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45TimingEvent"


// -----------------------------------------------------------------------------
// Action #3: gFOBTEveryYear
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Action #4: sDNAFITEvery1to3
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Action #5: CTColonographyEvery5
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Action #6: FlexSigEvery5
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Action #7: FlexSigFIT
// -----------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////////////