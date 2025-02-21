library HighLevel version '1.0.0'

using FHIR version '4.0.1'

include PrimaryScreeningDecision version '1.0.0' called PrimaryScreeningDecision
include FollowUp version '1.0.0' called FollowUp

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define hasFollowUpRecommendation:
  if PrimaryScreeningDecision.IsScreeningEligible and exists FollowUp."flow-FollowUp" then true
  else false

define usePrimaryRecommendation:
  if hasFollowUpRecommendation is false and exists PrimaryScreeningDecision.PrimaryScreeningDecision 
  then true
  else false 
