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
  IncreasedRiskExclusionsRecommendation

define IncreasedRiskExclusionsRecommendation:
  if Events."eve-HereditarySyndrome" is true
  then Actions."act-CRCHereditarySyndrome"
  else if Events."eve-IBD" is true
  then Actions."act-IBD"
  else if Events."eve-HxCRC" is true
  then Actions."act-HxCRC"
  else if Events."eve-FamilyHx" is true
  then Actions."act-FamilyHxCRC"
  else if Events."eve-HxPolyps" is true
  then Actions."act-HxPolyps"
  else null

define HereditarySyndrome:
  if Events."eve-HereditarySyndrome" is true
    then Actions."act-CRCHereditarySyndrome"
  else null

define IBD:
  if Events."eve-IBD" is true
    then Actions."act-IBD"
  else null

define HxCRC:
  if Events."eve-HxCRC" is true
    then Actions."act-HxCRC"
  else null

define FamilyHx:
  if Events."eve-FamilyHx" is true
    then Actions."act-FamilyHxCRC"
  else null

define HxPolyps:
  if Events."eve-HxPolyps" is true 
    then Actions."act-HxPolyps"
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