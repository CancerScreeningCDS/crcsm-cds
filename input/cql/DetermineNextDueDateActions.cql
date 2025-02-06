library DetermineNextDueDateActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

context Patient

//------------------------------------------------------------------------------
// Define Code and Timing for each test
//------------------------------------------------------------------------------

define MostRecentColorectalScreeningDate:
  DataElements.MostRecentColorectalScreeningDate

define function UpdateDueDate(screeningInteval System.Quantity):
  if MostRecentColorectalScreeningDate is not null then
    MostRecentColorectalScreeningDate + screeningInteval
  else 
    null

define "act-ColonoscopyEvery10":
  UpdateDueDate(10 years)

define "act-FOBTEveryYear":
  UpdateDueDate(1 years)

// TODO: Determine Screening interval for "Every 1 to 3 years"
define "act-sDNAFITEvery1to3":
  UpdateDueDate(1 years)

define "act-CTColonographyEvery5":
  UpdateDueDate(5 years)

define "act-FlexSigEvery5":
  UpdateDueDate(5 years)

//------------------------------------------------------------------------------
// Call CRCSMCommonFunctions.SetRecommendation for each test
//------------------------------------------------------------------------------

// define "act-ColonoscopyEvery10":
//   // TODO: Implement logic for act-ColonoscopyEvery10

// define "act-FOBTEveryYear":
//   // TODO: Implement logic for act-FOBTEveryYear

// define "act-sDNAFITEvery1to3":
//   // TODO: Implement logic for act-sDNAFITEvery1to3

// define "act-CTColonographyEvery5":
//   // TODO: Implement logic for act-CTColonographyEvery5

// define "act-FlexSigEvery5":
//   // TODO: Implement logic for act-FlexSigEvery5
