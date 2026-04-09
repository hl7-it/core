Instance: Procedure-PrelievoEmatico
InstanceOf: ProcedureItCore
Title: "Procedure - Prelievo ematico"
Description: "Esempio di procedura sanitaria, rappresentata tramite la risorsa ProcedureItCore."
Usage: #example

* id = "c81c6769-12f8-47a1-a704-d71d588bd11a"
* status = #completed
* code.coding[0].system = $cs-speciality
* code.coding[0].code = #396540005
* code.coding[0].display = "Phlebotomy"
* subject = Reference(Patient-Esempio)
* performedDateTime = "2024-09-01T08:00:00Z"
* recorder = Reference(Practitioner-Medico-MMG)
* performer.actor = Reference(Practitioner-Medico-MMG)
* performer.onBehalfOf = Reference(Organization-OspSGiovanni-Esempio)

//--------------Esempio 2 -----------------------------------------
Instance: Procedure-RadiografiaTorace
InstanceOf: ProcedureItCore
Title: "Procedure - Radiografia del torace"
Description: "Esempio di procedura sanitaria, rappresentata tramite la risorsa ProcedureItCore."
Usage: #example

* id = "0be39365-ddd0-4a51-9448-96a5b0206d99"
* code.coding = $cs-speciality#1290586005 "Plain X-ray of bone structure of rib, clavicle and sternum"
* status = #completed
* subject = Reference(Patient-Esempio2)
* performedDateTime = "2025-09-01T12:00:00Z"
* bodySite = $cs-speciality#51185008 "Thorax"
* outcome.text = "Paziente collaborante, esame eseguito senza complicanze."
* recorder = Reference(Practitioner-Tecnico-Radiologia)
* performer.actor = Reference(Practitioner-Tecnico-Radiologia)
* performer.onBehalfOf = Reference(Organization-OspSGiovanni-Esempio)
