library FollowUpEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include DataElements version '1.0.0' called DataElements

codesystem "SNOMED-CT": 'http://snomed.info/sct'

code "Inconclusive": '419984006' from "SNOMED-CT" display 'Inconclusive (qualifier value)'
code "Invalid": '455371000124106' from "SNOMED-CT" display 'Invalid result (qualifier value)'
code "Positive": '10828004' from "SNOMED-CT" display 'Positive (qualifier value)'

context Patient

define "eve-lastTestColonoscopy":
  DataElements."de-MostRecentTestIsColonoscopy" is true

define "eve-lastTestStool":
  DataElements."de-MostRecentTestIsFOBT" is true or DataElements."de-MostRecentTestIssDNAFIT" is true

define "eve-inconclusiveStoolTest":
  MostRecentStoolInconclusive is true

define "eve-abnormalStoolTest":
  MostRecentStoolAbnormal is true

define "eve-lastTestFlexSig":
  DataElements."de-MostRecentTestIsFlexSig" is true

define "eve-abnormalFlexSig":
  MostRecentFlexSigAbnormal is true

define "eve-lastTestCTC":
  DataElements."de-MostRecentTestIsCTC" is true

define "eve-inconclusiveCTColonography":
  MostRecentCTCInconclusive is true 

define "eve-abnormalCTColonography":
  MostRecentCTCAbnormal is true 

define MostRecentStoolInconclusive:
  exists DataElements.MostRecentColorectalScreeningTestResults.results R
    where
      AnyTrue(R.coding C
        return FHIRHelpers.ToCode(C) in {
          "Inconclusive",
          "Invalid"
      })

define MostRecentStoolAbnormal:
  exists DataElements.MostRecentColorectalScreeningTestResults.results R
    where
      AnyTrue(R.coding C
        return FHIRHelpers.ToCode(C) ~ "Positive"
      )

define MostRecentFlexSigAbnormal:
  "eve-lastTestFlexSig" is true and AnyTrue({
    DataElements."de-FindingPolyps",
    DataElements."de-FindingCRC"
    })
//TODO: malignant should warrant an oncology referral. There _may_ be a follow-up colonoscopy or not, depending on obstruction, etc.

define MostRecentCTCInconclusive:
  DataElements."de-CTCInconclusive" is true

define MostRecentCTCAbnormal:
  DataElements."de-CTCFindingPolyps" is true or DataElements."de-CTCFindingCRC" is true
//TODO: malignant should warrant an oncology referral. There _may_ be a follow-up colonoscopy or not, depending on obstruction, etc.

define "eve-colonoscopyFindingCRC":
  DataElements."de-FindingCRC" is true and "eve-lastTestColonoscopy"

define "eve-recommendedInterval":
  DataElements."de-RecommendedInterval"

define "eve-colonoscopyFindingPolyps":
  DataElements."de-FindingPolyps" is true and "eve-lastTestColonoscopy"


