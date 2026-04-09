Instance: Medication-Metformina-Esempio
InstanceOf: medication-it-core
Title: "Medication - Metformina"
Description: "Esempio di farmaco per il diabete (Metformina) rappresentato tramite il profilo MedicationItCore"
Usage: #example

* id = "81595685-1c77-497e-beab-fad8ca297c27"
* code.coding[AIC].system = "urn:oid:2.16.840.1.113883.2.9.6.1.5"
* code.coding[AIC].code = #045018064 
* code.coding[AIC].display = "850 MG COMPRESSE RIVESTITE CON FILM 28 COMPRESSE IN BLISTER PVC/AL"

* code.coding[ATC].system = "urn:oid:2.16.840.1.113883.6.73"
* code.coding[ATC].code = $cs-whoatc#A10BA02 "Metformina"

* status = #active
* form = $cs-speciality#421026006 "Oral tablet"
* amount.numerator.value = 28
* amount.numerator.unit = "compresse"
* amount.denominator.value = 1
* amount.denominator.unit = "blister"

//--------------------------------------------------

Instance: Medication-Levothyrox-Esempio
InstanceOf: medication-it-core
Title: "Medication - Farmaco Straniero"
Description: "Esempio di farmaco straniero, non codificabile tramite AIC/ATC, rappresentato tramite il profilo MedicationItCore"
Usage: #example

* id = "5b50de92-3f93-4c5d-a24a-10b3aa6330bb"
* code.coding[altro].system = $cs-nullFlavor
* code.coding[altro].code = #OTH
* code.coding[altro].display = "Other"
* code.coding[altro].extension[descrizione].valueString = "Farmaco estero non registrato in Italia: Levothyrox 75 µg (formulazione francese), importato"
* batch.lotNumber = "L12345"
* batch.expirationDate = "2027-12-31"

* amount.numerator.value = 25
* amount.numerator.unit = "microgrammi"
* amount.denominator.value = 1
* amount.denominator.unit = "compressa"