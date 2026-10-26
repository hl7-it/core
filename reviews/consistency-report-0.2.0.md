# HL7 Italia FHIR Implementation Guide (core) – Consistency Review for 0.2.0 (trial use)

- **Date:** 2026-10-26. First review.
- **Scope:** FSH sources (`input/fsh`), FHIR XML sources (`input/vocabulary`), narrative pages (`input/pagecontent`), configuration (`sushi-config.yaml`, `ig.ini`, the local template `it-template`), examples, the latest IG Publisher QA output (`output/qa.*`) and `input/ignoreWarnings.txt`.
- **Build status:**
  - SUSHI 3.21.0 reports 0 errors and 1 warning (see 2-2).
  - The IG Publisher run of 2026-10-26 18:38 (qa.txt reports version 3.0.1) was built as `hl7.fhir.it.core#0.2.0`, status `draft`, release label `trial use`. It includes all commits up to `c54d281` and the working-copy changes made today (display fixes in `CS_TipoEntita.xml`, `valueSet.fsh`, `OrganizationExample.fsh` and new entries in `ignoreWarnings.txt`).
  - It reports **0 errors, 14 warnings and 36 information messages**, plus 38 suppressed warnings and 95 suppressed hints.

Severity: **High** means fix before publication. **Medium** means it should be fixed for 0.2.0. **Low** means cleanup or editorial.

File references are relative to the repository root. Line numbers are those of the current working copy.

Each open item has an id `<section>-<n>` (e.g. `3.1-2`). Ids are stable: fixed or accepted items keep their id when they move to *Won't fix (accepted)* or *Fixed since the first review*, and new items get the next free number.

---

## 1. Release blockers (High)

| ID | Area | Finding | Fix |
|---|---|---|---|
| 1-1 | Profiles | `it-postal-code-pattern` (`input/fsh/profiles/AddressItCore.fsh:94-98`) has severity `#error` and applies to every `AddressItcore`, including foreign addresses (birth place, nationality, residence abroad). Valid foreign postcodes such as `SW1A 1AA` fail. The expression `matches('[0-9]{5}')` is also unanchored, so any value that *contains* five digits passes (e.g. `90210-1234`, `ABC123456`). The comment on line 79 gives a third pattern (`'[1,9]{4}'`). | Anchor the regex (`'^[0-9]{5}$'`) and limit it to Italian addresses, e.g. `country.exists() and (country = 'IT' or country = 'Italia' or country = '100') implies matches(...)` on `Address`, once the country convention is fixed (5-1). Align the comment on line 79. |
| 1-2 | Profiles | `$oid` is `urn:ietf:rfc:1155` (`input/fsh/aliases.fsh:8`), and it is fixed as `identifier[altro].system` in `PatientItCore.fsh:112` and `PractitionerItCore.fsh:47`. RFC 1155 is the SNMP SMI, not an identifier system. Implementers who follow the profile will put this URI in their data. The slice is described as the catch-all for "any other identifier", but a fixed system makes it match only this one URI. | Decide what `altro` is for. If it is a catch-all, remove the fixed system (the slicing is open, so unsliced identifiers are already allowed) or drop the slice. If it is meant for OID-based identifiers, require `system` to start with `urn:oid:` with an invariant. |
| 1-3 | Pages | `input/pagecontent/changes.xml` is the unchanged sample page: "list of changes to the MyIG specification", "2099-01-01 v0.1.0 - My IG R1 (STU ballot 1) Ballot Candidate". | Rewrite it with the real 0.1.0 entry and a 0.2.0 entry listing the changes (new profiles Medication, Procedure, PractitionerRole, Coverage, Organization, etc.). |
| 1-4 | Configuration | The release configuration is incomplete: no `license` (`sushi-config.yaml:16` is commented, so the IG resource has none); `status: draft` (line 11) with `releaseLabel: trial use` (line 15); no `publication-request.json`. | Set `license: CC0-1.0`. Decide the status of 0.2.0 (`active` + `trial use`, or `draft` + `ci-build`/`draft`) and set both consistently. Add `publication-request.json` if this release goes through the HL7 publication process. |

