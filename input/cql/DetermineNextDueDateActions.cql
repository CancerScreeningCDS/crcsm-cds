/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2025 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

library DetermineNextDueDateActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

context Patient

//------------------------------------------------------------------------------
// Define Code and Timing for each test
//------------------------------------------------------------------------------

define MostRecentColorectalScreeningDate:
  DataElements.MostRecentColorectalScreeningDate

define function UpdateDueDate(screeningInterval System.Quantity):
  if MostRecentColorectalScreeningDate is not null then
    MostRecentColorectalScreeningDate + screeningInterval
  else 
    null

define function UpdateDueDate(screeningInterval System.Quantity, followupInterval System.Quantity):
  if MostRecentColorectalScreeningDate is not null then
    MostRecentColorectalScreeningDate + Min({screeningInterval, followupInterval})
  else 
    null

define "act-ColonoscopyEvery10":
  if DataElements."de-RecommendedInterval" then
    UpdateDueDate(10 years, DataElements.FollowUpIntervalFromEndoscopist)
  else UpdateDueDate(10 years)

define "act-FOBTEveryYear":
  UpdateDueDate(1 years)

// TODO: Determine Screening interval for "Every 1 to 3 years"
define "act-sDNAFITEvery1to3":
  UpdateDueDate(1 years)

define "act-CTColonographyEvery5":
  UpdateDueDate(5 years)

define "act-FlexSigEvery5":
  if DataElements."de-RecommendedInterval" then
    UpdateDueDate(5 years, DataElements.FollowUpIntervalFromEndoscopist)
  else UpdateDueDate(5 years)

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
