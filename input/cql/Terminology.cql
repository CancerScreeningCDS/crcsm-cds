library Terminology version '1.0.0'

using FHIR version '4.0.1'

//------------------------------------------------------------------------------
// TERMINOLOGY FOR LOGIC PATH: SCREENING ELIGIBLE
//------------------------------------------------------------------------------

// CODES


// VALUE SETS

valueset "Colorectal Cancer": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/cancer-of-colon-anus-rectum' // #TODO replace with http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.325 when published
valueset "Non Bleeding Colorectal Cancer Signs and Symptoms": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/non-bleeding-colorectal-signs-symptoms' // #TODO replace with http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.336 when published
valueset "Blood in Stool": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/blood-in-stool' // #TODO replace with http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.330 when published


//------------------------------------------------------------------------------
// TERMINOLOGY FOR LOGIC PATH: DECISION TO SCREEN
//------------------------------------------------------------------------------

valueset "Hereditary Syndrome Associated with Colorectal Cancer": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/crc-hereditary-syndrome' // #TODO: move to VSAC
valueset "Ulcerative Colitis": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/ulcerative-colitis' // #TODO: move to VSAC
valueset "Crohn's Disease": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/crohns-disease' // #TODO: move to VSAC
valueset "History of Colorectal Cancer": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/history-crc' // #TODO: move to VSAC
valueset "Family History of Colorectal Cancer": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/family-history-crc' // #TODO: move to VSAC
valueset "Family History of Potentially Precancerous Polyps": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/family-history-polyps' // #TODO: move to VSAC
valueset "Potentially Precancerous Polyp Condition": 'http://cancerscreeningcds.github.io/crcsm-cds/ValueSet/polyps-condition' // #TODO: move to VSAC

//------------------------------------------------------------------------------
// TERMINOLOGY: DATA ELEMENTS
//------------------------------------------------------------------------------