---

## 2. Configuration and publication

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 2-1 | Medium | `sushi-config.yaml:10` | No `description`: the template line is commented out, so the IG resource and the package have an empty description. | Add an Italian description of the guide. |
| 2-2 | Low | `sushi-config.yaml:26` | `dependencies:` has no value (only comments), which causes the SUSHI warning "Configuration property dependencies has a value with an unexpected type". | Remove the key, or add the real dependencies. |
| 2-3 | Low | `sushi-config.yaml:94-109` | Only 8 profiles are grouped. The 6 extensions, 23 CodeSystems and 21 ValueSets have no group and fall into the Publisher's default sections, next to the custom ones. | Add groups for extensions and terminology, or drop the custom groups and use the default ones. |
| 2-4 | Low | `sushi-config.yaml:86-92` | Menu labels mix English and Italian ("IG Home", "Artifacts", "Support", "Downloads" next to "Sommario"). | Use one language for the menu. |
| 2-5 | Low | `sushi-config.yaml` | Most of the file is SUSHI template comments (US Core / mCODE examples, sample pages and groups). | Remove the template comments. |
| 2-6 | Low | `input/fsh/terminology/codesystem.fsh:65`, `:662`, `:759`; `input/fsh/terminology/valueSet.fsh:132`, `:176`, `:8448` | Three CodeSystem/ValueSet pairs share the same title ("MDS - ASL", "ISTAT - Registro delle Denominazioni Urbanistiche Generiche (DUG)", "Ministero della Salute - Codici Regioni / PPAA"). They cannot be told apart in the artifacts list. | Qualify the titles, e.g. "…, CodeSystem" / "…, ValueSet", or name the ValueSets after their scope. |
| 2-7 | Low | Publisher dependencies | `hl7.terminology.r4` is not pinned, so the resolved version can change between builds. | Pin it in `sushi-config.yaml`. |
| 2-8 | Low | `it-template/package/$root/package-list.json` | The template's package list is the HL7 Belgium one (`hl7.be.fhir.template`, `build.fhir.org/ig/hl7-be/...`). | Replace it with the Italian template's own data, or delete it. |

---

## 3. Profiles (FSH)

### 3.1 References between profiles

No Composition profiles in this IG. References between the IG profiles are consistent (all `Reference(...)` targets use the IT Core profiles where they exist). Remaining points:

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 3.1-1 | Medium | `input/fsh/profiles/OrganizationItCore.fsh` | `index.md:42-43` says `AddressItCore` is used "per pazienti, operatori e organizzazioni", but `OrganizationItCore` does not constrain `address`. | Add `* address only AddressItcore`, or correct the page. |
| 3.1-2 | Medium | `input/fsh/profiles/PatientItCore.fsh:21-41` | The bindings of `luogoNascitaCodeable`, `cittadinanza`, `nazionalita`, `professione` and `titoloStudio` are set on the extension element (`extension[x] ^binding…`), which is of type Extension and cannot carry a binding. `professione` is also `preferred` here while the extension itself binds the same value set as `example` (`professionePaziente.fsh:16`). | Move the bindings to `extension[x].valueCodeableConcept` (or define them only in the extensions) and use one strength. |
| 3.1-3 | Medium | `input/fsh/profiles/OrganizationItCore.fsh:9-13` | The identifier slicing uses a second `#value` discriminator on `$this.value`, but no slice fixes a value (the values are bound to example value sets). The slices are told apart by `system` only. | Remove the `value` discriminator. |
| 3.1-4 | Low | `input/fsh/profiles/CoverageItCore.fsh:6` | Only `CoverageItCore` sets `^status = #draft`; the other profiles take the IG status. | Remove the rule, or set the status the same way everywhere (see 3.4-1). |

