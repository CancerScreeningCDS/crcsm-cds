//------------------------------------------------------------------------------
// Excerpt from http://hl7.org/fhir/uv/cqfmeasures/Library/MATGlobalCommonFunctions
// Publisher: HL7 International / Clinical Quality Information
// Date: 2019-09-03
//------------------------------------------------------------------------------
library Hospice version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

codesystem "SNOMEDCT": 'http://snomed.info/sct'

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Hospice Care Ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1584'
valueset "Hospice Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1003'
valueset "Hospice Diagnosis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1165'

code "Discharge to healthcare facility for hospice care (procedure)": '428371000124100' from "SNOMEDCT" display 'Discharge to healthcare facility for hospice care (procedure)'
code "Discharge to home for hospice care (procedure)": '428361000124107' from "SNOMEDCT" display 'Discharge to home for hospice care (procedure)'

parameter "Measurement Period" Interval<DateTime> default Interval[Today() - 1 year,Today()]

context Patient

define "Has Hospice":
	exists (
    [Encounter: "Encounter Inpatient"] DischargeHospice
			where DischargeHospice.status = 'finished'
		    and (
	        DischargeHospice.hospitalization.dischargeDisposition ~ "Discharge to home for hospice care (procedure)"
				    or DischargeHospice.hospitalization.dischargeDisposition ~ "Discharge to healthcare facility for hospice care (procedure)"
	    	)
				and DischargeHospice.period ends during "Measurement Period"
	)
    or exists (
      [ServiceRequest: "Hospice Care Ambulatory"] HospiceOrder
        where HospiceOrder.intent = 'order'
            and HospiceOrder.authoredOn in "Measurement Period"
    )
    or exists (
      [Procedure: "Hospice Care Ambulatory"] HospicePerformed
        where HospicePerformed.status = 'completed'
          and "Normalize Interval"(HospicePerformed.performed) overlaps "Measurement Period")

define function "Normalize Interval"(choice Choice<FHIR.dateTime, FHIR.Period, FHIR.Timing, FHIR.instant, FHIR.string, FHIR.Age, FHIR.Range>):
  case
	  when choice is FHIR.dateTime then
    	Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
		when choice is FHIR.Period then
  		FHIRHelpers.ToInterval(choice as FHIR.Period)
		when choice is FHIR.instant then
			Interval[FHIRHelpers.ToDateTime(choice as FHIR.instant), FHIRHelpers.ToDateTime(choice as FHIR.instant)]
		when choice is FHIR.Age then
		  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age),
			  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age) + 1 year)
		when choice is FHIR.Range then
		  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).low),
			  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).high) + 1 year)
		when choice is FHIR.Timing then
		  Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute a single interval from a Timing type')
    when choice is FHIR.string then
      Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
		else
			null as Interval<DateTime>
	end          