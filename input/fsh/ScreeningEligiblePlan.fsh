////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-ScreeningEligible
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Screening Eligible"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-ScreeningEligible"
* description = "Screening eligible logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/ScreeningEligible|1.0.0"
// -----------------------------------------------------------------------------
// Action #1: Screening Eligible
// -----------------------------------------------------------------------------
* action[+].id = "ScreeningEligible"
* action[=].title = "Screening Eligible"
* action[=].description = "Patient is eligible for screening"
* action[=].code = $PDACS#eligible "Eligible for screening"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "IsScreeningEligible"
* action[=].definitionCanonical = Canonical(CommunicateEligible|1.0.0)
// -----------------------------------------------------------------------------
// Action #2: Not Screening Eligible
// -----------------------------------------------------------------------------
* action[+].id = "Not Screening Eligible"
* action[=].title = "Not Screening Eligible"
* action[=].description = "Patient is not eligible for screening"
* action[=].code = $PDACS#noteligible "Not eligible for screening"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind =  $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "IsNotScreeningEligible"
* action[=].definitionCanonical = Canonical(CommunicateNotEligible|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ScreeningEligibleReason"
// -----------------------------------------------------------------------------
// Inclusions error
// -----------------------------------------------------------------------------
* action[+].id = "Screening Eligible Missing Data"
* action[=].title = "Screening Eligible Missing Data"
* action[=].description = "Top level action that defines missing data for inclusion and exclusion."
* action[=].documentation[+].type = $RATYPE#documentation "Documentation"
* action[=].documentation[=].label = "Inclusions"
* action[=].documentation[=].display = "Error due to missing required data"
* action[=].trigger[+].type = $TTYPE#named-event "Named Event"
* action[=].trigger[=].name = "encounter-start" // CDS Hook name
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "MissingAgeOrBirthdate"
* action[=].condition[=].expression.reference = "Library/ScreeningEligible|1.0.0"
* action[=].definitionCanonical = Canonical(ScreeningEligibleQuestionnaire|1.0.0)

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateEligible
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Eligible"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
// * cpg-partOf = Canonical(TopLevelPlanDefinition) // TODO: Tie this into the entire pathway
* url = Canonical(CommunicateEligible)
* name = "CommunicateEligible"
* description = "This ActivityDefinition generates a CommunicationRequest containing information about the patient's ineligibility for screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#eligible "Eligible for screening"
* code.text = "Eligible for screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateNotEligible
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Not Eligible"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
// * cpg-partOf = Canonical(TopLevelPlanDefinition) // TODO: Tie this into the entire pathway
* url = Canonical(CommunicateNotEligible)
* name = "CommunicateNotEligible"
* description = "This ActivityDefinition generates a CommunicationRequest containing information about the patient's ineligibility for screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#noteligible "Not eligible for screening"
* code.text = "Not eligible for screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: ScreeningEligibleQuestionnaireTask
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Screening Eligible Questionnaire Task"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
// * cpg-partOf = Canonical(TopLevelPlanDefinition) // TODO: Tie this into the entire pathway
* url = Canonical(ScreeningEligibleQuestionnaireTask)
* name = "ScreeningEligibleQuestionnaireTask"
* description = "This ActivityDefinition generates a Questionnaire Task containing a request to complete a questionnaire."
* kind = $RRTYPE#Task "Task"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-activity-type#collect-information "Collect information"
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-collectWith"
* extension[=].valueCanonical = Canonical(ScreeningEligibleQuestionnaire|1.0.0)