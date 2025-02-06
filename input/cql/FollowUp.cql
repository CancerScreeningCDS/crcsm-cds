library FollowUp version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include FollowUpEvents version '1.0.0' called Events
include FollowUpActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-FollowUp":
  if Events."eve-lastTestColonoscopy" is true then {}
  else
    {
      FollowUpStoolTest,
      FollowUpFlexSig,
      FollowUpCTColonography
    }
    except { null }

define FollowUpStoolTest:
  if Events."eve-lastTestStool" is true then
    if Events."eve-inconclusiveStoolTest" is true then
      Actions."act-repeatScreening"                         // TODO: (not in L2): check for pending order of any test?
    else if Events."eve-abnormalStoolTest" is true then
      Actions."act-FollowUpColonoscopy"
    else
      Actions."act-continueRoutineScreening"
  else null

define FollowUpFlexSig:
  if Events."eve-lastTestFlexSig" is true then
    if Events."eve-abnormalFlexSig" is true then
      Actions."act-FollowUpColonoscopy"
    else Actions."act-continueRoutineScreeningDirectViz" 
  else null
// TODO: (not in L2): split abnormal and malignant findings. Malignant -> oncology referral
// TODO: (not in L2): add check for recommended interval from endoscopist when no abnormal findings?
// TODO: (not in L2): add repeat testting/consult with endoscopist for inconclusive flex sig?
// TODO: (not in L2): add explicit normal finding?

define FollowUpCTColonography:
  if Events."eve-lastTestCTC" is true then
    if Events."eve-inconclusiveCTColonography" then       
      Actions."act-repeatScreening"                       // TODO: (not in L2): check for pending order of any test?
    else if Events."eve-abnormalCTColonography" then
      Actions."act-FollowUpColonoscopy"
    else
      Actions."act-continueRoutineScreeningDirectViz"
  else null
// TODO: split abnormal and malignant findings. Malignant -> oncology referral (or surgery referral per radiology guidelines)
// TODO: add check for recommended interval from radiologist when no abnormal findings? Prep can be an issue here too.
// TODO: (not in L2): add explicit normal finding?
