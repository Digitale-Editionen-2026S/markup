### Navigation:

- [**Abschnitte/Blöcke**](#abschnitte-bloecke)
- [**Absatz**](#absatz)
- [**Überschrift**](#ueberschrift)
- [**Unterüberschrift**](#unterueberschrift)
- [**Zeilenwechsel**](#zeilenwechsel)
- [**Strophen/Verse**](#strophen-verse)
- [**Seitenwechsel**](#seitenwechsel)
- [**Streichung**](#streichung)
- [**Hinzufügung**](#hinzufuegung)
- [**Ersetzung**](#ersetzung)
- [**Unklarer Text**](#unclear-text)
- [**Regularisierungen/Normalisierungen**](#regularisierungen_und-normalisierungen)
- [**Leerraum im Text**](#leerraum-im-text)
- [**Paginierungen/Foliierungen im Quelldokument**](#paginierungen-folierungen-im-quelldokument)
- [**Verknüpfung mit Faksimiles/Layout**](#verknuepfung-mit-faksimileslayout)
- metadaten im Header: [**TEI Header**](#header-info)
- [**Globale Attribute**](#globale-attribute)

---

# Einige wichtige TEI-Elemente für die Textstrukturierung

<a id="abschnitte-bloecke"></a>

- Abschnitte/Blöcke: [`<div>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-div.html) mit Typisierung über @type

  ```xml
  <div type="chapter">
    <head>XSLT – der erste Kontakt</head>
    <p>Leiden und Schmerz sind …</p>
  </div>
  ```

<a id="absatz"></a>

- Absatz: [`<p>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-p.html)

  ```xml
  <p>Es begab sich aber zu der Zeit...</p>
  ```

<a id="ueberschrift"></a>

- Überschrift: [`<head>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-head.html) (oft innerhalb von [`<div>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-div.html))

  ```xml
  <div type="chapter">
    <head>Über Paratextualität</head>
    <p>Beiwerk, könnte man sagen …</p>
  </div>
  ```

<a id="unterueberschrift"></a>

- Unterüberschrift: [`<head>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-head.html) mit Typisierung oder Hierarchie über verschachtelte [`<div>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-div.html)s
  Optionen:
  - Unterebene als eigenes [`<div>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-div.html) mit Typisierung:
    ```xml
    <div type="section">
      <head>Hauptüberschrift</head>
      <div type="subsection">
        <head>Unterüberschrift</head>
      </div>
    </div>
    ```
  - Oder einheitliches [`<div>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-div.html), aber [`<head type="sub">`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-head.html):
    ```xml
    <div>
      <head>Hauptüberschrift</head>
      <head type="sub">Unterüberschrift</head>
    </div>
    ```

<a id="zeilenwechsel"></a>

- Zeilenwechsel: [`<lb/>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-lb.html) (line beginning!)
  - Wichtige Attribute:
    - @n: Zeilennummer
    - @facs: optionaler Verweis auf eine Zone im Faksimile

  - Beispiel (einfache Zeilenzählung):

  ```xml
  <p>
      <lb n="2"/>Hier beggint die 2te Zeile.
      <lb n="3"/>Hier beggint die 3te Zeile.
  </p>
  ```

<a id="strophen-verse"></a>

- Strophen/Verse: [`<lg>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-lg.html)/[`<l>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-l.html)

  ```xml
  <lg>
      <l n="1">Und als der Krieg im vierten Lenz</l>
      <l n="2">Keinen Ausblick auf Frieden bot</l>
      <l n="3">Da zog der Soldat seine Konsequenz</l>
      <l n="4">Und starb den Heldentod.</l>
  </lg>
  ```

<a id="seitenwechsel"></a>

- Seitenwechsel: [`<pb/>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-pb.html) (page beginning!)
  - Wichtige Attribute:
    - @n: die normalisierte Nummer (z. B. 3r bzw. 5)
    - @facs: Verweis auf das zugehörige Faksimile bzw. die Surface (die weiter oben im Dokument definiert werden)
    - @xml:id: eindeutiger Identifikator

    - Einfachster Fall:

    ```xml
    <pb />
    ```

    - Einfacher Fall (Foliierung, Faksimile-Verknüpfung):

    ```xml
    <pb n="3r" type="foliation" facs="#surf-f003r"/>
    ```

<a id="streichung"></a>

- Streichung: [`<del>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-del.html) (Darstellung ggf. mit @rend/@rendition)

  ```xml
  Er war <del rend="strikethrough">sehr</del> freundlich.
  ```

<a id="hinzufuegung"></a>

- Hinzufügung: [`<add>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-add.html) (Position mit @place; Hand mit @hand)

  ```xml
  Er war <add place="above" hand="#h1">sehr</add> freundlich.
  ```

<a id="ersetzung"></a>

- Ersetzung: [`<subst>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-subst.html) mit `<del>` und `<add>`

  ```xml
  Es war ein
  <subst>
    <del>schöner</del>
    <add>furchtbarer</add>
  </subst>
  Tag.
  ```

<a id="regularisierungen_und-normalisierungen"></a>

- Regularisierungen und Normalisierungen: [`<reg>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-reg.html) und [`<corr>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-corr.html)

  ```xml
  Er fragte
  <choice>
  <sic>nud</sic>
  <corr>und</corr>
  </choice> wartete auf die Antwort.
  <choice>
  <sic>Hülfe</sic>
  <reg>Hilfe</reg>
  </choice> war dringend nötig.

  ```

<a id="leerraum-im-text"></a>

- Leerraum im Text
  - Denken Sie daran, dass TEI/XML standardmäßig keine wiederholten Leerzeichen speichert. Sechs Leerzeichen entsprechen einem. Ein Tabulator entspricht einem. Zwei Tabulatoren entsprechen einem. Etc. … Alle komplexen Leerzeichen in der Transkription müssen explizit kodiert werden!
  - bewusste Leerstelle/Abstand: [`<space/>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-space.html)
  - fehlender/ausgelassener/defektiver Text: [`<gap/>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-gap.html)

  ```xml
   Doch in den Abgrund,<space quantity="6" unit="chars"/>  sagen die Sänger sich.
  ```

  ```xml
  Il n'y a pas de hors-<gap reason="illegible" quantity="1" unit="words"/>.
  ```

  <a id="unclear-text"></a>

- Unklarer Text: [`<unclear/>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-unclear.html)

  ```xml
  Wir trafen dort den Herrn <unclear reason="illegible">Mustermann</unclear>, einen freundlichen …
  ```

<a id="paginierungen-folierungen-im-quelldokument"></a>

- Paginierungen/Foliierungen im Quelldokument: [`<fw/>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-fw.html)
  - das Element kann auch für Columnen- oder Zeilennummern verwendet werden, wenn die Vorlage solche enthält

  ```xml
  <fw>3</fw>
  <!-- oder -->
  <fw type="pageNum" place="top right">5</fw>
  ```

<a id="verknuepfung-mit-faksimileslayout"></a>

- Verknüpfung mit Faksimiles/Layout: [`<facsimile>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-facsimile.html)
  - Definieren der Seiten/Surfaces im <facsimile>-Element (meist am Anfang des TEI-Dokuments)

  ```xml
  <facsimile>
    <surface xml:id="surf-f003r" n="3r">
      <!-- optional: <graphic url="..."/> und/oder <zone> … -->
    </surface>
    <surface xml:id="surf-f003v" n="3v"/>
  </facsimile>
  ```

<a id="header-info"></a>

- Metadaten sollten im Header platziert werden: [`<teiHeader>`](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-teiHeader.html)
  - siehe auch die [TEI Header-Dokumentation](https://tei-c.org/release/doc/tei-p5-doc/en/html/HD.html)
  ```xml
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>Der Titel des Werks</title>
        <author>Max Mustermann</author>
      </titleStmt>
      <publicationStmt>
        <publisher>Der Verlag</publisher>
        <date>2024</date>
      </publicationStmt>
      <sourceDesc>
        <bibl>Die Quelle, z. B. die Handschrift oder die Ausgabe, die transkribiert wurde</bibl>
      </sourceDesc>
    </fileDesc>
    …
  ```

<a id="globale-attribute"></a>

- [Globale Attribute](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.html): Alle TEI-Elemente können mit den globalen Attributen versehen werden z.B.:
  - [@xml:id](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.html#tei_att.xml-id) - "unique identifier"
  - [@n](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.html#tei_att.n) – non-unique label oder Nummer
  - [@xml:lang](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.html#tei_att.xml-lang) – Sprache (nach ISO Standard)
  - [@rend](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.rendition.html#tei_att.rend) und [@rendition](https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.rendition.html#tei_att.rendition) – visuelles Erscheinungsbild
