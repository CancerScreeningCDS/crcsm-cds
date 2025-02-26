/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2025 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

library ScreeningEligibleActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "ActCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Eligible for screening": 'eligible' from "ActCode" display 'Eligible for screening'
code "Not eligible for screening": 'noteligible' from "ActCode" display 'Not eligible for screening'
// Reason Codes
code "Eligible for screening reason": 'eligibleforscreening' from "ReasonCode" display 'Eligible for screening'
code "Current colorectal cancer": 'currentcolorectalcancer' from "ReasonCode" display 'Current colorectal cancer'
code "Total colectomy":  'totalcolectomy' from "ReasonCode" display 'Total colectomy'
code "Diagnostic testing":  'diagtesting' from "ReasonCode" display 'Diagnostic testing'

context Patient

define "act-ScreeningEligible":
  {
		code: "Eligible for screening",
    reason: "Eligible for screening reason"
	}

define "end-noteligible-currentcolorectalcancer":
  {
		code: "Not eligible for screening",
    reason: "Current colorectal cancer"
	}  

define "end-noteligible-colectomy":  
  {
		code: "Not eligible for screening",
    reason: "Total colectomy"
	} 

define "act-Diagnostic":
  {
		code: "Not eligible for screening",
    reason: "Diagnostic testing"
	} 