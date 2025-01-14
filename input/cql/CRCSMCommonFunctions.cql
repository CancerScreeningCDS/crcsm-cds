library CRCSMCommonFunctions version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include FHIRHelpers version '4.0.1' called FHIRHelpers
include CSMCommonFunctions version '1.0.0' called CSMCommonFunctions

codesystem "cpg-activity-type-cs": 'http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-activity-type-cs'
code "Record an inference": 'record-inference' from "cpg-activity-type-cs" display 'Record an inference'

context Patient

//------------------------------------------------------------------------------
// Recommendation model
//------------------------------------------------------------------------------

define SourceDocumentationACS:
  {
    label: 'ACS'
  }

define SourceDocumentationUSPSTF:
  {
    label: 'USPSTF'
  }

define SourceDocumentationUSMSTF:
  {
    label: 'USMSTF'
  }

define SourceDocumentationOther:
  {
    label: 'Other'
  }    

define function SetRecommendation(          
    code System.Code,
    reason System.Code,
    documentation Tuple{label System.String},
    timingAge Tuple{value Decimal, code String},
    event List<System.String>,
    repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}) 
    returns Tuple {code System.Code,reason System.Code,documentation Tuple{label System.String},timingAge Tuple{value Decimal, code String},
      timingTiming Tuple{event List<System.String>,repeat Tuple{boundsPeriod Tuple{start System.String},frequency System.Integer,period System.Decimal,periodUnit System.String}}}: 
  Tuple {
    code: code,
    reason: reason,
    documentation: documentation,
    timingAge: timingAge,
    timingTiming: {
      event: (if exists event then event else 
        {ToString(CalculateNextDueByCodeAndInterval(ToConcept(code), CalculateStartDateByAge(timingAge), repeat))}),
      repeat: {
        boundsPeriod: {
          start: if timingAge is not null then ToString(CalculateStartDateByAge(timingAge)) else null
        },
        frequency: repeat.frequency,
        period: repeat.period,
        periodUnit: repeat.periodUnit
      }
    }
  }

define function CalculateStartDateByAge(timingAge Tuple{value Decimal, code String}): 
  Patient.birthDate + System.Quantity{value: (timingAge.value), unit: FHIRHelpers.ToCalendarUnit(timingAge.code)}

//------------------------------------------------------------------------------
// Calculated next due date
//------------------------------------------------------------------------------
//  +startDate, +repeat, +lastreport = use startDate if > lastreport else lastreport + repeat
//  +startDate, +repeat, -lastreport = use startDate
//  +startDate, -repeat, +lastreport = use startDate if > lastreport else no prediction (non-repeating and ?completed)
//  +startDate, -repeat, -lastreport = use startDate
//  -startDate, +repeat, +lastreport = use lastreport + repeat
//  -startDate, +repeat, -lastreport = use today
//  -startDate, -repeat, +lastreport = no prediction (non-repeating and ?completed)
//  -startDate, -repeat, -lastreport = use today
define function CalculateNextDueByCodeAndInterval(code Concept, 
    startDate DateTime,
    repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}):
  code C
  //TODO: add last report lookup from observation for cases where report itself is not transmitted, only documented in a flowsheet
  let lastReport: MostRecentDiagnosticReportByCode(C)
  return
    case
      // +startDate, +repeat, +lastReport
      when startDate is not null and RepeatIsValid(repeat) and lastReport is not null then
        if startDate > FHIRHelpers.ToDateTime(lastReport.effective) as DateTime then startDate 
        else date from AddIntervalToDateTime(FHIRHelpers.ToDateTime(lastReport.effective) as DateTime, repeat)
      // +startDate, +repeat, -lastReport
      when startDate is not null and RepeatIsValid(repeat) and lastReport is null then
        startDate
      // +startDate, -repeat, +lastReport
      when startDate is not null and repeat is null and lastReport is not null then
        if startDate > FHIRHelpers.ToDateTime(lastReport.effective) as DateTime then startDate else null
      // +startDate, -repeat, -lastReport
      when startDate is not null and repeat is null and lastReport is null then
        startDate
      // -startDate, +repeat, +lastReport
      when startDate is null and RepeatIsValid(repeat) and lastReport is not null then
        date from AddIntervalToDateTime(FHIRHelpers.ToDateTime(lastReport.effective) as DateTime, repeat)
      // -startDate, +repeat, -lastReport
      when startDate is null and RepeatIsValid(repeat) and lastReport is null then
        Today()
      // -startDate, -repeat, +lastReport
      when startDate is null and RepeatIsValid(repeat) is false and lastReport is not null then
        null
      // -startDate, -repeat, -lastReport
      when startDate is null and RepeatIsValid(repeat) is false and lastReport is null then
        Today()
      else null  
    end

define function RepeatIsValid(repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}):
  repeat.frequency is not null and repeat.period is not null and repeat.periodUnit is not null

//TODO: determine if this needs a value set
define function MostRecentDiagnosticReportByCode(code Concept):
    CSMCommonFunctions.MostRecentDiagnosticReport(DiagnosticReportsByCode(code))

//TODO: determine if we need to look for non-test result, like specialty referral
define function DiagnosticReportsByCode(concept Concept):
  [DiagnosticReport] R
    where R.code ~ concept  

define function AddIntervalToDateTime(startDateTime System.DateTime, 
    repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}):
  startDateTime + System.Quantity {
    value: (repeat.frequency * repeat.period) * 1.0,
    unit: FHIRHelpers.ToCalendarUnit(repeat.periodUnit)
  }