<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="UTF-8" indent="yes" />
  <xsl:strip-space elements="*" />

  <!-- On démarre de la racine -->
  <xsl:template match="/">
    <BASE>
      <xsl:apply-templates />
    </BASE>
  </xsl:template>

  <xsl:template match="FILMS">
    <FILMS>
      <xsl:apply-templates />
    </FILMS>

    <REALISATEURS>
      <xsl:apply-templates select="//Realisateur" />
    </REALISATEURS>

    <ACTEURS>
      <xsl:apply-templates select="//Acteurs" />
    </ACTEURS>
  </xsl:template>

  <xsl:template match="Film">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:copy-of select="*[name() != 'Realisateur'][name() != 'Acteurs']" />
      <xsl:apply-templates select="Realisateur/@ID" />
      <xsl:apply-templates select="Acteurs/Acteur/@ID" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="Realisateur">
    <xsl:if test="not(@ID = ../preceding-sibling::*/Realisateur/@ID)">
      <xsl:copy-of select="." />
    </xsl:if>
  </xsl:template>

  <xsl:template match="Acteur">
    <xsl:if test="not(@ID = ../../preceding-sibling::*/Acteurs/*/@ID)">
      <xsl:copy-of select="." />
    </xsl:if>
  </xsl:template>

  <xsl:template match="Realisateur/@ID">
    <IDRealisateur ID="{.}" />
  </xsl:template>

  <xsl:template match="Acteurs/Acteur/@ID">
    <IDActeur ID="{.}" />
  </xsl:template>

</xsl:stylesheet>