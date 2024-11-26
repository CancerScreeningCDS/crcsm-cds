### Introduction

The Centers for Disease Control and Prevention's (CDC's) Division of
Cancer Prevention and Control partnered with the CMS Alliance to
Modernize Healthcare federally funded research and development center
(Health FFRDC) on a multi-year effort to develop clinical decision
support (CDS) tools. CDC and the Health FFRDC developed these tools to
encourage awareness and adoption of the most up-to-date breast and
colorectal cancer screening guidance and a risk-based approach for
managing abnormal screening results.

The project team intends for the CDS to help clinicians provide
screening and management care for breast and colorectal cancer based on
updated guidelines from several organizations including the United
States Preventive Services Task Force (USPSTF) for average risk
screening guidelines and several others for managing higher than average
risk patients and management of abnormal results.[^1] [^2] The Health
FFRDC is developing the CDS using a reproducible process, utilizing
interoperable health information technology (IT) standards including
Health Level 7 International (HL7<sup>®</sup>) [Fast Healthcare Interoperability
Resources](http://hl7.org/fhir) (FHIR<sup>®</sup>) and the [Clinical Quality
Language](https://cql.hl7.org/01-introduction.html) (CQL).

This document describes the purpose and intended use of the CDS for
breast cancer screening and management (BCSM), options for integration
of the CDS components with electronic health records (EHRs), and testing
and verification for ensuring the CDS software performs as expected.

#### Background

Primary care providers typically are responsible for scheduling
screening tests. Both breast and colorectal cancer screening potentially
could be improved by computerized electronic health record (EHR) prompts
for patients and providers when screening tests need to be scheduled. In
addition, depending on the test and finding, a patient and their care
team may need to track when follow-up testing is needed, from several
months to many years.[^3] Successful screening for breast and colorectal
cancer relies on timely follow-up after an abnormal test
result.[^4] [^5]

To encourage adoption of cancer screening guidance and rapid
dissemination of updated practices based on the latest guidance, DCPC
supports the development and implementation of vendor-neutral clinical
decision support (CDS) tools for integration into health information
technology (IT) systems such as EHRs. These CDS tools can take shape in
a variety of forms (e.g., reminders, visual displays, order set
recommendations, complex risk calculations) in clinician EHRs or patient
portals to inform the appropriate care recommendations that lead to
improved screening outcomes and management of abnormal test results.

CDC in partnership with the Health FFRDC will develop, implement, and
disseminate computable guidelines for breast and colorectal cancer
screening and management. The project is focused on the development of
CDS tools to support clinician adherence to advances in breast and
colorectal cancer screening and management guidelines.

#### Purpose

The primary purpose of this implementation guide is to provide guidance
to healthcare organizations regarding how to implement and operate the
CDS tools for breast cancer screening and management (BCSM) in their EHR
and evaluate their performance. In support of this activity, the
document provides a description of the following areas:

-   BCSM guidelines that informed the development of the CDS service and
    application displays

-   BCSM integration with the clinical workflow to support patient care

-   CDS design approach and dashboard display

-   Semi-structured (i.e., human readable) logic, also referred to as
    Level 2 (L2) logic

-   Structured (i.e., coded) logic, also referred to as Level 3 (L3)
    logic

#### Scope

This document provides guidance for end-users and implementors of CDS
tools for breast cancer screening and management (BCSM) guidelines. It
includes information about the project background, CDS design details,
EHR integration, and use in a clinical setting.

#### Audience

Various audiences may find the information in this implementation guide
helpful, including:

-   **Clinicians, Quality Improvement Leaders and Health
    Administrators** at healthcare organizations and primary care
    practices who wish to implement, test, and execute CDS related to
    BCSM in their health IT systems.

-   **CDS Developers and Informaticists** who may use components of this
    CDS logic as a foundation for other preventive health CDS, or who
    want to use well-developed structured logic and CQL in their own
    work.

-   **Community-based** **Organizations** interested in using BCSM CDS
    tools to promote women's health and the importance of cervical
    cancer screening and follow-up.

-   **Health IT Administrators** interested in understanding how the
    BCSM CDS tools are specified to inform implementation of the CDS in
    their IT system.

#### Document Organization

This document is organized as follows:

-   Section 2 -- Project Overview

-   Section 3 -- Overview of Clinical Decision Support

-   Section 4 -- Clinical Guidelines Evidence Base

-   Section 5 -- Overview of the Level 2 CDS Representation

-   Section 6 -- Overview of the Level 3 CDS Representation

-   Section 7 -- CDS Testing & Validation

-   Section 8 -- CDS Integration with EHR

-   Section 9 -- CDS Output to Clinician Dashboard

-   Section 10 -- Fielding BCSM CDS Application in Clinical Settings

### Project Overview

The Health FFRDC is developing interoperable CDS tools to increase
awareness and adoption of breast cancer screening and management (BCSM)
guidelines. The tools will assist clinicians with identifying
individuals due for screening and manage care concordant with clinical
practice guidelines. The CDS tools are being developed using
international health IT standards to support interoperability and a
modular approach to facilitate adaptation, configurability, and future
updates. The project includes the following activities:

-   **Environmental Scan for Breast and Colorectal Cancer Guidelines**:
    Conduct an environmental scan to determine the full scope and
    application of screening and management clinical practice guidelines
    for both breast and colorectal cancer. The scans for these two
    cancers will be conducted independently so that both cancers are
    fully understood. Look broadly across the guideline organizations
    and the latest evidence-based clinical guidelines to determine an
    appropriate set to translate into computable form. Identify existing
    efforts and best practices for translating those guidelines into
    clinical practice. Elicit input from subject matter experts and
    relevant stakeholders where appropriate.

-   **Logical Representation of Practice Guidelines:** Translate the
    narrative form of the screening and management clinical guidelines
    into semi-structured form that accurately captures the data elements
    and logical pathways described in the unstructured documents.
    Complete the first stage of the knowledge translation process to CDS
    Level 2 representation which is a human readable semi-structured
    expression of the breast and colorectal screening guidelines. The
    desired and appropriate set of practice guidelines designated for
    translation is determined in Task 1.

-   **CDS Tools for Breast and Colorectal Cancer:** Determine the
    design, features, and desired utility of the CDS tools for the two
    cancers. For example, the CDS can provide cognitive support to
    clinicians, promote clinician/patient engagement, and support
    patient-facing features. Apply CDS modular framework, developed for
    prior CDC funded effort for cervical cancer, to create executable
    CDS tools to support screening and management of breast and
    colorectal cancer.

###  Overview of Clinical Decision Support

The primary goal of this project is to develop CDS tools that provide
clinicians and patients with the best evidence-based clinical guidance
to inform their care decisions for cancer screening and any necessary
follow-up care. Clinical guidelines are published by professional
guideline organizations as a journal article in narrative form. Clinical
guidelines for cancer screening and management are increasingly complex
and require a baseline patient risk assessment to determine the
appropriate screening age, modality, and frequency. CDS tools and
interventions that are derived from a computable representation of the
narrative guidelines enable a digital lifecycle to get the most recent
evidence into practice faster, which will ultimately improve health
outcomes.

#### What Is Clinical Decision Support?

CDS is a critical tool in healthcare that aids clinicians, staff,
patients, and other individuals by providing person-specific
information, intelligently filtered or presented at appropriate times,
to enhance health and healthcare. CDS tools enhance decision making in
the clinical workflow and can manifest in a variety of forms:

-   Computerized alerts and reminders

-   Clinical guidelines

-   Condition-specific order sets

-   Focused patient data reports and summaries

-   Documentation templates

-   Diagnostic support

-   Contextually relevant information

CDS tools typically operate as a collection of interoperable system
components, usually within an EHR. These components are represented in
computable formats designed to support the clinical workflow. CDS
components often include triggers, knowledge collection, and actions.

CDS triggers are the events that "trigger" a decision support rule to be
invoked. Such events might include the ordering of a cancer screening or
the prescription of a drug. Once a trigger has been invoked, knowledge
collection of data elements for the patient may occur. In the context of
breast or colorectal cancer, relevant data elements to be collected may
include patient demographic data, patient and family health histories,
prior screening data, and laboratory results. Actions, or interventions,
are the result of a CDS trigger. Examples of actions include presenting
a guideline to the primary care physician (PCP), making a recommendation
based on a calculation from knowledge collection, or presenting an alert
to the PCP such as a missed patient cancer screening.

When discussing CDS components, particularly in detail, clinical
concepts are usually expressed with standard terminologies (SNOMED,
LOINC, ICD10, etc.). The executable logic used by CDS to execute an
action is often represented by the Clinical Quality Language (CQL), a
Health Level 7 (HL7) standard for querying against clinical data
gathered during knowledge collection.


<div style="text-align: center;">
  <img src="image2.png" alt="Alt text" style="width:5.65833in; height:4.0231in; display: block; margin: 0 auto;">
  <p><strong>Figure 1:</strong> Clinical Decision Support Conceptual Workflow</p>
</div>


Figure 1 above illustrates the workflow and interaction with the CDS in
a clinical setting:

-   Patient information flow is shown in green. The patient health
    portal represents patient-facing interactions with their health
    data, and could utilize web access, a mobile app, or messaging
    services.

-   Clinician information flow is shown in blue. The clinician interacts
    with the CDS service, which queries the EHR server for patient data.

-   Screening and treatment providers are shown in brown. These
    represent laboratory services, cancer specialists, surgeons, or
    other specialized care providers.

-   The results of all health actions are recorded in the EHR server.
    These results can further inform the CDS service, other clinicians,
    and the patient health portal.

#### CDS Interaction: How CDS Is Used

The CDS tool itself is just a service. It needs an interface to
communicate with the clinician, patient, or others who interact with the
CDS. The CDS is designed using a modular component approach to improve
interoperability, maintainability, and reusability. CDS components can
be created once, reused in multiple EHRs, or adapted for stand-alone
applications with less redundancy and more consistency. Some level of
configuration is always required to adapt to specific clinical
workflows, vendor-specific requirements, or constraints of the
implementation.

#### CDS Integration: How EHR Invokes CDS

The use of Fast Healthcare Interoperability Resources (FHIR) standards
for the CDS service allows it to be integrated into existing tools, such
as EHR systems using the **CDS Hooks**™ standard, or to be built into
custom applications that communicate with other health IT applications
and services using the **SMART-on-FHIR**<sup>®</sup> API (application programming
interface). By using these two standard approaches, the CDS can be
implemented as an interoperable service for use with certified EHRs that
require support for FHIR-based CDS integration.

#### CDS Modular Design

A modular approach is central to the design and implementation of this
CDS to support the clinical needs mentioned above. A modular approach
offers several benefits in terms of interoperability, adaptability, and
reusability. Building individual components as part of this project
allows for the components to be assembled in multiple ways to address
different use cases (e.g., clinical and quality improvement needs). Each
use case will have its own specific requirements related to the system
or workflow it is intended to work with. As with any interoperable
approach, these modular components will be assembled into an operational
CDS application and configured (with additional integration code) to
work with or within a health IT system.

Taking this type of modular approach is not new, and it is not novel to
the Health FFRDC. There are many organizations that build CDS systems
this way and many examples of these modular approaches. For more on this
modular approach to CDS, see the [FHIR Clinical Guidelines
IG](https://build.fhir.org/ig/HL7/cqf-recommendations/).

# Clinical Guidelines Evidence Base 

Based on the literature search, informant interviews, and review of the
guideline evidence base, the CDS tools will be designed to represent the
USPSTF guidelines for screening average risk individuals. Additional
guidelines will be applied for managing abnormal screening results and
increased or high-risk individuals. The list below is representative of
the primary guidelines that will be used to develop the CDS but may not
represent a comprehensive list of every evidence-based reference. A
complete set of guidelines and references will be documented as we
develop the logical representation for the CDS.

## Breast Cancer CDS Evidence Base

Average Risk Breast Cancer Screening 
-   *2024 U.S. Preventive Services Task Force Recommendation Statement: Screening for Breast Cancer​​* 
-   [*American College of Obstetricians and Gynecologists (ACOG): Practice Bulletin on Breast Cancer Risk Assessment and Screening in Average-Risk Women*](https://www.acog.org/clinical/clinical-guidance/practice-bulletin/articles/2017/07/breast-cancer-risk-assessment-and-screening-in-average-risk-women)
-   [*American Cancer Society (ACS): Guideline on Breast Cancer Screening for Women at Average Risk, Update*](https://jamanetwork.com/journals/jama/fullarticle/2463262)
-   [*NCCN Guidelines: Breast Cancer Screening and Diagnosis, Version 2.2023*](https://www.nccn.org/guidelines/guidelines-detail?category=2&id=1421)
-   [*ACR: ACR Appropriateness Criteria on Breast Cancer Screening*](https://acsearch.acr.org/docs/70910/Narrative/)

Higher than Average Risk Breast Cancer Screening
-   [*U.S. Preventive Services Task Force (USPSTF): Final Recommendation Statement on BRCA-Related Cancer: Risk Assessment, Genetic Counseling, and Genetic Testing*](https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/brca-related-cancer-risk-assessment-genetic-counseling-and-genetic-testing)
-   *[USPSTF Recommendation: Breast Cancer: Medication Use to Reduce Risk](https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/breast-cancer-medications-for-risk-reduction)*
-   [*American Cancer Society Guidelines for Breast Screening with MRI as an Adjunct to Mammography*](https://acsjournals.onlinelibrary.wiley.com/doi/full/10.3322/canjclin.57.2.75)
-   [*ACS Breast Cancer Screening Guidelines*](https://www.cancer.org/cancer/types/breast-cancer/screening-tests-and-early-detection/american-cancer-society-recommendations-for-the-early-detection-of-breast-cancer.html)
-   [*American College of Obstetricians and Gynecologists (ACOG): Practice Bulletin on Hereditary Cancer Syndromes and Risk Assessment*](https://www.acog.org/clinical/clinical-guidance/committee-opinion/articles/2019/12/hereditary-cancer-syndromes-and-risk-assessment)
-   [*NCCN Guidelines: Breast Cancer Screening and Diagnosis, Version 2.2023*](https://www.nccn.org/guidelines/guidelines-detail?category=2&id=1421)
-   [*NCCN Guidelines: Breast Cancer Risk Reduction, Version 2.2024*](https://www.nccn.org/guidelines/nccn-guidelines/guidelines-detail?category=2&id=1420)
-   [*NCCN Guidelines: Genetic/Familial High-Risk Assessment: Breast, Ovarian, and Pancreatic, Version 3.2024*](https://www.nccn.org/guidelines/nccn-guidelines/guidelines-detail?category=2&id=1503)
-   [*NCCN Guidelines: Breast Cancer Screening and Diagnosis, Version 2.2023*](https://www.nccn.org/guidelines/guidelines-detail?category=2&id=1421)

Management of Abnormal Breast Cancer Screening Results
-   [*NCCN Guidelines: Breast Cancer Screening and Diagnosis, Version 2.2023*](https://www.nccn.org/guidelines/guidelines-detail?category=2&id=1421)

## Colorectal Cancer CDS Evidence Base

Average-Risk Colorectal Cancer Screening 
-   [*2021 U.S. Preventive Services Task Force Recommendation Statement: Screening for Colorectal Cancer​*](https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening)​
  
Management of Abnormal Colorectal Cancer Colonoscopy Results
-   [*USMSTF: Recommendations for Follow-up After Colonoscopy and Polypectomy: A Consensus Update by the US Multi-Society Task Force on Colorectal Cancer*](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7389642/)

Symptomatic Patients
-   [*NCCN Guidelines: Colorectal Cancer Screening, Version 1.2024*](https://www.nccn.org/professionals/physician_gls/pdf/colorectal_screening.pdf)

Personal History of Colorectal Cancer
-   [*USMSTF: Colonoscopy Surveillance After Colorectal Cancer Resection: Recommendations of the US Multi-Society Task Force on Colorectal Cancer*](https://journals.lww.com/ajg/fulltext/2016/03000/colonoscopy_surveillance_after_colorectal_cancer.17.aspx)

Inflammatory Bowel Disease
-   [*Colorectal Cancer Surveillance in Inflammatory Bowel Disease: Practice Guidelines and Recent Developments*](https://www.wjgnet.com/1007-9327/full/v25/i30/4148.htm)
-   [*NCCN Guidelines: Colorectal Cancer Screening, Version 1.2024*](https://www.nccn.org/professionals/physician_gls/pdf/colorectal_screening.pdf)

History of CRC Genetic Syndromes -- Lynch Syndrome
-   [*Guidelines on Genetic Evaluation and Management of Lynch Syndrome: A Consensus Statement by the US Multi-Society Task Force on Colorectal Cancer*](https://www.gastrojournal.org/article/S0016-5085(14)00448-X/fulltext)
-   [*NCCN Guidelines: Genetic/Familial High-Risk Assessment: Colorectal, Version 2.2023*](https://www.nccn.org/guidelines/nccn-guidelines/guidelines-detail?category=2&id=1436)

History of CRC Genetic Syndromes -- Polyposis Syndromes
-   [*ACG Clinical Guideline: Genetic Testing and Management of Hereditary Gastrointestinal Cancer Syndromes*](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4695986/)

History of CRC Genetic Syndromes -- Cystic Fibrosis
-   [*Cystic Fibrosis Colorectal Cancer Screening Consensus Recommendations*](https://www.gastrojournal.org/article/S0016-5085(17)36716-1/fulltext?referrer=https%3A%2F%2Fpubmed.ncbi.nlm.nih.gov%2F)

Family History of CRC or Polyps
-   [*Colorectal Cancer Screening: Recommendations for Physicians and Patients from the U.S. Multi-Society Task Force on Colorectal Cancer*](https://pubmed.ncbi.nlm.nih.gov/28555630/)

Personal History of Childhood, Adolescent, and Young Adult Cancer
-   *Long-term Follow-up Guidelines for Survivors of Childhood, Adolescent, and Young Adult Cancers Version 6.0 -- October 2023*

# Overview of the CDS L2 Representation

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

The CDS L2 documentation for breast and colorectal cancer guidelines can
be found at these locations:

-   **CDC Breast Cancer Screening CDS L2** representation can be viewed
    in the CancerScreeningCDS GitHub repository at this location:
    [Introduction \| CDC Breast Cancer Screening CDS
    L2](https://cancerscreeningcds.github.io/CDC-Breast-Cancer-Screening-CDS-L2/)

-   **CDC Colorectal Screening CDS L2** representation can be viewed in
    the CancerScreeningCDS GitHub repository at this location:
    [Introduction \| CDC CRC Screening CDS
    L2](https://cancerscreeningcds.github.io/CDC-Colorectal-Cancer-Screening-CDS-L2/)

# Overview of the L3 CDS Representation

The L3 CDS is expressed in a computer-interpretable format using health
information technology (IT) interoperability standards. For health IT
systems that support the underlying interoperability standards,
implementation burden is eased when compared to their own version from
scratch based upon the L2 CDS. This section describes the health IT
standards used to define the L3 CDS. These standards are used to define
both the *structure* of the BCSM CDS as well as the computer *logic*
needed to provide customized recommendations for each patient. A
high-level conceptual description, with examples, is provided for how
the BCSM CDS is to be used in practice. This section closes with a link
to the open-source computer software that comprises the L3 CDS
definition.

## Interoperability Standards for CDS Definition

Multiple health IT interoperability standards are used to define the L3
CDS. These standards are introduced in this section, alongside rationale
for why they have been selected for use as the technical foundation of
the L3 CDS definition.

### Fast Healthcare Interoperability Resources (FHIR<sup>®</sup>)

Fast Healthcare Interoperability Resources (FHIR<sup>®</sup>) is an international
IT standard for representing and exchanging healthcare information
electronically. FHIR provides general data structures or
"[resources](https://www.hl7.org/fhir/resourcelist.html)" for
representing a variety of clinical and healthcare-related data. Example
resource types include [Condition](http://hl7.org/fhir/condition.html)
and [Observation](http://hl7.org/fhir/observation.html), which can
respectively be used to represent clinical diagnoses and laboratory test
results. FHIR resources are, by design, [general in
nature](https://www.hl7.org/fhir/extensibility.html) so that they can
support the majority of real-world use cases. But FHIR also allows each
resource to be customized for specific applications; these
customizations can themselves be standardized through the use of FHIR
extensions, [profiles](https://www.hl7.org/fhir/profiling.html), and
implementation guides.

This customizability and flexibility are some of the reasons why FHIR
has been growing in popularity despite being a relatively new standard.
The use of FHIR in the United States is expected to continue to grow
because it is the basis for the application programming interface (API)
required by the [21st Century Cures
Act](https://www.healthit.gov/curesrule/) Interoperability Final Rule.
It is for these reasons, flexibility and availability, that FHIR has
been selected for use in the L3 CDS definition. Section 6.2 discusses
the specific FHIR resources used to define the structure of the BCSM
CDS.

### FHIR Clinical Reasoning Module

The [Clinical Reasoning
Module](http://www.hl7.org/fhir/clinicalreasoning-module.html) (CRM) is
a subset of the base FHIR standard. The CRM provides the [FHIR resources
and
operations](http://www.hl7.org/fhir/clinicalreasoning-cds-on-fhir.html)
needed for representing and distributing clinical knowledge tools such
as CDS. The structure of the BCSM CDS described in this document is
based upon the guidance provided by the CRM for designing and building
CDS. Section 6.4 references the CRM while discussing conceptual usage of
the BCSM CDS.

### FHIR Clinical Guidelines Implementation Guide

The [FHIR Clinical Guidelines](https://www.hl7.org/fhir/uv/cpg/)
implementation guide (IG), also known as "Clinical Practice Guidelines
(CPG) on FHIR," provides an approach and methodology for representing
the intent of clinical guidelines as computable CDS. The BCSM CDS was
developed by following the best practices outline in the CPG on FHIR IG.
These best practices include testing and validation of the BCSM CDS
application, which is described in Section 7. In addition, several
extensions and profiles defined in the CPG on FHIR IG have been used in
the L3 CDS representation.

### Clinical Quality Language

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
Logical Model](https://cql.hl7.org/01-introduction.html) (ELM), and it
is this format of the logic that is interpreted when the CDS logic is
executed against patient data. Conversion from CQL to ELM is part of an
initial type of testing described in Section 6.2.1.

## CDS Structure via FHIR

The [FHIR standard](https://www.hl7.org/fhir/resourcelist.html) defines
numerous types of data structures called resources, several of which are
used to define the *structure* of the L3 CDS:

-   [PlanDefinition](https://www.hl7.org/fhir/plandefinition.html) -
    Used to define and describe groups of actions that occur under
    certain circumstances; these groups of actions represent the overall
    structure of the L3 CDS. Each action may reference FHIR resources
    including other PlanDefinition resources.

-   [ActivityDefinition](https://www.hl7.org/fhir/activitydefinition.html) -
    Used to define and describe a single activity, such as a request for
    a laboratory test or for a communication to be sent to a provider.

-   [Questionnaire](https://www.hl7.org/fhir/questionnaire.html) - Used
    to define forms that can be presented to the CDS user to obtain
    additional information when necessary.

-   [Library](https://www.hl7.org/fhir/library.html) - Used to package
    the CDS logic, which is referenced by the other FHIR resources and
    expressed using CQL.

Both the Screening CDS and Management CDS are represented as nested sets
of the above FHIR resources.

## CDS Logic via CQL

While FHIR allows the structure of the BCSM CDS to be described, it can
only enumerate the set of all actions that *could* apply to any patient.
The CQL standard allows CDS logic to be expressed so that it can be
determined which actions apply to a *specific* patient. As described in
Section 5.1.4, CQL allows the BCSM CDS logic to be written as computer
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

## Conceptual CDS Usage

The following section describes at a high level how the BCSM CDS
application is meant to be used in practice. The discussion here is
notional and informed by both the FHIR CRM as well as the CPG on FHIR
IG. Implementation details are not considered; see Sections 7 and 8 for
information about the software needed to implement the CDS for practical
usage.

### FHIR \$apply Operation

As described in previous sections, the structure of the BCSM CDS is
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
  <p><strong>Figure 2:</strong> Illustration of the FHIR \$apply operation.</p>
</div>


## CDS L3 Source Code

The L3 CDS definitions have been released under an [Apache 2.0
open-source license](https://www.apache.org/licenses/LICENSE-2.0) and
are available in this repository. The Apache 2.0 license was chosen for
the L3 CDS because it is generally considered to be permissive and
friendly to commercial reuse of the software being licensed. Releasing
the L3 CDS definitions under an Apache 2.0 license means that it can be
freely incorporated into other software and systems, which can in turn
be redistributed to others without permission from the L3 CDS authors.
Conditions of the Apache 2.0 license include attribution requirements
and lack of liability and/or warranty.

# CDS Testing & Validation

Testing is a critical step in the CDS development process; it is
necessary to test a CDS to ensure that it faithfully implements the
clinical logic as intended by the underlying guidelines. CDS testing
follows an approach similar to what is used for testing computer
software. This should come as no surprise since CDS can be thought of as
a very specialized computer program. The following section outlines the
testing methodology that has been used with the BCSM CDS. The role of
testing in CDS development is first described and then the different
types of testing are discussed. This section closes with a listing of
the computer software tools used as part of the BCSM CDS testing
process.

## Test Driven Development (TDD)

The BCSM CDS has been developed using what is known in the computer
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
the BCSM CDS application.


<div style="text-align: center;">
  <img src="image4.png" alt="Alt text" style="width:6.5in; height:2.663157261592301in; display: block; margin: 0 auto;">
  <p><strong>Figure 3:</strong> Illustration of test-driven approach for developing the BCSM CDS.</p>
</div>


## Types of Testing

This section discusses the different types of testing used while the
BCSM CDS application was developed. The types of tests start with simple
formatting checks, progress to tests on the individual units of CDS
logic, and finally conclude with the most representative type of testing
which involves running the CDS software "end-to-end." Each type of
testing requires different supporting software tools, which are
described in detail in Section 7.3.

### Specification Testing

Specification testing involves checking the CDS definition files to
ensure they conform to the underlying specification(s). In the case of
FHIR resources used to define the structure of the CDS, this entails
checking that each are valid according to the FHIR specification. For
CDS logic encoded using CQL, this means checking them for conformance
with the CQL specification. The tools used for specification testing are
described in Section 7.3.

Specification testing is important because it ensures that the CDS
definitions actually are represented using interoperable standards. If
the BCSM CDS definitions were to fail specification testing, it would
mean they are not truly interoperable. Conversely, just because
specification tests pass doesn't mean that the BCSM CDS definitions are
a valid representation of the underlying clinical guidelines and
evidence. To check that, a different type of testing is needed.

### Unit Testing with Test Cases

CDS, as with most software, is comprised of small portions of computer
code that are frequently referred to as "units." Ideally, each unit is
responsible for a single piece of CDS functionality (*e.g.*, a query for
a specific type of patient electronic health information). As mentioned
in the previous section, each unit of CQL logic must be verified to be
valid according to the CQL specification. Once that has been verified,
the *functionality* of the unit of CDS logic must be tested. This is
accomplished by defining one or more test cases, as described in Section
7.1. The process of applying these test cases to computer code is called
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

### End-to-End Testing

Even once all units of CQL logic have been individually tested, they
still must be tested *together* in a representative context. This is
accomplished by executing the process described in Section 5.4.1
regarding the FHIR \$apply operation. End-to-End Testing entails
generating synthetic electronic health records for a hypothetical
patient, processing that synthetic data using the BCSM CQL code, and
using the CQL logical outputs to customize the BCSM PlanDefinition and
other FHIR resources. The end result of the FHIR \$apply operation is a
set of FHIR resources which describe the BCSM CDS recommended actions
and interventions. Once produced, these outputs can be evaluated for
accuracy.

While the End-to-End Testing process may sound similar to the process
used for Unit Testing, it additionally entails using the BCSM FHIR and
CQL files together in concert. Also, the amount and complexity of the
synthetic data is greater with End-to-End Testing and outputs typically
have to be evaluated manually. These distinctions necessitate different
and more complex software tools to help facilitate End-to-End Testing.
Testing software is discussed in the next section.

## Testing Support Tools

Numerous software tools have been developed or leveraged to help support
testing of the BCSM CDS. This section describes these software tools and
discuss how they are used to support CDS testing. Many of these software
tools could also be used with an initial implementation of the BCSM CDS.
(See Section 8)

### FHIR Validator

The [FHIR Validator](https://www.hl7.org/fhir/validation.html) is a
software program written in the Java programming language and maintained
by HL7. It is capable of checking FHIR resource instances to ensure they
adhere to the FHIR specification. The FHIR Validator can identify errors
such as misspelled element names, missing or extraneous elements, and
value formatting issues. It is run manually and generates a textual
report summarizing all validation errors and warnings. The FHIR
resources developed for the BCSM have been checked for errors using the
FHIR Validator.

### CQL-to-ELM Translator

Recall from Section 6.1.4 that the human readable version of CQL must be
converted or translated to the computer friendly format (i.e., ELM)
before it can be used as a part of CDS software. The [CQL-to-ELM
Translator](https://github.com/cqframework/clinical_quality_language/blob/master/Src/java/cql-to-elm/OVERVIEW.md)
Reference Implementation is an open source software package written in
the Java programming language. It has been used to translate the BCSM
CDS CQL, which as a by-product checks the CQL for conformance to the CQL
specification. As with the FHIR Validator, this tool checks to make sure
what has been written is, from a software standpoint, "grammatically
correct." It does not provide any insight into whether the CQL code, as
written, correctly implements the intended CDS logic.

### CQL Execution Tools

Once CQL code has been translated into a computer friendly format, it
additionally needs software to "execute" or "run" the result in the
context of a patient's electronic health record. Executing CQL in this
way is necessary to support both Unit and End-to-End Testing. Multiple
open-source CQL "execution engines" exist; the BCSM CDS has been unit
tested using the [CQL Execution
Framework](https://github.com/cqframework/cql-execution) Reference
Implementation, a software library written in the JavaScript programming
language. Additional JavaScript libraries are used to help interface
with [FHIR data](https://github.com/cqframework/cql-exec-fhir) and to
handle [clinical codes and value
sets](https://github.com/cqframework/cql-exec-vsac). For End-to-End
Testing, an asynchronous library called [CQL
Workers](https://github.com/asbi-cds-tools/cql-worker) is used for
computational speed reasons.

### CQL Testing Framework

The [CQL Testing
Framework](https://github.com/asbi-cds-tools/cql-worker) is a JavaScript
software library that facilitates Unit Testing of CQL code. While
leveraging the CQL Execution Framework Reference Implementation, it
provides a convenient short-hand notation for defining test cases. The
CQL Testing Framework also automates the process of running the test
cases, which greatly increases the efficiency of TDD of CDS. All Unit
Tests were developed through the use of the CQL Testing Framework. The
complete specifications for all test cases were released under an
open-source license.

### Synthea

While the CQL Testing Framework allows simple test cases to be easily
defined, it is less well suited for defining large numbers of test cases
or complex test cases.
[Synthea](https://synthetichealth.github.io/synthea/) is a mature open
source tool for simulating large amounts of synthetic health record
data. It has the option of outputting data as FHIR resources, which
makes it suitable for use with testing interoperable CDS. For Synthea to
be able to generate suitable BCSM data, a breast cancer "[disease
module](https://synthetichealth.github.io/synthea/#technology-landing)"
must first be defined. A Synthea disease module is a directed graph that
defines what types of health data must be simulated and the dependencies
or constraints placed on that data.

### Encender

[Encender](https://github.com/ccsm-cds-tools/encender) is a software
library written in the JavaScript programming language that implements
the FHIR \$apply operation. It has been developed for the specific
purpose of testing the BCSM CDS but is also general in that it can be
used with other CDS. The name "Encender," which is also the Spanish word
for "to light or turn on," was chosen because the software allows FHIR
resources representing CDS to be applied to a specific patient's
electronic health data. As shown in Figure 2 and discussed in Section
6.4, the output from the FHIR \$apply operation, and thus the Encender
library, includes the CDS recommended actions for a specific patient.
This makes Encender a critical tool for End-to-End Testing; it uses the
CQL Workers library for CQL code execution. Encender has been released
as open source software.

### BCSM Dashboard Prototype

End-to-End Testing should be conducted in a representative testing
environment. For the BCSM CDS, this includes displaying the CDS outputs
in some sort. A prototype BCSM dashboard has been developed for testing
purposes and will be made available as open source software. The BCSM
Prototype Dashboard not only facilitates End-to-End Testing by making it
easier to evaluate the accuracy of CDS outputs, but it also serves as a
potential starting point for any clinical pilot or EHR integration of
the BCSM CDS.

# CDS Integration in EHR

Integration refers to the process of incorporating a CDS for use within
a health IT system; it can occur any time after initial CDS testing has
concluded. This section outlines a process for integrating the BCSM CDS.
It starts with a description of the health IT interoperability standards
needed for integration. These standards provide multiple options for how
the BCSM CDS can be integrated into a health IT system. Those options
are discussed as are the high-level requirements for what a health IT
system needs to provide in order to support integration. A necessary CDS
integration activity called "data mapping" is described next. This CDS
Integration concludes with a listing of strategies for handling
unstructured data which the BCSM CDS may need to have access to.

## Interoperability Standards for CDS Integration

The interoperability standards described in Section 6.1 have been used
to define the BCSM CDS in an open and shareable format. This section
describes additional standards which aim to help support CDS integration
into a health IT system.

### Sustainable Medical Applications, Reusable Technologies (SMART<sup>®</sup>)

The [Sustainable Medical Applications, Reusable
Technologies](https://smarthealthit.org/) (SMART<sup>®</sup>) standard
facilitates the integration of software applications, or "apps," with
health IT systems. "SMART on FHIR apps," or sometimes simply "SMART
apps," are software applications that securely interact with patient
EHRs and other healthcare-related data via a FHIR API. SMART apps are
interoperable in the sense that they can interface with any health IT
system that supports the SMART standard and the data requirements of the
app. Instead of writing a separate software application to provide the
same capability for each different health IT system, a single
application can be written that works with many different health IT
systems.

A key component of SMART has been documented in the [SMART App Launch
IG](http://hl7.org/fhir/smart-app-launch/index.html). It is the sequence
of steps taken so that an app can be authenticated and authorized by a
health IT system before any FHIR resources are accessed. This SMART App
Launch Framework helps to ensure that a particular SMART app is granted
access to only the EHR data that it needs and that its user is
authorized to access. Some of the BCSM CDS integration options
presuppose that SMART will be available in the system to which it is to
be integrated. Without SMART, a custom interface would have to be
designed for each health IT system, which defeats the intent and benefit
of interoperable CDS. Fortunately, SMART has been specifically called
out as a requirement for certified EHRs in the ONC 21<sup>st</sup> Century Cures
Act Final Rule. Many EHR vendors already support SMART.

### CDS Hooks

The [CDS Hooks standard](https://cds-hooks.org/) describes how CDS
services, which are simply software that provide CDS, can be integrated
with health IT systems. While SMART is more general in nature, CDS
[Hooks](https://en.wikipedia.org/wiki/Hooking) focuses on integrating
CDS into the clinician workflow. This is accomplished through the use of
a number of so-called "hooks," which is a software term for a technique
for altering the behavior of a software program. CDS Hooks focuses on
how CDS recommendations can be sent to a health IT system via
informational "cards." In contrast with SMART, a CDS Hooks integration
would typically assume that some other system (*e.g.*, the health IT
system) would be responsible for displaying the information in these
cards to the clinician. This distinction is discussed further in the
next section.

## Integration Options

This section describes three integration options for the BCSM CDS using
SMART and/or CDS Hooks. These options are based upon the different
approaches taken by SMART and CDS Hooks, as depicted below in Figure 4,
for integrating CDS into a health IT system. With the SMART on FHIR
approach, the CDS application is typically responsible for displaying
any content and recommendations to the user. With CDS Hooks, that
content and recommendations are typically sent back to the health IT
system, which is then responsible for displaying it.


<div style="text-align: center;">
  <img src="image5.png" alt="Alt text" style="width:4.425003280839895in;height:4.0in; display: block; margin: 0 auto;">
  <p><strong>Figure 4:</strong> Diagram showing integration approaches taken by SMART and CDS Hooks.</p>
</div>


### Option 1: SMART

The first integration option entails embedding the BCSM CDS into a
standalone SMART on FHIR application. The SMART application can be
launched from the health IT system but must then query the EHR for the
patient data required by the CDS. Once the required data has been pulled
from the EHR, it is used along with the CDS definition as part of the
FHIR \$apply operation (see Section 5.4.1). The outputs from the FHIR
\$apply operation are then used to populate the BCSM dashboard and
present the clinician with recommendations. If the clinician chooses to
act on the recommendations, the SMART application must transmit the
confirmed intervention back to the EHR.

The benefits of this integration option include the fact that the CDS is
entirely self-contained and has control over the presentation of the CDS
outputs. The drawbacks of this integration option include the fact that
the clinician has to "leave" the native health IT system in order to
interact with the CDS. Also, all CDS software must be bundled within a
single application, which may be computationally inefficient. Finally,
if the SMART application containing the CDS is hosted apart from the
health IT system, there may be latencies associated with data transfer
which may impact the user experience.

### Option 2: CDS Hooks

The second integration option involves operating one or more CDS Hooks
services which implement the BCSM CDS. As with the first integration
option, patient data is accessed via a FHIR API. However, the results
from evaluating the FHIR \$apply operation are returned back to the
health IT system which triggered the CDS. These CDS outputs are returned
in the form of one or more cards, which are just a standardized format
defined by CDS Hooks. The health IT system is responsible for presenting
the output cards to the user.

One advantage of a purely CDS Hooks approach is that the CDS outputs can
be integrated more naturally into the health IT system display. This may
help users become more comfortable with using the CDS. Additionally, the
user does not have to "leave" the health IT system to use the CDS, which
has both user experience as well as latency benefits. Finally, the
second integration option provides better flexibility in terms of how
the CDS software is structured. The main disadvantage of the second
integration option is that there little to no control over how the CDS
outputs are displayed to the user. Also, interactive CDS (user provides
inputs after the CDS initially triggers) may be harder to implement with
a purely CDS Hooks approach.

### Option 3: CDS Hooks and SMART

The third integration option involves combining the CDS Hooks and SMART
approaches. The initial CDS trigger and inclusion logic is handled via a
CDS Hooks service, which returns a card to the health IT system
containing a link to a SMART app. This SMART app is responsible for part
of the CDS logic as well as displaying the CDS outputs to the user. The
third integration option has many of the advantages and disadvantages of
the first two options, with the additional disadvantage of being more
complex to implement. The third integration option would be appealing to
implementors that already have a CDS Hooks capability but want to have
more flexibility with how interaction with the user is handled.

## Requirements

This section provides some high-level requirements for integration of
the BCSM CDS into a health IT system. Functional requirements are
discussed first, followed by data requirements.

### Functional Requirements

A health IT system for which the BCSM CDS application will be integrated
must support the following capabilities:

1.  Read access of required patient data via FHIR API (see Section
    7.3.2)

2.  Write access via FHIR API (outputs of \$apply operation)

3.  SMART app launch (if using integration options #1 or #3)

4.  CDS Hooks services (if using integration options #2 or #3)

5.  FHIR \$apply operation

6.  CQL execution capabilities

The last two requirements may be fulfilled with the help of the testing
software listed in Section 6.3. There are other open sources tools which
may help address the other requirements.

### Data Requirements

The BCSM CDS must by definition make certain assumptions about what data
will be available in the patient EHR. These assumptions are represented
by a set of data requirements consisting of the type of data required,
how that data will be represented using FHIR, and what clinical
informatic code(s) will be used. The data requirements are defined by
the FHIR queries performed within the CQL logic of the BCSM CDS.

## Data Mapping

It is expected that most health IT systems will not meet all data
requirements discussed in Section 7.3.2. Data mapping is the process of
transforming some or all of the data in a health IT system such that the
data requirements of the CDS are satisfied. Data mapping can be the most
time-consuming aspect of CDS integration; it is recommended that both
clinical and technical resources be available to support it. Without a
proper data mapping, the CDS may fail to locate all the patient data
necessary for proper operation.

For health IT systems without a FHIR API, the first step in data mapping
would be implementing a FHIR API that is accessible to the CDS. For
health IT systems with an existing FHIR API, there may some types of
FHIR resources which are needed by the CDS but that are not supported by
the API. In this case, the next step would be to add support for the
missing FHIR resource types, either by directly augmenting the FHIR API
or via an additional "interoperability layer." Finally, the health IT
system's FHIR API may support all necessary FHIR resources, but the FHIR
resources may not use the same clinical codes employed by the CDS. In
this case, the codes used in the health IT system must be converted, or
"mapped," to the codes assumed by the CDS.

## Handling Unstructured Data

Despite best efforts through data mapping, there may still be
information needed by the BCSM CDS which will not have the required
structure as FHIR resources. This section describes approaches for
handling so-called unstructured data, which can include information from
anatomic pathology laboratory systems.

### Allow Clinician Input

A key aspect of the BCSM CDS is to, when necessary, allow clinicians to
provide input to augment the information in the patient EHR. Clinician
input is captured using a FHIR [Questionnaire
resource](https://www.hl7.org/fhir/questionnaire.html), which allows a
structured set of questions and available responses to be represented in
a standard format. The FHIR Questionnaire is being developed in
conjunction with the BCSM CDS and initially includes the three questions
listed in Table 10. The advantage of this approach is that it allows
clinician judgement to be leveraged and incorporated into the BCSM CDS
logic when information in the patient EHR is lacking. The disadvantage
of this approach is that it requires additional time and effort from the
clinician.

### A Natural Language Processing (NLP) Application Programming Interface (API)

Natural Language Processing, or NLP, is a technology that among other
things attempts to extract knowledge from unstructured or textual
narrative data. NLP has been applied to a number of areas in the
healthcare domain, including interpretation of anatomic pathology
laboratory reports such as cervical cytology reports. This section
describes an approach for allowing information from existing NLP
algorithms to be incorporated into the BCSM CDS.

CDS Hooks provides a mechanism in which outputs from existing NLP
algorithms can be leveraged by the BCSM CDS. A CDS Hooks service can be
setup which would trigger when new unstructured data is created in the
EHR. The data would be wrapped in a FHIR resource and sent via a CDS
Hooks API to the NLP service. The data would be unpacked and processed
by the NLP algorithm; CDS Hooks and the FHIR CRM provide a process by
which the NLP outputs can be ingested back into the EHR as FHIR
resources. This can be done in such a way that the BCSM CDS can
accurately leverage the knowledge provided by the NLP algorithm.

# CDS Output to Clinician Dashboard

Placeholder for this section.

#  Fielding BCSM CDS Application in Clinical Settings

Placeholder for this section.

[^1]: USPSTF United States Preventive Services Task Force, "Breast
    Cancer: Screening," 11 January 2016. \[Online\]. Available:
    <https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/breast-cancer-screening>.

[^2]: USPSTF United States Preventive Services Task Force, "Colorectal
    Cancer: Screening," 18 May 2021. \[Online\]. Available:
    <https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening>

[^3]: Atlas SJ, Tosteson ANA, Wright A, et al. A Multilevel Primary Care
    Intervention to Improve Follow-Up of Overdue Abnormal Cancer
    Screening Test Results: A Cluster Randomized Clinical Trial. JAMA.
    2023 Oct 10;330(14):1348-1358. doi: 10.1001/jama.2023.18755. PMID:
    37815566.

[^4]: Reece JC, Neal EFG, Nguyen P, McIntosh JG, Emery JD. Delayed or
    failure to follow-up abnormal breast cancer screening mammograms in
    primary care: a systematic review. BMC Cancer. 2021 Apr 7;21(1):373.
    doi: 10.1186/s12885-021-08100-3. PMID: 33827476; PMCID: PMC8028768.

[^5]: Zorzi M, Battagello J, Selby K, Capodaglio G, Baracco S, Rizzato
    S, Chinellato E, Guzzinati S, Rugge M. Non-compliance with
    colonoscopy after a positive faecal immunochemical test doubles the
    risk of dying from colorectal cancer. Gut. 2022 Mar;71(3):561-567.
    doi: 10.1136/gutjnl-2020-322192. Epub 2021 Mar 31. PMID: 33789965;
    PMCID: PMC8862019.
