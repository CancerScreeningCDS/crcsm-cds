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