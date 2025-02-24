////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-FollowUp
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Follow Up"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-FollowUp"
* description = """
Determines next steps, if any, based on result of screening tests. This may be triggered by a diagnostic report being received by the system or a test result being documented in a structured manner.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/FollowUp|1.0.0"

* insert FollowupColonoscopyCRCResult
* insert FollowupColonoscopyPolypResult
* insert FollowupCTCInconclusiveResult
* insert FollowupCTCAbnormalResult
* insert FollowupStoolInconclusiveResult
* insert FollowupStoolAbnormalResult
* insert FollowupFlexSigAbnormalResult

//TODO: add citation, NCCN? ACR?
RuleSet: FollowupColonoscopyCRCResult
* action[+].id = "FollowupColonoscopyCRCResult"
* action[=].title = "Refer to Oncology"
* action[=].description = """
Refer to Oncology for evaluation.
"""
//* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
//* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
//* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupColonoscopyCRCResult"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyCRCResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyCRCResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyCRCResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyCRCResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyCRCResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyCRCResultTimingEvent"

RuleSet: FollowupColonoscopyPolypResult
* action[+].id = "FollowupColonoscopyPolypResult"
* action[=].title = "Follow-up with endoscopist for recommendation"
* action[=].description = """
Follow-up with endoscopist to determine appropriate interval for next screening/surveillance colonoscopy.
"""
//* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
//* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
//* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupColonoscopyPolypResult"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyPolypResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyPolypResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyPolypResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyPolypResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyPolypResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupColonoscopyPolypResultTimingEvent"

RuleSet: FollowupCTCInconclusiveResult
* action[+].id = "FollowupCTCInconclusiveResult"
* action[=].title = "Repeat screening due to inconclusive CTC result"
* action[=].description = """
Repeat screening due to inconclusive CT colonography test results.
"""
//* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
//* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
//* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupCTCInconclusiveResult"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCInconclusiveResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCInconclusiveResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCInconclusiveResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCInconclusiveResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCInconclusiveResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCInconclusiveResultTimingEvent"

RuleSet: FollowupCTCAbnormalResult
* action[+].id = "FollowupCTCAbnormalResult"
* action[=].title = "Order follow-up colonoscopy due to abnormal CTC result"
* action[=].description = """
Order follow-up colonoscopy.

Abnormal findings identified by CT colonography require follow-up with colonoscopy for the screening benefits to be achieved.
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
//* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
//* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
//* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupCTCAbnormalResult"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCAbnormalResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCAbnormalResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCAbnormalResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCAbnormalResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCAbnormalResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupCTCAbnormalResultTimingEvent"

RuleSet: FollowupStoolInconclusiveResult
* action[+].id = "FollowupStoolInconclusiveResult"
* action[=].title = "Repeat screening due to inconclusive stool result"
* action[=].description = """
Repeat screening due to inconclusive test results.
"""
//* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
//* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
//* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupStoolInconclusiveResult"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolInconclusiveResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolInconclusiveResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolInconclusiveResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolInconclusiveResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolInconclusiveResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolInconclusiveResultTimingEvent"

RuleSet: FollowupStoolAbnormalResult
* action[+].id = "FollowupStoolAbnormalResult"
* action[=].title = "Order follow-up colonoscopy due to abnormal stool result"
* action[=].description = """
Order follow-up colonoscopy.

Positive stool-based tests or abnormal findings require follow-up with colonoscopy for the screening benefits to be achieved.
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
//* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
//* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
//* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupStoolAbnormalResult"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolAbnormalResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolAbnormalResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolAbnormalResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolAbnormalResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolAbnormalResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupStoolAbnormalResultTimingEvent"

RuleSet: FollowupFlexSigAbnormalResult
* action[+].id = "FollowupFlexSigAbnormalResult"
* action[=].title = "Order follow-up colonoscopy due to abnormal flex sig result"
* action[=].description = """
Order follow-up colonoscopy.

Abnormal findings identified by flexible sigmoidoscopy require follow-up with colonoscopy for the screening benefits to be achieved.
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
//* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
//* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
//* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupFlexSigAbnormalResult"
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupFlexSigAbnormalResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupFlexSigAbnormalResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupFlexSigAbnormalResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupFlexSigAbnormalResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupFlexSigAbnormalResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupFlexSigAbnormalResultTimingEvent"
