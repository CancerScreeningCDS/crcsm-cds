/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2024 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

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