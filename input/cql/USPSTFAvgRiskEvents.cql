library USPSTFAvgRiskEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

parameter tieredApproach Boolean default false

/***** BEGIN CDS LOGIC ********************************************************/

context Patient

define "eve-AgeOver45":
  AgeInYears() >= 45

define "eve-priorScreeningExists":
  DataElements."de-FIT" is true or DataElements."de-gFOBT" is true or DataElements."Stool DNA-FIT test" is true
    or DataElements."de-Colonoscopy" is true or DataElements."de-CTColonography" is true or DataElements."de-FlexSig" is true

// define tieredApproachParameters:
//   [Parameters] P
//     where exists (P.parameter PParam where PParam.name = 'tieredApproach')

define "eve-TieredApproach":
  // First(tieredApproachParameters).parameter.value
  tieredApproach


