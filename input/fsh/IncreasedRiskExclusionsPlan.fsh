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
* insert FamHxCRCIncreasedRiskScreening
* insert PostPolypectomySurveillance

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
* action[=] insert ApplicabilityHereditarySyndromesSurveillance
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HereditarySyndromeCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HereditarySyndromeReason"

RuleSet: ApplicabilityHereditarySyndromesSurveillance
* condition[+].kind = $ACKIND#applicability "Applicability"
* condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* condition[=].expression.expression = "ExistsHereditarySyndrome"

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
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=] insert ApplicabilityIBDSurveillance
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "IBDCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "IBDReason"

RuleSet: ApplicabilityIBDSurveillance
* condition[+].kind = $ACKIND#applicability "Applicability"
* condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* condition[=].expression.expression = "ExistsIBD"

// -----------------------------------------------------------------------------
// Post-colorectal cancer resection surveillance
// -----------------------------------------------------------------------------
RuleSet: PostCRCSurveillance
* action[+].id = "HistoryCRCSurveillance"
* action[=].title = "Post-colorectal cancer resection surveillance"
* action[=].description = """
Patients with a history of colorectal cancer should begin colonoscopy surveillance 1 year pos-resection.

Repeat colonoscopy 3 years after 1st surveillance, and every 5 years thereafter. Post-polypectomy surveillance intervals apply if shorter.

Refer to patient's oncologic treatment team of survivorship care plan for patient-specific guidance.
"""
* action[=] insert USMSTFPostCRCResectionCitationActionDocumentation
* action[=] insert USMSTFFollowUpColonoscopyCitationActionDocumentation
* action[=] insert ApplicabilityPostCRCSurveillance
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HxCRCCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HxCRCReason"

RuleSet: ApplicabilityPostCRCSurveillance
* condition[+].kind = $ACKIND#applicability "Applicability"
* condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* condition[=].expression.expression = "ExistsHxCRC"

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
* action[=] insert ApplicabilityFamHxCRCIncreasedRiskScreening
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FamilyHxCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FamilyHxReason"

RuleSet: ApplicabilityFamHxCRCIncreasedRiskScreening
* condition[+].kind = $ACKIND#applicability "Applicability"
* condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* condition[=].expression.expression = "ExistsFamilyHx"

// -----------------------------------------------------------------------------
// Post-polypectomy surveillance
// -----------------------------------------------------------------------------
RuleSet: PostPolypectomySurveillance
* action[+].id = "HistoryPolypsIncreasedRisk"
* action[=].title = "Post-polypectomy surveillance"
* action[=].description = """
Follow endoscopist-recommended interval. 
"""
* action[=] insert USMSTFFollowUpColonoscopyCitationActionDocumentation
* action[=] insert ApplicabilityPostPolypectomySurveillance
* action[=].definitionCanonical = Canonical(ColorectalCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HxPolypsCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HxPolypsReason"

RuleSet: ApplicabilityPostPolypectomySurveillance
* condition[+].kind = $ACKIND#applicability "Applicability"
* condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* condition[=].expression.expression = "ExistsHxPolyps"

////////////////////////////////////////////////////////////////////////////////////////////////////