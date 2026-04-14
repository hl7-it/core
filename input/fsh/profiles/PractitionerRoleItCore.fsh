Profile: PractitionerRoleItcore
Parent: PractitionerRole
Id: practitionerRole-it-core
Title: "PractitionerRole - IG Core"
Description: "Questo profilo definisce un insieme specifico di ruoli, sedi, specializzazioni e servizi che un professionista può svolgere in un’organizzazione per un determinato periodo di tempo, insieme ai ruoli e alle organizzazioni con cui il professionista è associato. "
* . ^short = "Rappresentazione dei ruoli, delle attività e delle sedi in cui un professionista opera all’interno di un’organizzazione."

* identifier ^short = "Identificativo univoco del ruolo del professionista all’interno di un’organizzazione."

* code 1..
* code ^short = "Ruolo del professionista all’interno di un’organizzazione."
* code from $vs-role-it (required)

* practitioner only Reference(PractitionerItcore)
* practitioner ^short = "Riferimento al professionista"

* organization only Reference(OrganizationItCore)
* organization ^short = "Informazioni relative all'organizzazione in cui opera il Practitioner."