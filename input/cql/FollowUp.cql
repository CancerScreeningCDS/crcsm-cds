library FollowUp version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include FollowUpEvents version '1.0.0' called Events
include FollowUpActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommon

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-FollowUp":
  if Events."eve-lastTestColonoscopy" is true then 
    FollowUpColonoscopy
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
      null
  else null

define FollowUpFlexSig:
  if Events."eve-lastTestFlexSig" is true then
    if Events."eve-abnormalFlexSig" is true then
      Actions."act-FollowUpColonoscopy"
    else null
  else null
// TODO: (not in L2): split abnormal and malignant findings. Malignant -> oncology referral
// TODO: (not in L2): add check for recommended interval from endoscopist when no abnormal findings?
// TODO: (not in L2): add repeat testing/consult with endoscopist for inconclusive flex sig?
// TODO: (not in L2): add explicit normal finding?

define FollowUpCTColonography:
  if Events."eve-lastTestCTC" is true then
    if Events."eve-inconclusiveCTColonography" then       
      Actions."act-repeatScreening"                       // TODO: (not in L2): check for pending order of any test?
    else if Events."eve-abnormalCTColonography" then
      Actions."act-FollowUpColonoscopy"
    else
      null
  else null
// TODO: split abnormal and malignant findings. Malignant -> oncology referral (or surgery referral per radiology guidelines)
// TODO: add check for recommended interval from radiologist when no abnormal findings? Prep can be an issue here too.
// TODO: (not in L2): add explicit normal finding?

define FollowUpColonoscopy:
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

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------    

//Colonoscopy
define ExistsFollowupColonoscopyCRCResult:
  ColonoscopyCRC is not null

define FollowupFollowupColonoscopyCRCResultCode:    
  ColonoscopyCRC R return R.code

define FollowupFollowupColonoscopyCRCResultReason:  
  ColonoscopyCRC R return R.reason

define FollowupFollowupColonoscopyCRCResultTiming:    
  ColonoscopyCRC R return R.timingTiming

define FollowupFollowupColonoscopyCRCResultTimingEvent:    
  FollowupFollowupColonoscopyCRCResultTiming R return First(R.event)

define FollowupFollowupColonoscopyCRCResultFlag:
  ColonoscopyCRC R return CRCSMCommon.CreateRecommendationFlagExtension(R.flag)  

define ExistsFollowupColonoscopyPolypResult:
  ColonoscopyPolyps is not null

define FollowupColonoscopyPolypResultCode:    
  ColonoscopyPolyps R return R.code

define FollowupColonoscopyPolypResultReason:  
  ColonoscopyPolyps R return R.reason

define FollowupColonoscopyPolypResultTiming:    
  ColonoscopyPolyps R return R.timingTiming

define FollowupColonoscopyPolypResultTimingEvent:    
  FollowupColonoscopyPolypResultTiming R return First(R.event)

define FollowupColonoscopyPolypResultFlag:
  ColonoscopyPolyps R return CRCSMCommon.CreateRecommendationFlagExtension(R.flag)

//CTC

define ExistsFollowupCTCInconclusiveResult:
  Events."eve-inconclusiveCTColonography" is true and FollowUpCTColonography is not null

define FollowupFollowupCTCInconclusiveResultCode:    
  FollowUpCTColonography R return R.code

define FollowupFollowupCTCInconclusiveResultReason:  
  FollowUpCTColonography R return R.reason

define FollowupFollowupCTCInconclusiveResultTiming:    
  FollowUpCTColonography R return R.timingTiming

define FollowupFollowupCTCInconclusiveResultTimingEvent:    
  FollowupFollowupCTCInconclusiveResultTiming R return First(R.event)

define FollowupBirads4Or5ResultFlag:
  FollowUpCTColonography R return CRCSMCommon.CreateRecommendationFlagExtension(R.flag)

define ExistsFollowupCTCAbnormalResult:
  Events."eve-abnormalCTColonography" is true and FollowUpCTColonography is not null

define FollowupCTCAbnormalResultCode:    
  FollowUpCTColonography R return R.code

define FollowupCTCAbnormalResultReason:  
  FollowUpCTColonography R return R.reason

define FollowupCTCAbnormalResultTiming:    
  FollowUpCTColonography R return R.timingTiming

define FollowupCTCAbnormalResultTimingEvent:    
  FollowupCTCAbnormalResultTiming R return First(R.event)

define FollowupCTCAbnormalResultFlag:
  FollowUpCTColonography R return CRCSMCommon.CreateRecommendationFlagExtension(R.flag)

//stool test

define ExistsFollowupStoolInconclusiveResult:
  Events."eve-inconclusiveStoolTest" is true and FollowUpStoolTest is not null

define FollowupStoolInconclusiveResultCode:    
  FollowUpStoolTest R return R.code

define FollowupStoolInconclusiveResultReason:  
  FollowUpStoolTest R return R.reason

define FollowupStoolInconclusiveResultTiming:    
  FollowUpStoolTest R return R.timingTiming

define FollowupStoolInconclusiveResultTimingEvent:    
  FollowupStoolInconclusiveResultTiming R return First(R.event)

define FollowupStoolInconclusiveResultFlag:
  FollowUpStoolTest R return CRCSMCommon.CreateRecommendationFlagExtension(R.flag)

define ExistsFollowupStoolAbnormalResult:
  Events."eve-abnormalStoolTest" is true and FollowUpStoolTest is not null

define FollowupStoolAbnormalResultCode:    
  FollowUpStoolTest R return R.code

define FollowupStoolAbnormalResultReason:  
  FollowUpStoolTest R return R.reason

define FollowupStoolAbnormalResultTiming:    
  FollowUpStoolTest R return R.timingTiming

define FollowupStoolAbnormalResultTimingEvent:    
  FollowupStoolAbnormalResultTiming R return First(R.event)

define FollowupStoolAbnormalResultFlag:
  FollowUpStoolTest R return CRCSMCommon.CreateRecommendationFlagExtension(R.flag)

//flex sig

define ExistsFollowupFlexSigAbnormalResult:
  Events."eve-abnormalFlexSig" is true and FollowUpFlexSig is not null

define FollowupFlexSigAbnormalResultCode:    
  FollowUpFlexSig R return R.code

define FollowupFlexSigAbnormalResultReason:  
  FollowUpFlexSig R return R.reason

define FollowupFlexSigAbnormalResultTiming:    
  FollowUpFlexSig R return R.timingTiming

define FollowupFlexSigAbnormalResultTimingEvent:    
  FollowupFlexSigAbnormalResultTiming R return First(R.event)

define FollowupFlexSigAbnormalResultFlag:
  FollowUpFlexSig R return CRCSMCommon.CreateRecommendationFlagExtension(R.flag)
