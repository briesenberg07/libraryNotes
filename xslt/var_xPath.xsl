<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <!-- commenter didn't include xsl:output method=xml; not needed? -->
    <xsl:output method="xml" indent="yes"/>

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
            <xsl:variable name="contextForEval" select="."/>
            <xsl:for-each select="$trees/tree">
                <text00>A tree here</text00>
                <text01>Element content: </text01>
                <val01>
                    <xsl:evaluate xpath="elementContent" as="xs:string" context-item="$contextForEval"/>
                </val01>
                <text02>
                    <xsl:text>Attribute value: </xsl:text>
                </text02>
                <val02>
                    <xsl:evaluate xpath="attributeValue" as="xs:string" context-item="$contextForEval"/>
                </val02>
            </xsl:for-each>
        </root>
    </xsl:template>
</xsl:stylesheet>
