Profile: PractitionerItcore
Parent: Practitioner
Id: practitioner-it-core
Title: "Practitioner - IG Core"
Description: "Questo profilo definisce una persona direttamente o indirettamente coinvolta nella fornitura di assistenza sanitaria. "
* . ^short = "Rappresentazione dell'individuo coinvolto nella procedura tramite la risorsa Practitioner."

//slicing su identifier, discriminando per system
* identifier 1..
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #open
* identifier contains 
    codiceFiscale 0..1
    and codiceANA 0..1
    and altro 0..*

//----------------------Codice Fiscale-----------------------
* identifier[codiceFiscale]
* identifier[codiceFiscale] ^short = "Codice Fiscale del professionista sanitario o della persona coinvolta nella procedura sanitaria."
* identifier[codiceFiscale].system 1..
* identifier[codiceFiscale].system = "urn:oid:2.16.840.1.113883.2.9.4.3.2" 
* identifier[codiceFiscale].value 1..
* identifier[codiceFiscale].assigner only Reference(OrganizationItCore)

//----------------------ID Regionale-----------------------
// * identifier[idRegionale]
// * identifier[idRegionale] ^short = "ID regionale del professionista sanitario o della persona coinvolta."
// * identifier[idRegionale].system 1..
// * identifier[idRegionale].system obeys pr-id-reg-oid-1
// * identifier[idRegionale].system ^short = "L'id regionale deve seguire questa struttura: “2.16.840.1.113883.2.9.2.” + [REGIONE] + “.4.2”"

//----------------------Codice ANA-----------------------
* identifier[codiceANA]
* identifier[codiceANA] ^short = "Codice ANA del professionista sanitario o della persona coinvolta."
* identifier[codiceANA].system 1..
* identifier[codiceANA].system = "urn:oid:2.16.840.1.113883.2.9.4.3.15"
* identifier[codiceANA].value 1..
* identifier[codiceANA].assigner only Reference(OrganizationItCore)

//----------------------Altro------------------------------
* identifier[altro] ^short = "Qualora l'identifier del practitioner non ricada in nessuna delle precedenti alternative, è possibile utilizzare la slice 'altro'"
* identifier[altro].value ^short = "Valore dell'identifier"
* identifier[altro].system = $oid
* identifier[altro].assigner only Reference(OrganizationItCore)

* address only AddressItcore
* address ^short = "Indirizzo del professionista sanitario o della persona coinvolta nella procedura sanitaria."

* qualification.issuer only Reference(OrganizationItCore)

//---------------------rule per idRegionale-----------------------
// Invariant: pr-id-reg-oid-1
// Description: "L'identificativo regionale deve essere espresso nella seguente struttura: “2.16.840.1.113883.2.9.2.” + [REGIONE] + “.4.2”"
// Severity: #error
// Expression: "system.matches('^urn:oid:2\\.16\\.840\\.1\\.113883\\.2\\.9\\.2\\.(10|20|30|41|42|50|60|70|80|90|100|110|120|130|140|150|160|170|180|190|200)\\.4\\.2$')"
// XPath: "matches(@system,'^urn:oid:2\\.16\\.840\\.1\\.113883\\.2\\.9\\.2\\.(10|20|30|41|42|50|60|70|80|90|100|110|120|130|140|150|160|170|180|190|200)\\.4\\.2$')"
