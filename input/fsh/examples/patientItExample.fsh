Instance: Patient-Esempio
InstanceOf: PatientItcore
Title: "Patient - Paziente uomo iscritto al SSN"
Usage: #example
Description: "Esempio di Paziente (uomo) iscritto al SSN rappresentato tramite il profilo PatientItCore"

* id = "3279afbb-2ba8-4020-8d84-b2f666ece9be"

* extension[luogoNascita].valueAddress.line[+].extension[odonimo].valueString = "Piazza Ludovico Cerva"
* extension[luogoNascita].valueAddress.line[=].extension[houseNumber].valueString = "3"
* extension[luogoNascita].valueAddress.line[=] = "Piazza Ludovico Cerva, 3"
* extension[luogoNascita].valueAddress.city = $cs-comuni#079023 "Catanzaro"
* extension[luogoNascita].valueAddress.postalCode = "88100"
* extension[luogoNascita].valueAddress.country = "IT"
* extension[luogoNascita].valueAddress.state = $cs-regioni#180 "Calabria"
* extension[luogoNascita].valueAddress.use = #old "old"
* extension[luogoNascitaCodeable].valueCodeableConcept = $cs-istat-comune#079023 "Catanzaro"
* extension[professione].valueCodeableConcept = $cs-istatprofessione#5.4.8.4 "Vigili del fuoco e professioni assimilate"
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
* contact.telecom[0].value = "+39 999100099"

* address.line.extension[dugCode].valueCodeableConcept  = $cs-istat-dug#67 "via"
* address.city.extension[codiceComune].valueCoding = $cs-comuni#079023 "Catanzaro"
* address.country = #100
* address.postalCode = "23839"
* address.state = $cs-regioni#180 "Calabria"
* address.line = "Via Milano, 52"
* address.use = #home "Residenza"
* generalPractitioner = Reference(Practitioner-Medico-MMG)

//--------------Esempio 2 Patient-----------------------------------------

Instance: Patient-Esempio2
InstanceOf: PatientItcore
Title: "Patient - Paziente donna iscritta al SSN"
Usage: #example
Description: "Esempio di Paziente (donna) iscritta al SSN rappresentato tramite il profilo PatientItCore"

* id = "18a83b35-274f-4946-bf0b-11eefa50d490"

* extension[luogoNascita].valueAddress.line[+].extension[odonimo].valueString = "Via dei Mille"
* extension[luogoNascita].valueAddress.line[=].extension[houseNumber].valueString = "3"
* extension[luogoNascita].valueAddress.line[=] = "Via dei Mille, 3"
* extension[luogoNascita].valueAddress.city = $cs-comuni#058118 "Ciampino"
* extension[luogoNascita].valueAddress.postalCode = "88100"
* extension[luogoNascita].valueAddress.country = "IT"
* extension[luogoNascita].valueAddress.state = $cs-regioni#120 "Lazio"
* extension[luogoNascita].valueAddress.use = #home "home"
* extension[luogoNascitaCodeable].valueCodeableConcept = $cs-istat-comune#058118 "Ciampino"
* extension[professione].valueCodeableConcept = $cs-istatprofessione#3.4.2.7 "Atleti"
* extension[titoloStudio].valueCodeableConcept = $cs-titoloStudio#40202000 "Diploma di istruzione secondaria superiore ad indirizzo tecnico industriale"
* identifier[codiceFiscale].system = "urn:oid:2.16.840.1.113883.2.9.4.3.2"
* identifier[codiceFiscale].value = "MRABCH99B65H501O"
* identifier[codiceFiscale].extension[certificazioneId].extension[when].valueDateTime = "2024-09-01"

* active = true
* name.family = "Bianchi"
* name.given = "Maria"

* telecom[0].system = #phone
* telecom[0].value = "+39 123456789"
* gender = #female
* birthDate = "1999-02-25"
* deceasedBoolean = false
* multipleBirthBoolean = false
* photo.hash = "616662333464c6c7"
* contact.relationship.text = "Padre"
* contact.name.family = "Bianchi"
* contact.name.given = "Marco"
* contact.telecom[0].system = #phone
* contact.telecom[0].value = "+39 123456799"

* address.line.extension[dugCode].valueCodeableConcept  = $cs-istat-dug#67 "via"
* address.city.extension[codiceComune].valueCoding = $cs-comuni#058118 "Ciampino"
* address.country = #120
* address.postalCode = "00043"
* address.state = $cs-regioni#120 "Lazio"
* address.line = "Via dei Mille, 3"
* address.use = #home "Residenza"

* generalPractitioner = Reference(Practitioner-Medico-MMG)
