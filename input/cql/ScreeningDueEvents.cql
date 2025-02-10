library ScreeningDueEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0'
include CSMCommonFunctions version '1.0.0'

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED": 'http://snomed.info/sct'

// Standard codes
code "Colorectal cancer screening": '268548003' from "SNOMED" display 'Screening for malignant neoplasm of large intestine (procedure)'

valueset "Fecal Occult Blood Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.11.1020' // Includes FIT and gFOBT, which cannot always be distinguished in LOINC; Steward: NCQA
valueset "Stool DNA-FIT": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1145' // Steward: NCQA
valueset "Colonoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.356' // for use with document type/diagnostic report
valueset "CT Colonography Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.118.11.1097' // For use with document type/diagnostic report. Steward: NCQA Phemur
valueset "Flexible Sigmoidoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.359' // for use with document type/diagnostic report

context Patient

define "eve-nextdueexists":
  ActivityPlannedDate(ColorectalPlannedActivity.timing) is not null

// TODO: add event for 45-74 and no screening in past 10 years - due now (not in L2)

define "eve-DetermineIfDueForScreening":
  CarePlanActivitiesDue A where A.flag in {CRCSMCommonFunctions."DUE", CRCSMCommonFunctions."OVERDUE"}

define CarePlanActivitiesDue:
  ScreeningActivities A
  let lastReport: CRCSMCommonFunctions.MostRecentDiagnosticReportByCode(A.code),
  lastReportDate: CSMCommonFunctions.DiagnosticReportDate(lastReport),
  nextdue: CalculateActivityNextDue(A)
  return {
    code: A.code,
    intent: 'plan',
    nextDue: nextdue,
    plannedDue: A.plannedDue,
    plannedStart: A.plannedStart,
    plannedRepeat: CRCSMCommonFunctions.EvaluateInterval((A.timing as FHIR.Timing).repeat),
    lastReportDate: lastReportDate,
    flag: CRCSMCommonFunctions.EvaluateFlag((A.timing as FHIR.Timing).repeat, nextdue)
  } 

define ScreeningActivities:
  ScreeningRequestGroupActions union ScreeningServiceRequests

//------------------------------------------------------------------------------
// calculated next due
//------------------------------------------------------------------------------

define function CalculateActivityNextDue(
  activity Tuple{code FHIR.CodeableConcept,plannedDue System.DateTime,plannedStart System.DateTime,timing FHIR.Timing}
):
  activity A
  let lastReport: CRCSMCommonFunctions.MostRecentDiagnosticReportByCode(A.code),
  lastReportDate: FHIRHelpers.ToDateTime(lastReport.effective) as DateTime,
  duedate: A.plannedDue,
  repeat: Tuple{frequency: FHIRHelpers.ToInteger((A.timing as Timing).repeat.frequency),
        period: FHIRHelpers.ToDecimal((A.timing as Timing).repeat.period),
        periodUnit: FHIRHelpers.ToString((A.timing as Timing).repeat.periodUnit)}
  return
    case
      // -duedate = use CalculateNextDueByCodeAndInterval
      when duedate is null then 
        CRCSMCommonFunctions.CalculateNextDueByCodeAndInterval(
          A.code, 
          FHIRHelpers.ToDateTime(((A.timing as Timing).repeat.bounds as Period).start),
          repeat)
      // +duedate, -repeat, -lastreport or +lastreport < duedate = use duedate
      when CRCSMCommonFunctions.RepeatIsValid(repeat) is false and (lastReport is null or lastReportDate < duedate) then duedate
      // +duedate, +repeat, -lastreport or +lastreport < duedate = use duedate
      when CRCSMCommonFunctions.RepeatIsValid(repeat) and (lastReport is null or lastReportDate < duedate) then duedate
      // +duedate, -repeat, +lastreport > duedate = no prediction
      when CRCSMCommonFunctions.RepeatIsValid(repeat) is false and lastReport is not null and lastReportDate > duedate then null
      // +duedate, +repeat, +lastreport > duedate = use lastreport + repeat
      when CRCSMCommonFunctions.RepeatIsValid(repeat) and lastReport is not null and lastReportDate > duedate then
        date from CRCSMCommonFunctions.AddIntervalToDateTime(lastReportDate, repeat)
      // Default case if none of the above conditions are met      
      else null
    end     

