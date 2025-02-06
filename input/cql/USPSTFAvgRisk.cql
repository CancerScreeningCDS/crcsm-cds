library USPSTFAvgRisk version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include USPSTFAvgRiskEvents version '1.0.0' called Events
include USPSTFAvgRiskActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-USPSTFAvgRisk":
  {
    if Events."eve-AgeOver45" is false
      then Actions."act-RecommendStartScreeningAt45"
    else 
      HasPriorScreening
  }   
  except { null }

define HasPriorScreening:
  if Events."eve-priorScreeningExists" is true
  then Actions."act-determineDueDate" else Actions."act-updateDueDateNow"   
