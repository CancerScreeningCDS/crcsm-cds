RuleSet: CPGKnowledgeExtensions
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-knowledgeCapability"
* extension[=].valueCode = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-knowledge-capability#executable "Executable"
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-knowledgeRepresentationLevel"
* extension[=].valueCode = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-knowledge-representation-level#structured "Structured"

RuleSet: CommonMetadata
* version = "1.0.0"
* date = "2025-02-28"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* experimental = true
* publisher = "The Health FFRDC, operated by The MITRE Corporation, in support of the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention."
* copyright = "(C) 2024 The MITRE Corporation. All Rights Reserved. Approved for Public Release: 24-2711. Distribution Unlimited. Unless otherwise noted, this work is available under an Apache 2.0 license. It was produced by the MITRE Corporation for the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention in accordance with the Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931."
* approvalDate =  "2025-02-28"
* lastReviewDate =  "2025-02-28"
* author[+].name = "The Health FFRDC, operated by The MITRE Corporation, in support of the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention."
* editor[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"
* reviewer[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"
* endorser[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"

RuleSet: USPSTFScreeningCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USPSTF (2021)"
* documentation[=].display = "Screening for Colorectal Cancer: US Preventive Services Task Force Recommendation Statement"
* documentation[=].citation = "US Preventive Services Task Force. Screening for Colorectal Cancer: US Preventive Services Task Force Recommendation Statement. JAMA. Published online May 18, 2021."
* documentation[=].url = "https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening"

RuleSet: ACSCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACS 2018"
* documentation[=].display = "Colorectal cancer screening for average‐risk adults: 2018 guideline update from the American Cancer Society"
* documentation[=].citation = "Wolf, A. M. D., et al. (2018). Colorectal cancer screening for average‐risk adults: 2018 guideline update from the American Cancer Society. CA: A Cancer Journal for Clinicians, 68(4), 250–281. https://doi.org/10.3322/caac.21457"

RuleSet: USMSTFCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USMSTF (2017)"
* documentation[=].display = "Colorectal Cancer Screening: Recommendations for Physicians and Patients From the U.S. Multi-Society Task Force on Colorectal Cancer"
* documentation[=].citation = "Rex, D. K., et al. (2017). Colorectal Cancer Screening: Recommendations for Physicians and Patients From the U.S. Multi-Society Task Force on Colorectal Cancer. Gastroenterology, 153(1), 307-323. https://doi.org/10.1053/j.gastro.2017.05.013"

RuleSet: ACGHereditarySyndromesCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACG Hereditary Syndromes (2015)"
* documentation[=].display = "ACG Clinical Guideline: Genetic Testing and Management of Hereditary Gastrointestinal Cancer Syndromes"
* documentation[=].citation = "Syngal, S., et al. (2015). ACG Clinical Guideline: Genetic Testing and Management of Hereditary Gastrointestinal Cancer Syndromes. American Journal of Gastroenterology 110(2):p 223-262. https://doi.org/10.1038/ajg.2014.435"

RuleSet: ACGCrohnsDiseaseCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACG Crohn's Disease (2018)"
* documentation[=].display = "ACG Clinical Guideline: Management of Crohn's Disease in Adults"
* documentation[=].citation = "Lichtenstein, G.R., et al. (2018). ACG Clinical Guideline: Management of Crohn's Disease in Adults. American Journal of Gastroenterology, 113(4), 481-517. https://doi.org/10.1038/ajg.2018.27"

RuleSet: ACGUlcerativeColitisCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACG Ulcerative Colitis (2019)"
* documentation[=].display = "ACG Clinical Guideline: Ulcerative Colitis in Adults"
* documentation[=].citation = "Rubin, D. T., et al. (2019). ACG Clinical Guideline: Ulcerative Colitis in Adults. The American journal of gastroenterology, 114(3), 384-413. https://doi.org/10.14309/ajg.0000000000000152"

RuleSet: AGAIBDCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "AGA Inflammatory Bowel Disease (2021)"
* documentation[=].display = "AGA Clinical Practice Update on Endoscopic Surveillance and Management of Colorectal Dysplasia in Inflammatory Bowel Diseases: Expert Review"
* documentation[=].citation = "Murthy, S. K., et al. (2021). AGA Clinical Practice Update on Endoscopic Surveillance and Management of Colorectal Dysplasia in Inflammatory Bowel Diseases: Expert Review. Gastroenterology, 161(3), 1043-1051.e4. https://doi.org/10.1053/j.gastro.2021.05.063"

RuleSet: USMSTFPostCRCResectionCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USMSTF Post Colorectal Cancer Resection (2016)"
* documentation[=].display = "Colonoscopy Surveillance after Colorectal Cancer Resection: Recommendations of the US Multi-Society Task Force on Colorectal Cancer"
* documentation[=].citation = "Kahi, C. J., et al. (2016). Colonoscopy Surveillance after Colorectal Cancer Resection: Recommendations of the US Multi-Society Task Force on Colorectal Cancer. Gastroenterology, 150(3), 758-768.e11. https://doi.org/10.1053/j.gastro.2016.01.001"

RuleSet: USMSTFFollowUpColonoscopyCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USMSTF Follow-Up After Colonoscopy and Polypectomy (2020)"
* documentation[=].display = "Recommendations for Follow-Up After Colonoscopy and Polypectomy: A Consensus Update by the US Multi-Society Task Force on Colorectal Cancer"
* documentation[=].citation = "Gupta, S., et al. (2020). Recommendations for Follow-Up After Colonoscopy and Polypectomy: A Consensus Update by the US Multi-Society Task Force on Colorectal Cancer. Gastroenterology, 158(4), 1131–1153.e5. https://doi.org/10.1053/j.gastro.2019.10.026"

RuleSet: ACGCitationActionDocumentation
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACG Average Risk (2021)"
* documentation[=].display = "ACG Clinical Guidelines: Colorectal Cancer Screening 2021"
* documentation[=].citation = "Shaukat, A., et al. (2021). ACG Clinical Guidelines: Colorectal Cancer Screening 2021. American Journal of Gastroenterology, 116(3), 458-479. https://doi.org/10.14309/ajg.0000000000001122"