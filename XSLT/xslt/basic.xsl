<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                version="2.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

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

  <!-- Beispiel: TEI-Absätze werden in HTML-Absätze umgewandelt, der Inhalt wird von anderen Templates weiterverarbeitet -->
  <xsl:template match="tei:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:text|tei:body">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Fallback: Identität (alles andere wird einfach roh kopieren) -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>