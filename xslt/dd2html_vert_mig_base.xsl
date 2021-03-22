<?xml version="1.0" encoding="UTF-8"?>
<!-- Copied/modified from dds-to-html-vertical-staff.xsl ('original')-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mig="http://www.lib.washington.edu/msd/mig/schemas/dataDictionaries"
    xmlns:mig2="http://faculty.washington.edu/tgis/schemasProject/xsd4md"
    exclude-result-prefixes="xs">

    <xsl:include href="dd2html_vert_mig_named_templates.xsl"/>

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

    <!-- Put data-dictionary 'cdmcode' in a var to try and increase code reusability -->
    <xsl:variable name="collection" select="'p16786coll3'"/>

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
        <h1 id="dd_top">
            <xsl:text>UWL MIG Data Dictionary: </xsl:text>
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
        <h2 id="dd_props">
            <xsl:text>Data Dictionary Property List</xsl:text>
        </h2>
        <h3 id="co_props">
            <xsl:text>Compound-object Properties</xsl:text>
        </h3>
        <ol>
            <!-- **Match XPath @ L~107 (CO prop tables)** -->
            <!-- This XPath **hard-coded** for SSDC (@dd='p16786coll3') -->
            <!-- Any unexpected effects??? -->
            <xsl:for-each
                select="
                    mig:properties/mig2:property
                    [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                    [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]
                    [mig2:descriptions//mig2:customization[@co = 'object'][@dd = 'p16786coll3'] or
                    mig2:descriptions//mig2:instructions/@co = 'object']
                    [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]">
                <xsl:call-template name="prop_list_items">
                    <xsl:with-param name="context" select="."/>
                    <xsl:with-param name="set" select="'co'"/>
                </xsl:call-template>
            </xsl:for-each>
        </ol>
        <!-- I'VE REMOVED MODED TEMPLATES AT THIS TIME, THIS STYLESHEET CURRENTLY ONLY SUPPORTS *COMBINED* (CO+STANDALONE) COLLECTIONS -->
        <xsl:apply-templates select="mig:properties"/>
    </xsl:template>

    <xsl:template match="mig:properties">
        <h2>
            <xsl:text>COMPOUND-OBJECT DESCRIPTION</xsl:text>
        </h2>
        <!-- **Match with XPath @ L~65 (CO prop list)**; see notes there -->
        <xsl:for-each
            select="
                mig2:property
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]
                [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                mig2:descriptions//mig2:instructions/@co = 'object']
                [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]">
            <xsl:call-template name="prop_tables">
                <xsl:with-param name="context" select="."/>
                <xsl:with-param name="set" select="'co'"/>
            </xsl:call-template>
            <!-- table structure differs from original -->
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
