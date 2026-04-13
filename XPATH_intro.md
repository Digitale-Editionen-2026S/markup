## Navigation
- [Was ist XPath](#was-ist-xpath)
- [Datenmodell und Knotentypen](#datenmodell-und-knotentypen)
- [Pfad-Syntax und Startpunkte](#pfad-syntax-und-startpunkte)
- [Achsen](#achsen)
- [Filter](#filter)
- [Funktionen und Operatoren](#funktionen-und-operatoren)
- [Namespaces (TEI) – wichtig!](#namespaces-tei--wichtig)
- [Beispiele für TEI-Selektoren](#beispiele-für-tei-selektoren)
- [Existenzprüfung](#existenzprüfung)

---

## Was ist XPath
- Sprache zur Adressierung/Selektion von Teilen eines XML-Baums/einer XML-Datei.
- Wird u.a. in XSLT verwendet.
- Versionen: XPath 1.0 (breit unterstützt), 2.0/3.1 (reichere Typen, Funktionen, Sequenzen; in Python nicht standardmäßig verfügbar).

## Datenmodell und Knotentypen
- Knotenarten: Element, Attribut, Text, Dokument-Knoten, Namespace, …
- Kontext bestimmt Auswertung, z. B.:
  - aktueller Knoten: `.`

## Pfad-Syntax und Startpunkte
- `/` Wurzel des Dokuments (in unserem Fall das TEI-Element)
- `.` aktueller Knoten
- `..` Elternknoten des aktuellen Knotens
- `//` alle Nachfahren unterhalb (inkl. aktueller Knoten), bzw. das TEI-Element und alle seine Nachfahren, wenn am Anfang eines Pfades verwendet
- Kindschritte: `a/b/c` (die c-Knoten, die Kinder von b sind, die Kinder von a sind), beliebige Nachfahren: `a//c` (alle c-Knoten unterhalb von a)
- Attribute: `@id`, `//@xml:id`

Beispiele:
- `/tei:TEI/tei:text/tei:body/tei:div` (alle divs im body)
- `//tei:p` (alle Absätze im Dokument)
- `.//tei:note` (alle Noten unterhalb des aktuellen Knotens)

## Achsen (vorerst weniger relevant, aber gut zu wissen)
- `child::tei:p` → Kind-Elemente (Abkürzung: `tei:p`)
- `descendant::tei:note` → Nachfahren (Abkürzung: `//tei:note`)
- `parent::node()` → Elternknoten (Abkürzung: `..`)
- `ancestor::tei:div` → Vorfahren
- `following-sibling::tei:p` / `preceding-sibling::tei:p` → Geschwister
- `attribute::xml:id` → Attribute (Abkürzung: `@xml:id`)
- `self::node()` → aktueller Knoten

## Filter
- Prädikate in eckigen Klammern filtern Node-Sets/Sequenzen.
- Nach Wert: `tei:div[@type='letter']`
- Nach Position:
  - `tei:div[1]` (erstes `div`-Kind)
  - `(//tei:note)[1]` (erste Note im Dokument)
- Kombination mit `and`: `tei:div[@type='letter' and @n=3]` (div mit dem type „letter“ und n=3)
- Positionen: `position()`, `last()`
  - `tei:pb[position()=1]` (erster Seitenwechsel)
  - `tei:pb[last()]` (letzter Seitenwechsel)

## Funktionen und Operatoren
- Zeichenketten: 
  - `normalize-space()`  → entfernt führende und nachfolgende Leerzeichen
  - `contains()` → prüft, ob eine Zeichenkette eine andere enthält
  - `starts-with()` → prüft, ob eine Zeichenkette mit einer anderen beginnt
  - Beispiele:
    - `contains(., 'Renner')`
    - `normalize-space(tei:head) != '')`

- Numerisch: 
  - `count()` → zählt die Anzahl der Knoten
  - `sum()` → summiert numerische Werte
  - `number()` → konvertiert in eine Zahl
- Operatoren: `=`, `!=`, `<`, `<=`, `>`, `>=`; logische `and`, `or`

## Namespaces (TEI) – wichtig!
- TEI-Elemente stehen im Namespace `http://www.tei-c.org/ns/1.0` und müssen im XPath mit Präfix angesprochen werden.
- Im XSLT-Stylesheet z. B.:
  - `xmlns:tei="http://www.tei-c.org/ns/1.0"`
  - Selektoren: `//tei:div`, `/tei:TEI/tei:teiHeader`
- Attribute wie `@xml:id` sind im `xml`-Namespace: `@xml:id` funktioniert in XSLT ohne zusätzliche Präfix-Deklaration.

## Beispiele für TEI-Selektoren
- Alle Absätze: `//tei:p`
- Erste Überschrift im body: `(/tei:TEI/tei:text/tei:body//tei:head)[1]`
- Personen mit `@ref`: `//tei:persName[@ref]`
- Noten in Apparaten: `//tei:note[@type='app']`
- Briefe vom Typ „letter“ mit Nummer: `//tei:div[@type='letter' and @n]`