### 3.2 Invariants

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 3.2-1 | Medium | `input/fsh/profiles/PatientItCore.fsh:149-152` | `it-city-required` is `country.value=100 implies city.exists()`. `value` is not a FHIRPath child of a string, so the left side is always empty and the invariant can never fail. It is also redundant: `AddressItcore` already sets `city 1..1`. | Remove the invariant, or remove `city 1..1` from the Address profile and write `(country = '100' or country = 'IT' …) implies city.exists()` once 5-1 is decided. |
| 3.2-2 | Medium | `input/fsh/profiles/PatientItCore.fsh:135-139` | `pat-id-cf-1` (Codice Fiscale format) is defined but not attached to any element, so it is not enforced. The description says "16 caratteri" but the regex allows the omocodia letters, which is right; the regex is anchored. | Attach it to `identifier[codiceFiscale].value`, or delete it. |
| 3.2-3 | Low | `input/fsh/profiles/PatientItCore.fsh:142` | Typo in `it-pat-name-1`: "aprti". | "parti". |
| 3.2-4 | Low | `input/fsh/profiles/AddressItCore.fsh:97`, `PatientItCore.fsh:139`, `:145` | XPath expressions are kept on the invariants. They are not used in R4 validation and `it-city-required` has none. | Drop the `XPath:` lines, or add one to every invariant. |

### 3.3 Leftovers in FSH

- **[3.3-1]** **Stale TODO comments:** `input/fsh/profiles/PatientItCore.fsh:154` "ORGANZATION DA AGGIUNGERE LE REFERENCE QUANDO CI SARà il PROFILO": the Organization profile exists and is referenced. Delete it.
- **[3.3-2]** **Commented-out blocks:** `PractitionerItCore.fsh:29-34` and `:56-60` (the `idRegionale` slice and its invariant `pr-id-reg-oid-1`), `PatientItCore.fsh:108` (`pat-id-stp-1`, never defined), `codesystem.fsh:16-28` (a commented ValueSet), `valueSet.fsh:144-145`. Decide whether `idRegionale` belongs to this release; delete the rest.
- **[3.3-3]** **Unused rulesets:** none. `rulesets.fsh` has one ruleset (`ATCCopyrightForVS`), used once.
- **[3.3-4]** **Aliases:** 61 aliases, 3 unused (`$add-use`, `$uri`, `$vs-addr-use-org`). `$add-use` and `$cs-addr-use-org` are duplicates (same URL). 22 commented-out aliases in `aliases.fsh:14-112` point to the old `https://www.hl7.it/fhir/terminology/...` canonicals. Delete them.
- **[3.3-5]** **Placeholder text:** `AddressItCore.fsh:7` definition ends a sentence with "lavorare con un XXXX".
- **[3.3-6]** **Hard-coded metadata in extensions:** `professionePaziente.fsh:5-6` sets `^version = "0.1.0"` and `^date = "2020-06-30…"`; `titoloDiStudioPaziente.fsh:5` sets `^version = "0.1.1"`. The generated extensions carry these versions while the IG is 0.2.0. Both files also repeat `^publisher`, `^contact` and `^jurisdiction` that the other artifacts take from the IG. Delete these rules.
- **[3.3-7]** **Wrong texts:** `ExtDug.fsh:4` description is "Denominazione Urbanistica Ufficiale." but the extension is the *Generica* (DUG) code. `certificazione.fsh:3` title "Certificazione (Patient)" but the extension also applies to `Address` and `Patient.identifier`.
- **[3.3-8]** **Typos:** `AddressItCore.fsh:5` "caratterizzazine", `:67` "oragnizzato"; `CoverageItCore.fsh:17` "esensione"; `PatientItCore.fsh:24` "eccezionle", `:56` "Identifictivo".

### 3.4 Terminology

