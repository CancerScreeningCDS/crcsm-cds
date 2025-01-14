library FollowUpEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include DataElements version '1.0.0' called DataElements

codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/crcsm-cds/CodeSystem/screening-observation-code-system'

code "POSITIVE": '10828004' from "SNOMED-CT" display 'Positive (qualifier value)'
code "INCONCLUSIVE": '419984006' from "SNOMED-CT" display 'Inconclusive (qualifier value)'
code "INVALID": '455371000124106' from "SNOMED-CT" display 'Invalid result (qualifier value)'

parameter tieredApproach Boolean default false

context Patient

define "eve-lastTestColonoscopy":
  DataElements."de-MostRecentTestIsColonoscopy" is true

define "eve-lastTestStool":
  DataElements."de-MostRecentTestIsFIT" is true or DataElements."de-MostRecentTestIsgFOBT" is true or DataElements."de-MostRecentTestIssDNAFIT" is true

define "eve-inconclusiveStoolTest":
  (DataElements."de-MostRecentTestIsFIT" is true or DataElements."de-MostRecentTestIsgFOBT" is true or DataElements."de-MostRecentTestIssDNAFIT" is true) and MostRecentStoolInconclusive is true

define "eve-abnormalStoolTest":
  (DataElements."de-MostRecentTestIsFIT" is true or DataElements."de-MostRecentTestIsgFOBT" is true or DataElements."de-MostRecentTestIssDNAFIT" is true) and MostRecentStoolAbnormal is true

define MostRecentStoolReport:
  Common.MostRecentDiagnosticReport(DataElements.FITDiagnosticReports union DataElements.gFOBTDiagnosticReports union DataElements.sDNAFITDiagnosticReports)

define MostRecentStoolAbnormal:
  (
    MostRecentStoolReport R
      where AnyTrue(
        (DataElements.CollateConclusionCodes(R, (DataElements.FITObservations union DataElements.gFOBTObservations union DataElements.sDNAFITObservations))) CCC return CCC ~ "POSITIVE"
      )
  ) is not null

define MostRecentStoolInconclusive:
  (
    MostRecentStoolReport R
      where AnyTrue(
        (DataElements.CollateConclusionCodes(R, (DataElements.FITObservations union DataElements.gFOBTObservations union DataElements.sDNAFITObservations))) CCC return (CCC ~ "INCONCLUSIVE" or CCC ~ "INVALID")
      )
  ) is not null

define "eve-lastTestFlexSig":
  DataElements."de-MostRecentTestIsFlexSig" is true

define "eve-abnormalFlexSig":
  DataElements."de-MostRecentTestIsFlexSig" is true and MostRecentFlexSigAbnormal is true

define "eve-adequateBowelPrep":
  DataElements."de-MostRecentTestIsFlexSig" is true and MostRecentFlexSigAdequatePrep is true

define MostRecentFlexSigReport:
  Common.MostRecentDiagnosticReport(DataElements.FlexSigDiagnosticReports)

define MostRecentFlexSigAbnormal:
  (MostRecentFlexSigReport R 
    where (R in DataElements."de-FindingPolypsFlexSig" or R in DataElements."de-FindingCRCFlexSig"))
  is not null

define MostRecentFlexSigAdequatePrep:
  (MostRecentFlexSigReport R 
    where R in DataElements."de-AdequateBowelPrepFlexSig")
  is not null

define "eve-lastTestCTC":
  DataElements."de-MostRecentTestIsCTC" is true

define "eve-inconclusiveCTColonography":
  DataElements."de-MostRecentTestIsCTC" is true and MostRecentCTCInconclusive is true 

define "eve-abnormalCTColonography":
  DataElements."de-MostRecentTestIsCTC" is true and MostRecentCTCAbnormal is true 

define MostRecentCTCReport:
  Common.MostRecentDiagnosticReport(DataElements.FlexSigDiagnosticReports)

define MostRecentCTCInconclusive:
  (MostRecentFlexSigReport R 
    where R in DataElements."de-CTCInconclusive")
  is not null

define MostRecentCTCAbnormal:
  (MostRecentFlexSigReport R 
    where (R in DataElements."de-CTCFindingPolyps" or R in DataElements."de-CTCFindingCRC"))
  is not null

define "eve-pendingColonoscopy":
  DataElements."de-pendingOrderReferralForCRCTest" is true

define "eve-TieredApproach":
  tieredApproach


