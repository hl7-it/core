Profile: MedicationItCore
Parent: Medication
Id: medication-it-core
Title: "Medication - IG Core"
Description: "Rappresentazione del medicinale tramite il profilo Medication"
* . ^short = "Risorsa che descrive un medicinale e i suoi codici identificativi."

* code 1..1
* code.coding 1..*
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
* code.coding[AIC] ^short = "Codice AIC del farmaco"
* code.coding[AIC].system 1..
* code.coding[AIC].system = $cs-aifaAIC 
* code.coding[AIC].code from $vs-aifaAIC (preferred)
* code.coding[AIC].code 1..
* code.coding[AIC].code ^short = "Codice AIC del farmaco"
//----------------------ATC-----------------------
* code.coding[ATC]
* code.coding[ATC] ^short = "Codice ATC del farmaco"
* code.coding[ATC].system 1..
* code.coding[ATC].system = $cs-whoatc
* code.coding[ATC].code 1..
* code.coding[ATC].code from $vs-whoatc (required)
* code.coding[ATC].code ^short = "Codice ATC del farmaco"
//----------------------Gruppo Equivalenza---------------------
* code.coding[GruppoEquivalenza]
* code.coding[GruppoEquivalenza] ^short = "Gruppo di equivalenza del farmaco"
* code.coding[GruppoEquivalenza].system 1..
* code.coding[GruppoEquivalenza].system = $cs-aifa-ge
* code.coding[GruppoEquivalenza].code 1..
* code.coding[GruppoEquivalenza].code from $vs-aifa-ge (required)
* code.coding[GruppoEquivalenza].code ^short = "Codice del gruppo di equivalenza del farmaco"
//----------------------Altro-----------------------
* code.coding[altro] ^short = "Qualora il codice del farmaco/integratore non ricada in nessuna delle precedenti alternative, è possibile utilizzare la slice 'altro'"
* code.coding[altro].code from $vs-nullFlavor
* code.coding[altro].system = $cs-nullFlavor
* code.coding[altro].code 1..
* code.coding[altro].extension contains $ext-originalText named descrizione 0..1
* code.coding[altro].extension[descrizione] ^short = "Descrizione specifica per il farmaco che non rientra nelle codifiche AIC/ATC/GE"
* code.coding[altro].extension[descrizione].valueString 1..
* manufacturer only Reference(OrganizationItCore)
* ingredient.itemReference only Reference(MedicationItCore)