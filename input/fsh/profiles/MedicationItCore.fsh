Profile: MedicationItcore
Parent: Medication
Id: medication-it-core
Title: "Medication - IG core"
Description: "Rappresentazione del medicinale tramite il profilo Medication"
* . ^short = "Risorsa che descrive un medicinale e i suoi codici identificativi."


* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains 
    AIC 0..1
    and ATC 0..1
    and GruppoEquivalenza 0..1
    and altro 0..*

//----------------------AIC-----------------------
* code.coding[AIC]
* code.coding[AIC] ^short = "AIC del medicinale"
* code.coding[AIC].system 1..
* code.coding[AIC].system = "urn:oid:2.16.840.1.113883.2.9.6.1.5" 
* code.coding[AIC].code ^short = "Codice AIC del medicinale"
//----------------------ATC-----------------------
* code.coding[ATC]
* code.coding[ATC] ^short = "ATC del medicinale"
* code.coding[ATC].system 1..
* code.coding[ATC].system = $vs-whoatc
* code.coding[ATC].code ^short = "Codice ATC del medicinale"
//----------------------Gruppo Equivalenza-----------------------
* code.coding[GruppoEquivalenza]
* code.coding[GruppoEquivalenza] ^short = "Gruppo di equivalenza del medicinale"
* code.coding[GruppoEquivalenza].system 1..
* code.coding[GruppoEquivalenza].system = $vs-aifa-ge
* code.coding[GruppoEquivalenza].code ^short = "Codice del gruppo di equivalenza del medicinale"
//----------------------Altro-----------------------
* code.coding[altro] ^short = "Qualora il codice del medicinale non ricada in nessuna delle precedenti alternative, è possibile utilizzare la slice 'altro'"
* code.coding[altro].system = $vs-nullFlavor
* code.coding[altro] ^short = "Motivo per cui non è stato possibile codificare il medicinale con nessuno dei codici previsti nelle slice precedenti."
* code.coding[altro].display ^short = "Stringa libera per descrivere il medicinale"

//* manufacturer only Reference(OrganizationItcore)