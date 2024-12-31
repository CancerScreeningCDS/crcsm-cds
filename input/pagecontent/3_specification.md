### Clinical Guidelines Evidence Base 

Based on the literature search, informant interviews, and review of the
guideline evidence base, the CDS tools will be designed to represent the
USPSTF guidelines for screening average risk individuals. Additional
guidelines will be applied for managing abnormal screening results and
increased or high-risk individuals. The list below is representative of
the primary guidelines that will be used to develop the CDS but may not
represent a comprehensive list of every evidence-based reference. A
complete set of guidelines and references will be documented as we
develop the logical representation for the CDS.

#### Colorectal Cancer CDS Evidence Base

Average-Risk Colorectal Cancer Screening 
-   [*2021 U.S. Preventive Services Task Force Recommendation Statement: Screening for Colorectal Cancer​*](https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening){:target="_blank"}
  
Management of Abnormal Colorectal Cancer Colonoscopy Results
-   [*USMSTF: Recommendations for Follow-up After Colonoscopy and Polypectomy: A Consensus Update by the US Multi-Society Task Force on Colorectal Cancer*](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7389642/){:target="_blank"}

Symptomatic Patients
-   [*NCCN Guidelines: Colorectal Cancer Screening, Version 1.2024*](https://www.nccn.org/professionals/physician_gls/pdf/colorectal_screening.pdf){:target="_blank"}

Personal History of Colorectal Cancer
-   [*USMSTF: Colonoscopy Surveillance After Colorectal Cancer Resection: Recommendations of the US Multi-Society Task Force on Colorectal Cancer*](https://journals.lww.com/ajg/fulltext/2016/03000/colonoscopy_surveillance_after_colorectal_cancer.17.aspx){:target="_blank"}

Inflammatory Bowel Disease
-   [*Colorectal Cancer Surveillance in Inflammatory Bowel Disease: Practice Guidelines and Recent Developments*](https://www.wjgnet.com/1007-9327/full/v25/i30/4148.html){:target="_blank"}
-   [*NCCN Guidelines: Colorectal Cancer Screening, Version 1.2024*](https://www.nccn.org/professionals/physician_gls/pdf/colorectal_screening.pdf){:target="_blank"}

History of CRC Genetic Syndromes -- Lynch Syndrome
-   [*Guidelines on Genetic Evaluation and Management of Lynch Syndrome: A Consensus Statement by the US Multi-Society Task Force on Colorectal Cancer*](https://www.gastrojournal.org/article/S0016-5085(14)00448-X/fulltext){:target="_blank"}
-   [*NCCN Guidelines: Genetic/Familial High-Risk Assessment: Colorectal, Version 2.2023*](https://www.nccn.org/guidelines/nccn-guidelines/guidelines-detail?category=2&id=1436){:target="_blank"}

History of CRC Genetic Syndromes -- Polyposis Syndromes
-   [*ACG Clinical Guideline: Genetic Testing and Management of Hereditary Gastrointestinal Cancer Syndromes*](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4695986/){:target="_blank"}

History of CRC Genetic Syndromes -- Cystic Fibrosis
-   [*Cystic Fibrosis Colorectal Cancer Screening Consensus Recommendations*](https://www.gastrojournal.org/article/S0016-5085(17)36716-1/fulltext?referrer=https%3A%2F%2Fpubmed.ncbi.nlm.nih.gov%2F){:target="_blank"}

Family History of CRC or Polyps
-   [*Colorectal Cancer Screening: Recommendations for Physicians and Patients from the U.S. Multi-Society Task Force on Colorectal Cancer*](https://pubmed.ncbi.nlm.nih.gov/28555630/){:target="_blank"}

Personal History of Childhood, Adolescent, and Young Adult Cancer
-   [*Long-term Follow-up Guidelines for Survivors of Childhood, Adolescent, and Young Adult Cancers Version 6.0 -- October 2023*](http://www.survivorshipguidelines.org/){:target="_blank"}

### Overview of the CDS L2 Representation

The CDS Level 2 (L2) includes a semi-structured representation of
evidence-based narrative guidelines for breast and colorectal cancer
screening. Semi-structured representation of guideline content and
recommendations is essential for the development of computable clinical
decision support (CDS) artifacts. It includes:

1.  High-level and mid-level flow diagrams that visually illustrate
    portions of the guidelines.

2.  A brief description of each portion of the CDS logic.

3.  Semi-structured logic statements that list required clinical
    concepts, inclusion criteria, exclusion criteria, events (decision
    points), and actions (output, e.g. recommendations).

The high-level flow diagram identifies several different patient populations based on a patient’s symptoms, past medical history and previous screening results. The flow diagram also points to the corresponding guidelines that outline how that patient should be cared for. The mid-level flow diagram (which is divided across several pages) provides a more detailed view of the logic. It describes how population criteria are defined and decision points that identify relevant guidelines and patient-specific recommendations.

The CDS L2 documentation for colorectal cancer guidelines can be found at this location: [Introduction \| CDC CRC Screening CDS L2](https://cancerscreeningcds.github.io/CDC-Colorectal-Cancer-Screening-CDS-L2/){:target="_blank"}

<div style="text-align: center;">
  <img src="highlevelcrc.png" alt="Alt text" style="width:9in; display: block; margin: 0 auto;">
    <p><strong>Figure 1:</strong> High-Level Flow Diagram.</p>
</div>

### Overview of the L3 CDS Representation

The L3 CDS is expressed in a computer-interpretable format using health
information technology (IT) interoperability standards. For health IT
systems that support the underlying interoperability standards,
implementation burden is eased when compared to their own version from
scratch based upon the L2 CDS. This section describes the health IT
standards used to define the L3 CDS. These standards are used to define
both the *structure* of the CRCSM CDS as well as the computer *logic*
needed to provide customized recommendations for each patient. A
high-level conceptual description, with examples, is provided for how
the CRCSM CDS is to be used in practice. This section closes with a link
to the open-source computer software that comprises the L3 CDS
definition.

#### Interoperability Standards for CDS Definition

Multiple health IT interoperability standards are used to define the L3
CDS. These standards are introduced in this section, alongside rationale
for why they have been selected for use as the technical foundation of
the L3 CDS definition.

##### Fast Healthcare Interoperability Resources (FHIR<sup>®</sup>)

Fast Healthcare Interoperability Resources (FHIR<sup>®</sup>) is an international
IT standard for representing and exchanging healthcare information
electronically. FHIR provides general data structures or
["resources"](https://www.hl7.org/fhir/resourcelist.html){:target="_blank"} for
representing a variety of clinical and healthcare-related data. Example
resource types include [Condition](http://hl7.org/fhir/condition.html){:target="_blank"}
and [Observation](http://hl7.org/fhir/observation.html){:target="_blank"}, which can
respectively be used to represent clinical diagnoses and laboratory test
results. FHIR resources are, by design, [general in
nature](https://www.hl7.org/fhir/extensibility.html){:target="_blank"} so that they can
support the majority of real-world use cases. But FHIR also allows each
resource to be customized for specific applications; these
customizations can themselves be standardized through the use of FHIR
extensions, [profiles](https://www.hl7.org/fhir/profiling.html){:target="_blank"}, and
implementation guides.

This customizability and flexibility are some of the reasons why FHIR
has been growing in popularity despite being a relatively new standard.
The use of FHIR in the United States is expected to continue to grow
because it is the basis for the application programming interface (API)
required by the [21st Century Cures
Act](https://www.healthit.gov/curesrule/){:target="_blank"} Interoperability Final Rule.
It is for these reasons, flexibility and availability, that FHIR has
been selected for use in the L3 CDS definition. [Section 3.3.2](#cds-structure-via-fhir){:target="_blank"} discusses
the specific FHIR resources used to define the structure of the CRCSM
CDS.

##### FHIR Clinical Reasoning Module

The [Clinical Reasoning
Module](http://www.hl7.org/fhir/clinicalreasoning-module.html){:target="_blank"} (CRM) is
a subset of the base FHIR standard. The CRM provides the [FHIR resources
and operations](http://www.hl7.org/fhir/clinicalreasoning-cds-on-fhir.html){:target="_blank"}
needed for representing and distributing clinical knowledge tools such
as CDS. The structure of the CRCSM CDS described in this document is
based upon the guidance provided by the CRM for designing and building
CDS. [Section 3.3.4](#conceptual-cds-usage){:target="_blank"} references the CRM while discussing conceptual usage of
the CRCSM CDS.

##### FHIR Clinical Guidelines Implementation Guide

The [FHIR Clinical Guidelines](https://www.hl7.org/fhir/uv/cpg/){:target="_blank"}
implementation guide (IG), also known as "Clinical Practice Guidelines
(CPG) on FHIR," provides an approach and methodology for representing
the intent of clinical guidelines as computable CDS. The CRCSM CDS was
developed by following the best practices outline in the CPG on FHIR IG.
These best practices include testing and validation of the CRCSM CDS
application, which is described in [Section 3.4](#cds-testing--validation){:target="_blank"}. In addition, several
extensions and profiles defined in the CPG on FHIR IG have been used in
the L3 CDS representation.

##### Clinical Quality Language

The Clinical Quality Language (CQL) is a domain-specific computer
programming language focused on the expression of clinical quality
concepts. It can be used to author CDS logic and is designed to
interface with the other standards described in this section. That
latter fact constitutes one of CQL's advantages over other more
general-purpose programming languages when it comes to authoring CDS
logic. An additional advantage is that CDS logical expressions written
with CQL tend to read more like natural language than as a computer
program, making CQL more accessible to audiences outside the realm of
software development.

Computer code written in CQL is human readable but can be translated or
"compiled" into a more structured format that is interpretable by
computers. This computer-friendly format is called the [Expression
Logical Model](https://cql.hl7.org/01-introduction.html){:target="_blank"} (ELM), and it
is this format of the logic that is interpreted when the CDS logic is
executed against patient data. Conversion from CQL to ELM is part of an
initial type of testing described in [Section 3.4.3.2](#cql-to-elm-translator){:target="_blank"}.

#### CDS Structure via FHIR

The [FHIR standard](https://www.hl7.org/fhir/resourcelist.html){:target="_blank"} defines
numerous types of data structures called resources, several of which are
used to define the *structure* of the L3 CDS:

-   [PlanDefinition](https://www.hl7.org/fhir/plandefinition.html){:target="_blank"} -
    Used to define and describe groups of actions that occur under
    certain circumstances; these groups of actions represent the overall
    structure of the L3 CDS. Each action may reference FHIR resources
    including other PlanDefinition resources.

-   [ActivityDefinition](https://www.hl7.org/fhir/activitydefinition.html){:target="_blank"} -
    Used to define and describe a single activity, such as a request for
    a laboratory test or for a communication to be sent to a provider.

-   [Questionnaire](https://www.hl7.org/fhir/questionnaire.html){:target="_blank"} - Used
    to define forms that can be presented to the CDS user to obtain
    additional information when necessary.

-   [Library](https://www.hl7.org/fhir/library.html){:target="_blank"} - Used to package
    the CDS logic, which is referenced by the other FHIR resources and
    expressed using CQL.

Both the Screening CDS and Management CDS are represented as nested sets
of the above FHIR resources.

#### CDS Logic via CQL

While FHIR allows the structure of the CRCSM CDS to be described, it can
only enumerate the set of all actions that *could* apply to any patient.
The CQL standard allows CDS logic to be expressed so that it can be
determined which actions apply to a *specific* patient. As described in
[Section 3.3.3](#cds-logic-via-cql){:target="_blank"}, CQL allows the CRCSM CDS logic to be written as computer
code that implements the following capabilities:

-   Query patient electronic health record (EHR) for pertinent medical
    history

-   Aggregate and sort pertinent medical history for presentation to the
    clinician on a dashboard

-   Apply inclusion and exclusion logic to determine what actions of the
    CDS should apply to a particular patient

-   Generate structured recommendations for the patient when appropriate

-   Identify errors and communicate them to the clinician via meaningful
    notifications

#### Conceptual CDS Usage

The following section describes at a high level how the CRCSM CDS
application is meant to be used in practice. The discussion here is
notional and informed by both the FHIR CRM as well as the CPG on FHIR
IG. Implementation details are not considered; see [Section 2.4](2_background.html#cds-integration-in-ehr){:target="_blank"} for
information about the software needed to implement the CDS for practical
usage.

##### FHIR \$apply Operation

As described in previous sections, the structure of the CRCSM CDS is
defined by a set of FHIR resources. The structural FHIR resources
primarily include PlanDefinition and ActivityDefinition; these resources
come from the CRM and describe actions or groups of actions that are
general and patient agnostic (that is, they have not been customized for
any particular patient). The CRM provides an operation called "\$apply,"
which transforms these patient-agnostic resources into other FHIR
resources which are customized for a particular patient. This is
accomplished by evaluating CDS logic, expressed using CQL, in the
context of the patient electronical health record. Figure 7 below
illustrates the process behind the \$apply operation; two notional
examples are provided in the following section.


<div style="text-align: center;">
  <img src="image3.png" alt="Alt text" style="width:3.92in;height:3.83in; display: block; margin: 0 auto;">
  <p><strong>Figure 2:</strong> Illustration of the FHIR $apply operation.</p>
</div>


#### CDS L3 Source Code

The L3 CDS definitions have been released under an [Apache 2.0
open-source license](https://www.apache.org/licenses/LICENSE-2.0){:target="_blank"} and
are available in this repository. The Apache 2.0 license was chosen for
the L3 CDS because it is generally considered to be permissive and
friendly to commercial reuse of the software being licensed. Releasing
the L3 CDS definitions under an Apache 2.0 license means that it can be
freely incorporated into other software and systems, which can in turn
be redistributed to others without permission from the L3 CDS authors.
Conditions of the Apache 2.0 license include attribution requirements
and lack of liability and/or warranty.

### CDS Testing & Validation

Testing is a critical step in the CDS development process; it is
necessary to test a CDS to ensure that it faithfully implements the
clinical logic as intended by the underlying guidelines. CDS testing
follows an approach similar to what is used for testing computer
software. This should come as no surprise since CDS can be thought of as
a very specialized computer program. The following section outlines the
testing methodology that has been used with the CRCSM CDS. The role of
testing in CDS development is first described and then the different
types of testing are discussed. This section closes with a listing of
the computer software tools used as part of the CRCSM CDS testing
process.

#### Test Driven Development (TDD)

The CRCSM CDS has been developed using what is known in the computer
software domain as test driven development (TDD). With TDD, test
cases are first created before any CDS software ("code") is written.
Each test case consists of a set of synthetic patient health data
represented as FHIR resources as well as a specification for what the
CDS outputs are expected to be. Once a test case is created, just enough
CDS code is written so that the test passes (meaning the CDS outputs
agree with the expected values). If a test case fails, the CDS code must
be updated until the test case passes. This process of defining a test
case and then writing a portion or "unit" of the CDS software continues
until the code is deemed to be complete. The rationale for TDD is that
it is expected that the resulting computer code will have fewer defects
("bugs") than would normally exist in comparable software. Figure 3
shows a diagram depicting the test-driven approach used for developing
the CRCSM CDS application.


<div style="text-align: center;">
  <img src="image4.png" alt="Alt text" style="width:6.5in; height:2.663157261592301in; display: block; margin: 0 auto;">
  <p><strong>Figure 3:</strong> Illustration of test-driven approach for developing the CRCSM CDS.</p>
</div>


#### Types of Testing

This section discusses the different types of testing used while the
CRCSM CDS application was developed. The types of tests start with simple
formatting checks, progress to tests on the individual units of CDS
logic, and finally conclude with the most representative type of testing
which involves running the CDS software "end-to-end." Each type of
testing requires different supporting software tools, which are
described in detail in [Section 3.4.3](#testing-support-tools){:target="_blank"}.

##### Specification Testing

Specification testing involves checking the CDS definition files to
ensure they conform to the underlying specification(s). In the case of
FHIR resources used to define the structure of the CDS, this entails
checking that each are valid according to the FHIR specification. For
CDS logic encoded using CQL, this means checking them for conformance
with the CQL specification. The tools used for specification testing are
described in [Section 3.4.3](#testing-support-tools){:target="_blank"}.

Specification testing is important because it ensures that the CDS
definitions actually are represented using interoperable standards. If
the CRCSM CDS definitions were to fail specification testing, it would
mean they are not truly interoperable. Conversely, just because
specification tests pass doesn't mean that the CRCSM CDS definitions are
a valid representation of the underlying clinical guidelines and
evidence. To check that, a different type of testing is needed.

##### Unit Testing with Test Cases

CDS, as with most software, is comprised of small portions of computer
code that are frequently referred to as "units." Ideally, each unit is
responsible for a single piece of CDS functionality (*e.g.*, a query for
a specific type of patient electronic health information). As mentioned
in the previous section, each unit of CQL logic must be verified to be
valid according to the CQL specification. Once that has been verified,
the *functionality* of the unit of CDS logic must be tested. This is
accomplished by defining one or more test cases, as described in [Section 3.4.1](#test-driven-development-tdd){:target="_blank"}. 
The process of applying these test cases to computer code is called
"unit testing."

Each test case consists of synthetic electronic health records for a
hypothetical patient as well as the corresponding expected CDS outputs.
The synthetic electronic health records are specified with a set of FHIR
resources while the expected CDS outputs are specified using knowledge
of the underlying guidelines and on the L2 CDS. Unit testing involves
running or "executing" the CQL code against the synthetic FHIR data and
then comparing the output against the expected results. A unit of CQL
code is not complete until all test cases referencing it pass
successfully.

##### End-to-End Testing

Even once all units of CQL logic have been individually tested, they
still must be tested *together* in a representative context. This is
accomplished by executing the process described in [Section 3.3.4.1](#fhir-apply-operation){:target="_blank"}
regarding the FHIR \$apply operation. End-to-End Testing entails
generating synthetic electronic health records for a hypothetical
patient, processing that synthetic data using the CRCSM CQL code, and
using the CQL logical outputs to customize the CRCSM PlanDefinition and
other FHIR resources. The end result of the FHIR \$apply operation is a
set of FHIR resources which describe the CRCSM CDS recommended actions
and interventions. Once produced, these outputs can be evaluated for
accuracy.

While the End-to-End Testing process may sound similar to the process
used for Unit Testing, it additionally entails using the CRCSM FHIR and
CQL files together in concert. Also, the amount and complexity of the
synthetic data is greater with End-to-End Testing and outputs typically
have to be evaluated manually. These distinctions necessitate different
and more complex software tools to help facilitate End-to-End Testing.
Testing software is discussed in the next section.

#### Testing Support Tools

Numerous software tools have been developed or leveraged to help support
testing of the CRCSM CDS. This section describes these software tools and
discuss how they are used to support CDS testing. Many of these software
tools could also be used with an initial implementation of the CRCSM CDS.
(See [Section 2.4](2_background.html#cds-integration-in-ehr){:target="_blank"})

##### FHIR Validator

The [FHIR Validator](https://www.hl7.org/fhir/validation.html){:target="_blank"} is a
software program written in the Java programming language and maintained
by HL7. It is capable of checking FHIR resource instances to ensure they
adhere to the FHIR specification. The FHIR Validator can identify errors
such as misspelled element names, missing or extraneous elements, and
value formatting issues. It is run manually and generates a textual
report summarizing all validation errors and warnings. The FHIR
resources developed for the CRCSM have been checked for errors using the
FHIR Validator.

##### CQL-to-ELM Translator

Recall from [Section 3.3.1.4](#clinical-quality-language){:target="_blank"} that the human readable version of CQL must be
converted or translated to the computer friendly format (i.e., ELM)
before it can be used as a part of CDS software. The [CQL-to-ELM
Translator](https://github.com/cqframework/clinical_quality_language/blob/master/Src/java/cql-to-elm/OVERVIEW.md){:target="_blank"}
Reference Implementation is an open source software package written in
the Java programming language. It has been used to translate the CRCSM
CDS CQL, which as a by-product checks the CQL for conformance to the CQL
specification. As with the FHIR Validator, this tool checks to make sure
what has been written is, from a software standpoint, "grammatically
correct." It does not provide any insight into whether the CQL code, as
written, correctly implements the intended CDS logic.

##### CQL Execution Tools

Once CQL code has been translated into a computer friendly format, it
additionally needs software to "execute" or "run" the result in the
context of a patient's electronic health record. Executing CQL in this
way is necessary to support both Unit and End-to-End Testing. Multiple
open-source CQL "execution engines" exist; the CRCSM CDS has been unit
tested using the [CQL Execution
Framework](https://github.com/cqframework/cql-execution){:target="_blank"} Reference
Implementation, a software library written in the JavaScript programming
language. Additional JavaScript libraries are used to help interface
with [FHIR data](https://github.com/cqframework/cql-exec-fhir){:target="_blank"} and to
handle [clinical codes and value
sets](https://github.com/cqframework/cql-exec-vsac){:target="_blank"}. For End-to-End
Testing, an asynchronous library called [CQL
Workers](https://github.com/asbi-cds-tools/cql-worker){:target="_blank"} is used for
computational speed reasons.

##### CQL Testing Framework

The [CQL Testing
Framework](https://github.com/asbi-cds-tools/cql-worker){:target="_blank"} is a JavaScript
software library that facilitates Unit Testing of CQL code. While
leveraging the CQL Execution Framework Reference Implementation, it
provides a convenient short-hand notation for defining test cases. The
CQL Testing Framework also automates the process of running the test
cases, which greatly increases the efficiency of TDD of CDS. All Unit
Tests were developed through the use of the CQL Testing Framework. The
complete specifications for all test cases were released under an
open-source license.

##### Synthea

While the CQL Testing Framework allows simple test cases to be easily
defined, it is less well suited for defining large numbers of test cases
or complex test cases.
[Synthea](https://synthetichealth.github.io/synthea/){:target="_blank"} is a mature open
source tool for simulating large amounts of synthetic health record
data. It has the option of outputting data as FHIR resources, which
makes it suitable for use with testing interoperable CDS. For Synthea to
be able to generate suitable CRCSM data, a colorectal cancer ["disease
module"](https://synthetichealth.github.io/synthea/#technology-landing){:target="_blank"}
must first be defined. A Synthea disease module is a directed graph that
defines what types of health data must be simulated and the dependencies
or constraints placed on that data.

##### Encender

["Encender"](https://github.com/ccsm-cds-tools/encender){:target="_blank"} is a software
library written in the JavaScript programming language that implements
the FHIR \$apply operation. It has been developed for the specific
purpose of testing the CRCSM CDS but is also general in that it can be
used with other CDS. The name "Encender," which is also the Spanish word
for "to light or turn on," was chosen because the software allows FHIR
resources representing CDS to be applied to a specific patient's
electronic health data. As shown in Figure 2 and discussed in [Section 3.3.4](#conceptual-cds-usage){:target="_blank"}, 
the output from the FHIR \$apply operation, and thus the Encender
library, includes the CDS recommended actions for a specific patient.
This makes Encender a critical tool for End-to-End Testing; it uses the
CQL Workers library for CQL code execution. Encender has been released
as open source software.

##### CRCSM Dashboard Prototype

End-to-End Testing should be conducted in a representative testing
environment. For the CRCSM CDS, this includes displaying the CDS outputs
in some sort. A prototype CRCSM dashboard has been developed for testing
purposes and will be made available as open source software. The CRCSM
Prototype Dashboard not only facilitates End-to-End Testing by making it
easier to evaluate the accuracy of CDS outputs, but it also serves as a
potential starting point for any clinical pilot or EHR integration of
the CRCSM CDS.