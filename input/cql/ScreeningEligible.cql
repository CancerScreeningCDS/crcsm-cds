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
  if Events."eve-ActiveCRC" is true
  then Actions."end-noteligible-currentcolorectalcancer"
  else if Events."eve-HxTotalColectomy" is true
  then Actions."end-noteligible-colectomy"
  else if Events."eve-Symptomatic" is true
  then Actions."act-Diagnostic" 
  else Actions."act-ScreeningEligible"

define IsScreeningEligible:
  "flow-ScreeningEligible".code ~ Actions."Eligible for screening"

define IsNotScreeningEligible:
  "flow-ScreeningEligible".code ~ Actions."Not eligible for screening"   

define ScreeningEligibleCode:
  "flow-ScreeningEligible".code

define ScreeningEligibleReason:
  "flow-ScreeningEligible".reason 

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