- **[3.4-1]** **Status and experimental flags differ** (Medium). The 8 XML CodeSystems in `input/vocabulary` are `active`; in FSH, `cs-codici-esenzioni`, `cs-nessuna-esenzione`, `cs-mds-idStruttureInterne` and `vs-tipoIdentificatore` are `active`, all other CodeSystems and ValueSets are `draft`. `cs-mds-asl` (`codesystem.fsh:71`) and `cs-province-istat` (`:820`) are `experimental = true`. The examples and `address-it-core` get 10 "Reference to draft/experimental CodeSystem" messages (7-10) from this. Use one rule for the release (e.g. all `draft` for 0.2.0, `experimental = false`).
- **[3.4-2]** **Versions in terminology** (Low). `cs-mds-asl` has `^version = "1.0.0"` (`codesystem.fsh:69`), `CS_professioni.xml` has `0.1.0`, `CS_titolostudio.xml` `28_10_2005`; the others take the IG version. Keep explicit versions only for external code systems where they are the source version, and say so.
- **[3.4-3]** **XML CodeSystems have no `url`** (Low). None of the 8 files in `input/vocabulary` has a `url` element; the Publisher derives it from the canonical. Add it explicitly so the files are valid on their own.
- **[3.4-4]** **Hand-written expansions** (Medium). `VsRoleCodeIt` (`valueSet.fsh:25`), `VsIstatDug` (`:181`) and `VsMinSanRegioni` (`:8454`) contain a stored `^expansion` (122 `contains` entries in all). The Publisher warns that the expansions have no parameters and no `used-codesystem` (6 warnings, 7-3), and the stored expansion can drift from the `compose`. Remove the `^expansion` rules and let the Publisher expand.
- **[3.4-5]** **`continente` property** (Medium). In `CS_unita_amm_territoriali_estere.xml` the property `continente` has type `code`, so the values `1`–`5` are validated as codes of the same CodeSystem and fail (5 warnings, 7-4). Change the type to `string` (or `integer`), or define a small CodeSystem for continents and reference it.
- **[3.4-6]** **Titles** (Low). Mixed style and language: "Address use", "Role Code", "WHO ATC" (English), "Valueset Stato Esenzioni", lower-case "identificativi per le Aziende Ospedaliere…" (`valueSet.fsh:5`, `:20`, `:93`, `:102`); "ISTAT - Unita Amministrative Territoriali Estere" without the accent while the sibling is "Unità".
- **[3.4-7]** **`cs-aifa-aic`** (Medium). The CodeSystem is `content = not-present`, so the AIC value set `aifa-aic` cannot be expanded and AIC codes cannot be validated: one warning on the Metformina example (7-1) and a suppressed expansion error (`ignoreWarnings.txt:10`). Either accept this and document it (knownIssues, 6.6-1) or publish the AIC list as a fragment.

---

## 4. Obligation profiles

This IG has no obligation profiles. No items.

---

## 5. Examples

