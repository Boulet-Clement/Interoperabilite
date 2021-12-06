<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" version="4.0" indent="yes"/>
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
                    <TD><strong>N°</strong></TD>
                    <TD><strong>Titre</strong></TD>
                    <TD><strong>Réalisateur</strong></TD>
                    <TD><strong>Pays</strong></TD>
                    <TD><strong>Genre</strong></TD>
                    <TD><strong>Durée</strong></TD>
                    <TD><strong>Affiche</strong></TD>
                </TR>
                
                    <!--On parcourt le sous-arbre dans l'ordre 'normal'-->
                    <xsl:apply-templates select="//Film"/>  
                
                </TABLE>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Film">
        <TR><TD><xsl:value-of select="position()"/><br/></TD>
        <TD><xsl:apply-templates select="Titre"/></TD>
        <TD><xsl:apply-templates select="Realisateur"/></TD>
        <TD><xsl:apply-templates select="Pays"/></TD>
        <TD><xsl:apply-templates select="Genre"/></TD>
        <TD><xsl:apply-templates select="Duree"/></TD>
        <TD><xsl:apply-templates select="@Affiche"/></TD>
        </TR>
    </xsl:template>

    <xsl:template match="Film/@Affiche">
        <xsl:element name="IMG">
            <xsl:attribute name="src">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <xsl:attribute name="height">
                100px
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Film/Realisateur">
        <xsl:apply-templates select="Nom"/>
        <xsl:apply-templates select="Prenom"/>
    </xsl:template>
    <xsl:template match="Film/Realisateur/Nom">
        <b>
            <xsl:value-of select="."/>
        </b>
        <xsl:text>&#xA0;</xsl:text>
    </xsl:template>
    <xsl:template match="Film/Realisateur/Prenom">
        <xsl:value-of select="."/><br/>
    </xsl:template>

    <xsl:template match="Film/Titre">
        <b><xsl:value-of select="."/></b>
    </xsl:template>
    <xsl:template match="Film/Pays">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="Film/Genre">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="Film/Duree">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>
