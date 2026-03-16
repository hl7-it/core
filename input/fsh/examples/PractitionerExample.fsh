Instance: Practitioner-Tecnico-Radiologia
InstanceOf: PractitionerItcore
Title: "Practitioner - Tecnico di radiologia medica"
Description: "Esempio di tecnico di radiologia medica"
Usage: #example

* id = "587bb258-60c7-4f44-8f23-973333aada8c"
* identifier[codiceFiscale].system = "urn:oid:2.16.840.1.113883.2.9.4.3.2"
* identifier[codiceFiscale].value = "CTRMNN75E42H501H"
* active = true
* name.family = "Caterini"
* name.given = "Marianna"

* telecom[0].system = #phone
* telecom[0].value = "+39 348 1234567"
* telecom[0].use = #work

* telecom[1].system = #email
* telecom[1].value = "caterini.marianna@aslroma1.it"
* telecom[1].use = #work

* address.use = #home

//* address.line[0] = "Via dei Genieri"
* address.line[0].extension[odonimo].valueString = "Via dei Genieri"
* address.line[1] = "Via"
* address.line[1].extension[dugCode].valueCodeableConcept  = $cs-istat-dug#67 "via"
* address.line[2] = "dei Genieri,"
* address.line[2].extension[denominazioneUrbanisticaUfficiale].valueString = "dei Genieri"
* address.line[3] = "1"
* address.line[3].extension[houseNumber].valueString = "1"
* address.city[0] = "Roma"
* address.city[0].extension[codiceComune].valueCoding = $cs-comuni#058091 "Roma"
* address.district[0] = "Roma"
* address.district[0].extension[codiceProvincia].valueCoding = $cs-provincia#058 "Roma"
* address.state[0] = "Lazio"
* address.state[0].extension[codiceRegione].valueCoding = $cs-regioni#120 "Lazio"
* address.country[0] = "Italia"
* address.country[0].extension[codiceStato].valueCoding = $cs-stato#100 "Italia"


* gender = #female
* birthDate = "1975-02-05"

* qualification.code = $cs-titoloStudio#40102014 "Tecnico di radiologia medica"

* communication.coding.system = "urn:oid:2.16.840.1.113883.4.642.3.20"
* communication.coding.code = #it
* communication.coding.display = "Italiano"
