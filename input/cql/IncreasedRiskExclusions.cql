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

// TODO: Flattenn into list of actions. Multiple actions can apply here:
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


define HereditarySyndrome:
  if Events."eve-HereditarySyndrome" is true
    then Actions."act-CRCHereditarySyndrome" as Tuple{code Code, reason Code}
  else null

define IBD:
  if Events."eve-IBD" is true
    then Actions."act-IBD" as Tuple{code Code, reason Code}
  else null

define HxCRC:
  if Events."eve-HxCRC" is true
    then Actions."act-HxCRC" as Tuple{code Code, reason Code}
  else null

define FamilyHx:
  if Events."eve-FamilyHx" is true
    then Actions."act-FamilyHxCRC" as Tuple{code Code, reason Code}
  else null

define HxPolyps:
  if Events."eve-HxPolyps" is true 
    then Actions."act-HxPolyps" as Tuple{code Code, reason Code}
  else null

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------   

// HereditarySyndrome
define ExistsHereditarySyndrome:
  HereditarySyndrome is not null

define HereditarySyndromeCode:
  HereditarySyndrome.code

define HereditarySyndromeReason:
  HereditarySyndrome.reason


// IBD
define ExistsIBD:
  IBD is not null

define IBDCode:
  IBD.code

define IBDReason:
  IBD.reason


// HxCRC
define ExistsHxCRC:
  HxCRC is not null

define HxCRCCode:
  HxCRC.code

define HxCRCReason:
  HxCRC.reason


// FamilyHx
define ExistsFamilyHx:
  FamilyHx is not null

define FamilyHxCode:
  FamilyHx.code

define FamilyHxReason:
  FamilyHx.reason


// HxPolyps
define ExistsHxPolyps:
  HxPolyps is not null

define HxPolypsCode:
  HxPolyps.code

define HxPolypsReason:
  HxPolyps.reason


// OLDER CODE:

define IsHereditaryIncRisk:
  Events."eve-HereditarySyndrome" is true

define IsIBDIncRisk:
  Events."eve-IBD" is true

define IsHxCRCIncRisk:
  Events."eve-HxCRC" is true

define IsFamilyHxIncRisk:
  Events."eve-FamilyHx" is true

define IsHxPolypsIncRisk:
  Events."eve-HxPolyps" is true

define IsAvgRisk:
  Events."eve-HereditarySyndrome" is false and Events."eve-IBD" is false and Events."eve-HxCRC" is false and
  Events."eve-FamilyHx" is false and Events."eve-HxPolyps" is false