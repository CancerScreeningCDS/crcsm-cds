library ScreeningIncompleteEvents version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include CRCSMCommonFunctions version '1.0.0' called CRCSMCommonFunctions

valueset "Colorectal Screening Modalities": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.361'

context Patient

define "eve-pendingorders":
  ActiveColorectalCancerScreeningOrders union 
  CompletedOrdersWithoutResults

define "eve-pendingprocedures":
  CompletedProceduresWithoutResults

//define "eve-pendingpathology":
//  IncompleteColorectalBiopsyDiagnosticReports  

//------------------------------------------------------------------------------
// ORDERS
//------------------------------------------------------------------------------ 

define CompletedOrdersWithoutResults:
  if not exists DataElements.ColorectalCancerScreeningObservations
    then CompletedOrdersWithoutSubsequentReport
  else
    from CompletedOrdersWithoutSubsequentReport O,
      (DataElements.ColorectalCancerScreeningObservations) Obs
    where not Exists (Obs.basedOn B where B.reference = 'ServiceRequest/' + O.id)
    return O

define CompletedOrdersWithoutSubsequentReport:
  CompletedOrdersWithoutDiagnosticReport O
  let lastReportDate: LastReportDateByCode(O.code)
  where LastReportNotAfterOccurrenceDateTime(O.occurrence as FHIR.dateTime, lastReportDate)
    or LastReportNotAfterOccurrencePeriod(O.occurrence as FHIR.Period, lastReportDate)    

define CompletedOrdersWithoutDiagnosticReport:
  if not exists DataElements.ColorectalCancerScreeningDiagnosticReports
    then CompletedColorectalCancerScreeningOrders
  else
    from CompletedColorectalCancerScreeningOrders O,
      DataElements.ColorectalCancerScreeningDiagnosticReports DR
    where not Exists (DR.basedOn B where B.reference = 'ServiceRequest/' + O.id)
    return O

define CompletedColorectalCancerScreeningOrders:
  ColorectalCancerScreeningOrders O
    where O.status in {'completed'}

define ActiveColorectalCancerScreeningOrders:
  ColorectalCancerScreeningOrders O
    where O.status in {'active'}

define ColorectalCancerScreeningOrders:
  [ServiceRequest: "Colorectal Screening Modalities"] O
    where O.intent in {'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order'}    

//------------------------------------------------------------------------------
// PROCEDURES
//------------------------------------------------------------------------------ 

define CompletedProceduresWithoutResults:
  if not exists DataElements.ColorectalCancerScreeningObservations 
    then CompletedProceduresWithoutSubsequentReport
  else
    from CompletedProceduresWithoutSubsequentReport P,
      (DataElements.ColorectalCancerScreeningObservations) Obs
    where not Exists (Obs.basedOn B where B.reference = 'Procedure/' + P.id)
    and not Exists( (Obs.basedOn) oB where AnyTrue((P.basedOn) pB return pB = oB ) )
    return P

define CompletedProceduresWithoutSubsequentReport:
  CompletedProceduresWithoutDiagnosticReport P
  let lastReportDate: LastReportDateByCode(P.code)
  where LastReportNotAfterOccurrenceDateTime(P.performed as FHIR.dateTime, lastReportDate)
    or LastReportNotAfterOccurrencePeriod(P.performed as FHIR.Period, lastReportDate)    

define CompletedProceduresWithoutDiagnosticReport:
  if not exists DataElements.ColorectalCancerScreeningDiagnosticReports
    then CompletedColorectalCancerScreeningProcedures
  else
    from CompletedColorectalCancerScreeningProcedures P,
      DataElements.ColorectalCancerScreeningDiagnosticReports DR
    where not Exists (DR.basedOn B where B.reference = 'Procedure/' + P.id)
    return P

define CompletedColorectalCancerScreeningProcedures:
  ColorectalCancerScreeningProcedures P
    where P.status in {'completed'}

define ColorectalCancerScreeningProcedures:
  ColorectalCancerScreeningOrderedProcedures union
  [Procedure] P
    where P.code in "Colorectal Screening Modalities"

define ColorectalCancerScreeningOrderedProcedures:
  from CompletedColorectalCancerScreeningOrders O,
    [Procedure] P
  where Exists (P.basedOn B where B.reference = 'ServiceRequest/' + O.id)
    return P

//------------------------------------------------------------------------------
// DIAGNOSTIC REPORTS
//------------------------------------------------------------------------------ 

//define IncompleteColorectalBiopsyDiagnosticReports:
//  [DiagnosticReport: DataElements."Biopsy Report"] DR where
//    DR.status in {'preliminary', 'registered', 'partial'}

//------------------------------------------------------------------------------
// Functions
//------------------------------------------------------------------------------ 

define function LastReportDateByCode(code FHIR.CodeableConcept):
  code C
  let lastReport: CRCSMCommonFunctions.MostRecentDiagnosticReportByCode(C),
  lastReportDate: Common.DiagnosticReportDate(lastReport)
  return lastReportDate

define function LastReportNotAfterOccurrenceDateTime(occurrence FHIR.dateTime, lastReportDate System.DateTime):
  lastReportDate is null 
    or (occurrence is not null and lastReportDate <= occurrence) 

define function LastReportNotAfterOccurrencePeriod(occurrence FHIR.Period, lastReportDate System.DateTime):
  lastReportDate is null
    or (occurrence is not null and lastReportDate before C3F.PeriodToInterval(occurrence))