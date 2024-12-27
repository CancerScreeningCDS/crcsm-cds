import { existsSync, readdirSync, readFileSync, writeFileSync } from "fs";
import * as path from "path";
import { applyPlan, simpleResolver } from "encender";

export default class ApplyProcessor {
  constructor(elmResourcePath, fhirResourcePath) {
    this.elmJsonDependencies = this.reformatElmJson(
      this.readJsonFolderArray(elmResourcePath)
    );
    this.planJsonArray = this.readJsonFolderArray(fhirResourcePath);
  }

  readJsonFolderArray(inputPath) {
    const jsonArray = [];

    // Read all files in the input folder
    const files = readdirSync(inputPath);

    files.forEach((file) => {
      const filePath = path.join(inputPath, file);

      // Check if the file is a JSON file
      if (path.extname(file) === ".json" && file !== 'cql-options.json') {
        const fileContent = readFileSync(filePath, "utf-8");
        try {
          const jsonData = JSON.parse(fileContent);
          jsonArray.push(jsonData);
        } catch (error) {
          console.error(`Error parsing JSON from file ${file}:`, error);
        }
      }
    });

    return jsonArray;
  }

  reformatElmJson(elmJsonDependencyArray) {
    // Reformat ELM JSON value set references to match what is expected by the
    // code service built into the cql execution engine
    return elmJsonDependencyArray.reduce((acc, elm) => {
      let refs = elm?.library?.valueSets?.def;
      if (refs) {
        refs = refs.map((r) => ({
          ...r,
          id: r.id.split("/").pop(),
        }));
        elm.library.valueSets.def = refs;
      }
      return {
        ...acc,
        [elm.library.identifier.id]: elm,
      };
    }, {});
  }

  readAndReformatValueSets(filePath) {
    if (!existsSync(filePath)) {
      return {};
    }

    // Read in cached value set JSON
    let valueSetJson = JSON.parse(readFileSync(filePath));

    // Reformat value sets to match format expected by code service built into the
    // cql execution engine.
    return Object.keys(valueSetJson).reduce(
      (acc, vs) => ({
        ...acc,
        [vs]: {
          Latest: valueSetJson[vs]["Latest"]["codes"],
        },
      }),
      {}
    );
  }

  getPatientReference(examplePatientResources) {
    const patientId = examplePatientResources
      .filter((r) => r.resourceType === "Patient")
      .map((p) => p.id)[0];
    return "Patient/" + patientId;
  }

  setPlan(planDefinitionPath, valueSetFilePath){
    this.planDefinition = JSON.parse(readFileSync(planDefinitionPath));
    this.valueSetJson = this.readAndReformatValueSets(valueSetFilePath);
  }

  createFhirBundle(resources, baseUrl, bundleId) {    
    // Initialize the bundle
    const bundle = {
        resourceType: 'Bundle',
        id: bundleId,
        type: 'collection',
        entry: []
    };

    // Iterate over each resource in the array
    resources.forEach(resource => {
        if (resource.resourceType && resource.id) {
            // Construct the fullUrl
            const fullUrl = `${baseUrl}/${resource.resourceType}/${resource.id}`;
            
            // Add the resource to the bundle entry
            bundle.entry.push({
                fullUrl: fullUrl,
                resource: resource
            });
        } else {
            console.warn('Resource missing resourceType or id:', resource);
        }
    });

    return bundle;
  }

  async applyPlan(patientBundle, outputFilePath) {
    const baseUrl = 'http://cancerscreeningcds.github.io/crcsm-cds';

    // Bring in an example patient bundle from the test folder
    const examplePatientBundle = JSON.parse(readFileSync(patientBundle));
    const examplePatientResources = examplePatientBundle.entry.map(
      (r) => r.resource
    ); // convert from bundle to flat array
    // Specify patient reference
    const patientReference = this.getPatientReference(examplePatientResources);

    // Put all FHIR resources into a single flat array
    const fhirJsonArray = [...this.planJsonArray, ...examplePatientResources];

    // Create resolver() function
    const resolver = simpleResolver(fhirJsonArray);
    // Define aux object containing ELM JSON and value sets
    const aux = {
      elmJsonDependencies: this.elmJsonDependencies,
      valueSetJson: this.valueSetJson,
    };

    // Run the $apply operations
    const [CarePlan, RequestGroup, ...otherResources] = await applyPlan(
        this.planDefinition,
        patientReference,
        resolver,
        aux
    );

    // Concatenate all the resources created by $apply operation
    const outputResources = this.createFhirBundle([CarePlan, RequestGroup, ...otherResources], 
      baseUrl, 
      path.basename(outputFilePath, '.json'));

    // Write them out to a file
    writeFileSync(outputFilePath, JSON.stringify(outputResources, null, 2));
  }
}

// Usage example
/*
const elmResourcePath = "input/cql";
const fhirResourcePath = "fsh-generated/resources/";
const processor = new ApplyProcessor(
  elmResourcePath,
  fhirResourcePath
);

const valueSetFilePath =
  "test/flow-ScreeningEligible/.vscache/valueset-db.json";
processor.setPlan("fsh-generated/resources/PlanDefinition-flow-ScreeningEligible.json", valueSetFilePath);
processor.applyPlan(
  "./test/examples/ScreeningEligible_v1.0.0/bundles/inc-AgeAtLeast18_error.json",
  "apply/screeningEligibleExampleOutput.json"
);
*/
