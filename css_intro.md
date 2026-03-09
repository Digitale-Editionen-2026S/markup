## Was ist CSS?
- CSS = Cascading Style Sheets: beschreibt wie HTML dargestellt werden soll (Layout, Farben, Typografie, Abstände)
- Trennung von Struktur (HTML) und Präsentation (CSS)
- Besteht aus Regeln, die immer das folgende Schema haben: `selektor { eigenschaft: wert; }`
- Einbindung:
  - Extern (empfohlen): `<link rel="stylesheet" href="styles.css">`
  - ~~Intern: `<style> ... </style>`~~
  - ~~Inline: `style="..."`~~

Beispiel:
```html
<h1 class="titel">Hallo</h1>
```
```css
.titel { color: #0a84ff; font-family: system-ui; }
```

---

## Cascading, Vererbung, Spezifität
- Kaskade: Browser wählt die „gewin­nende“ Deklaration anhand von:
  1) Herkunftrang: Benutzeragent < Benutzer < Autor; `!important` erhöht Priorität  
  2) Spezifität (näherer Selektor gewinnt)  
  3) Quellreihenfolge (spätere Regeln überschreiben frühere)
- Vererbung: Einige Eigenschaften erben (z. B. `color`, `font`), andere nicht (z. B. `margin`, `padding`)
- Spezifität (vereinfacht):
  - Inline-Style: höchst
  - ID-Selektor: hoch
  - Klassen/Attribute/Pseudo-Klassen: mittel
  - Typ/Pseudo-Elemente: niedrig

Beispiel Konflikt:
```css
p { color: black; }         /* niedrig */
.highlight p { color: green; }  /* mittel */
#intro p { color: blue; }       /* hoch */
```

---

## Selektoren (Überblick)
- Eineinfach:
  - Typ: `p`
  - Klasse: `.box`
  - ID: `#header`
- Attribute: `input[type="email"]`
- Pseudo-Klassen: `:hover`, `:focus`, `:active`, `:nth-child(2n)`
- Pseudo-Elemente: `::before`, `::after`, `::first-line`
- Kombinatoren:
  - descendant: `article p`
  - child: `ul > li`
  - adjacent sibling: `h2 + p`
  - general sibling: `h2 ~ p`

Beispiel:
```css
nav a:hover { text-decoration: underline; }
.card::before { content: "★ "; color: gold; }
ul > li[selected] { font-weight: bold; }
```

---

## Wertearten und häufige Eigenschaften
- Farben: `#1e90ff`, `rgb(30,144,255)`, `hsl(210 100% 56%)`
- Längen: `px`, `em`, `rem`, `%`, `vw`, `vh`
- Keywords: `auto`, `none`, `currentColor`

Häufige Eigenschaften:
- Text/Schrift: `font-size`, `line-height`, `font-weight`, `color`
- Box: `margin`, `padding`, `border`, `width/height`, `box-sizing`
- Layout: `display`, `position`, `flex`, `grid`
- Hintergrund: `background`, `background-image`

Beispiel:
```css
:root { --space: 1rem; }
.card {
  background: white;
  color: #222;
  padding: var(--space);
  border: 1px solid hsl(0 0% 85%);
}
```

---

## Einheiten – em, rem, px, Viewport, %
- `px`: CSS-Pixel (geräteunabhängig). Stabil für feine Kanten, Icons.
- `em`: relativ zur Schriftgröße des Elements. Kaskadiert mit Elternwerten.
- `rem`: relativ zur Schriftgröße des Wurzelelements (`html`). Gut für konsistente Skalierung.
- `%`: relativ zur Elterneigenschaft (z. B. `width`, `padding` bei Blockelementen)
- Viewport:
  - `1vw`: 1% der Viewport-Breite
  - `1vh`: 1% der Viewport-Höhe
  - `vmin`/`vmax`: Min/Max von `vw` und `vh`

Tipps:
- Basisgröße z. B. am Root: `html { font-size: 16px; }`
- Typografie/Abstände skaliert: bevorzugt `rem`
- Komponenten-intern dynamisch: `em`
- Responsive Größen: `clamp()` mit Viewport-Einheiten

Beispiele:
```css
html { font-size: 16px; }          /* 1rem = 16px */
h1 { font-size: 2.5rem; }          /* skaliert mit Root */
.button { padding: 0.75em 1.25em; }/* relativ zur eigenen Schriftgröße */
.hero { height: 60vh; }
.title { font-size: clamp(1.25rem, 2vw + 1rem, 2.5rem); }
```

## CSS-Frameworks
- Zweck: Vorgefertigte Layout- und UI-Bausteine (Grid, Utilities, Komponenten) für schnellen Start
- Vorteile:
  - Schnelles Prototyping, konsistente Basiskomponenten, responsives Grid out-of-the-box
  - Gute Doku, große Community
- Nachteile:
  - Zusätzlicher Overhead/Bloat, einheitlicher „Framework-Look“
  - Spezifitätskonflikte, erschwerte spätere Individualisierung
- Kernideen (Bootstrap):
  - Grid: 12-Spalten, responsive Breakpoints (`col-`, `col-sm-`, `col-md-` …)
  - Utilities: Klassen für Abstände, Farben, Display (`.mt-3`, `.text-center`, `.d-flex`)
  - Komponenten: Buttons, Navbars, Cards, Modals
- Einbindung:
  - CDN (schnell) oder lokal/über Paketmanager (kontrollierter, bundling)
```html
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-..."
  crossorigin="anonymous">
```
- Beispiel-Layout:
```html
<div class="container">
  <div class="row">
    <div class="col-md-8"><div class="card p-3">Hauptinhalt</div></div>
    <div class="col-md-4"><div class="card p-3">Sidebar</div></div>
  </div>
  <button class="btn btn-primary mt-3">Aktion</button>
</div>
```
- Alternativen/Ansätze:
  - Utility-first: Tailwind CSS (hohe Granularität)
  - Leichtgewichtig: Bulma, Milligram, Pico.css
- Tipps für den Einsatz:
  - Nur benötigte Module laden
  - Eigene Variablen/Theming nutzen statt harte Overrides
  - Langfristig: Framework-Klassen schrittweise durch projektspezifische CSS-Architektur ersetzen (BEM, Tokens)