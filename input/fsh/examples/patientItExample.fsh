Instance: Patient-Esempio
InstanceOf: PatientItcore
Title: "Patient - Paziente uomo iscritto al SSN"
Usage: #example
Description: "Esempio di Paziente (uomo) iscritto al SSN"

* id = "3279afbb-2ba8-4020-8d84-b2f666ece9be"

* extension[luogoNascita].valueAddress.line[+].extension[odonimo].valueString = "Piazza Ludovico Cerva"
* extension[luogoNascita].valueAddress.line[=].extension[houseNumber].valueString = "3"
* extension[luogoNascita].valueAddress.line[=] = "Piazza Ludovico Cerva, 3"
* extension[luogoNascita].valueAddress.city = $cs-comuni#079023 "Catanzaro"
* extension[luogoNascita].valueAddress.postalCode = "88100"
* extension[luogoNascita].valueAddress.country = "IT"
* extension[luogoNascita].valueAddress.state = $cs-regioni#180 "Calabria"
* extension[luogoNascita].valueAddress.use = #old "old"

* extension[titoloStudio].valueCodeableConcept = $cs-titoloStudio#40502000 "Diploma di istruzione secondaria superiore di Liceo classico"


* identifier[codiceFiscale].system = "urn:oid:2.16.840.1.113883.2.9.4.3.2"
* identifier[codiceFiscale].value = "GRGVRD06D02F611G" 
* identifier[codiceFiscale].extension[certificazioneId].extension[when].valueDateTime = "2024-09-01"

* active = true
* name.family = "Verdi"
* name.given = "Gregorio"

* telecom[0].system = #phone
* telecom[0].value = "+39 999000099"

* gender = #male
* birthDate = "2006-04-02"
* deceasedBoolean = false
* multipleBirthBoolean = false
* photo.hash = "616662666464c6c7"

* contact.relationship.text = "Padre"
* contact.name.family = "Verdi"
* contact.name.given = "Giovanni"
* contact.telecom[0].system = #phone
* contact.telecom[0].value = "+39 999000099"

* address.line.extension[dugCode].valueCodeableConcept  = $cs-istat-dug#67 "via"
* address.city.extension[codiceComune].valueCoding = $cs-comuni#079023 "Catanzaro"
* address.country = #100
* address.postalCode = "23839"
* address.state = $cs-regioni#180 "Calabria"
* address.line = "Via Milano, 52"
* address.use = #home "Residenza"

* generalPractitioner = Reference(Practitioner-Medico-MMG)

