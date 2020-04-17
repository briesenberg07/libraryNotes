<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:mode on-no-match="deep-copy"/>
    <xsl:template match="/">
        <collection>
            <xsl:apply-templates select="collection/record"/>
        </collection>
    </xsl:template>
    <!-- How to simply add a datafield tag=500 as specified, while copying all other leader, controlfield, and datafield elements? -->
    <xsl:template match="collection/record" mode="copyMarcXml">
        <xsl:copy-of select="."/>
        <!-- OK: Use something like copy/deep-copy to copy all element nodes, attrs, and text children, and then give add result element below -->
        <!-- This is still not working; some notes on that:
            I don't know what I'm doing, really, with xsl:mode and the 2nd template's mode attr
            The desired result element datafield tag="500" is not in the output still -->
        <datafield tag="500" ind1=" " ind2=" ">
            <xsl:text>This content was digitized by the University of Washington Libraries and is made publically available through a partnership between the U.S. Government Publishing Office and the University of Washington Libraries.</xsl:text>
        </datafield>
    </xsl:template>
</xsl:stylesheet>
