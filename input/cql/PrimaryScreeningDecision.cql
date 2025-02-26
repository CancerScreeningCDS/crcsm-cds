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

library PrimaryScreeningDecision version '1.0.0'

using FHIR version '4.0.1'

include ScreeningEligible version '1.0.0' called ScreeningEligible
include DecisionToScreen version '1.0.0' called DecisionToScreen
include USPSTFAvgRisk version '1.0.0' called USPSTFAvgRisk

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define PrimaryScreeningDecision:
  Flatten(
    {
      "flow-DecisionToScreen",
      "flow-ScreeningEligible"
     }
    except { null }
  )

define "flow-ScreeningEligible":
  ScreeningEligible."flow-ScreeningEligible"

define "flow-DecisionToScreen":
  if IsScreeningEligible then DecisionToScreen."flow-DecisionToScreen" else null

//------------------------------------------------------------------------------
// DYNAMIC VALUES Screening Eligible
//------------------------------------------------------------------------------      

define CheckIsIncludedAndNotExcluded:
  ScreeningEligible.CheckIsIncludedAndNotExcluded

define IsScreeningEligible:
  ScreeningEligible."IsScreeningEligible"

define IsNotScreeningEligible:
  ScreeningEligible.IsNotScreeningEligible

// TODO: Add Screening Eligible Actions for Not Eligible Reasons

define ScreeningEligibleCode:
  ScreeningEligible.ScreeningEligibleCode

define ScreeningEligibleReason:
  ScreeningEligible.ScreeningEligibleReason     

//------------------------------------------------------------------------------
// DYNAMIC VALUES DECISION TO SCREEN
//------------------------------------------------------------------------------  

define ExistsSDMContinueScreeningAge:
  DecisionToScreen.ExistsSDMContinueScreeningAge

define SDMContinueScreeningAgeCode:
  DecisionToScreen.SDMContinueScreeningAgeCode

define SDMContinueScreeningAgeReason:
  DecisionToScreen.SDMContinueScreeningAgeReason

define ExistsSDMContinueScreeningLifeExp:
  DecisionToScreen.ExistsSDMContinueScreeningLifeExp

define SDMContinueScreeningLifeExpCode:
  DecisionToScreen.SDMContinueScreeningLifeExpCode

define SDMContinueScreeningLifeExpReason:
  DecisionToScreen.SDMContinueScreeningLifeExpReason

define ExistsStopScreeningAge:
  DecisionToScreen.ExistsStopScreeningAge
  
define StopScreeningAgeCode:
  DecisionToScreen.StopScreeningAgeCode

define StopScreeningAgeReason:
  DecisionToScreen.StopScreeningAgeReason

define ExistsIncreasedRiskExclusionsRecommendations:
  DecisionToScreen.ExistsIncreasedRiskExclusionsRecommendations

define ExistsUSPSTFAverageRiskRecommendations:
  DecisionToScreen.ExistsUSPSTFAverageRiskRecommendations

//------------------------------------------------------------------------------
// DYNAMIC VALUES INCREASED RISK SCREENING/SURVEILLANCE
//------------------------------------------------------------------------------

define ExistsHereditarySyndrome:
  DecisionToScreen.ExistsHereditarySyndrome

define HereditarySyndromeCode:
  DecisionToScreen.HereditarySyndromeCode

define HereditarySyndromeReason:
  DecisionToScreen.HereditarySyndromeReason

define ExistsIBD:
  DecisionToScreen.ExistsIBD

define IBDCode:
  DecisionToScreen.IBDCode

define IBDReason:
  DecisionToScreen.IBDReason

define ExistsHxCRC:
  DecisionToScreen.ExistsHxCRC

define HxCRCCode:
  DecisionToScreen.HxCRCCode

define HxCRCReason:
  DecisionToScreen.HxCRCReason

define ExistsFamilyHx:
  DecisionToScreen.ExistsFamilyHx

define FamilyHxCode:
  DecisionToScreen.FamilyHxCode

define FamilyHxReason:
  DecisionToScreen.FamilyHxReason

define ExistsHxPolyps:
  DecisionToScreen.ExistsHxPolyps

define HxPolypsCode:
  DecisionToScreen.HxPolypsCode

define HxPolypsReason:
  DecisionToScreen.HxPolypsReason

//------------------------------------------------------------------------------
// DYNAMIC VALUES AVERAGE RISK
//------------------------------------------------------------------------------

define ExistsUSPSTFAvgRisk:
  DecisionToScreen.ExistsUSPSTFAvgRisk

define USPSTFAvgRiskCode:    
  DecisionToScreen.USPSTFAvgRiskCode

define USPSTFAvgRiskReason:
  DecisionToScreen.USPSTFAvgRiskReason

define USPSTFAvgRiskTiming:    
  DecisionToScreen.USPSTFAvgRiskTiming

define USPSTFAvgRiskTimingEvent:    
  DecisionToScreen.USPSTFAvgRiskTimingEvent

define ExistsUSPSTFAvgRiskStartAt45:
  USPSTFAvgRisk.ExistsUSPSTFAvgRiskStartAt45

define ExistsUSPSTFAvgRiskNextDue:
  USPSTFAvgRisk.ExistsUSPSTFAvgRiskNextDue

define ExistsUSPSTFAvgRiskStartNow:
  USPSTFAvgRisk.ExistsUSPSTFAvgRiskStartNow