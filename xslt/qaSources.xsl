<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:j="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="j" version="3.0">
    <!-- Will I still be in the same context node once this template is called? 
        Looks like maybe no, because I'm not getting my values in output.
        How to fix? -->
    <xsl:variable name="qaNameString">
        <xsl:choose>
            <xsl:when test="j:array[@key = 'useValuesFrom']/j:string = 'urn:ld4p:qa:names'">
                <xsl:text>LOC all names (QA)</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Unknown Lookup URN (!)</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="qaSourceURL">
        <xsl:choose>
            <xsl:when test="j:array[@key = 'useValuesFrom']/j:string = 'urn:ld4p:qa:names'">
                <xsl:text>http://id.loc.gov/authorities/names.html</xsl:text>
            </xsl:when>
            <xsl:otherwise>Unknown Lookup URN (!)</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="qaInfo">
        <xsl:choose>
            <xsl:when test="j:array[@key = 'useValuesFrom']/j:string = 'urn:ld4p:qa:names'">
                <xsl:text> via the </xsl:text>
                <a href="https://lookup.ld4l.org/">
                    <xsl:text>LD4P Authority Lookup Service</xsl:text>
                </a>
                <xsl:text> > </xsl:text>
                <a href="https://lookup.ld4l.org/authority_list">
                    <xsl:text>'LOCNAMES_LD4L_CACHE'</xsl:text>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> Unknown Lookup URN (!)</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
</xsl:stylesheet>
