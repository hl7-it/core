Extension: ExtDug
Id: address-dug
Title: "DUG (Denominazione Urbanistica Generica)"
Description: "Denominazione Urbanistica Ufficiale."
* ^context.type = #element
* ^context.expression = "Address.line"
* ^url = "http://hl7.it/fhir/itcore/StructureDefinition/address-dug"
* value[x] only CodeableConcept
* value[x] from $vs-istat-dug (extensible)
