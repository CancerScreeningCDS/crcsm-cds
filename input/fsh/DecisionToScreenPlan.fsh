////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-DecisionToScreen
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Decision to Screen"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-DecisionToScreen"
* description = """
Evaluates criteria for when to stop screening for colorectal cancer, and determines whether the patient is eligible for average risk screening, increased risk screening, or surveillance, based on the risk factors outlined by USPSTF. 

Provides recommendations for screening and surveillance based on the identified risk path and specific risk factors.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/DecisionToScreen|1.0.0"

* insert SDMContinueScreeningAge
* insert SDMContinueScreeningLifeExp
* insert StopScreeningAge
// -----------------------------------------------------------------------------
// INCREASED RISK EXCLUSIONS
// -----------------------------------------------------------------------------
* insert HereditarySyndromesSurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert IBDSurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert PostCRCSurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert FamHxCRCIncreasedRiskScreening
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
* insert PostPolypectomySurveillance
* insert ApplicabilityIncreasedRiskExclusionsRecommendations
// -----------------------------------------------------------------------------
// AVERAGE RISK
// -----------------------------------------------------------------------------
* insert StartScreeningAt45YearsOld
* insert ApplicabilityAverageRiskRecommendations
* insert StartScreening
* insert ApplicabilityAverageRiskRecommendations
* insert ContinueRoutineScreening
* insert ApplicabilityAverageRiskRecommendations

RuleSet: SDMContinueScreeningAge
* action[+].id = "SDMContinueScreeningAge"
* action[=].title = "Selectively offer screening"
* action[=].description = "The USPSTF recommends that clinicians selectively offer screening for colorectal cancer in adults aged 76 to 85 years."
* action[=] insert USPSTFScreeningCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsSDMContinueScreeningAge"
* action[=].definitionCanonical = Canonical(CommunicateSDMContinueScreening|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "SDMContinueScreeningAgeReason"

RuleSet: SDMContinueScreeningLifeExp
* action[+].id = "SDMContinueScreeningLifeExp"
* action[=].title = "Discuss decision to continue screening"
* action[=].description = "ACS advises that individuals should continue colorectal cancer screening as long as their overall health is good and they have a life expectancy of 10 years or more. Decision to continue screening in cases of limited life expectancy should be based on shared decision-making."
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsSDMContinueScreeningLifeExp"
* action[=].definitionCanonical = Canonical(CommunicateSDMContinueScreening|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "SDMContinueScreeningLifeExpReason"

RuleSet: StopScreeningAge
* action[+].id = "StopScreeningAge"
* action[=].title = "Stop screening"
* action[=].description = "Evidence is lacking on benefits and harms of colorectal cancer screening for individuals aged 86 and older. Competing causes of mortality likely preclude survival benefit that would outweigh the harms of screening."
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsStopScreeningAge"
* action[=].definitionCanonical = Canonical(CommunicateRecommendationStopScreening|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "StopScreeningAgeReason"

RuleSet: ApplicabilityIncreasedRiskExclusionsRecommendations
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsIncreasedRiskExclusionsRecommendations"

RuleSet: ApplicabilityAverageRiskRecommendations
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsUSPSTFAverageRiskRecommendations"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateSDMContinueScreening
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Shared Decision Making to Continue Screening"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateSDMContinueScreening)
* name = "CommunicateSDMContinueScreening"
* description = "This ActivityDefinition generates a CommunicationRequest recommending shared decision making on the decision to continue screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#sdmcontinue "Shared decision making to continue screening"
* code.text = "Shared decision making to continue screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateRecommendationStopScreening
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Recommendation to Stop Screening"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateRecommendationStopScreening)
* name = "CommunicateRecommendationStopScreening"
* description = "This ActivityDefinition generates a CommunicationRequest recommending to stop screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#stopscreen "Stop screening"
* code.text = "Stop screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: ColorectalCancerScreeningServiceRequest
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Colorectal Cancer Screening Service Request"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(ColorectalCancerScreeningServiceRequest)
* name = "ColorectalCancerScreeningServiceRequest"
* description = "This ActivityDefinition generates a ServiceRequest for screening study or specialty referral."
* kind = $RRTYPE#ServiceRequest "ServiceRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"