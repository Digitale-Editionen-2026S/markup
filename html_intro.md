## Was ist HTML?
- HTML = HyperText Markup Language
- Beschreibt die Struktur von Webseiten (Inhalte, Abschnitte, Beziehungen)
- Besteht aus Elementen (Tags) mit optionalen Attributen
- Wird von Browsern interpretiert und gerendert
- Trennung der Schichten: Struktur (HTML), Präsentation (CSS), Verhalten (JavaScript)

---

## Grundgerüst eines HTML-Dokuments
- Pflichtbestandteile: `<!DOCTYPE html>`, `<html>`, `<head>`, `<body>`
- `lang`-Attribut für Sprache setzen
- Metadaten im `head`, Inhalte im `body`
```html
<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <title>Meine erste Edition</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Einführung in HTML">
  </head>
  <body>
    <h1>Meine erste Edition</h1>
    <p>… text text text …</p>
  </body>
</html>
```

---

## Elemente, Tags und Attribute
- Öffnender und schließender Tag, z. B. `<p>...</p>`
- Leere Elemente ohne Inhalt, z. B. `<img>`, `<br>`
- Attribute liefern zusätzliche Informationen
- Globale Attribute: `id`, `class`, `title`, `lang`, `dir`
```html
<p id="einleitung" title="Ein kurzer Absatz">Hallo!</p>
<p class="untergeordnet">Dieser Absatz ist untergeordnet.</p>
<img src="bild.jpg" alt="Beschreibung des Bildes" width="300" height="200">
```
- die Werte von id und class können für CSS-Selektoren verwendet werden, z. B. `#einleitung` oder `.untergeordnet`. Id-Werte müssen eindeutig sein, während class-Werte in mehreren Elementen vergeben werden können (und meist auch sollten).

---

## Textstrukturierung
- Überschriften: `<h1>` bis `<h6>` (hierarchisch, nur eine `<h1>` pro Seite empfohlen)
- Absätze: `<p>`
- Betonung: `<em>` (inhaltliche Betonung), `<strong>` (stark betont)
- Inline vs. Block: `<span>` (inline), `<div>` (block)
```html
<h1>Überschrift der Seite</h1>
<h2>Überschrift des Abschnitts</h2>
<p>Dies ist ein <em>wichtiger</em> Absatz mit <strong>starker Betonung</strong>.</p>
<div><p>Ein Absatz innerhalb eines Blockbereichs</p><p>Ein weiterer Absatz innerhalb desselben Blockbereichs</p></div>
<p><span>Ein inline-Textstück</span>, also ein Bereich, der nicht als Block dargestellt werden sollte.</p>
```

---

## Links und Navigation
- Hyperlinks mit `<a href="...">`
- Absolute vs. relative URLs
- Barrierefreiheit: Linktexte aussagekräftig formulieren
- Navigation oft in `<nav>`-Bereichen organisiert
- Ankerlinks mit `#` für Sprungmarken innerhalb der Seite
```html
<nav>
  <ul>
    <li><a href="/index.html">Startseite</a></li>
    <li><a href="https://example.com">Externe Ressource</a></li>
    <li><a href="#kontakt">Zum Kontaktbereich</a></li>
  </ul>
</nav>
<p id="kontakt">Kontakt: <a href="mailto:info@example.com">E-Mail senden</a></p>
```

---

## Bilder und Medien (ohne CSS)
- Bilder: `<img src alt>` – `alt` ist Pflicht (Beschreibung)
- Einfache Einbettung von Video/Audio
```html
<img src="foto.jpg" alt="Ein Faksimile des edierten Dokuments">
```

---

## Listen und Tabellen
- Ungeordnete Listen: `<ul>`, geordnete Listen: `<ol>`, Einträge: `<li>`
- Beschreibungslisten: `<dl>`, `<dt>`, `<dd>`
- Tabellen: `<table>`, `<thead>`, `<tbody>`, `<tr>`, `<th>`, `<td>`
```html
<ul>
  <li>Apfel</li>
  <li>Banane</li>
</ul>

<dl>
  <dt>HTML</dt>
  <dd>Auszeichnungssprache für Webinhalte</dd>
</dl>

<table>
  <thead>
    <tr><th>Produkt</th><th>Preis</th></tr>
  </thead>
  <tbody>
    <tr><td>Buch</td><td>12,99 €</td></tr>
    <tr><td>Stift</td><td>1,50 €</td></tr>
  </tbody>
</table>
```

---

## Semantische HTML5-Elemente
- Strukturieren Inhalte in bedeutungsvolle Bereiche:
  - `<header>` Kopfbereich
  - `<nav>` Navigation
  - `<main>` Hauptinhalt (einmal pro Seite)
  - `<article>` in sich geschlossener Beitrag
  - `<section>` thematischer Abschnitt
  - `<aside>` ergänzende Inhalte
  - `<footer>` Fußbereich
```html
<header>
  <h1>Meine Edition</h1>
</header>
<main>
  <article>
    <h2>Textzeuge 1</h2>
    <p>Inhalt...</p>
  </article>
  <aside>Informationen zur Entstehung des Textes</aside>
</main>
<footer>&copy; 2026</footer>
```
---

## Gute Praxis, Validierung und Ressourcen
- Saubere Struktur, semantische Tags, sinnvolle `alt`-Texte
- Einhaltung der Barrierefreiheit (z. B. sinnvolle Überschriftenhierarchie, Labels)
- Well-formed HTML: Alle Tags korrekt geöffnet und geschlossen, keine verschachtelten Fehler.
- Validierung (gegen ein definiertes Schema): https://validator.w3.org/
- Ressourcen:
  - MDN Web Docs (developer.mozilla.org)
  - HTML Living Standard (whatwg.org)
  - WebAIM (webaim.org) für Accessibility
  - Google, Stack Overflow – wahrscheinlich hatte bereits jemand Ihr Problem
  - LLMs können auch sehr gut helfen. Aber prüfen Sie die Outputs und lassen Sie sich alles erklären, damit Sie verstehen, was passiert!