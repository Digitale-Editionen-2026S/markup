# TEI-Briefe kodieren: Besonderheiten und Beispiele
## 1. Korrespondenzbeschreibung im Header: correspDesc
- Ort: teiHeader > profileDesc > correspDesc
- enthält eine formalisierte Beschreibung von Korrespondenzhandlungen (z. B. Versand, Empfang)
- Kernelemente:
  - correspAction mit @type="sent" | "received" | "transmitted" | ...
  - darin u. a. persName/orgName, address, placeName, date sowie @ref zur Verknüpfung auf Ziele mit @xml:id

Beispiel (strukturierte Absender- und Empfängerangaben, datiert und ortsbezogen):

```xml
<TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="de">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>Brief: Goethe an Zelter, 12. Mai 1825</title>
      </titleStmt>
      <publicationStmt>
        <p>Unveröffentlicht; Beispiel.</p>
      </publicationStmt>
      <sourceDesc>
        <p>Autografischer Brief; siehe physische Beschreibung weiter unten.</p>
      </sourceDesc>
    </fileDesc>
    <profileDesc>
      <particDesc>
        <listPerson>
          <person xml:id="goethe">
            <persName>Johann Wolfgang von Goethe</persName>
          </person>
          <person xml:id="zelter">
            <persName>Carl Friedrich Zelter</persName>
          </person>
        </listPerson>
      </particDesc>
      <settingDesc>
        <listPlace>
          <place xml:id="weimar">
            <placeName>Weimar</placeName>
          </place>
          <place xml:id="berlin">
            <placeName>Berlin</placeName>
          </place>
        </listPlace>
      </settingDesc>
      <correspDesc>
        <correspAction type="sent">
          <persName ref="#goethe">Johann Wolfgang von Goethe</persName>
          <placeName ref="#weimar">Weimar</placeName>
          <date when="1825-05-12">12. Mai 1825</date>
          <address>
            <street>Frauenplan 1</street>
            <settlement>Weimar</settlement>
            <country key="DE">Deutschland</country>
          </address>
        </correspAction>
        <correspAction type="received">
          <persName ref="#zelter">Carl Friedrich Zelter</persName>
          <placeName ref="#berlin">Berlin</placeName>
          <date when="1825-05-16">16. Mai 1825</date>
          <address>
            <street>Singe-Akademie</street>
            <settlement>Berlin</settlement>
            <country key="DE">Deutschland</country>
          </address>
        </correspAction>
      </correspDesc>
    </profileDesc>
    <!-- physische Merkmale siehe Abschnitt 6 -->
  </teiHeader>
  <text>
    <body>
      <!-- Textbeispiele folgen in den nächsten Abschnitten -->
    </body>
  </text>
</TEI>
```

- Verwenden Sie möglichst normierte Datumsangaben mit @when (ISO 8601).
- Verknüpfen Sie Personen/Orte über @ref zu <listPerson>/<listPlace> im Header, wenn vorhanden.
- @ref verweist auf ein Ziel mit @xml:id (z. B. ref="#goethe" auf xml:id="goethe").
- address kann sowohl im Header (in correspAction) als auch im Textkörper (z. B. Briefkopf oder Umschlag) auftreten.

## 2. Adressen: address

- address dient der strukturierten Angabe von Adressbestandteilen.
- Innerhalb von correspDesc oder im Text (z. B. Briefkopf, Umschlag oder Adressfeld auf dem Blatt).
- Für unstrukturierte Zeilen: addrLine; für strukturierte: street, postCode, settlement, region, country etc.

Beispiel (unstrukturierte Adresszeilen, etwa Umschlagbeschriftung im Text):

```xml
<div type="envelope">
  <head>Umschlag</head>
  <address>
    <addrLine>An Herrn</addrLine>
    <addrLine>C. F. Zelter</addrLine>
    <addrLine>Singe-Akademie</addrLine>
    <addrLine>Berlin</addrLine>
  </address>
</div>
```

Beispiel (strukturierte Adresse im Briefkopf):

```xml
<opener>
  <address>
    <street>Frauenplan 1</street>
    <postCode>99423</postCode>
    <settlement>Weimar</settlement>
    <country key="DE">Deutschland</country>
  </address>
  <!-- weitere opener-Bestandteile -->
</opener>
```

## 3. Briefanfang: opener mit dateline und salute

- opener fasst den Briefanfang zusammen.
- Übliche Inhalte: dateline (Ort/Datum), salute (Anrede).
- dateline enthält häufig placeName und date.
- salute kann mit @type="initial" gekennzeichnet werden (optional).

Beispiel:

```xml
<opener>
  <dateline>
    <placeName ref="#weimar">Weimar</placeName>,
    <date when="1825-05-12">12. Mai 1825</date>
  </dateline>
  <salute type="initial">Lieber Freund,</salute>
</opener>
```

Hinweise:
- dateline kann auch am Briefschluss stehen (siehe closer).
- placeName und date im Text sind unabhängig von den korrespondierenden Angaben im Header, sollten aber konsistent sein.

## 4. Briefschluss: closer mit salute und signed