| ID | Sev | Location | Finding | Fix |
|---|---|---|---|---|
| 5-1 | Medium | `input/fsh/examples/patientItExample.fsh:14`, `:43`, `:65`, `:93`; `PractitionerExample.fsh:38`; `PractitionerMMGExample.fsh:35`; `OrganizationExample.fsh:22` | `Address.country` uses four conventions: `"IT"`, `"100"`, `"120"` and `"Italia"`. `"120"` (`patientItExample.fsh:93`) is the Lazio region code, not a country code. The profile does not say which form to use. | Choose one convention (e.g. the ISO code or the name in `country`, the ISTAT code in the `codiceStato` extension), document it in the profile, and apply it to all examples. |
| 5-2 | Medium | `patientItExample.fsh:12`, `:15`, `:42`, `:45`, `:66`, `:92`, `:95` | Coded assignments to string elements put codes where names belong: `city = "079023"`, `state = "180"` / `"120"`. Both home addresses have no `city` value at all (only the `codiceComune` extension). | Put the name in the element (`"Catanzaro"`, `"Calabria"`) and the code in the extensions `codiceComune` / `codiceRegione`, as the Practitioner examples do. |
| 5-3 | Medium | `patientItExample.fsh:44`, `:64` | Postal codes don't match the city: `23839` (Lecco area) for Catanzaro; the birth place of `Patient-Esempio2` (Ciampino) has `88100`, the Catanzaro code copied from the first example. | Use `88100` and `00043`. |
| 5-4 | Medium | `PractitionerExample.fsh:24-31`, `PractitionerMMGExample.fsh:22-28` | The address is split into four `line` entries, one per part ("Via", "dei Genieri,", "1"). In the profile the parts are extensions of one `line` holding the full street line, as in the Patient examples. `PractitionerMMGExample.fsh:22` has a line with no value; `:27-28` has `line = "1"` with `houseNumber = "67"`. | One `line` with the full value and all the part extensions on it. |
| 5-5 | Medium | `PractitionerMMGExample.fsh:43-44` | `communication.coding` has a code and no system (visible warning, 7-2). | Add `system = urn:ietf:bcp:47` (code `it-IT` or `it`). |
| 5-6 | Low | `OrganizationExample.fsh:26` | `Organization-aslroma2-Esempio` has no `Usage:`. | Add `Usage: #example`. |
| 5-7 | Low | `PractitionerExample.fsh:22`, `PractitionerMMGExample.fsh:20` | Practitioners' addresses use `use = #home` in a work context (both have work telecoms). | Use `#work`, or say it is the home address. |
| 5-8 | Low | `ProcedureExample.fsh:4`, `:22` | Both Procedures have the same description, which also calls the profile a "risorsa". | Describe each example ("Prelievo ematico…", "Radiografia del torace…"); "profilo ProcedureItCore". |
| 5-9 | Low | `MedicationExample.fsh:10` | The AIC display is the package description only ("850 MG COMPRESSE…"), without the product name. | Prefix with the product name. |
| 5-10 | Low | All examples | Instance ids are UUIDs while the instance names are readable (`Patient-Esempio`). Page names in the published IG are therefore `Patient-3279afbb-….html`. Not wrong, but harder to cite. | Consider readable ids. |

---

## 6. Narrative pages

### 6.1 `changes.xml`

See 1-3. `changes.xml` is the template page and has to be written for 0.2.0.

### 6.2 Stale ballot or preview wording

| ID | Location | Original | Proposed |
|---|---|---|---|
| 6.2-1 | `input/pagecontent/changes.xml:7` | "2099-01-01 v0.1.0 - My IG R1 (STU ballot 1) Ballot Candidate" | Covered by 1-3. |
| 6.2-2 | `README.md:4-6` | Link to `https://www.hl7.it/fhir/itcore/0.1.0/` and a "Ballot: Guida alla votazione" section with examples from the `lab-report` repository and images (`input/images/comment.png`, `quest.png`) that are not in this repository. | Update the link and the ballot guide for this repository, or remove the ballot section. |

### 6.3 Broken or inconsistent links

| ID | Sev | Location | Finding → Fix |
|---|---|---|---|
| 6.3-1 | Medium | `input/pagecontent/index.md:16` | Links to `https://hl7.org/fhir/R4B`, but the IG is built on FHIR 4.0.1 → `https://hl7.org/fhir/R4/`. |

### 6.4 Content inconsistencies

| ID | Sev | Location | Finding → Proposed |
|---|---|---|---|
| 6.4-1 | Medium | `input/pagecontent/index.md:42-43` | Says `AddressItCore` is used for organisations; see 3.1-1. |
| 6.4-2 | Low | `input/pagecontent/index.md:19-78` | Lists the profiles but not the six extensions, and gives no link to any artifact. → Add links to the profile pages and a list of the extensions. |
| 6.4-3 | Low | `input/pagecontent/index.md:109-114` | The authors table starts with an empty row. → Delete it. |

