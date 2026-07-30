Profile:  OrganizationItCore
Parent:   Organization
Id:       organization-it-core
Title:    "Organization - IG Core"
Description: "Profilo base specifico per Organization: include le informazioni minime per descrivere una organizzazione che eroga od è responsabile per prestazioni sanitarie o socio sanitarie"
//-------------------------------------------------------------------------------------------

* identifier 1..*
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "$this.system"

* identifier ^slicing.discriminator[1].type = #value
* identifier ^slicing.discriminator[1].path = "$this.value"

* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier contains 
	aslRegione 0..1
	and struttura 0..1 
	and partitaIva 0..1
	and strutturaInterna 0..1

//-----------asl Regione----------------------------------------------------
* identifier[aslRegione] ^short = "Identificativo Azienda Sanitaria Locale (FLS 11 - 6 char)"
* identifier[aslRegione].system 1..1
* identifier[aslRegione].value 1..1
* identifier[aslRegione].system = $cs-aslRegione  // pattern
* identifier[aslRegione].value from VsMdsAsl (example)
* identifier[aslRegione] ^example.label = "ASL ROMA 1"
* identifier[aslRegione] ^example.valueString = "120201"
//----------struttura-------------------------------------------------------
* identifier[struttura] ^short = "Identificativo Azienda Ospedaliera o Identificativo Struttura di Ricovero (HSP 11)"
* identifier[struttura].system = $cs-aziendaOspedaliera  // pattern
* identifier[struttura].value from VsStrutturaAzienda (example)
* identifier[struttura].system 1..1
* identifier[struttura].value 1..1
* identifier[struttura] ^example.label = "AZIENDA OSP. S.GIOVANNI/ADDOLORATA ROMA"
* identifier[struttura] ^example.valueString = "120902"
//----------struttura interna------------------------------------------------
* identifier[strutturaInterna] ^short = "Identificativo Struttura Interna di Ricovero"
* identifier[strutturaInterna].system = $mds-struttureinterne  // pattern
* identifier[strutturaInterna].value from VsStrutturaInterna (example)
* identifier[strutturaInterna].system 1..1
* identifier[strutturaInterna].value 1..1
* identifier[strutturaInterna] ^example.label = "ISTITUTO CHIRURGICO ORTOPEDICO REGINA MARGHERITA"
* identifier[strutturaInterna] ^example.valueString = "010909.05"
//----------partita IVA------------------------------------------------------
* identifier[partitaIva] ^short = "Partita IVA Organizzazione/Codice Fiscale Organizzazione"
* identifier[partitaIva].system = $CF
* identifier[partitaIva].system 1..1
* identifier[partitaIva].value 1..1 
* identifier[partitaIva] ^example.label = "Partita IVA"
* identifier[partitaIva] ^example.valueString = "12345678910"

* type from VsTipoOrgSocioSanitaria (extensible)