library DetermineNextDueDateEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

context Patient

define "eve-lastTestColonoscopy":
  DataElements."de-MostRecentTestIsColonoscopy"

define "eve-lastTestFOBT":
  DataElements."de-MostRecentTestIsFOBT"

define "eve-lastTestSDNA":
  DataElements."de-MostRecentTestIssDNAFIT"

define "eve-lastTestCTcolonography":
  DataElements."de-MostRecentTestIsCTC"

define "eve-lastTestFlexSig":
  DataElements."de-MostRecentTestIsFlexSig"
