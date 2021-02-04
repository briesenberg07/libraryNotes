<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="xml"/>

    <xsl:variable name="trees">
        <tree>
            <elementContent>root/tree01/trunk/branch/leaf/text</elementContent>
            <attributeValue>root/tree01/trunk/branch/leaf/@attr</attributeValue>
        </tree>
        <tree>
            <elementContent>root/tree02/trunk02/branch</elementContent>
            <attributeValue>root/tree02/trunk01/@attr</attributeValue>
        </tree>
    </xsl:variable>

    <xsl:template match="/">
        <root>
            <xsl:for-each select="$trees/tree">
                <text00>A tree here</text00>
                <text01>Element content: </text01>
                <val01>
                    <xsl:value-of select="elementContent"/>
                </val01>
                <text02>
                    <xsl:text>Attribute value: </xsl:text>
                </text02>
                <val02>
                    <xsl:value-of select="attributeValue"/>
                </val02>
            </xsl:for-each>
        </root>
    </xsl:template>
</xsl:stylesheet>
