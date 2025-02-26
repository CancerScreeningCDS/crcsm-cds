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

library HighLevel version '1.0.0'

using FHIR version '4.0.1'

include PrimaryScreeningDecision version '1.0.0' called PrimaryScreeningDecision
include FollowUp version '1.0.0' called FollowUp

context Patient

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------

define ExistsFollowUpRecommendation:
  exists FollowUp."flow-FollowUp"

define ExistsPrimaryScreeningDecisionRecommendation:
  ExistsFollowUpRecommendation is false and exists PrimaryScreeningDecision.PrimaryScreeningDecision