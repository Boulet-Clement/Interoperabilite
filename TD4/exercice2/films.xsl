<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" version="4.0" indent="yes"/>
    <!--<xsl:strip-space elements="*"/>-->

    <!-- On démarre le parcours de l'arbre xml de la racine -->
    <xsl:template match="/">
        <html>
            <head>
                <title>xml et xsl pour films : version tableau et templates</title>
            </head>
            <body>
                <h1>Liste des films de ma base</h1>
                <TABLE BORDER="1">
                <TR>
                <TD><strong>Titre</strong></TD><TD><strong>Réalisateur</strong></TD><TD><strong>Pays</strong></TD><TD><strong>Genre</strong></TD><TD><strong>Durée</strong></TD>
                </TR>
                
                    <!--On parcourt le sous-arbre dans l'ordre 'normal'-->
                    <xsl:apply-templates />  
                
                </TABLE>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Film">
        <TR><xsl:apply-templates select="Titre"/></TR>
        <xsl:apply-templates select="Realisateur"/>
        <xsl:apply-templates select="Pays"/>
    </xsl:template>

    <xsl:template match="Film/Realisateur">
        <xsl:apply-templates select="Nom"/>
    </xsl:template>
    <xsl:template match="Film/Realisateur/Nom">
        <TD><b><xsl:value-of select="."/></b></TD>
    </xsl:template>
    <xsl:template match="Film/Realisateur/Prenom">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="Film/Titre">
        <TD><b><xsl:value-of select="."/></b></TD>
    </xsl:template>
    <xsl:template match="Film/Pays">
        <TD><xsl:value-of select="."/></TD>
    </xsl:template>
    <xsl:template match="Film/Genre">
        <TD><xsl:value-of select="."/></TD>
    </xsl:template>
    <xsl:template match="Film/Genre">
        <TD><xsl:value-of select="."/></TD>
    </xsl:template>
</xsl:stylesheet>
