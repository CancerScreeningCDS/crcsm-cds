/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2024 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

library DetermineNextDueDate version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DetermineNextDueDateEvents version '1.0.0' called Events
include DetermineNextDueDateActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

//------------------------------------------------------------------------------
// Determine whether each action/event exists
//------------------------------------------------------------------------------


//TODO: refactor DetermineNextDueDate from a path to a function and corresponding expressions directly in the USPSTFAverageRisk logic path
define "flow-DetermineNextDueDate":
  case
    when Events."eve-lastTestColonoscopy" then Actions."act-ColonoscopyEvery10"
    when Events."eve-lastTestFOBT" then Actions."act-FOBTEveryYear"
    when Events."eve-lastTestSDNA" then Actions."act-sDNAFITEvery1to3"
    when Events."eve-lastTestCTcolonography" then Actions."act-CTColonographyEvery5"
    when Events."eve-lastTestFlexSig" then Actions."act-FlexSigEvery5"
    else null
  end