- closer enthält den Abschluss des Briefes.
- Typische Inhalte: salute (Grußformel), signed (Unterschrift), optional auch eine dateline (z. B. bei Nachdatierung am Ende).

Beispiel:

```xml
<closer>
  <salute type="closing">Mit herzlichen Grüßen</salute>
  <signed>
    <persName ref="#goethe">J. W. v. Goethe</persName>
  </signed>
</closer>
```

Beispiel mit dateline im Schluss:

```xml
<closer>
  <dateline>
    <placeName ref="#weimar">Weimar</placeName>,
    <date when="1825-05-12">12. Mai 1825</date>
  </dateline>
  <salute type="closing">Hochachtungsvoll</salute>
  <signed>Goethe</signed>
</closer>
```

## 5. Nachträge: postscript

- postscript markiert Postskripta (P.S., PS, NB etc.) und folgt üblicherweise dem closer.
- Kann Absätze, Zeilen oder Inline-Kommentar enthalten.

Beispiel:

```xml
<postscript>
  <p>P.S.: Bitte grüßen Sie die Freunde in Berlin von mir.</p>
</postscript>
```

## 6. Zusammenhängendes Minimalbeispiel

Das folgende Beispiel kombiniert die textlichen und beschreibenden Bestandteile für einen einfachen Brief:

```xml
<TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="de">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>Brief: Goethe an Zelter, 12. Mai 1825</title>
        <author xml:id="goethe">Johann Wolfgang von Goethe</author>
      </titleStmt>
      <publicationStmt>
        <p>Unveröffentlicht; Beispiel.</p>
      </publicationStmt>
      <sourceDesc>
        <msDesc>
          <msIdentifier>
            <repository>Goethe- und Schiller-Archiv</repository>
            <idno>GSA 12345</idno>
          </msIdentifier>
          <physDesc>
            <objectDesc>
              <supportDesc>
                <support>Papier</support>
                <extent>1 Blatt, 2 Seiten</extent>
                <watermark>Foolscap-Wasserzeichen mit Stern</watermark>
              </supportDesc>
            </objectDesc>
            <decoDesc>
              <stamp>Ovaler Archivstempel in violetter Tinte</stamp>
            </decoDesc>
            <sealDesc>
              <seal type="wax">Roter Wachssiegelrest am Falz</seal>
            </sealDesc>
          </physDesc>
        </msDesc>
      </sourceDesc>
    </fileDesc>
    <profileDesc>
      <correspDesc>
        <correspAction type="sent">
          <persName ref="#goethe">Johann Wolfgang von Goethe</persName>
          <placeName xml:id="weimar">Weimar</placeName>
          <date when="1825-05-12">12. Mai 1825</date>
          <address>
            <street>Frauenplan 1</street>
            <settlement>Weimar</settlement>
            <country key="DE">Deutschland</country>
          </address>
        </correspAction>
        <correspAction type="received">
          <persName xml:id="zelter">Carl Friedrich Zelter</persName>
          <placeName xml:id="berlin">Berlin</placeName>
        </correspAction>
      </correspDesc>
    </profileDesc>
  </teiHeader>
  <text>
    <body>
      <opener>
        <dateline>
          <placeName ref="#weimar">Weimar</placeName>,
          <date when="1825-05-12">12. Mai 1825</date>
        </dateline>
        <salute type="initial">Lieber Freund,</salute>
      </opener>
      <p>Ich danke Ihnen herzlich für Ihren letzten Brief und die beigefügten Noten ...</p>
      <closer>
        <salute type="closing">Mit herzlichen Grüßen</salute>
        <signed>
          <persName ref="#goethe">J. W. v. Goethe</persName>
        </signed>
      </closer>
      <postscript>
        <p>P.S.: Das Konzert am kommenden Sonntag beginnt um fünf Uhr.</p>
      </postscript>
      <!-- Optional: Umschlag- oder Adressseite als eigener Abschnitt -->
      <div type="envelope">
        <head>Umschlag</head>
        <address>
          <addrLine>An Herrn</addrLine>
          <addrLine>Carl Friedrich Zelter</addrLine>
          <addrLine>Singe-Akademie</addrLine>
          <addrLine>Berlin</addrLine>
        </address>
      </div>
    </body>
  </text>
</TEI>
```

## 8. Praktische Hinweise

- Verwenden Sie @when/@notBefore/@notAfter für datumsbezogene Unsicherheiten.
- Nutzen Sie @type an salute zur Unterscheidung von Anrede und Schlussformel.
- signed kann Personen- oder Namenselemente enthalten (z. B. persName), insbesondere wenn Sie Normdaten verlinken.
- address: Wählen Sie addrLine für zeilengetreue Wiedergabe; nutzen Sie strukturierte Unterelemente für semantische Auswertung.
- Physische Merkmale gehören in die msDesc/physDesc im sourceDesc des Headers; diese Angaben beschreiben das Trägerobjekt, nicht den Textinhalt.

Wenn Sie möchten, kann ich die Beispiele an Ihr konkretes Projektprofil (z. B. Normdaten, Modulaktivierung, ODD) anpassen.