import fs from 'fs';
import path from 'path';
import assert from 'assert';
import ApplyProcessor from './apply.js'; // Adjust the path as needed

describe('Apply Tests', function() {
  const baseTestPath = 'test';
  const elmResourcePath = 'input/cql';
  const fhirResourcePath = 'fsh-generated/resources/';
  const processor = new ApplyProcessor(elmResourcePath, fhirResourcePath);

  if (!fs.existsSync('apply/examples/')){
    fs.mkdirSync('apply/examples/');
  }

  // Read all directories in the base test path, excluding 'examples' and 'DataElements'
  const testFolders = fs.readdirSync(baseTestPath).filter(file => {
    return fs.statSync(path.join(baseTestPath, file)).isDirectory() && file !== 'examples' && file !== 'DataElements';
  });

  testFolders.forEach(folderName => {
    const strippedFlowName = folderName.replace(/^flow-/, ''); // Remove 'flow-' prefix
    const bundlesPath = path.join(baseTestPath, `examples/${strippedFlowName}_v1.0.0/bundles`);

    // Check if bundles path exists
    if (!fs.existsSync(bundlesPath)) {
      console.warn(`Skipping ${folderName}: Bundles path does not exist.`);
      return;
    }

    // Read all JSON files in the bundles directory
    const jsonFiles = fs.readdirSync(bundlesPath).filter(file => file.endsWith('.json'));

    describe(`${folderName} Tests`, function() {
      jsonFiles.forEach(jsonFile => {
        it(`should process the plan for ${jsonFile}`, async function() {
          const valueSetFolderPath = path.join(baseTestPath, folderName, '.vscache');
          const valueSetFilePath = path.join(valueSetFolderPath, 'valueset-db.json');
          const planDefinitionPath = path.join(fhirResourcePath, `PlanDefinition-${folderName}.json`);
          const inputBundlePath = path.join(bundlesPath, jsonFile);
          const outputFilePath = `apply/examples/${strippedFlowName}_${path.basename(jsonFile, '.json')}.json`;

          // Check if required files exist
          if (!fs.existsSync(valueSetFolderPath) || !fs.existsSync(planDefinitionPath) || !fs.existsSync(inputBundlePath)) {
            console.warn(`Skipping test for ${folderName} using ${jsonFile}: Required file(s) missing.`);
            this.skip();
          }
                    
          processor.setPlan(planDefinitionPath, valueSetFilePath);
          await processor.applyPlan(inputBundlePath, outputFilePath);

          // Add assertions as needed
          assert.ok(fs.existsSync(outputFilePath), `Output file should exist for ${folderName} using ${jsonFile}`);
        });
      });
    });
  });
});
