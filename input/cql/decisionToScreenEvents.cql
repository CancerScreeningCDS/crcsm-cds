library decisionToScreenEvents version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

define "eve-LifeExp10":
  DataElements."de-ColorectalSignsSymptoms"

define "eve-AgeOver76":
  // TODO: Implement logic for eve-AgeOver76

define "eve-Age86AndOlder":
  // TODO: Implement logic for eve-Age86AndOlder

define "eve-riskFactors":
  // TODO: Implement logic for eve-riskFactors

