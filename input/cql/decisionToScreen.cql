library decisionToScreen version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include decisionToScreenEvents version '1.0.0' called Events
include decisionToScreenActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-decisionToScreen":  
  {
    (if Events."eve-Age86AndOlder" is true
    then Actions."act-HarmsLikelyOutweighBenefits" as Tuple{result Boolean, code Code, reason Code}
    else null),
    (if Events."eve-AgeOver76" is true
    then Actions."act-SelectivelyOfferScreening" as Tuple{code Code, reason Code}
    else null),
    (if Events."eve-LifeExp" is true
    then Actions."act-sdmcontinuelifexp" as Tuple{code Code, reason Code}
    else null),
    flatten({Actions."act-incRiskEligible"}),
    (if Count(Actions."act-incRiskEligible") = 0
    then flatten({Actions."act-AvgRiskEligible"})
    else null)
  }   
  except { null, {} }

define ExistsSDMContinueScreeningAge:
  Events."eve-AgeOver76"

define SDMContinueScreeningAgeReason:
  (Actions."act-SelectivelyOfferScreening").reason

define ExistsSDMContinueScreeningLifeExp:
  Events."eve-LifeExp" is true

define SDMContinueScreeningLifeExpReason:
  (Actions."act-sdmcontinuelifexp").reason    

