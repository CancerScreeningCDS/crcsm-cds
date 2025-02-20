library HighLevel version '1.0.0'

using FHIR version '4.0.1'

include PrimaryScreeningDecision version '1.0.0' called PrimaryScreeningDecision
include FollowUp version '1.0.0' called FollowUp

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define hasFollowUpRecommendation:
  if FollowUp."flow-FollowUp" is not null then true
  else false

define noFollowUpRecommendation:
  if FollowUp."flow-FollowUp" is null and PrimaryScreeningDecision.PrimaryScreeningDecision is not null 
  then true
  else false 
