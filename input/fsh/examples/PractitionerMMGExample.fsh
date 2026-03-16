Instance: Practitioner-Medico-MMG
InstanceOf: PractitionerItcore
Title: "Practitioner - Medico di medicina generale"
Description: "Esempio di medico di medicina generale"
Usage: #example

* id = "1d1632b0-d7cc-49cf-9f2d-f5d8669e16ee"
* identifier[codiceFiscale].system = "urn:oid:2.16.840.1.113883.2.9.4.3.2"
* identifier[codiceFiscale].value = "LLNFLR70A67I804I"
* active = true
* name.family = "Allende"
* name.given = "Flora"
* telecom[0].system = #phone
* telecom[0].value = "+39 3381234567"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "allende.flora@aslroma1.it"
* telecom[1].use = #work

* address.use = #home

* address.line[0].extension[odonimo].valueString = "Via Pola"
* address.line[1] = "Via"
* address.line[1].extension[dugCode].valueCodeableConcept  = $cs-istat-dug#67 "via"
* address.line[2] = "Pola"
* address.line[2].extension[denominazioneUrbanisticaUfficiale].valueString = "Pola"
* address.line[3] = "1"
* address.line[3].extension[houseNumber].valueString = "67"
* address.city[0] = "Roma"
* address.city[0].extension[codiceComune].valueCoding = $cs-comuni#058091 "Roma"
* address.district[0] = "Roma"
* address.district[0].extension[codiceProvincia].valueCoding = $cs-provincia#058 "Roma"
* address.state[0] = "Lazio"
* address.state[0].extension[codiceRegione].valueCoding = $cs-regioni#120 "Lazio"
* address.country[0] = "Italia"
* address.country[0].extension[codiceStato].valueCoding = $cs-stato#100 "Italia"


* gender = #female
* birthDate = "1970-01-27"
* qualification.code[+] = $cs-titoloStudio#70000000 "LAUREA - Vecchio o nuovo ordinamento (corsi di durata compresa tra i 2 e i 6 anni)"
* qualification.code[=] = $cs-titoloStudio#72004001 "Medicina e chirurgia"
* communication.coding.system = "urn:oid:2.16.840.1.113883.4.642.3.20"
* communication.coding.code = #it
* communication.coding.display = "Italiano"
