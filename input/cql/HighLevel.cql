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