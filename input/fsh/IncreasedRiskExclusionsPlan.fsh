////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-IncreasedRiskExclusions
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Increased Risk Exclusions"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-IncreasedRiskExclusions"
* description = "Risk Factors logic path" // TODO: update description per L2
* type = $PDTYPE#eca-rule
* library[+] = "Library/IncreasedRiskExclusions|1.0.0"

* insert HereditarySyndromesSurveillance
* insert IBDSurveillance
* insert PostCRCSurveillance

// -----------------------------------------------------------------------------
// Hereditary syndromes increased risk screening/surveillance
// -----------------------------------------------------------------------------
RuleSet: HereditarySyndromesSurveillance
* action[+].id = "HereditarySyndromesSurveillance"
* action[=].title = "Colorectal cancer surveillance per specialist recommendations"
* action[=].description = """
Refer to GI specialist for colorectal cancer (and possibly additional cancers) surveillance recommendations.

Patients with a hereditary cancer syndrome require specialized management and colonoscopy surveillance for colorectal cancer (as well as additional surveillance for other cancers). Recommendations on when to start surveillance and surveillance intervals vary according to the syndrome.
"""
* action[=] insert ACGHereditarySyndromesCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsHereditarySyndrome"
* action[=].definitionCanonical = Canonical(CommunicateSpecialtyReferral|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "HereditarySyndromeCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "HereditarySyndromeReason"

// -----------------------------------------------------------------------------
// IBD surveillance
// -----------------------------------------------------------------------------
RuleSet: IBDSurveillance
* action[+].id = "IBDIncreasedRisk"
* action[=].title = "IBD surveillance per specialist recommendations"
* action[=].description = """
Start colonoscopy surveillance 8-10 years after disease onset.

Repeat colonoscopy every 1-5 years based on GI specialist recommendations.
"""
* action[=] insert ACGCrohnsDiseaseCitationActionDocumentation
* action[=] insert ACGUlcerativeColitisCitationActionDocumentation
* action[=] insert AGAIBDCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsIBD"
* action[=].definitionCanonical = Canonical(CommunicateSpecialtyReferral|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "IBDCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "IBDReason"

// -----------------------------------------------------------------------------
// Post-colorectal cancer resection surveillance
// -----------------------------------------------------------------------------
RuleSet: PostCRCSurveillance
* action[+].id = "HistoryCRCSurveillance"
* action[=].title = "Post-colorectal cancer resection surveillance"
* action[=].description = """
Patients with a history of colorectal cancer resection should initiate surveillance colonoscopy 1 year after cancer resection or post-operative clearing colonoscopy.

Colonoscopy surveillance intervals:
* 3 years after first surveillance (4 years post-resection), 5 years after second surveillance (9 years post-resection), and every 5 years thereafter.
* If potentially precancerous polyps are detected in surveillance, subsequent surveillance interval should be consistent with the shorter interval based on polyp findings and routine surveillance intervals.
* Patients with certain localized rectal cancers may require additional local surveillance for the first 2-3 years after resection.

Refer to patient's oncologic treatment team of survivorship care plan for patient-specific guidance.
"""
* action[=] insert USMSTFPostCRCResectionCitationActionDocumentation
* action[=] insert USMSTFFollowUpColonoscopyCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsHxCRC"
* action[=].definitionCanonical = Canonical(CommunicateSpecialtyReferral|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "HxCRCCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "HxCRCReason"

// -----------------------------------------------------------------------------
// Family history increased risk screening/surveillance
// -----------------------------------------------------------------------------
RuleSet: FamHxCRCIncreasedRiskScreening
* action[+].id = "FamilyHistoryIncreasedRisk"
* action[=].title = "Family history increased risk screening/surveillance"
* action[=].description = """
For patients with a single first-degree relative (mother, father, full sibling, child) with colorectal cancer or an advanced polyp(s):
* If relative diagnosed at >= 60 years:
    * Start screening at 40 years old. Tests and intervals are as per average risk screening recommendations.
* If relative diagnosed at < 60 years old:
    * Start screening 10 years before relative's age at diagnosis or age 40, whichever is earlier. Repeat colonoscopy every 5 years.
    * If no significant neoplasia appears by age 60 years, can offer expanding the interval between colonoscopies.

For patients with 2 or more first-degree relatives with colorectal cancer or an advanced polyp:
* Start screening colonoscopy 10 years before the reatives' youngest age at diagnosis or age 40, whichever is earlier. Repeat colonoscopy every 5 years.

Patients with a history of potentially precancerous polyps should follow shortest interval between recommendations above and recommendations based on colonoscopy findings.
"""
* action[=] insert USMSTFCitationActionDocumentation
* action[=] insert ACGCitationActionDocumentation
* action[=] insert USMSTFFollowUpColonoscopyCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsFamilyHx"
* action[=].definitionCanonical = Canonical(ColorectalCencerServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "FamilyHxCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "FamilyHxReason"

// -----------------------------------------------------------------------------
// Action #5: Post-polypectomy surveillance
// -----------------------------------------------------------------------------
* action[+].id = "HistoryPolypsIncreasedRisk"
* action[=].title = "Post-polypectomy surveillance"
* action[=].description = """
Follow endoscopist-recommended interval.
"""
* action[=] insert USMSTFFollowUpColonoscopyCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsHxPolyps"
* action[=].definitionCanonical = Canonical(ColorectalCencerServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "HxPolypsCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "HxPolypsReason"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateSpecialtyReferral
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Recommendation to refer to specialist"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateSpecialtyReferral)
* name = "CommunicateSpecialtyReferral"
* description = "This ActivityDefinition generates a CommunicationRequest recommending specialty referral."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#specialtyreferral "Refer to specialist recommendations"
* code.text = "Refer to specialist recommendations"