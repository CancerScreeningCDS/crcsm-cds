library IncreasedRiskExclusionsActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "See 'Hereditary Syndromes' logic path": 'seehereditarysyndromespath' from "ActCode" display 'See Hereditary Syndromes logic path'
code "See 'Inflammatory Bowel Disease' logic path": 'seeibdpath' from "ActCode" display 'See Inflammatory Bowel Disease logic path'
code "See 'Personal History of Colorectal Cancer' logic path": 'seepersonalhxofcrcpath' from "ActCode" display 'See Personal History of Colorectal Cancer logic path'
code "See 'Family History of Colorectal Cancer or Advanced Polyps' logic path": 'seefamilyhxofcrcpath' from "ActCode" display 'See Family History of Colorectal Cancer or Advanced Polyps logic path'
code "See 'Personal History of Potentially Precancerous Polyps' logic path": 'seepersonalhxofpolypspath' from "ActCode" display 'See Personal History of Potentially Precancerous Polyps logic path'
code "See 'Average Risk Screening' logic path": 'seeavgriskscreeningpath' from "ActCode" display 'See Average Risk Screening logic path'
// Reason Codes
code "Hereditary syndrome": 'hereditarysyndrome' from "ReasonCode" display 'Hereditary syndrome'
code "IBD": 'ibd' from "ReasonCode" display 'IBD'
code "History of CRC": 'historyofcrc' from "ReasonCode" display 'History of CRC'
code "Family history of CRC or advanced polyps": 'familyhistoryofcrc' from "ReasonCode" display 'Family history of CRC or advanced polyps'
code "History of potentially precancerous polyps": 'historyofprecancerouspolyps' from "ReasonCode" display 'History of potentially precancerous polyps'
code "Average risk screening eligible": 'averageriskscreeningeligible' from "ReasonCode" display 'Average risk screening eligible'

context Patient

define "act-CRCHereditarySyndrome":
  {
	code: "See 'Hereditary Syndromes' logic path",
    reason: "Hereditary syndrome"
  }

define "act-IBD":
  {
	code: "See 'Inflammatory Bowel Disease' logic path",
    reason: "IBD"
  } 

define "act-HxCRC":
  {
	code: "See 'Personal History of Colorectal Cancer' logic path",
    reason: "History of CRC"
  } 

define "act-FamilyHxCRC":
  {
	code: "See 'Family History of Colorectal Cancer or Advanced Polyps' logic path",
    reason: "Family history of CRC or advanced polyps"
  } 

define "act-HxPolyps":
  {
	code: "See 'Personal History of Potentially Precancerous Polyps' logic path",
    reason: "History of potentially precancerous polyps"
  } 

define "act-AvgRiskScreeningEligible":
  {
	code: "See 'Average Risk Screening' logic path",
    reason: "Average risk screening eligible"
  } 
