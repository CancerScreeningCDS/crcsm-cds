library ScreeningEligibleEvents version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

context Patient

define "eve-HxTotalColectomy":
  DataElements."de-TotalColectomy"

define "eve-ActiveCRC":
  DataElements."de-CurrentCRC"

define "eve-Symptomatic":
  DataElements."de-ColorectalSignsSymptoms"

