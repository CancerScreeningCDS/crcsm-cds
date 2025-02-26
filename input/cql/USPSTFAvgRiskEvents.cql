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

library USPSTFAvgRiskEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

/***** BEGIN CDS LOGIC ********************************************************/

context Patient

define "eve-AgeOver45":
  AgeInYears() >= 45

define "eve-priorScreeningExists":
  DataElements."de-FOBT" is true or DataElements."de-stoolDNAFIT" is true
    or DataElements."de-Colonoscopy" is true or DataElements."de-CTColonography" is true or DataElements."de-FlexSig" is true
