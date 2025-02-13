////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-IncreasedRiskExclusions
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Increased Risk Exclusions"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-IncreasedRiskExclusions"
* description = "Risk Factors logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/IncreasedRiskExclusions|1.0.0"
// -----------------------------------------------------------------------------
// Action #1: Hereditary syndromes increased risk screening/surveillance
// -----------------------------------------------------------------------------
* action[+].id = "HereditarySyndromesIncreasedRisk"
* action[=].title = "Hereditary syndromes increased risk screening/surveillance"
* action[=].description = "Hereditary syndromes increased risk screening/surveillance"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsHereditarySyndrome"
//* action[=].definitionCanonical = Canonical(flow-Syndromes|1.0.0)

// -----------------------------------------------------------------------------
// Action #2: IBD surveillance
// -----------------------------------------------------------------------------
* action[+].id = "IBDIncreasedRisk"
* action[=].title = "IBD surveillance"
* action[=].description = "IBD surveillance"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsIBD"
//* action[=].definitionCanonical = Canonical(flow-IBD|1.0.0)

// -----------------------------------------------------------------------------
// Action #3: Post-colorectal cancer resection surveillance
// -----------------------------------------------------------------------------
* action[+].id = "HistoryCRCIncreasedRisk"
* action[=].title = "Post-colorectal cancer resection surveillance"
* action[=].description = "Post-colorectal cancer resection surveillance"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsHxCRC"
//* action[=].definitionCanonical = Canonical(flow-PersonalHxOfCRC|1.0.0)

// -----------------------------------------------------------------------------
// Action #4: Family history increased risk screening/surveillance
// -----------------------------------------------------------------------------
* action[+].id = "FamilyHistoryIncreasedRisk"
* action[=].title = "Family history increased risk screening/surveillance"
* action[=].description = "Family history increased risk screening/surveillance"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsFamilyHx"
//* action[=].definitionCanonical = Canonical(flow-FamilyHx|1.0.0)

// -----------------------------------------------------------------------------
// Action #5: Post-polypectomy surveillance
// -----------------------------------------------------------------------------
* action[+].id = "HistoryPolypsIncreasedRisk"
* action[=].title = "Post-polypectomy surveillance"
* action[=].description = "Post-polypectomy surveillance"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsHxPolyps"
//* action[=].definitionCanonical = Canonical(flow-PostPolypectomy|1.0.0)
