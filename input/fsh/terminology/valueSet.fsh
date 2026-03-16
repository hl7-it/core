
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ValueSet: VsAddressUseIt
Id: vs-add-use-it
Title: "Address use"
Description: "Traduzione italiana dell'use address"
* ^experimental = false

* $cs-addr-use-org#home "Residenza"
* $cs-addr-use-org#work "Lavoro"
* $cs-addr-use-org#temp "Domicilio temporaneo"
* $cs-addr-use-org#old  "old"
* $cs-addr-use-org#billing "Indirizzo di Fatturazione"
//capire se tenere, probabilmente no

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ValueSet: VsRoleCodeIt
Id: vs-role-code-it
Title: "Role Code"
Description: "Insieme di codici che identificano il ruolo professionale svolto da un operatore sanitario all'interno dei sistemi sanitari e nei flussi informativi."
* ^experimental = false
* include codes from system $cs-role-it

* ^expansion.timestamp = "2024-06-01T12:00:00Z"

* ^expansion.contains[0].system = $cs-role-it
* ^expansion.contains[0].code = #MMG
* ^expansion.contains[0].display = "Medico di Medicina Generale"

* ^expansion.contains[1].system = $cs-role-it
* ^expansion.contains[1].code = #PLS
* ^expansion.contains[1].display = "pediatra di libera scelta"

* ^expansion.contains[2].system = $cs-role-it
* ^expansion.contains[2].code = #MSD
* ^expansion.contains[2].display = "medico del servizio/struttura del distretto/azienda"

* ^expansion.contains[3].system = $cs-role-it
* ^expansion.contains[3].code = #MCA
* ^expansion.contains[3].display = "medico continuità assistenziale"

* ^expansion.contains[4].system = $cs-role-it
* ^expansion.contains[4].code = #MO
* ^expansion.contains[4].display = "medico ospedaliero"

* ^expansion.contains[5].system = $cs-role-it
* ^expansion.contains[5].code = #MSA
* ^expansion.contains[5].display = "medico specialista ambulatoriale"

* ^expansion.contains[6].system = $cs-role-it
* ^expansion.contains[6].code = #MUA
* ^expansion.contains[6].display = "medico di azienda universitaria"

* ^expansion.contains[7].system = $cs-role-it
* ^expansion.contains[7].code = #GMT
* ^expansion.contains[7].display = "guardia medica turistica"

* ^expansion.contains[8].system = $cs-role-it
* ^expansion.contains[8].code = #SPA
* ^expansion.contains[8].display = "specialista di struttura privata accreditata"

* ^expansion.contains[9].system = $cs-role-it
* ^expansion.contains[9].code = #MI
* ^expansion.contains[9].display = "medico INAIL"

* ^expansion.contains[10].system = $cs-role-it
* ^expansion.contains[10].code = #MC
* ^expansion.contains[10].display = "medico consulente"

* ^expansion.contains[11].system = $cs-role-it
* ^expansion.contains[11].code = #AS
* ^expansion.contains[11].display = "altra specializzazione"

* ^expansion.contains[12].system = $cs-role-it
* ^expansion.contains[12].code = #AA
* ^expansion.contains[12].display = "altro (tirocinanti, specializzandi, ecc.)"


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ValueSet: VsEsenzionieNE
Id: vs-esenzione-ne
Title: "Codici Esenzione"
Description: "Valuset che contiene i codici per le esenzioni più il code Nessuna Esenzione"
* ^experimental = false

* include codes from system $cs-codici-esenzioni
* include codes from system CsNessunaEsenzione