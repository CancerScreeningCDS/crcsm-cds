library FollowUpActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "ColonoscopyResultCS": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/colonoscopy-result-observation-code-system'

// Act Codes
//code "Continue routine screening": 'continueroutinescreening' from "ActCode" display 'Continue routine screening'
//code "Continue routine screening if high-quality test": 'continueroutinescreeninghighqualitytest' from "ActCode" display 'Continue routine screening if high-quality test'
//code "Repeat screening": 'repeatscreening' from "ActCode" display 'Repeat screening'
code "Colorectal Cancer Screening": '268548003' from "SNOMED-CT" display 'Screening for malignant neoplasm of large intestine (procedure)'
//code "Order follow-up colonoscopy": 'orderfollowupcolonoscopy' from "ActCode" display 'Order follow-up colonoscopy'
code "Colonoscopy": '18746-8' from "LOINC" display 'Colonoscopy study'
code "Follow-up endoscopist recommendations": 'endoscopistrecs' from "ActCode" display 'Follow-up with endoscopist for recommendations'
code "Oncologic referral": 'oncreferral' from  "ActCode" display 'Oncologic referral'

// Reason Codes
code "Screening negative": 'negativescreening' from "ReasonCode" display 'Non-colonoscopy colorectal cancer screening negative'
code "Inconclusive non-colonoscopy test result": 'inconclusivescreening' from "ReasonCode" display 'Inconclusive non-colonoscopy screening'
code "Positive or abnormal noncolonoscopy test": 'positiveabnormalscreening' from "ReasonCode" display 'Positive or abnormal non-colonoscopy screening'
code "Negative or normal non-colonoscopy test with high-quality exam": 'negativehighqualityscreening' from "ReasonCode" display 'Negative or normal non-colonoscopy test with high-quality exam'
code "Colorectal cancer finding": 'crcfinding' from ColonoscopyResultCS display 'Colorectal cancer finding'
code "Missing endoscopist recommendation": 'missingrec' from ColonoscopyResultCS display 'Missing endoscopist recommendation for potentially precancerous polyp finding'

context Patient

define "act-repeatScreening":
  CRCSMCommonFunctions.SetFollowupRecommendation(
    "Colorectal Cancer Screening", 
    "Inconclusive non-colonoscopy test result", 
    CRCSMCommonFunctions.SourceDocumentationOther, 
    DataElements.MostRecentColorectalScreeningDate )   

define "act-FollowUpColonoscopy":
  CRCSMCommonFunctions.SetFollowupRecommendation(
    "Colonoscopy", 
    "Positive or abnormal noncolonoscopy test", 
    CRCSMCommonFunctions.SourceDocumentationUSPSTF, 
    DataElements.MostRecentColorectalScreeningDate )   

define "act-oncologyReferral":
  CRCSMCommonFunctions.SetFollowupRecommendation(
    "Oncologic referral", 
    "Colorectal cancer finding", 
    CRCSMCommonFunctions.SourceDocumentationOther, 
    DataElements.MostRecentColorectalScreeningDate )    

define "act-followUpColonoscopist":
  CRCSMCommonFunctions.SetFollowupRecommendation(
    "Follow-up endoscopist recommendations", 
    "Missing endoscopist recommendation", 
    CRCSMCommonFunctions.SourceDocumentationOther, 
    DataElements.MostRecentColorectalScreeningDate )    