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