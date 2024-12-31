### Background

Primary care providers typically are responsible for scheduling
screening tests. Both breast and colorectal cancer screening potentially
could be improved by computerized electronic health record (EHR) prompts
for patients and providers when screening tests need to be scheduled. In
addition, depending on the test and finding, a patient and their care
team may need to track when follow-up testing is needed, from several
months to many years.[^1] Successful screening for breast and colorectal
cancer relies on timely follow-up after an abnormal test
result.[^2] [^3]

To encourage adoption of cancer screening guidance and rapid
dissemination of updated practices based on the latest guidance, CDC's Division of Cancer Prevention and Control (DCPC)
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

### Project Overview

The Health FFRDC is developing interoperable CDS tools to increase
awareness and adoption of colorectal cancer screening and management (CRCSM)
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
IG](https://build.fhir.org/ig/HL7/cqf-recommendations/){:target="_blank"}.

### CDS Integration in EHR

Integration refers to the process of incorporating a CDS for use within
a health IT system; it can occur any time after initial CDS testing has
concluded. This section outlines a process for integrating the CRCSM CDS.
It starts with a description of the health IT interoperability standards
needed for integration. These standards provide multiple options for how
the CRCSM CDS can be integrated into a health IT system. Those options
are discussed as are the high-level requirements for what a health IT
system needs to provide in order to support integration. A necessary CDS
integration activity called "data mapping" is described next. This CDS
Integration concludes with a listing of strategies for handling
unstructured data which the CRCSM CDS may need to have access to.

#### Interoperability Standards for CDS Integration

The interoperability standards described in [Section 3.3.1](3_specification.html#interoperability-standards-for-cds-definition){:target="_blank"} have been used
to define the CRCSM CDS in an open and shareable format. This section
describes additional standards which aim to help support CDS integration
into a health IT system.

##### Sustainable Medical Applications, Reusable Technologies (SMART<sup>®</sup>)

The [Sustainable Medical Applications, Reusable
Technologies](https://smarthealthit.org/){:target="_blank"} (SMART<sup>®</sup>) standard
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
IG](http://hl7.org/fhir/smart-app-launch/index.html){:target="_blank"}. It is the sequence
of steps taken so that an app can be authenticated and authorized by a
health IT system before any FHIR resources are accessed. This SMART App
Launch Framework helps to ensure that a particular SMART app is granted
access to only the EHR data that it needs and that its user is
authorized to access. Some of the CRCSM CDS integration options
presuppose that SMART will be available in the system to which it is to
be integrated. Without SMART, a custom interface would have to be
designed for each health IT system, which defeats the intent and benefit
of interoperable CDS. Fortunately, SMART has been specifically called
out as a requirement for certified EHRs in the ONC 21<sup>st</sup> Century Cures
Act Final Rule. Many EHR vendors already support SMART.

##### CDS Hooks

The [CDS Hooks standard](https://cds-hooks.org/){:target="_blank"} describes how CDS
services, which are simply software that provide CDS, can be integrated
with health IT systems. While SMART is more general in nature, CDS
[Hooks](https://en.wikipedia.org/wiki/Hooking){:target="_blank"} focuses on integrating
CDS into the clinician workflow. This is accomplished through the use of
a number of so-called "hooks," which is a software term for a technique
for altering the behavior of a software program. CDS Hooks focuses on
how CDS recommendations can be sent to a health IT system via
informational "cards." In contrast with SMART, a CDS Hooks integration
would typically assume that some other system (*e.g.*, the health IT
system) would be responsible for displaying the information in these
cards to the clinician. This distinction is discussed further in the
next section.

#### Integration Options

This section describes three integration options for the CRCSM CDS using
SMART and/or CDS Hooks. These options are based upon the different
approaches taken by SMART and CDS Hooks, as depicted below in Figure 2,
for integrating CDS into a health IT system. With the SMART on FHIR
approach, the CDS application is typically responsible for displaying
any content and recommendations to the user. With CDS Hooks, that
content and recommendations are typically sent back to the health IT
system, which is then responsible for displaying it.


<div style="text-align: center;">
  <img src="image5.png" alt="Alt text" style="width:4.425003280839895in;height:4.0in; display: block; margin: 0 auto;">
  <p><strong>Figure 2:</strong> Diagram showing integration approaches taken by SMART and CDS Hooks.</p>
</div>


##### Option 1: SMART

The first integration option entails embedding the CRCSM CDS into a
standalone SMART on FHIR application. The SMART application can be
launched from the health IT system but must then query the EHR for the
patient data required by the CDS. Once the required data has been pulled
from the EHR, it is used along with the CDS definition as part of the
FHIR \$apply operation. The outputs from the FHIR
\$apply operation are then used to populate the CRCSM dashboard and
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

##### Option 2: CDS Hooks

The second integration option involves operating one or more CDS Hooks
services which implement the CRCSM CDS. As with the first integration
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

##### Option 3: CDS Hooks and SMART

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

#### Requirements

This section provides some high-level requirements for integration of
the CRCSM CDS into a health IT system. Functional requirements are
discussed first, followed by data requirements.

##### Functional Requirements

A health IT system for which the CRCSM CDS application will be integrated
must support the following capabilities:

1.  Read access of required patient data via FHIR API (see [Section 3.4.3.2](3_specification.html#cql-to-elm-translator){:target="_blank"})

2.  Write access via FHIR API (outputs of \$apply operation)

3.  SMART app launch (if using integration options #1 or #3)

4.  CDS Hooks services (if using integration options #2 or #3)

5.  FHIR \$apply operation

6.  CQL execution capabilities

The last two requirements may be fulfilled with the help of the testing
software listed in [Section 3.4.3](3_specification.html#testing-support-tools){:target="_blank"}. There are other open sources tools which
may help address the other requirements.

##### Data Requirements

The CRCSM CDS must by definition make certain assumptions about what data
will be available in the patient EHR. These assumptions are represented
by a set of data requirements consisting of the type of data required,
how that data will be represented using FHIR, and what clinical
informatic code(s) will be used. The data requirements are defined by
the FHIR queries performed within the CQL logic of the CRCSM CDS.

#### Data Mapping

It is expected that most health IT systems will not meet all data
requirements discussed in [Section 3.4.3.2](3_specification.html#cql-to-elm-translator){:target="_blank"}. Data mapping is the process of
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

#### Handling Unstructured Data

Despite best efforts through data mapping, there may still be
information needed by the CRCSM CDS which will not have the required
structure as FHIR resources. This section describes approaches for
handling so-called unstructured data, which can include information from
anatomic pathology laboratory systems.

##### Allow Clinician Input

A key aspect of the CRCSM CDS is to, when necessary, allow clinicians to
provide input to augment the information in the patient EHR. Clinician
input is captured using a FHIR [Questionnaire
resource](https://www.hl7.org/fhir/questionnaire.html){:target="_blank"}, which allows a
structured set of questions and available responses to be represented in
a standard format. The FHIR Questionnaire is being developed in
conjunction with the CRCSM CDS. The advantage of this approach is that it allows
clinician judgement to be leveraged and incorporated into the CRCSM CDS
logic when information in the patient EHR is lacking. The disadvantage
of this approach is that it requires additional time and effort from the
clinician.

##### A Natural Language Processing (NLP) Application Programming Interface (API)

Natural Language Processing, or NLP, is a technology that among other
things attempts to extract knowledge from unstructured or textual
narrative data. NLP has been applied to a number of areas in the
healthcare domain, including interpretation of anatomic pathology
laboratory reports such as cervical cytology reports. This section
describes an approach for allowing information from existing NLP
algorithms to be incorporated into the CRCSM CDS.

CDS Hooks provides a mechanism in which outputs from existing NLP
algorithms can be leveraged by the CRCSM CDS. A CDS Hooks service can be
setup which would trigger when new unstructured data is created in the
EHR. The data would be wrapped in a FHIR resource and sent via a CDS
Hooks API to the NLP service. The data would be unpacked and processed
by the NLP algorithm; CDS Hooks and the FHIR Clinical Reasoning Module provide a process by
which the NLP outputs can be ingested back into the EHR as FHIR
resources. This can be done in such a way that the CRCSM CDS can
accurately leverage the knowledge provided by the NLP algorithm.

[^1]: Atlas SJ, Tosteson ANA, Wright A, et al. A Multilevel Primary Care
    Intervention to Improve Follow-Up of Overdue Abnormal Cancer
    Screening Test Results: A Cluster Randomized Clinical Trial. JAMA.
    2023 Oct 10;330(14):1348-1358. doi: 10.1001/jama.2023.18755. PMID:
    37815566.

[^2]: Reece JC, Neal EFG, Nguyen P, McIntosh JG, Emery JD. Delayed or
    failure to follow-up abnormal breast cancer screening mammograms in
    primary care: a systematic review. BMC Cancer. 2021 Apr 7;21(1):373.
    doi: 10.1186/s12885-021-08100-3. PMID: 33827476; PMCID: PMC8028768.

[^3]: Zorzi M, Battagello J, Selby K, Capodaglio G, Baracco S, Rizzato
    S, Chinellato E, Guzzinati S, Rugge M. Non-compliance with
    colonoscopy after a positive faecal immunochemical test doubles the
    risk of dying from colorectal cancer. Gut. 2022 Mar;71(3):561-567.
    doi: 10.1136/gutjnl-2020-322192. Epub 2021 Mar 31. PMID: 33789965;
    PMCID: PMC8862019.
