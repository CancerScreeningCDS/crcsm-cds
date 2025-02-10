library ScreeningDue version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include ScreeningDueEvents version '1.0.0' called Events
include ScreeningDueActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-ScreeningDue":
  if DetermineNextDueDate is not null
    then {DetermineNextDueDate}
    else DueOrOverdue

// TODO: add event for 45-74 and no screening in past 10 years - due now (not in L2)
define DetermineNextDueDate:
  if Events."eve-nextdueexists" is false
    then Actions."act-determinedue"
    else null

define DueOrOverdue:    
  Events."eve-DetermineIfDueForScreening"