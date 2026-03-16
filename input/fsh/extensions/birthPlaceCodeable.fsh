Extension: ExtCodeableBirthPlace
Id: patient-codeableBirthPlace
Title: "Codice comune e/o stato di nascita (Patient)"
Description: "Codice comune e/o stato di nascita."
* ^context.type = #element
* ^context.expression = "Patient"
* ^url = "http://hl7.it/fhir/itcore/StructureDefinition/patient-codeableBirthPlace"
* value[x] only CodeableConcept 
* valueCodeableConcept from $istat-luogoNascita (example)