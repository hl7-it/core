Profile: ProcedureItCore
Parent: Procedure
Id: procedure-it-core
Title: "Procedure - IG core"
Description: "Rappresentazione di una procedura sanitaria, che può essere un’attività svolta sul paziente o a suo favore."
* . ^short = "Rappresentazione di una procedura sanitaria tramite la risorsa Procedure."

* partOf only Reference(ProcedureItCore or Observation or MedicationAdministration)
* partOf ^short = "Riferimento ad altre procedure, osservazioni o somministrazioni di farmaci correlate a questa procedura."
* code 1..
* code ^short = "Codice che identifica la procedura eseguita o da eseguire."
* performed[x] 1..
* performed[x] ^short = "Data e ora o periodo di tempo in cui è stata eseguita la procedura."
* subject only Reference(PatientItcore)
* subject ^short = "Paziente che è stato sottoposto alla procedura."
* recorder only Reference(PatientItcore or PractitionerItcore or PractitionerRoleItcore or RelatedPerson)
* asserter only Reference(PatientItcore or PractitionerItcore or PractitionerRoleItcore or RelatedPerson) 
* asserter ^short = "Persona che attesta che la procedura è stata eseguita."
* performer.actor only Reference(PatientItcore or PractitionerItcore or PractitionerRoleItcore or OrganizationItCore or Device)
* performer.actor ^short = "Persona, organizzazione o dispositivo che ha eseguito la procedura."
* performer.onBehalfOf only Reference(OrganizationItCore)
* performer.onBehalfOf ^short = "Organizzazione in cui è stata eseguita la procedura."


