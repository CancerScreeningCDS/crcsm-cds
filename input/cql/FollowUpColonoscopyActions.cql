library FollowUpColonoscopyActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ColonoscopyResultCS": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/colonoscopy-result-observation-code-system'

// Act Codes
code "Follow-up endoscopist recommendations": 'endoscopistrecs' from "ActCode" display 'Follow-up with endoscopist for recommendations'
code "Oncologic referral": 'oncreferral' from  "ActCode" display 'Oncologic referral'
// Reason Codes
code "Colorectal cancer finding": 'crcfinding' from ColonoscopyResultCS display 'Colorectal cancer finding'
code "Missing endoscopist recommendation": 'missingrec' from ColonoscopyResultCS display 'Missing endoscopist recommendation for potentially precancerous polyp finding'

context Patient

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