//------------------------------------------------------------------------------
// Care plan
//------------------------------------------------------------------------------

define MostRecentActiveScreeningCarePlan:
  Last(ActiveColorectalCancerScreeningCarePlans C 
    sort by Coalesce(start of period, created)
  )      

define ActiveColorectalCancerScreeningCarePlans:
  [CarePlan] C
    where C.status in {'active'}
      and exists C.category cat where cat ~ "Colorectal cancer screening"   

//------------------------------------------------------------------------------
// Care plan/Request group
//------------------------------------------------------------------------------

define ScreeningRequestGroupActions:
  MostRecentActiveScreeningCarePlanRequestGroup.action A
  return {
    code: First(A.code),
    plannedDue: ActivityPlannedDate(A.timing),
    plannedStart: FHIRHelpers.ToDateTime(((A.timing as Timing).repeat.bounds as Period).start),
    timing: A.timing as FHIR.Timing
  } 

define MostRecentActiveScreeningCarePlanRequestGroup:
  if MostRecentActiveScreeningCarePlan.activity[0].reference.reference is not null
    and StartsWith(MostRecentActiveScreeningCarePlan.activity[0].reference.reference,'RequestGroup/')
  then
    First(
      [RequestGroup] R where 
        R.id = Last(Split(MostRecentActiveScreeningCarePlan.activity[0].reference.reference,'/'))
    )
  else null       

//------------------------------------------------------------------------------
// Care plan/Service requests
//------------------------------------------------------------------------------

define ScreeningServiceRequests:
  MostRecentActiveScreeningCarePlanServiceRequests R
  return {
    code: R.code,
    plannedDue: Coalesce(
      ActivityPlannedDate(R.occurrence as Timing),
      (R.occurrence as FHIR.dateTime).value,
      (R.occurrence as FHIR.Period)."end".value,
      (R.occurrence as FHIR.Period)."start".value
    ),
    plannedStart: FHIRHelpers.ToDateTime(((R.occurrence as FHIR.Timing).repeat.bounds as Period).start),
    timing: R.occurrence as FHIR.Timing
  }

define MostRecentActiveScreeningCarePlanServiceRequests:
  MostRecentActiveScreeningCarePlan.activity A
  where
    A.reference.reference is not null and StartsWith(A.reference.reference,'ServiceRequest/')
  return singleton from (
    [ServiceRequest] R 
    where R.id = Last(Split(A.reference.reference,'/'))
      and R.intent = 'plan' //from CPG workflow        
  )

//------------------------------------------------------------------------------
// Activity
//------------------------------------------------------------------------------

define ColorectalPlannedActivity:
  NextPlannedActivityByColorectalVS(ScreeningActivities)

define function NextPlannedActivityByCode(
  activities List<Tuple{code FHIR.CodeableConcept,plannedDue System.DateTime,plannedStart System.DateTime,timing FHIR.Timing}>,
  code Code
):
  NextPlannedActivity(activities A where A.code ~ ToConcept(code))

define function NextPlannedActivityByColorectalVS(
  activities List<Tuple{code FHIR.CodeableConcept,plannedDue System.DateTime,plannedStart System.DateTime,timing FHIR.Timing}>
):
  NextPlannedActivity(
    activities A where
      exists A.code.coding C
        where
          C in "Fecal Occult Blood Test" or
          C in "Stool DNA-FIT" or
          C in "Colonoscopy Study" or
          C in "CT Colonography Study" or
          C in "Flexible Sigmoidoscopy Study" or
          C ~ "Colorectal cancer screening"
  )

define function NextPlannedActivity(
  activities List<Tuple{code FHIR.CodeableConcept,plannedDue System.DateTime,plannedStart System.DateTime,timing FHIR.Timing}>
):
  Last(activities A sort by ActivityPlannedDate(timing))

//------------------------------------------------------------------------------
// planned due date
//------------------------------------------------------------------------------

define function ActivityPlannedDate(timing Choice<FHIR.Timing,FHIR.Period>):
  Coalesce(
    MostRecentTimingEvent(timing as FHIR.Timing),
    (timing as FHIR.Period)."start".value,
    (timing as FHIR.Period)."end".value
  )

define function MostRecentTimingEvent(timing FHIR.Timing):
  Last(timing.event E sort asc).value 
