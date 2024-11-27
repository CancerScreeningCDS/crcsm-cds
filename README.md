# Colorectal Cancer Screening and Management (CRCSM) Clinical Decision Support (CDS) Implementation Guide

## Local development

### Pre-requisites

#### Node

To check that Node is installed, use the command:

    $ node -v

To install Node, follow the instructions at https://nodejs.org/en/download/package-manager

#### Java

#### Ruby

### Installing dependencies

    $ npm install

If using the development dependencies from the repository branches, you will also need to delete the `node_modules\encender\node_modules` folder to prevent encender from using the packed version of cql-worker.    

If using VSAC terminology, set the UMLS_API_KEY environment variable to your UMLS profile API key to access the VSAC API in the testing framework.

    $ export UMLS_API_KEY=<value>

### Test

    $ npm run cql-to-elm
    $ npm run test-cql

To run tests against $apply operation:

    $ npm run sushi
    $ npm run test-apply

These are intended for local testing and can only be run after the CQL tests have successfully executed as they use the Bundle outputs from CQL tests as inputs to the $apply operation.    

### Build

Uses templates and scripts from https://github.com/cqframework/sample-content-ig. Automatically creates Library resources and adds both CQL and ELM to content as Base64. 

    $ ./_refresh.sh
    $ ./_genonce.sh

## Licenses

(C) 2021 The MITRE Corporation. All Rights Reserved. Approved for Public Release: 24-2711. Distribution Unlimited.

Unless otherwise noted, the CRCSM CDS is available under an [Apache 2.0 license](./LICENSE.txt). It was produced by the MITRE Corporation for the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention in accordance with the Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.    