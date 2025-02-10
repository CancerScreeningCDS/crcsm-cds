library ScreeningIncomplete version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include ScreeningIncompleteEvents version '1.0.0' called Events
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-ScreeningIncomplete":
  PendingOrders

define PendingOrders:
  Events."eve-pendingorders"  

