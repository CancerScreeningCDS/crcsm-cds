RuleSet: CPGKnowledgeExtensions
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-knowledgeCapability"
* extension[=].valueCode = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-knowledge-capability#executable "Executable"
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-knowledgeRepresentationLevel"
* extension[=].valueCode = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-knowledge-representation-level#structured "Structured"

RuleSet: CommonMetadata
* version = "1.0.0"
* date = "2024-10-22"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* experimental = true
* publisher = "The Health FFRDC, operated by The MITRE Corporation, in support of the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention."
* copyright = "(C) 2024 The MITRE Corporation. All Rights Reserved. Approved for Public Release: 24-2711. Distribution Unlimited. Unless otherwise noted, this work is available under an Apache 2.0 license. It was produced by the MITRE Corporation for the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention in accordance with the Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931."
* approvalDate =  "2024-10-22"
* lastReviewDate =  "2024-10-22"
* author[+].name = "The Health FFRDC, operated by The MITRE Corporation, in support of the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention."
* editor[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"
* reviewer[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"
* endorser[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"

RuleSet: USPSTFScreeningCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USPSTF"
* documentation[=].display = "Screening for Colorectal Cancer: US Preventive Services Task Force Recommendation Statement"
* documentation[=].citation = "US Preventive Services Task Force. Screening for Colorectal Cancer: US Preventive Services Task Force Recommendation Statement. JAMA. Published online May 18, 2021."
* documentation[=].url = "https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening"

RuleSet: ACSCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACS"
* documentation[=].display = "Colorectal cancer screening for average‐risk adults: 2018 guideline update from the American Cancer Society"
* documentation[=].citation = "Wolf, A. M. D., et al. (2018). Colorectal cancer screening for average‐risk adults: 2018 guideline update from the American Cancer Society. CA: A Cancer Journal for Clinicians, 68(4), 250–281. https://doi.org/10.3322/caac.21457"

RuleSet: USMSTFCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USMSTF"
* documentation[=].display = "Colorectal Cancer Screening: Recommendations for Physicians and Patients From the U.S. Multi-Society Task Force on Colorectal Cancer"
* documentation[=].citation = "Rex, D. K., et al. (2017). Colorectal Cancer Screening: Recommendations for Physicians and Patients From the U.S. Multi-Society Task Force on Colorectal Cancer. Gastroenterology, 153(1), 307-323. https://doi.org/10.1053/j.gastro.2017.05.013"