### 6.5 Language and editorial conventions

- **[6.5-1]** **Language.** The pages and artifacts are in Italian but some headings are in English: "Details", "Cross-Version Analysis", "Intellectual Property Statements" (`index.md:93-94`, `:150`), and the menu (2-4). Choose one language for headings.
- **[6.5-2]** **Naming.** `index.md` uses the profile names `PatientItCore`, `PractitionerItCore`, `AddressItCore`, `PractitionerRoleItCore`; the FSH names are `PatientItcore`, `PractitionerItcore`, `AddressItcore`, `PractitionerRoleItcore` (lower-case "c"), while `CoverageItCore`, `OrganizationItCore`, `MedicationItCore` and `ProcedureItCore` use upper case. Align the FSH names (they become `StructureDefinition.name`).
- **[6.5-3]** **Markup.** `index.md:82` and `:87` empty `<p></p>` used as spacing; mixed Markdown and raw HTML lists. `downloads.xml` has no trailing newline.
- **[6.5-4]** **Contact data.** `index.md:119` publishes a personal Gmail address for an author. Check that this is intended.

### 6.6 `knownIssues.md`: suggested additions

There is no known-issues page. Suggested content:

- **[6.6-1]** AIC codes cannot be validated, because the AIC code system is published as `not-present` (3.4-7).
- **[6.6-2]** Display names of HL7 and SNOMED CT codes are given in English: the terminology server has no Italian designations for them (the suppressions in `ignoreWarnings.txt:13-48`).
- **[6.6-3]** Several code systems and value sets are `draft` / experimental (3.4-1), if that is kept for 0.2.0.

---

## 7. QA output and `ignoreWarnings.txt`

This section is based on the IG Publisher run of 2026-10-26 18:38, built as `0.2.0` / `draft` / `trial use`.

**Visible messages:** 0 errors, 14 warnings and 36 information messages.

| ID | Message | Resources | Fix |
|---|---|---|---|
| 7-1 | Warning: CodeSystem `cs-aifa-aic` could not be found, so the code cannot be validated; information: code `045018064` not in value set `aifa-aic` | `Medication-Metformina-Esempio` | See 3.4-7. If accepted, suppress both with a justification. |
| 7-2 | Warning: Coding has no system | `Practitioner-Medico-MMG` | 5-5. |
| 7-3 | 6 warnings, 3 information: expansion has no parameters / no identifier / no `used-codesystem` | `vs-istatdug`, `vs-minsan-regione`, `vs-role-code-it` | 3.4-4. |
| 7-4 | 5 warnings: code `1`–`5` is not a valid code in this code system; 1 information: property type `code` without a value set | `istat-unitaAmministrativeTerritorialiEstere` | 3.4-5. |
| 7-5 | Warning: resource has a language but the XHTML has no `lang` / `xml:lang` | `istat-ctsi03` (`CS_titolostudio.xml`) | Add `lang="it-IT" xml:lang="it-IT"` to the narrative `div`. |
| 7-6 | 5 information: Wrong Display Name (`Residenza`, `Lavoro`, `Domicilio temporaneo`, `Obsoleto`, `Indirizzo di Fatturazione`) | `vs-add-use-it` | Italian displays on purpose: suppress, like the other ValueSet display messages. |
| 7-7 | Information: Wrong Display Name 'Non cittadini riconosciuti' for `#888`; valid is 'Cittadini non riconosciuti' | `vs-istat-cittadinanza` | Fix the display at `input/fsh/terminology/valueSet.fsh:8770`. |
| 7-8 | Information: no Italian display for SNOMED CT `421026006` ('Oral tablet') | `Medication-Metformina-Esempio` | Suppress like the other SNOMED CT codes. |
| 7-9 | 10 information: Reference to draft / experimental CodeSystem (`cs-istatdug`, `cs-province-istat`, `cs-minsan-regione`) | Patient and Practitioner examples, `address-it-core` | Goes away with 3.4-1. |
| 7-10 | 12 information: property has only a code and no URI | `minsan-hsp` (6), `istat-unitaAmministrativeTerritoriali` (5), `istat-unitaAmministrativeTerritorialiEstere` (1) | Add `uri` to the properties, or accept and suppress. |
| 7-11 | Information: value set include has too many concepts to validate (7 895) | `vs-istatcomune` | Expected; suppress. |
| 7-12 | Information: `elementdefinition-maxValueSet` is deprecated | `coverage-it-core` (`Coverage.language`) | Comes from the R4 base definition; suppress. |

