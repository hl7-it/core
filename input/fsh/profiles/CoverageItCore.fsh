Profile: CoverageItCore
Parent: Coverage
Id: coverage-it-core
Title: "Coverage - IG Core"
Description: "Rappresentazione delle esenzioni attraverso il profilo Coverage"
* ^status = #draft
* beneficiary MS
* beneficiary only Reference(PatientItcore)
* costToBeneficiary 0..* MS
* costToBeneficiary.value[x].extension contains $dataAbsentReasonExt named data-absent-reason 1..1

* costToBeneficiary.value[x].extension[data-absent-reason].valueCode = #not-applicable 
* costToBeneficiary.exception MS
* costToBeneficiary.exception.extension contains $coverage-exceptionStatus named stato-esenzione 0..1 MS
* costToBeneficiary.exception.extension[stato-esenzione].valueCodeableConcept from $vs-stato-esenzione
* costToBeneficiary.exception.type MS
* costToBeneficiary.exception.type ^short = "Codice esensione"
* costToBeneficiary.exception.type from $vs-esenzione-ne (example)
* costToBeneficiary.exception.period MS 
* payor only Reference(OrganizationItCore or PatientItcore or RelatedPerson)