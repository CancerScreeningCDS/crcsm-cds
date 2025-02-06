library USPSTFAvgRiskEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

/***** BEGIN CDS LOGIC ********************************************************/

context Patient

define "eve-AgeOver45":
  AgeInYears() >= 45

define "eve-priorScreeningExists":
  DataElements."de-FOBT" is true or DataElements."de-stoolDNAFIT" is true
    or DataElements."de-Colonoscopy" is true or DataElements."de-CTColonography" is true or DataElements."de-FlexSig" is true
