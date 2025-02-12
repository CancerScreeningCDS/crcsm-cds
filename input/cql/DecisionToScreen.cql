library DecisionToScreen version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DecisionToScreenEvents version '1.0.0' called Events
include DecisionToScreenActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements
include IncreasedRiskExclusions version '1.0.0' called IncreasedRiskExclusions

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-DecisionToScreen":  
  {
    StopScreeningAge,
    SDMContinueScreeningAge,
    SDMContinueScreeningLifeExp,
    flatten({Actions."act-incRiskEligible"}),
    if not exists Actions."act-incRiskEligible"
      then flatten({Actions."act-AvgRiskEligible"})
      else null
  }   
  except { null, {} }

define SDMContinueScreeningAge:
  if Events."eve-AgeOver76" is true
    then Actions."act-SelectivelyOfferScreening"
    else null

define SDMContinueScreeningLifeExp:
  if Events."eve-LifeExp" is true
    then Actions."act-sdmcontinuelifexp"
    else null

define StopScreeningAge:
  if Events."eve-Age86AndOlder" is true
    then Actions."act-HarmsLikelyOutweighBenefits"
    else null

// TODO: Add recommendations from Increased Risk and Average Risk Paths

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------  

define ExistsSDMContinueScreeningAge:
  SDMContinueScreeningAge is not null

define SDMContinueScreeningAgeCode:
  SDMContinueScreeningAge.code

define SDMContinueScreeningAgeReason:
  SDMContinueScreeningAge.reason

define ExistsSDMContinueScreeningLifeExp:
  SDMContinueScreeningLifeExp is not null

define SDMContinueScreeningLifeExpCode:
  SDMContinueScreeningLifeExp.code  

define SDMContinueScreeningLifeExpReason:
  SDMContinueScreeningLifeExp.reason

define ExistsStopScreeningAge:
  StopScreeningAge is not null

define StopScreeningAgeCode:
  StopScreeningAge.code

define StopScreeningAgeReason:
  StopScreeningAge.reason

// TODO: Add top-level Dynamic Values from Increased Risk and Average Risk Paths

//------------------------------------------------------------------------------
// DYNAMIC VALUES INCREASED RISK SCREENING/SURVEILLANCE
//------------------------------------------------------------------------------
// TODO: Add dynamic values for increased risk

//------------------------------------------------------------------------------
// DYNAMIC VALUES AVERAGE RISK
//------------------------------------------------------------------------------
// TODO: Add dynamic values for average risk
