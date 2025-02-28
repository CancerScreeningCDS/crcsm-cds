library IncreasedRiskExclusionsEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include DataElements version '1.0.0' called DataElements

context Patient

define "eve-HereditarySyndrome":
  DataElements."de-personalHxHereditarySyndrome" 
  or DataElements."de-famHxSyndrome"

define "eve-IBD":
  DataElements."de-IBD"

define "eve-HxCRC":
  DataElements."de-HxCRC"

define "eve-FamilyHx":
  DataElements."de-FamilyHxCRC" or DataElements."de-FamHxAdvancedPolyps"

define "eve-HxPolyps":
  DataElements."de-HxPolyps"