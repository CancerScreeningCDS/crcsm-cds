library ScreeningIncomplete version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include ScreeningIncompleteEvents version '1.0.0' called Events
include DataElements version '1.0.0' called DataElements
include ScreeningEligible version '1.0.0'

context Patient

define "flow-ScreeningIncomplete":
  exists IncompleteScreeningOrders
    or exists IncompleteScreeningProcedures
//    or exists IncompleteScreeningPathology

define IncompleteScreeningOrders:
  Events."eve-pendingorders"  

define IncompleteScreeningProcedures:
  Events."eve-pendingprocedures"

//define IncompleteScreeningPathology:
//  Events."eve-pendingpathology" 

//------------------------------------------------------------------------------
// MEASURE
//------------------------------------------------------------------------------  

define "Initial Population":
  ScreeningEligible.IsIncludedAndNotExcluded

define "Denominator":
	"Initial Population"

define "Denominator Exclusion":
  ScreeningEligible.IsNotScreeningEligible

define "Numerator":
  "flow-ScreeningIncomplete"  