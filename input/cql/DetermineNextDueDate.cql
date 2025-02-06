library DetermineNextDueDate version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DetermineNextDueDateEvents version '1.0.0' called Events
include DetermineNextDueDateActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

//------------------------------------------------------------------------------
// Determine whether each action/event exists
//------------------------------------------------------------------------------

define "flow-DetermineNextDueDate":
  case
    when Events."eve-lastTestColonoscopyAvg" then Actions."act-ColonoscopyEvery10"
    when Events."eve-lastTestFOBT" then Actions."act-FOBTEveryYear"
    when Events."eve-lastTestSDNA" then Actions."act-sDNAFITEvery1to3"
    when Events."eve-lastTestCTcolonography" then Actions."act-CTColonographyEvery5"
    when Events."eve-lastTestFlexSig" then Actions."act-FlexSigEvery5"
    else null
  end
