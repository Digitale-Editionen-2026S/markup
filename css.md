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
  1) Herkunftrang: Benutzeragent < Benutzer:in < Autor:in; `!important` erhöht Priorität  
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
- Block-/Box-Eigenschaften: `margin`, `padding`, `border`, `width/height`, `box-sizing`
- Layout: `display`, `position`, `flex`, `grid`
- Hintergrund: `background`, `background-image`

**Inline- vs. Block-/Box-Elemente**
- Inline-Elemente (z. B. `a`, `span`, `em`) laufen im Textfluss mit, brechen die Zeile nicht und respektieren nur horizontale Abstände (`padding-left/right`, `margin-left/right`).
- Block- bzw. Box-Elemente (z. B. `div`, `p`, `section`) belegen standardmäßig die volle verfügbare Breite, beginnen in einer neuen Zeile und lassen sich über Box-Eigenschaften (`width`, `height`, `margin`, `padding`, `border`) und Layout-Modelle wie Flex oder Grid zu komplexeren Strukturen kombinieren.

Beispiel:
```css
.card {
  display: block;
  background: white;
  color: #222;
  padding: 1rem;
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

Beispiele:
```css
html { font-size: 16px; }          /* 1rem = 16px */
h1 { font-size: 2.5rem; }          /* skaliert mit Root */
.button { padding: 0.75em 1.25em; }/* relativ zur eigenen Schriftgröße */
.hero { height: 60vh; }
```

## Flexbox vs. Grid
- Flexbox: Ein-dimensional (entweder Zeile oder Spalte), ideal für einfache Layouts, z. B. Navigation, Kartenreihen
- Grid: Zwei-dimensional (Zeilen und Spalten), mächtiger für komplexe Layouts, z. B. mehrspaltige Seiten, asymmetrische Designs
- Flexbox: `display: flex;` + `flex-direction`, `justify-content`, `align-items`
- Grid: `display: grid;` + `grid-template-columns`, `grid-template-rows`, `gap`
- Beide Tools sind sehr mächtig, aber auch relativ komplex. Infos zum Grid finden sich z.B. hier: https://css-tricks.com/complete-guide-css-grid-layout/
- Kombination: Flexbox für Komponenten, Grid für Seitenlayout-Beispiel:
```css
.container {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 1rem;
}
.nav { display: flex; gap: 1rem; }
```
```html
<div class="container">
  <main>Hauptinhalt</main>
  <aside>Sidebar</aside>
</div>
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