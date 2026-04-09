Instance: Organization-OspSGiovanni-Esempio
InstanceOf: OrganizationItCore
Title: "Organization - Ospedale San Giovanni Addolorata"
Description: "Esempio di organizzazione ospedaliera rappresentata tramite il profilo OrganizationItCore"
Usage: #example

* id = "606860f9-cd4e-494d-b550-85e7856d6746"
* identifier[aslRegione].system = "urn:oid:2.16.840.1.113883.2.9.4.1.1"
* identifier[aslRegione].value = #120202
* identifier[struttura].system = "urn:oid:2.16.840.1.113883.2.9.4.1.2"
* identifier[struttura].value = #120902
* identifier[partitaIva].system = "urn:oid:2.16.840.1.113883.2.9.6.3.2"
* identifier[partitaIva].value = "04735061006"
* type = $cs-tipoOrg#ao "Azienda Opedaliera"
* name = "Azienda Ospedaliera San Giovanni Addolorata"
* telecom.system = #phone
* telecom.value = "067010203"
* address.type = #both
* address.line = "Via dell'Amba Aradam, 9"
* address.city = "Roma"
* address.postalCode = "00184"
* address.country = "IT"

//----------------------Esempio asl Roma 2-----------------------

Instance: Organization-aslroma2-Esempio
InstanceOf: OrganizationItCore
Title: "Organization - ASL Roma 2"
Description: "Esempio di organizzazione ASL rappresentata tramite il profilo OrganizationItCore"


* id = "3c75bf31-bd32-4c0f-9e4a-585d20c08ce4"
* identifier[aslRegione].system = "urn:oid:2.16.840.1.113883.2.9.4.1.1"
* identifier[aslRegione].value = #120202
* active = 	true
* type = $cs-tipoOrg#asl "Azienda Sanitaria Locale"
* name = "ASL ROMA 2"
* telecom[0].system = #phone
* telecom[0].value = "0651004555"
* telecom[1].system = #url
* telecom[1].value = "http://www.aslroma2.it"

//--------------------------------------------------------------