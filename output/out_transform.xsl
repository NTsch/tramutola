<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:cei="http://www.monasterium.net/NS/cei" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs math" version="3.0">
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="node()|@*">
     <xsl:copy>
       <xsl:apply-templates select="node()|@*"/>
     </xsl:copy>
 </xsl:template>
    
</xsl:stylesheet>