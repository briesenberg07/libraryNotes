<?xml version="1.0" encoding="UTF-8"?>
<!-- Copied/modified from dds-to-html-vertical-staff.xsl ('original')-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mig="http://www.lib.washington.edu/msd/mig/schemas/dataDictionaries"
    xmlns:mig2="http://faculty.washington.edu/tgis/schemasProject/xsd4md"
    exclude-result-prefixes="xs">

    <xsl:include href="https://github.com/uwlib-cams/webviews/raw/master/xslt/common-elements.xsl"/>
    
    <!-- add html-version attribute -->
    <xsl:output method="html" html-version="5.0" indent="yes" use-character-maps="angleBrackets"/>
    
    <!-- I don't understand @use-character-maps, refer to:
        https://www.saxonica.com/html/documentation/xsl-elements/output.html
        https://www.saxonica.com/html/documentation/xsl-elements/character-map.html
        [!?] This may be what allows the encoding of anchors for output?? -->
    <xsl:character-map name="angleBrackets">
        <xsl:output-character character="&lt;" string="&lt;"/>
        <xsl:output-character character="&gt;" string="&gt;"/>
    </xsl:character-map>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="mig:migDataDictionary/mig:ddName"/>
                </title>
                <!-- no style element here or style attributes below, using external css -->
                <link rel="stylesheet" href="bmr_dd.css"/>
            </head>
            <body>
                <xsl:apply-templates select="mig:migDataDictionary"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="mig:migDataDictionary">
        <h1>
            <xsl:value-of select="mig:ddName"/>
        </h1>
        <ul>
            <li>
                <xsl:text>Most recent revision: </xsl:text>
                <xsl:value-of select="mig:latestUpdate"/>
            </li>
            <li>
                <xsl:text>Metadata liaison(s): </xsl:text>
                <ul>
                    <xsl:for-each select="mig:metadataLiaisons/mig:metadataLiaison">
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
            </li>
        </ul>
        <xsl:choose>
            <!-- NOTE template mode conditions here -->
            <xsl:when test="mig:standalone = 'yes' and mig:cdmCo = 'no'">
                <xsl:apply-templates select="mig:properties" mode="standalone"/>
            </xsl:when>
            <xsl:when test="mig:standalone = 'no' and mig:cdmCo = 'yes'">
                <xsl:apply-templates select="mig:properties" mode="co"/>
            </xsl:when>
            <xsl:when test="mig:standalone = 'yes' and mig:cdmCo = 'yes'">
                <xsl:apply-templates select="mig:properties" mode="combined"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>UNDEFINED SCHEMA FORMATIONS; MUST IDENTIFY IF THERE ARE COMPOUND OBJECTS ONLY, STANDALONE OBJECTS ONLY, OR BOTH.</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- This transform does not include templates:
        match="mig:properties" mode="standalone" 
        match="mig:properties" mode="co" -->

    <xsl:template match="mig:properties" mode="combined">
        <h2>
            <xsl:text>OBJECT DESCRIPTION</xsl:text>
        </h2>
        <!-- 3rd predicate will result in omitting properties? -->
        <!-- [?] Can fn:not conditions be combined? -->
        <!-- [?] What do '//' in 3rd, 4th conditions' XPaths do? -->
        <!-- Don't understand 4th condition -->
        <!-- Possible to miss relevant prop with no default CO instruction but custom instruction for CO? -->
        <xsl:for-each
            select="
                mig2:property
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:dcmDatatype = 'uwAdministrative')]
                [mig2:descriptions//mig2:instructions/@co = 'object']
                [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]">
            <!-- table structure differs from original -->
            <table>
                <thead>
                    <tr>
                        <th colspan="2">
                            <xsl:value-of select="position()"/>
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="mig2:cdm/mig2:label"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">
                            <xsl:text>Label</xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="mig2:cdm/mig2:label"/>
                        </td>
                    </tr>
                    <!-- Omitting URI for local properties; there currently are no URIs for local properties -->
                    <tr>
                        <th scope="row">
                            <xsl:text>Dublin Core Equivalent</xsl:text>
                        </th>
                        <td>
                            <xsl:choose>
                                <xsl:when test="mig2:labels/mig2:dc = 'none'">
                                    <xsl:text>[No DC equivalent]</xsl:text>
                                </xsl:when>
                                <!-- Special condition with hard-coding for the restrictions property (does not match label of equivalent DC Element) -->
                                <xsl:when test="mig2:labels/mig2:platformIndependent = 'restrictions'">
                                    <a href="http://purl.org/dc/elements/1.1/rights">rights [Dublin Core Element Set 1.1]</a>
                                </xsl:when>
                                <!-- Condition for equivalents which 1) are OWL datatype props and 2) match DC Element names -->
                                <xsl:when test="mig2:rdf/mig2:owlDatatypeProperty = 'yes'">
                                    <a href="{concat('http://purl.org/dc/elements/1.1/', mig2:labels/mig2:dc)}">
                                        <xsl:value-of select="mig2:labels/mig2:dc"/>
                                        <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                                    </a>
                                </xsl:when>
                                <!-- Condition for equivalents which 2) are *not* OWL datatype props and 2) match DC Element names -->
                                <xsl:when test="mig2:rdf/mig2:owlDatatypeProperty = 'no'">
                                    <a href="{concat('http://purl.org/dc/elements/1.1/', mig2:labels/mig2:dc)}">
                                        <xsl:value-of select="mig2:labels/mig2:dc"/>
                                        <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a href="{concat('http://purl.org/dc/terms/', mig2:labels/mig2:dc)}">
                                        <xsl:value-of select="mig2:labels/mig2:dc"/>
                                        <xsl:text> [DCMI Metadata Terms]</xsl:text>
                                    </a>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!-- Do this with CSS instead -->
            <br/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