**Publication request check:** not run, as there is no `publication-request.json` (1-4).

**Suppressed messages:** 38 warnings and 95 hints. All 22 entries were used in this run.

**Suppressions that hide fixable issues:**

| ID | Lines | Entry (uses) | Fix |
|---|---|---|---|
| 7-13 | 10 | "Error from https://tx.fhir.org/r4: … CodeSystem 'cs-aifa-aic' could not be found, so the value set cannot be expanded" | Depends on 3.4-7. If kept, add a justification comment. |
| 7-14 | 7, 9 | "The link 'StructureDefinition-narrativeLink.html' … cannot be resolved"; "HL7 Defined CodeSystems should ensure that every concept has a definition" | No justification comment. The second one hides missing definitions in this IG's own CodeSystems: add a comment saying this is accepted for national code lists, or add definitions. |

**Wildcard suppressions (still justified?):**

- **[7-15]** `ignoreWarnings.txt:18` and `:21` suppress every "should have / could usefully have an OID assigned" message (23 and 15 uses). Added during this review session at the user's request. They will also hide the message for future artifacts.

**Stale entries:** none (0 entries with 0 uses).

---

## 8. Repository hygiene

- **[8-1]** **`it-template` is tracked but ignored.** Its files are committed, but `.gitignore:8` lists `/it-template`, so new template files (e.g. the `content/searchform.html` override added today to fix the template's malformed HTML) are not picked up by `git add`. Remove `/it-template` from `.gitignore`, or `git add -f` the new file.
- **[8-2]** **Untracked build scripts:** `_build.bat` and `_build.sh` are not committed. Commit them if they replace `_genonce.*`, or ignore them.
- **[8-3]** **Generated file in the root:** `Requirements-fromNarrative.json` is a Publisher output committed at the root. Delete it and add it to `.gitignore`.
- **[8-4]** **Uncommitted `.gitignore` change** (`.vscode/settings.json`). Commit it with the other working-copy changes.

---

## 9. Suggested order of work

1. Release configuration and changes page: 1-3, 1-4, 2-1, 2-2 (§1, §2).
2. Profile defects: 1-1, 1-2, 3.1-1, 3.1-2, 3.1-3, 3.2-1, 3.2-2 (§1, §3.1, §3.2).
3. Address conventions in the examples, which 1-1 and 3.2-1 depend on: 5-1 to 5-5 (§5).
4. Terminology: 3.4-1, 3.4-4, 3.4-5, 3.4-7, 7-5, 7-7 (§3.4, §7).
5. Leftovers and editorial: §3.3, §6, remaining §2 and §5 items.
6. Suppressions and known issues once the above is decided: 7-6, 7-8, 7-10 to 7-14, §6.6.
7. Repository hygiene (§8).

---

## Won't fix (accepted)

Items reviewed and accepted as they are. They keep their id and the structure of the section they come from; the last column gives the rationale.

No items yet.

---

## Fixed since the first review

Nothing yet: this is the first review. Fixes made earlier on 2026-10-26, before this review (working copy, not yet committed): `searchform.html` template override; `it-tipoEntita#ao` display typo in the CodeSystem; `irccs` and `cc-priv-na` displays in `VsTipoOrgSocioSanitaria`; `address-use#old` display; `ignoreWarnings.txt` entries listed in `reviews/review-notes.md`.
