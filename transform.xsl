<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:cei="http://www.monasterium.net/NS/cei"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
          <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="cei:date">
        <cei:date>
            <xsl:attribute name="value">
                <xsl:variable name="tokens" select="tokenize(normalize-space(replace(./text(), '\(\?\)', '')))"/>
                <xsl:variable name="month">
                    <xsl:choose>
                        <xsl:when test="$tokens[2] = 'gennaio'">
                            <xsl:text>01</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'marzo'">
                            <xsl:text>03</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'aprile'">
                            <xsl:text>04</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'maggio'">
                            <xsl:text>05</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'giugno'">
                            <xsl:text>06</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'luglio'">
                            <xsl:text>07</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'agosto'">
                            <xsl:text>08</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'settembre'">
                            <xsl:text>09</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'novembre'">
                            <xsl:text>11</xsl:text>
                        </xsl:when>
                        <xsl:when test="$tokens[2] = 'dicembre'">
                            <xsl:text>12</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="day">
                    <xsl:choose>
                        <xsl:when test="$tokens[3]">
                            <xsl:variable name="nullstring" select="concat('0', $tokens[3])"/>
                            <xsl:value-of select="substring($nullstring, string-length($nullstring) - 1)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>99</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="normalize-space(concat($tokens[1], $month, $day))"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </cei:date>
    </xsl:template>
    
    <xsl:template match='cei:notariusSign[ancestor::cei:tenor]'>
        <cei:figure>
            <cei:figDesc>notarial sign</cei:figDesc>
        </cei:figure>
    </xsl:template>
    
    <xsl:template match="cei:expan[parent::cei:abstract]">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>