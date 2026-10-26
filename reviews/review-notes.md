# Review notes – hl7.fhir.it.core

Decisions already taken for this guide. Consistency reviews do not re-raise these as open items.

## Accepted QA messages (suppressed in `input/ignoreWarnings.txt`)

Decided on 2026-10-26.

- **OIDs:** no OIDs are assigned. All "should have an OID assigned" (CodeSystems, ValueSets) and "could usefully have an OID assigned" (ImplementationGuide, StructureDefinitions) messages are suppressed with wildcards.
- **Missing Italian displays:** the terminology server has no Italian designations for `urn:iso:std:iso:3166#IT`, the HL7 v3 codes used (`v3-NullFlavor#OTH`, `v3-ActCode#PUBLICPOL`, `v3-ActStatus#active`) and SNOMED CT codes used in examples (`1290586005`, `51185008`, `396540005`). The English displays are kept.
- **Italian displays in value sets:** ValueSets may use Italian displays for HL7 codes (`v3-ActStatus`, `v3-NullFlavor#UNK`, `v2-0203#DL`, `#PPN`). The "Wrong Display Name" information messages for them are accepted.
- **Deprecated `regex` extension:** comes from definitions this IG builds on, not from its own FSH. Accepted.
- **Large value set expansions:** "The value set expansion is too large, and only a subset has been displayed" is accepted.

## Conventions

- The `address-use#old` display in `vs-add-use-it` is "Obsoleto" (Italian, like the other entries in that value set).
- `it-tipoEntita#ao` is "Azienda Ospedaliera" (the CodeSystem's earlier "Opedaliera" was a typo).
- The template's `searchform.html` is overridden in `it-template/package/content/` to fix its malformed HTML.
