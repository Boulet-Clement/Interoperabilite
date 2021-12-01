<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="no"/>
    <!--<xsl:strip-space elements="*"/>-->

    <!-- On démarre le parcours de l'arbre xml de la racine -->
    <xsl:template match="/">
        <html>
            <head/>
            <body>
                <ul>
                    <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
                    <xsl:apply-templates />  
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Film">
        <xsl:apply-templates select="Titre"/> 
    </xsl:template>
    <xsl:template match="Film/Titre">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>
