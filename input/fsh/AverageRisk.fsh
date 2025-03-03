////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-USPSTFAvgRisk
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Average Risk"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-USPSTFAvgRisk"
* description = """
Provides recommendations on the age to start and to stop screening, modalities, and screening intervals for average risk patients, based on U.S. Preventative Services Task Force (USPSTF). It also determines the next due date for screening for average risk patients, based on their age and screening history.

The path is intended for use with either individual patient alerts/flagging or for generating asynchronous reports on a cohort of patients in order to target outreach or escalation.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/USPSTFAvgRisk|1.0.0"

// TODO: may be able to consolidate in single action - the only differences are in action.description
* insert StartScreeningAt45YearsOld
* insert StartScreening
* insert ContinueRoutineScreening

RuleSet: StartScreeningAt45YearsOld
* action[+].id = "StartScreeningAt45YearsOld"
* action[=].title = "Start screening at 45 years old"
* action[=].description = """
Patients at average risk for colorectal cancer should start screening at 45 years old.
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsUSPSTFAvgRiskStartAt45"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTiming"
// * action[=].dynamicValue[+].path = "%action.extension"
// * action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
// * action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTimingEvent"

RuleSet: StartScreening
* action[+].id = "StartScreening"
* action[=].title = "Start screening Now"
* action[=].description = """
Start screening now. Patients at average risk for colorectal cancer should start screening at 45 years old.

Screening strategies and intervals recommended for average risk patients include:
* Colonoscopy every 10 years
* High-sensitivity gFOBT or FIT every year
* sDNA-FIT every 1 to 3 years
* CT colonography every 5 years
* Flexible sigmoidoscopy every 5 years
* Flexible sigmoidoscopy every 10 years + FIT every year
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsUSPSTFAvgRiskStartNow"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTiming"
// * action[=].dynamicValue[+].path = "%action.extension"
// * action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
// * action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTimingEvent"

RuleSet: ContinueRoutineScreening
* action[+].id = "ContinueRoutineScreening"
* action[=].title = "Continue routine screening"
* action[=].description = """
Continue routine screening.

Screening strategies and intervals recommended for average risk patients include:
* Colonoscopy every 10 years
* High-sensitivity gFOBT or FIT every year
* sDNA-FIT every 1 to 3 years
* CT colonography every 5 years
* Flexible sigmoidoscopy every 5 years
* Flexible sigmoidoscopy every 10 years + FIT every year
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsUSPSTFAvgRiskNextDue"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTiming"
// * action[=].dynamicValue[+].path = "%action.extension"
// * action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
// * action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTimingEvent"