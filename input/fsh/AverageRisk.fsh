////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-AverageRisk
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Average Risk"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-AverageRisk"
* description = "Average risk logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/AverageRisk|1.0.0"

* insert StartScreeningAt45YearsOld
* insert StartScreening
* insert ContinueRoutineScreening

RuleSet: StartScreeningAt45YearsOld
* action[+].id = "StartScreeningAt45YearsOld"
* action[=].title = "Start screening at 45 years old"
* action[=].description = """
Start screening at 45 years old.
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
// TODO: Fill in StartScreeningAt45YearsOld action

RuleSet: StartScreening
* action[+].id = "StartScreening"
* action[=].title = "Start screening"
* action[=].description = """
Start screening now.
Patients at average risk for colorectal cancer screening should start screening at 45 years old.

Average risk recommended screening strategies and intervals:
* Colonoscopy every 10 years
* High-sensitivity gFOBT or FIT every year
* sDNA-FIT every 1 to 3 years
* CT colonography every 5 years
* Flexible sigmoidoscopy every 5 years
* Flexible sigmoidoscopy every 10 years + FIT every year

Source: USPSTF, 2021
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
// TODO: Fill in StartScreening action

RuleSet: ContinueRoutineScreening
* action[+].id = "ContinueRoutineScreening"
* action[=].title = "Continue routine screening"
* action[=].description = """
Continue routine screening.

Average risk recommended screening strategies and intervals:
* Colonoscopy every 10 years
* High-sensitivity gFOBT or FIT every year
* sDNA-FIT every 1 to 3 years
* CT colonography every 5 years
* Flexible sigmoidoscopy every 5 years
* Flexible sigmoidoscopy every 10 years + FIT every year

Source: USPSTF, 2021
"""
* action[=] insert USPSTFScreeningCitationActionDocumentation
// TODO: Fill in ContinueRoutineScreening action

////////////////////////////////////////////////////////////////////////////////////////////////////