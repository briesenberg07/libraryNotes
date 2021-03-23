<?xml version="1.0" encoding="UTF-8"?>
<!-- Copied/modified from dds-to-html-vertical-staff.xsl -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mig="http://www.lib.washington.edu/msd/mig/schemas/dataDictionaries"
    xmlns:mig2="http://faculty.washington.edu/tgis/schemasProject/xsd4md"
    exclude-result-prefixes="xs">
    
    <!-- A note on 'set' param values, which are somewhat semantically confusing:
            'object' = for compound objects
            'item' = for compound-object items
            'no' = for standalone objects -->

    <!-- **NO** MODED TEMPLATES AT THIS TIME, THIS STYLESHEET CURRENTLY **ONLY SUPPORTS** COMBINED (CO+STANDALONE) COLLECTIONS -->
    
    <xsl:include href="dd2html_vertical_mig_002_named_templates.xsl"/>
    
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

    <!-- Put data-dictionary 'cdmcode' in a var to try and increase code reusability;
        BUT NOTE AND BEWARE, hard-coding below which will require rework for reuse with other DDs -->
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
            <xsl:text>Data Dictionary Properties</xsl:text>
        </h2>

        <!-- CO property lists -->
        <h3 id="object_props">
            <xsl:text>Compound Object Properties</xsl:text>
        </h3>
        <xsl:call-template name="prop_lists">
            <xsl:with-param name="set" select="'object'"/>
            <xsl:with-param name="lists_context"
                select="
                    mig:properties/mig2:property
                    [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                    mig2:descriptions//mig2:instructions/@co = 'object']
                    [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"
            />
        </xsl:call-template>

        <!-- CO-item property lists -->
        <h3 id="item_props">
            <xsl:text>Compound-object Item Properties</xsl:text>
        </h3>
        <xsl:call-template name="prop_lists">
            <xsl:with-param name="set" select="'item'"/>
            <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
            <xsl:with-param name="lists_context"
                select="
                    mig:properties/mig2:property
                    [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                    mig2:descriptions//mig2:instructions/@co = 'item']
                    [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                    [not(mig2:labels/mig2:platformIndependent = 'language')]
                    [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                    [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"
            />
        </xsl:call-template>

        <!-- Standalone object property lists -->
        <h3 id="no_props">
            <xsl:text>Standalone Object Properties</xsl:text>
        </h3>
        <xsl:call-template name="prop_lists">
            <xsl:with-param name="set" select="'no'"/>
            <xsl:with-param name="lists_context"
                select="
                mig:properties/mig2:property
                [mig2:descriptions//mig2:customization[@co = 'no'][@dd = $collection] or
                mig2:descriptions//mig2:instructions/@co = 'no']
                [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"
            />
        </xsl:call-template>

        <xsl:apply-templates select="mig:properties"/>
    </xsl:template>

    <xsl:template match="mig:properties">
        <!-- CO properties tables -->
        <xsl:call-template name="prop_tables">
            <xsl:with-param name="tables_context"
                select="
                    mig2:property
                    [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                    mig2:descriptions//mig2:instructions/@co = 'object']
                    [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
            <xsl:with-param name="set" select="'object'"/>
        </xsl:call-template>

        <!-- CO-item properties tables -->
        <xsl:call-template name="prop_tables">
            <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
            <xsl:with-param name="tables_context"
                select="
                    mig2:property
                    [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                    mig2:descriptions//mig2:instructions/@co = 'item']
                    [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                    [not(mig2:labels/mig2:platformIndependent = 'language')]
                    [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                    [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"/>
            <xsl:with-param name="set" select="'item'"/>
        </xsl:call-template>
        
        <!-- Standalone properties tables -->
        <xsl:call-template name="prop_tables">
            <xsl:with-param name="tables_context"
                select="
                mig2:property
                [mig2:descriptions//mig2:customization[@co = 'no'][@dd = $collection] or
                mig2:descriptions//mig2:instructions/@co = 'no']
                [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
            <xsl:with-param name="set" select="'no'"/>
        </xsl:call-template>

    </xsl:template>
    
    
    
    
    
    
    
</xsl:stylesheet>
