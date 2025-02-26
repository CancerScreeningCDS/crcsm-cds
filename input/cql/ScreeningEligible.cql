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

library ScreeningEligible version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include ScreeningEligibleEvents version '1.0.0' called Events
include ScreeningEligibleActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "LOINC": 'http://loinc.org'

codesystem "ActCode": 'http://example.org/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://example.org/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Error": 'error' from "ActCode"
// Reason Codes
code "Missing age or birth date": 'missingageorbirthdate' from "ReasonCode"

// Standard codes
code "Age": '30525-0' from "LOINC" display 'Age'

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

context Patient

//------------------------------------------------------------------------------
// CDS Logic
//------------------------------------------------------------------------------

define CheckIsIncludedAndNotExcluded:
  IsIncludedAndNotExcludedErrorsHaveOccurred is not true 
    and Message(IsIncludedAndNotExcluded, IsIncludedAndNotExcluded is false,
    'http://example.org/CodeSystem/plan-definition-action-reason-code-system/excludedornotincluded',
    'Error', 
    'Excluded or not included')  

define IsIncludedAndNotExcluded:
  IsIncluded and not Excluded

// INCLUSIONS
define IsIncluded:
  "inc-AgeAtLeast18"

// Age 18 years and older, only use MostRecentAgeValue if no birthdate  
define "inc-AgeAtLeast18":
  (AgeInYears() is not null and AgeInYears() >= 18) or (AgeInYears() is null and MostRecentAgeValue >= 18)

define MostRecentAgeValue:
  First(
    [Observation: "Age"] O
      where O.value.unit = 'years'
      sort by effective desc
  ).value.value.value

// EXCLUSIONS
define Excluded:
  false

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-ScreeningEligible":
  {
    Coalesce(
      ActiveCRC,
      HxTotalColectomy,
      Symptomatic,
      Eligible
    )
  }
  except { null }


define ActiveCRC:
  if Events."eve-ActiveCRC" is true
  then Actions."end-noteligible-currentcolorectalcancer" else null

define HxTotalColectomy:
  if Events."eve-HxTotalColectomy" is true
  then Actions."end-noteligible-colectomy" else null

define Symptomatic:
  if Events."eve-Symptomatic" is true
  then Actions."act-Diagnostic" else null

define Eligible:
  if Coalesce(
    ActiveCRC,
    HxTotalColectomy,
    Symptomatic
  ) is null
  then Actions."act-ScreeningEligible" else null
  

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------

define IsScreeningEligible:
  Eligible is not null

define IsNotScreeningEligible:
  Eligible is null  


define ExistsActiveCRC:
  ActiveCRC is not null

define ExistsHxTotalColectomy:
  HxTotalColectomy is not null

define ExistsSymptomatic:
  Symptomatic is not null

define ScreeningEligibleCode:
  First("flow-ScreeningEligible").code

define ScreeningEligibleReason:
  First("flow-ScreeningEligible").reason 

//------------------------------------------------------------------------------
// ERRORS
//------------------------------------------------------------------------------

define IsIncludedAndNotExcludedErrorsHaveOccurred:
  ErrorMissingAgeOrBirthdate

define MissingAgeOrBirthdate:
  AgeInYears() is null and MostRecentAgeValue is null

define ErrorMissingAgeOrBirthdate:
  if MissingAgeOrBirthdate
  then Message(true, true,
    'http://example.org/CodeSystem/plan-definition-action-reason-code-system/missingageorbirthdate',
    'Warning', 
    'Missing age or birth date')
  else false

