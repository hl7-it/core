Instance: PractitionerRole-Tecnico-Radiologia
InstanceOf: PractitionerRoleItcore
Title: "PractitionerRole - Tecnico di radiologia medica"
Description: "Esempio di ruolo di tecnico di radiologia medica"
Usage: #example

* id = "b0fd1872-5f75-4003-8bbe-e2c4595215a0"

* identifier.system = "https://ospedale-roma.it/ruoli"
* identifier.value = "RUOLO-12345"
//* identifier.assigner = Reference(Organization-ASL-Roma1)

* active = true
* period.start = "2020-01-01"
* period.end = "2030-12-31"

* practitioner = Reference(Practitioner-Tecnico-Radiologia)

* code = $cs-role-it#AS "altra specializzazione"
* specialty = $cs-speciality#394914008 "Radiology"

* telecom[0].system = #phone
* telecom[0].value = "+39 348 1234567"
* telecom[0].use = #work

* availableTime.daysOfWeek[0] = #mon 
* availableTime.daysOfWeek[1] = #tue
* availableTime.daysOfWeek[2] = #wed
* availableTime.daysOfWeek[3] = #thu
* availableTime.daysOfWeek[4] = #fri
* availableTime.allDay = true

* notAvailable.during.start = "2026-08-10"
* notAvailable.during.end = "2026-08-20"
* notAvailable.description = "Chiusura clinica per ferie estive"

