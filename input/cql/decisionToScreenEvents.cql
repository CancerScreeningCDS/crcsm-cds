library DecisionToScreenEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'

// Non-standard or "local" codes

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

parameter ObservationLookbackPeriod default 14 days
parameter SymptomaticLookBack default 14 days

context Patient

define "eve-LifeExp":
  DataElements."de-lifeexp"

define "eve-AgeOver76":
  (AgeInYears() > 76 and AgeInYears() < 86)

define "eve-Age86AndOlder":
  AgeInYears() >= 86

//define "eve-riskFactors":
  // TODO: Implement logic for eve-riskFactors

