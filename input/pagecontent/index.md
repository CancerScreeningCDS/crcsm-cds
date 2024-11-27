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
Health Level 7 International (HL7<sup>®</sup>) <a href="http://hl7.org/fhir" target="_blank">Fast Healthcare Interoperability
Resources</a> (FHIR<sup>®</sup>) and the <a href="https://cql.hl7.org/01-introduction.html" target="_blank">Clinical Quality
Language</a> (CQL).

This document describes the purpose and intended use of the CDS for
colorectal cancer screening and management (CRCSM), options for integration
of the CDS components with electronic health records (EHRs), and testing
and verification for ensuring the CDS software performs as expected.

### Purpose

The primary purpose of this implementation guide is to provide guidance
to healthcare organizations regarding how to implement and operate the
CDS tools for colorectal cancer screening and management (CRCSM) in their EHR
and evaluate their performance. In support of this activity, the
document provides a description of the following areas:

-   CRCSM guidelines that informed the development of the CDS service and
    application displays
-   CRCSM integration with the clinical workflow to support patient care
-   CDS design approach and dashboard display
-   Semi-structured (i.e., human readable) logic, also referred to as
    Level 2 (L2) logic
-   Structured (i.e., coded) logic, also referred to as Level 3 (L3)
    logic

### Scope

This document provides guidance for end-users and implementors of CDS
tools for colorectal cancer screening and management (CRCSM) guidelines. It
includes information about the project background, CDS design details,
EHR integration, and use in a clinical setting.

### Audience

Various audiences may find the information in this implementation guide
helpful, including:

-   **Clinicians, Quality Improvement Leaders and Health
    Administrators** at healthcare organizations and primary care
    practices who wish to implement, test, and execute CDS related to
    CRCSM in their health IT systems.
-   **CDS Developers and Informaticists** who may use components of this
    CDS logic as a foundation for other preventive health CDS, or who
    want to use well-developed structured logic and CQL in their own
    work.
-   **Community-based** **Organizations** interested in using CRCSM CDS
    tools to promote health and the importance of colorectal
    cancer screening and follow-up.
-   **Health IT Administrators** interested in understanding how the
    CRCSM CDS tools are specified to inform implementation of the CDS in
    their IT system.

### Document Organization

This document is organized as follows:

-   Section 2 -- [Background](2_background.html)
-   Section 3 -- [Specification](3_specification.html)
-   Section 4 -- [Examples](4_examples.html)
-   Section 5 -- [Downloads](5_downloads.html)
-   Section 6 -- [Artifacts](artifacts.html)

[^1]: USPSTF United States Preventive Services Task Force, "Breast
    Cancer: Screening," 11 January 2016. \[Online\]. Available:
    <a href="https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/breast-cancer-screening" target="_blank">https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/breast-cancer-screening</a>.

[^2]: USPSTF United States Preventive Services Task Force, "Colorectal
    Cancer: Screening," 18 May 2021. \[Online\]. Available:
    <a href="https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening" target="_blank">https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening</a>

