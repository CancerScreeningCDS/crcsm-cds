library FollowUpColonoscopy version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include FollowUpColonoscopyEvents version '1.0.0' called Events
include FollowUpColonoscopyActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-FollowUpColonoscopy":
  if Events."eve-lastTestColonoscopy" is not true then {}
  else
    {
      ColonoscopyCRC,
      HasEndoscopistRecommendation
    }
    except { null }

define ColonoscopyCRC:
  if Events."eve-colonoscopyFindingCRC" is true
  then Actions."act-oncologyReferral"
  else null 

define HasEndoscopistRecommendation:
  if Events."eve-recommendedInterval" is false
  then ColonoscopyPolyps 
  else null

define ColonoscopyPolyps:
  if Events."eve-colonoscopyFindingPolyps" is true
  then Actions."act-followUpColonoscopist"
  else null 