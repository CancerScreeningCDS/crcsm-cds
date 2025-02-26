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

library DetermineNextDueDateEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

context Patient

define "eve-lastTestColonoscopy":
  DataElements."de-MostRecentTestIsColonoscopy"

define "eve-lastTestFOBT":
  DataElements."de-MostRecentTestIsFOBT"

define "eve-lastTestSDNA":
  DataElements."de-MostRecentTestIssDNAFIT"

define "eve-lastTestCTcolonography":
  DataElements."de-MostRecentTestIsCTC"

define "eve-lastTestFlexSig":
  DataElements."de-MostRecentTestIsFlexSig"
