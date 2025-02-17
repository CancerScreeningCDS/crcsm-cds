library FollowUpColonoscopyEvents version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

context Patient

define "eve-lastTestColonoscopy":
  DataElements."de-MostRecentTestIsColonoscopy" is true

define "eve-colonoscopyFindingCRC":
  DataElements."de-FindingCRC" is true

define "eve-recommendedInterval":
  DataElements."de-RecommendedInterval"

define "eve-colonoscopyFindingPolyps":
  DataElements."de-FindingPolyps" is true


