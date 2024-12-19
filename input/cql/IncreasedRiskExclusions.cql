library IncreasedRiskExclusions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include IncreasedRiskExclusionsEvents version '1.0.0' called Events
include IncreasedRiskExclusionsActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-IncreasedRiskExclusions":
  if Events."eve-HereditarySyndrome" is true
  then Actions."act-CRCHereditarySyndrome" as Tuple{code Code, reason Code}
  else if Events."eve-IBD" is true
  then Actions."act-IBD" as Tuple{code Code, reason Code}
  else if Events."eve-HxCRC" is true
  then Actions."act-HxCRC" as Tuple{code Code, reason Code}
  else if Events."eve-FamilyHx" is true
  then Actions."act-FamilyHxCRC" as Tuple{code Code, reason Code}
  else if Events."eve-HxPolyps" is true
  then Actions."act-HxPolyps" as Tuple{code Code, reason Code}
  else Actions."act-AvgRiskScreeningEligible" as Tuple{code Code, reason Code}


