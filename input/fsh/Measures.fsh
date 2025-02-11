Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population

Instance: ScreeningDueMeasure
InstanceOf: Measure
Title: "Screening Due Measure"
Usage: #definition

* insert CommonMetadata
* url = "http://cancerscreeningcds.github.io/crcsm-cds/Measure/ScreeningDueMeasure"
* version = "1.0.0"
* name = "ScreeningDueMeasure"
* status = #active
* description = """
Identifies patient who may be due for screening based on prior assessment and documentation of next due date and flags patient who may be overdue for potential enhanced outreach efforts.

Intended for use with either individual patient alerts, within the context of a clinical encounter or outside an encounter, or for generating asynchronous reports on a cohort/panel of patients in order to target outreach or escalation.
"""
* library[+] = "http://cancerscreeningcds.github.io/crcsm-cds/Library/ScreeningDue"
* group.population[0].code = $measure-population#initial-population "Initial Population"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].code = $measure-population#numerator "Numerator"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Numerator"
* group.population[+].code = $measure-population#denominator "Denominator"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Denominator"
* group.population[+].code = $measure-population#denominator-exclusion "Denominator Exclusion"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Denominator Exclusion"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: ScreeningIncompleteMeasure
InstanceOf: Measure
Title: "Screening Incomplete Measure"
Usage: #definition

* insert CommonMetadata
* url = "http://cancerscreeningcds.github.io/crcsm-cds/Measure/ScreeningIncompleteMeasure"
* version = "1.0.0"
* name = "ScreeningIncompleteMeasure"
* status = #active
* description = """
Identifies patients who have been ordered for screening or for follow-up study for abnormal screening but for whom a study report has not been received or documented as received.

Intended for use with either individual patient alerts, within the context of a clinical encounter or outside an encounter, or for generating asynchronous reports on a cohort/panel of patients in order to target outreach or escalation.
"""
* library[+] = "http://cancerscreeningcds.github.io/crcsm-cds/Library/ScreeningDue"
* group.population[0].code = $measure-population#initial-population "Initial Population"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].code = $measure-population#numerator "Numerator"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Numerator"
* group.population[+].code = $measure-population#denominator "Denominator"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Denominator"
* group.population[+].code = $measure-population#denominator-exclusion "Denominator Exclusion"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Denominator Exclusion"