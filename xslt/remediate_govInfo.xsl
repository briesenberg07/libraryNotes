<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:mode on-no-match="shallow-copy" />
        <xsl:template match="/">
            <xsl:apply-templates select="collection/record"/>
        </xsl:template>
        <!-- How to simply add a datafield tag=500 as specified, while copying all other leader, controlfield, and datafield elements? -->
        <xsl:template match="collection/record">
            <!-- ... -->
            <datafield tag="500" ind1=" " ind2=" ">
                <xsl:text>This content was digitized by the University of Washington Libraries and is made publically available through a partnership between the U.S. Government Publishing Office and the University of Washington Libraries.</xsl:text>
            </datafield>
        </xsl:template>
    </xsl:stylesheet>