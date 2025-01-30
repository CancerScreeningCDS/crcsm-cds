library FollowUp version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include FollowUpEvents version '1.0.0' called Events
include FollowUpActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-FollowUp":
  if Events."eve-lastTestColonoscopy" is false and Events."eve-lastTestStool" is true
    then inconclusiveOrPositiveStoolTest
  else if Events."eve-lastTestColonoscopy" is false and Events."eve-lastTestFlexSig" is true
    then positiveOrInadequateFlexSig
  else if Events."eve-lastTestColonoscopy" is false and Events."eve-lastTestCTC" is true
    then inconclusiveOrPositiveCTC
  else null

define inconclusiveOrPositiveStoolTest:
  if Events."eve-inconclusiveStoolTest" is true
    then tieredApproach
  else if Events."eve-abnormalStoolTest" is false
    then Actions."act-continueRoutineScreening"
  else if Events."eve-abnormalStoolTest" is true and Events."eve-pendingColonoscopy" is not true
    then Actions."act-FollowUpColonoscopy"
  else null

define tieredApproach:
  if Events."eve-TieredApproach" 
    then Actions."act-PickScreeningMethodTiered"
  else Actions."act-PickScreeningMethodNonTiered"

define positiveOrInadequateFlexSig:
  if Events."eve-abnormalFlexSig" is true and Events."eve-pendingColonoscopy" is not true
    then Actions."act-FollowUpColonoscopy"
  else if Events."eve-adequateBowelPrep" is not true  
    then Actions."act-followUpEndoscopist"
  else Actions."act-continueRoutineScreening"

define inconclusiveOrPositiveCTC:
  if Events."eve-inconclusiveCTColonography" is true 
    then tieredApproach
  else if Events."eve-abnormalCTColonography" is false
    then Actions."act-continueRoutineScreening"
  else if Events."eve-abnormalCTColonography" is true and Events."eve-pendingColonoscopy" is not true
    then Actions."act-FollowUpColonoscopy"
  else null
