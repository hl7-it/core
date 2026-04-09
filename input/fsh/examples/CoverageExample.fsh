Instance: Coverage-Esempio
InstanceOf: CoverageItCore
Title: "Coverage - Esenzione per infortunio sul lavoro"
Description: "Esempio di esenzione per infortunio sul lavoro rappresentato tramite il profilo CoverageItCore"
Usage: #example

* id = "48fe737e-fc1a-4cde-9abf-899d3421d759"

* status = #active

* type = $cs-coveragetype#PUBLICPOL "public healthcare"
* policyHolder = Reference(Organization-aslroma2-Esempio)
* payor = Reference(Organization-aslroma2-Esempio)
* beneficiary = Reference(Patient-Esempio)

* costToBeneficiary.valueQuantity.extension[data-absent-reason].url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* costToBeneficiary.valueQuantity.extension[data-absent-reason].valueCode = #not-applicable  
* costToBeneficiary.exception.extension[+].url = "http://hl7.it/fhir/itcore/StructureDefinition/coverage-exceptionStatus"
* costToBeneficiary.exception.extension[=].valueCodeableConcept = $cs-esenzione#active "active"

* costToBeneficiary.exception.type = $cs-codici-esenzioni#L04 "Infortunati sul lavoro o affetti da malattie professionali (ex art.6 DM 1.2.1991)"
* costToBeneficiary.exception.period.start = "2026-01-01"
* costToBeneficiary.exception.period.end = "2026-12-31"