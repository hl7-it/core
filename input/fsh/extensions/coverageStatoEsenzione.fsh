Extension:   StatoEsenzioneCoverage
Id:          coverage-exceptionStatus
Title:       "Stato Esenzione"
Description: "Estensione per gestire lo stato di una esenzione"
//-------------------------------------------------------------------------------------------

* ^context.type = #element
* ^context.expression = "Coverage.costToBeneficiary.exception"
* ^url = "http://hl7.it/fhir/itcore/StructureDefinition/coverage-exceptionStatus"
* value[x] only CodeableConcept
* valueCodeableConcept