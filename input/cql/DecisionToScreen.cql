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

library DecisionToScreen version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DecisionToScreenEvents version '1.0.0' called Events
include DecisionToScreenActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements
include IncreasedRiskExclusions version '1.0.0' called IncreasedRiskExclusions
include USPSTFAvgRisk version '1.0.0' called USPSTFAvgRisk

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-DecisionToScreen":  
  {
    StopScreeningAge,
    SDMContinueScreeningAge,
    SDMContinueScreeningLifeExp,
    IncreasedRiskExclusionsRecommendations,
    USPSTFAverageRiskRecommendations
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

define IncreasedRiskExclusionsRecommendations:
  IncreasedRiskExclusions."flow-IncreasedRiskExclusions"

define USPSTFAverageRiskRecommendations:
  if IncreasedRiskExclusionsRecommendations is null and StopScreeningAge is null
    then USPSTFAvgRisk."flow-USPSTFAvgRisk"
    else null

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

define ExistsIncreasedRiskExclusionsRecommendations:
  IncreasedRiskExclusionsRecommendations is not null

define ExistsUSPSTFAverageRiskRecommendations:
  USPSTFAverageRiskRecommendations is not null

//------------------------------------------------------------------------------
// DYNAMIC VALUES INCREASED RISK SCREENING/SURVEILLANCE
//------------------------------------------------------------------------------

define ExistsHereditarySyndrome:
  IncreasedRiskExclusions.ExistsHereditarySyndrome

define HereditarySyndromeCode:
  IncreasedRiskExclusions.HereditarySyndromeCode

define HereditarySyndromeReason:
  IncreasedRiskExclusions.HereditarySyndromeReason

define ExistsIBD:
  IncreasedRiskExclusions.ExistsIBD

define IBDCode:
  IncreasedRiskExclusions.IBDCode

define IBDReason:
  IncreasedRiskExclusions.IBDReason

define ExistsHxCRC:
  IncreasedRiskExclusions.ExistsHxCRC

define HxCRCCode:
  IncreasedRiskExclusions.HxCRCCode

define HxCRCReason:
  IncreasedRiskExclusions.HxCRCReason

define ExistsFamilyHx:
  IncreasedRiskExclusions.ExistsFamilyHx

define FamilyHxCode:
  IncreasedRiskExclusions.FamilyHxCode

define FamilyHxReason:
  IncreasedRiskExclusions.FamilyHxReason

define ExistsHxPolyps:
  IncreasedRiskExclusions.ExistsHxPolyps

define HxPolypsCode:
  IncreasedRiskExclusions.HxPolypsCode

define HxPolypsReason:
  IncreasedRiskExclusions.HxPolypsReason

//------------------------------------------------------------------------------
// DYNAMIC VALUES AVERAGE RISK
//------------------------------------------------------------------------------

define ExistsUSPSTFAvgRisk:
  USPSTFAvgRisk.ExistsUSPSTFAvgRisk

define USPSTFAvgRiskCode:    
  USPSTFAvgRisk.USPSTFAvgRiskCode

define USPSTFAvgRiskReason:
  USPSTFAvgRisk.USPSTFAvgRiskReason

define USPSTFAvgRiskTiming:    
  USPSTFAvgRisk.USPSTFAvgRiskTiming

define USPSTFAvgRiskTimingEvent:    
  USPSTFAvgRisk.USPSTFAvgRiskTimingEvent
