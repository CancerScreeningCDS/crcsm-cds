library DecisionToScreenEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

context Patient

define "eve-LifeExp":
  DataElements."de-lifeexp"

define "eve-AgeOver76":
  AgeInYears() > 76 and AgeInYears() < 86

define "eve-Age86AndOlder":
  AgeInYears() >= 86

//define "eve-riskFactors":
  // TODO: Implement logic for eve-riskFactors

