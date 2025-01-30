library ScreeningDueEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CRCSMCommonFunctions version '1.0.0'
include CSMCommonFunctions version '1.0.0'

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED": 'http://snomed.info/sct'

// Standard codes
code "Colorectal cancer screening": '275978004' from "SNOMED" display 'Colorectal cancer screening'

valueset "Fecal Occult Blood Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.11.1020' // Includes FIT and gFOBT, which cannot always be distinguished in LOINC; Steward: NCQA
valueset "Stool DNA-FIT": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.11.1145' // Steward: NCQA
valueset "Colonoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.356' // for use with document type/diagnostic report
valueset "CT Colonography Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.118.11.1097' // For use with document type/diagnostic report. Steward: NCQA Phemur
valueset "Flexible Sigmoidoscopy Study": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.359' // for use with document type/diagnostic report

context Patient

define "eve-nextdueexists":
  ActivityScheduledDate(ColorectalScheduledActivity.timing) is not null

define "eve-DetermineIfDueForScreening":
  CarePlanActivitiesDue A where A.flag in {CRCSMCommonFunctions."DUE", CRCSMCommonFunctions."OVERDUE"}

define CarePlanActivitiesDue:
  ColorectalCancerScreeningActivities A
  let lastReport: CRCSMCommonFunctions.MostRecentDiagnosticReportByCode(First(A.code)),
  lastReportDate: CSMCommonFunctions.DiagnosticReportDate(lastReport),
  nextdue: CalculateActivityNextDue(A)
  return {
    activity: A,
    activityCode: A.code,
    nextDue: nextdue,
    scheduledDue: ActivityScheduledDate(A.timing),
    scheduledStart: ((A.timing as Timing).repeat.bounds as Period).start,
    scheduledRepeat: CRCSMCommonFunctions.EvaluateInterval((A.timing as FHIR.Timing).repeat),
    lastReportDate: lastReportDate,
    flag: CRCSMCommonFunctions.EvaluateFlag((A.timing as FHIR.Timing).repeat, nextdue)
  } 

//------------------------------------------------------------------------------
// calculated next due
//------------------------------------------------------------------------------

define function CalculateActivityNextDue(action FHIR.RequestGroup.Action):
  action A
  let lastReport: CRCSMCommonFunctions.MostRecentDiagnosticReportByCode(First(A.code)),
  lastReportDate: FHIRHelpers.ToDateTime(lastReport.effective) as DateTime,
  duedate: ActivityScheduledDate(A.timing),
  repeat: Tuple{frequency: FHIRHelpers.ToInteger((A.timing as Timing).repeat.frequency),
        period: FHIRHelpers.ToDecimal((A.timing as Timing).repeat.period),
        periodUnit: FHIRHelpers.ToString((A.timing as Timing).repeat.periodUnit)}
  return
    case
      // -duedate = use CalculateNextDueByCodeAndInterval
      when duedate is null then 
        CRCSMCommonFunctions.CalculateNextDueByCodeAndInterval(
          First(A.code), 
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
// Care plan/Request group
//------------------------------------------------------------------------------

define ColorectalCancerScreeningRequestGroup:
  if MostRecentActiveColorectalCancerScreeningCarePlan.activity[0].reference.reference is not null
    and StartsWith(MostRecentActiveColorectalCancerScreeningCarePlan.activity[0].reference.reference,'RequestGroup/')
  then
    //FHIRHelpers.resolve(MostRecentActiveColorectalCancerScreeningCarePlan.activity[0].reference) as FHIR.RequestGroup
    First(
      [RequestGroup] R where 
        R.id = Last(Split(MostRecentActiveColorectalCancerScreeningCarePlan.activity[0].reference.reference,'/'))
    )
  else null      

define ColorectalCancerScreeningCarePlan:
  MostRecentActiveColorectalCancerScreeningCarePlan

define MostRecentActiveColorectalCancerScreeningCarePlan:
  Last(ActiveColorectalCancerScreeningCarePlans C sort by Coalesce(
    start of period,
    created)
  )      

define ActiveColorectalCancerScreeningCarePlans:
  [CarePlan] C
    where C.status in {'active', 'draft'}
      and exists C.category cat where cat ~ "Colorectal cancer screening"   

//------------------------------------------------------------------------------
// Activity
//------------------------------------------------------------------------------

define ColorectalScheduledActivity:
  NextScheduledColorectalScreeningActivity(ColorectalCancerScreeningActivities)

define ColorectalCancerScreeningActivities:
  ColorectalCancerScreeningRequestGroup.action A

define function NextScheduledActivityByCode(activities List<FHIR.RequestGroup.Action>, code Code):
  NextScheduledActivity(activities A where exists A.code C where C ~ ToConcept(code))

define function NextScheduledColorectalScreeningActivity(activities List<FHIR.RequestGroup.Action>):
  NextScheduledActivity(activities A where exists A.code C where C in "Fecal Occult Blood Test" or C in "Stool DNA-FIT" or C in "Colonoscopy Study" or C in "CT Colonography Study" or C in "Flexible Sigmoidoscopy Study")

define function NextScheduledActivity(activities List<FHIR.RequestGroup.Action>):
  Last(activities A sort by ActivityScheduledDate(timing))

//------------------------------------------------------------------------------
// scheduled due date
//------------------------------------------------------------------------------

define function ActivityScheduledDate(timing Choice<FHIR.Timing,FHIR.Period>):
  Coalesce(
    MostRecentTimingEvent(timing as FHIR.Timing),
    (timing as FHIR.Period)."start".value,
    (timing as FHIR.Period)."end".value
  )

define function MostRecentTimingEvent(timing FHIR.Timing):
  Last(timing.event E sort asc).value 
