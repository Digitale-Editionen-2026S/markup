

### Navigation:

- [**Was ist XSLT**](#was-ist-xslt)
- [**Warum XSLT**](#warum-xslt)
- [**Haupt-Stylesheet und Module**](#haupt-stylesheet-und-module)
- [**Templates und match**](#templates-und-match)
- [**apply-templates**](#apply-templates)
- [**copy**](#copy)
- [**Parameter und Variablen**](#parameter-und-variablen)
- [**Wiederverwendung mit call-template**](#wiederverwendung-mit-call-template)
- [**Stylesheets zusammenbauen**](#stylesheets-zusammenbauen)
- [**Minimales TEI-Stylesheet**](#minimales-tei-stylesheet)



---

# XSLT-Grundlagen für TEI und XML-Transformation

<a id="was-ist-xslt"></a>

- Was ist XSLT
  - Deklarative Transformationssprache für XML (W3C-Standard; XSLT 1.0/2.0/3.0)
  - Arbeitet template-basiert: Muster (`match`) werden in Outputfragmente übersetzt
  - Nutzt XPath zur Navigation und Selektion im XML-Baum
  - Typische Ergebnisse: HTML, Text oder anderes XML

<a id="warum-xslt"></a>

- Warum XSLT
  - TEI XML kann in HTML-Seiten für Lesefassungen, Apparate, Register oder Metadaten transformiert werden
  - Navigationsstrukturen wie Inhaltsverzeichnisse oder Indizes lassen sich automatisch erzeugen
  - Inhalte können normalisiert oder angereichert werden, etwa Personen- und Ortsreferenzen über `@ref`
  - Größere Texte lassen sich in mehrere Seiten aufteilen, etwa pro Kapitel oder Brief, z. B. mit `xsl:result-document`
  - Inhalt und Präsentation bleiben getrennt: TEI für die Daten, XSLT/CSS/JS für die Darstellung

<a id="haupt-stylesheet-und-module"></a>

- Haupt-Stylesheet und Module
  - Üblicherweise gibt es ein Haupt-Stylesheet als Einstiegspunkt
  - Dort werden globale Parameter, Imports und Includes definiert
  - Zusätzliche Modul-Stylesheets können logische Bereiche separieren, z. B. `tei-header.xsl`, `body.xsl` oder `helpers.xsl`

<a id="templates-und-match"></a>

- Templates und `match`
  - `xsl:template match="…"` legt fest, welche Knoten wie verarbeitet werden
  - Das `match`-Attribut enthält einen XPath-Ausdruck
  - Templates sind das Grundprinzip von XSLT: richtiges Element finden, Ausgabe erzeugen

<a id="apply-templates"></a>

- `xsl:apply-templates`
  - delegiert die Verarbeitung an andere passende (bzw. alle matchenden) Templates
  - ist zentral für die rekursive, baumartige Verarbeitung von XML
  - wird oft genutzt, um von einem übergeordneten Element zu seinen Kindern weiterzugehen

<a id="copy"></a>
  - `xsl:copy` kopiert den aktuellen Knoten ohne seine Nachfahren vollständig mitzunehmen; diese werden meist mit `xsl:apply-templates` ergänzt

<a id="parameter-und-variablen"></a>

- Parameter und Variablen
  - `xsl:param` dient der Konfiguration eines Stylesheets oder Templates
  - `xsl:variable` bindet Werte oder Knotensequenzen für die weitere Verarbeitung
  - Beides hilft dabei, Regeln übersichtlicher und wiederverwendbar zu halten

<a id="wiederverwendung-mit-call-template"></a>

- Wiederverwendung mit `call-template`
  - `xsl:call-template` ruft ein benanntes Template gezielt auf

<a id="stylesheets-zusammenbauen"></a>

- Stylesheets zusammenbauen
  - `xsl:import` und `xsl:include` verteilen größere Transformationslogik auf mehrere Dateien
  - So bleibt das Haupt-Stylesheet übersichtlich und thematisch getrennte Logik kann separat gepflegt werden

<a id="minimales-tei-stylesheet"></a>

- Minimales TEI-Stylesheet
  - ein einfacher Einstieg für Transformationen im TEI-Namespace

```xml
<!-- Standard-XSLT-Template: diesen Anfang können Sie direkt übernehmen -->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                version="2.0">
  <xsl:output method="html" html-version="5" encoding="UTF-8" indent="yes"/>

  <!-- Root-Template: erzeugt die HTML-Hülle basierend auf dem Root-Element TEI -->
  <xsl:template match="/">
    <html lang="de">
      <head>
        <meta charset="utf-8"/>
        <title><xsl:value-of select="(/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title)[1]"/></title>
        <link rel="stylesheet" href="styles.css"/>
      </head>
      <body>
        <h1><xsl:value-of select="(/tei:TEI//tei:title)[1]"/></h1>
        <xsl:apply-templates select="/tei:TEI/tei:text"/>
      </body>
    </html>
  </xsl:template>
<!-- Identity-Template: kopiert alle Knoten und Attribute unverändert (also in unserem Fall einfach das Quell-XML) -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
```