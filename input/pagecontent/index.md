
### Obiettivo

Lo scopo della presente Implementation Guide è definire un insieme coerente, condiviso e riutilizzabile di profili, extensions e terminologie che costituiscono il nucleo (it‑core) per tutte le Implementation Guide FHIR sviluppate nel Realm Italiano. La guida fornisce un riferimento stabile per promuovere:

<ul>
<li>Uniformità e coerenza semantica tra le diverse IG nazionali e regionali;</li>
<li>Interoperabilità sicura ed efficace tra i sistemi informativi sanitari coinvolti nei processi clinici e amministrativi; </li>
<li>Riutilizzo e semplificazione nello sviluppo delle future IG, attraverso la definizione di componenti condivise e di un approccio progettuale armonizzato.</li>
</ul>

La presente guida si configura quindi come fondamento tecnico per tutte le successive Implementation Guide italiane, garantendo un impianto metodologico univoco e promuovendo una crescente standardizzazione nel contesto italiano secondo le linee guida HL7 Italia, a beneficio dell’interoperabilità e della qualità dei dati sanitari.

### Contesto IG Core italiana

La presente guida ha lo scopo di definire i profili, le extension e le terminologie [HL7 FHIR](https://hl7.org/fhir/R4B) fondamentali per il contesto italiano. 
In particolare:

<ul>
  <li>
    <strong>Extensions</strong>
    <ul>
      <li>
        Forniscono elementi aggiuntivi non presenti nel core FHIR,
        consentendo di rappresentare informazioni rilevanti nel contesto italiano,
        ma assenti nelle risorse base
      </li>
    </ul>
  </li>

  <li>
    <strong>Profili</strong>
    <ul>
      <li>
        <em>PatientItCore</em>: profilo che definisce le caratteristiche dell'assistito;
      </li>
      <li>
        <em>PractitionerItCore</em>: profilo che descrive le informazioni relative
        ai professionisti coinvolti nell’assistenza sanitaria;
      </li>
      <li>
        <em>AddressItCore</em>: profilo che definisce la struttura dell’indirizzo
        utilizzato per pazienti, operatori e organizzazioni;
      </li>
      <li>
        <em>PractitionerRoleItCore</em>: profilo che rappresenta il ruolo ricoperto
        da un professionista sanitario all’interno di un’organizzazione;
      </li>
      <li>
        <em>CoverageItCore</em>: profilo che descrive le informazioni relative a
        esenzioni e coperture sanitarie;
      </li>
      <li>
        <em>OrganizationItCore</em>: profilo che definisce le caratteristiche di
        un’organizzazione sanitaria o socio‑sanitaria;
      </li>
      <li>
        <em>MedicationItCore</em>: profilo che rappresenta farmaci e integratori
        seguendo le specifiche italiane per la definizione di medicinali;
      </li>
      <li>
        <em>ProcedureItCore</em>: profilo che definisce le caratteristiche di una
        prestazione o procedura sanitaria.
      </li>
    </ul>
  </li>

  <li>
    <strong>Terminologie</strong>
    <ul>
      <li>
        Includono insiemi di codici e valori specifici
        necessari a rappresentare concetti normativi, clinici e
        organizzativi.
      </li>
    </ul>
  </li>
</ul>


<div>
  <p></p>
  <figure style="text-align: center;">
    <img src="igCore.png" alt="Core profiles" width="80%"/>
    <figcaption><strong>Rappresentazione grafica della IG Core</strong></figcaption>
  </figure>
  <p></p>
</div>

### Dipendenze
{% include dependency-table.xhtml %}

### Details
#### Cross-Version Analysis
{% include cross-version-analysis.xhtml %}

### Autori e Contributori

<table>
<thead>
<tr class="header">
<th>Ruolo</th>
<th>Nome</th>
<th>Organizzazione</th>
<th>Contatto</th>
</tr>
</thead>
<tbody>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Autore</td>
<td>Leonardo Alcaro</td>
<td>CTO HL7</td>
<td>leonardo.alcaro@gmail.com</td>
</tr>
<tr class="even">
<td>Autore</td>
<td>Mario Sicuranza</td>
<td>CNR ICAR</td>
<td>mario.sicuranza@icar.cnr.it</td>
</tr>
<tr class="even">
<td>Autore</td>
<td>Valeria Cesarò</td>
<td>EY Advisory S.p.A.</td>
<td>valeria.cesaro@it.ey.com</td>
</tr>
<tr class="even">
<td>Autore</td>
<td>Chiara Fulgenzio</td>
<td>EY Advisory S.p.A.</td>
<td>chiara.fulgenzio@it.ey.com</td>
</tr>
<tr class="odd">
<td>Autore</td>
<td>Maria Giovanna Antida Preziosi</td>
<td>SOGEI</td>
<td>mpreziosi@sogei.it</td>
</tr>
</tbody>
</table>



### Intellectual Property Statements
{% include ip-statements.xhtml %}
