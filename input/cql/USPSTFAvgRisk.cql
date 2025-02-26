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

library USPSTFAvgRisk version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include USPSTFAvgRiskEvents version '1.0.0' called Events
include USPSTFAvgRiskActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-USPSTFAvgRisk":
  USPSTFAvgRisk

define USPSTFAvgRisk:
  Coalesce(
    USPSTFAvgRiskStartAt45,
    USPSTFAvgRiskStartNow,
    USPSTFAvgRiskNextDue
  )

define USPSTFAvgRiskStartAt45:
  if Events."eve-AgeOver45" is false
    then Actions."act-RecommendStartScreeningAt45"
  else null

define USPSTFAvgRiskStartNow:
  if Events."eve-AgeOver45" is true and Events."eve-priorScreeningExists" is false
    then Actions."act-updateDueDateNow"
  else null

define USPSTFAvgRiskNextDue:
  if Events."eve-AgeOver45" is true and Events."eve-priorScreeningExists" is true
    then Actions."act-determineDueDate"
  else null

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------  

define ExistsUSPSTFAvgRisk:
  USPSTFAvgRisk is not null

define ExistsUSPSTFAvgRiskStartAt45:
  USPSTFAvgRiskStartAt45 is not null

define ExistsUSPSTFAvgRiskStartNow:
  USPSTFAvgRiskStartNow is not null

define ExistsUSPSTFAvgRiskNextDue:
  USPSTFAvgRiskNextDue is not null
  
define USPSTFAvgRiskCode:    
  USPSTFAvgRisk R return R.code

define USPSTFAvgRiskReason:
  USPSTFAvgRisk R return R.reason

define USPSTFAvgRiskTiming:    
  USPSTFAvgRisk R return R.timingTiming

define USPSTFAvgRiskTimingEvent:    
  USPSTFAvgRiskTiming R return First(R.event)