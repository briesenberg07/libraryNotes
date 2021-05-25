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
    <!-- SUPPORT FOR OUTPUTTING CO-ONLY/STANDALONE-ONLY DDs IS A 'TO-DO' -->

    <xsl:include href="ssdc_dd2html_vertical_mig_named_templates.xsl"/>

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

    <!-- More vars for storing multiple XML docs; see:
    https://github.com/UniverityOfWashingtonLibrariesSchemas/schemasProject/issues/22
    -->
    <xsl:variable name="ssdc-text-dd"
        select="document('../../schemasProject/dataDictionaries/xml/ssdc-text-dd.xml')"/>
    <xsl:variable name="ssdc-ballad-dd"
        select="document('../../schemasProject/dataDictionaries/xml/ssdc-ballad-dd.xml')"/>
    <xsl:variable name="ssdc-oh-dd"
        select="document('../../schemasProject/dataDictionaries/xml/ssdc-oh-dd.xml')"/>

    <!-- ********** TOP-LEVEL INFO AND HEADINGS ********** -->

    <xsl:template match="/">
        <html>
            <head>
                <title>SSDCDD</title>
                <link rel="stylesheet" href="bmr_dd.css"/>
            </head>
            <body>
                <h1 id="dd_top">
                    <xsl:text>UWL MIG Data Dictionary: </xsl:text>
                    <xsl:value-of select="$ssdc-text-dd/mig:migDataDictionary/mig:ddName"/>
                </h1>

                <ul>
                    <li>
                        <xsl:text>Most recent revision: </xsl:text>
                        <xsl:value-of select="$ssdc-text-dd/mig:migDataDictionary/mig:latestUpdate"
                        />
                    </li>
                    <li>
                        <xsl:text>Metadata liaison(s): </xsl:text>
                        <ul>
                            <xsl:for-each
                                select="$ssdc-text-dd/mig:migDataDictionary/mig:metadataLiaisons/mig:metadataLiaison">
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
                
                <!-- ********** PROPERTY LISTS BY RESOURCE TYPE ********** -->
                
                <!-- No standalone property lists/tables for each resource type
                Add combined standalone property list/tables at bottom (all props for all resource types) -->
                
                <!-- TEXT PROPS -->
                <!-- BMR: NEW ID here -->
                <h3 id="text_props">
                    <xsl:text>Textual Resources</xsl:text>
                </h3>
                <!-- TEXT CO property list -->
                <!-- BMR: ID changed here -->
                <h4 id="text_object_props">
                    <xsl:text>Compound Object Properties</xsl:text>
                </h4>
                <xsl:call-template name="prop_list">
                    <xsl:with-param name="prop_list_context"
                        select="
                            $ssdc-text-dd/mig:migDataDictionary/mig:properties/mig2:property
                            [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                            mig2:descriptions//mig2:instructions[@co = 'object']]
                            [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
                    <!-- BMR New param here -->
                    <xsl:with-param name="resource_type" select="'text'"/>
                    <xsl:with-param name="set" select="'object'"/>
                </xsl:call-template>
                <!-- TEXT CO-item property list -->
                <!-- BMR: ID changed here -->
                <h4 id="text_item_props">
                    <xsl:text>Compound-object Item Properties</xsl:text>
                </h4>
                <xsl:call-template name="prop_list">
                    <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
                    <xsl:with-param name="prop_list_context"
                        select="
                            $ssdc-text-dd/mig:migDataDictionary/mig:properties/mig2:property
                            [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                            mig2:descriptions//mig2:instructions[@co = 'item']]
                            [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                            [not(mig2:labels/mig2:platformIndependent = 'language')]
                            [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                            [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"/>
                    <xsl:with-param name="resource_type" select="'text'"/>
                    <xsl:with-param name="set" select="'item'"/>
                </xsl:call-template>
                
                <!-- BALLAD PROPS -->
                <!-- BMR: NEW ID here -->
                <h3 id="ballad_props">
                    <xsl:text>Audio - Ballads</xsl:text>
                </h3>
                <!-- BALLAD CO property list -->
                <!-- BMR: ID changed here -->
                <h4 id="ballad_object_props">
                    <xsl:text>Compound Object Properties</xsl:text>
                </h4>
                <xsl:call-template name="prop_list">
                    <xsl:with-param name="prop_list_context"
                        select="
                        $ssdc-ballad-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'object']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
                    <!-- BMR New param here -->
                    <xsl:with-param name="resource_type" select="'ballad'"/>
                    <xsl:with-param name="set" select="'object'"/>
                </xsl:call-template>
                
                <!-- BALLAD CO-item property list -->
                <!-- BMR: ID changed here -->
                <h4 id="ballad_item_props">
                    <xsl:text>Compound-object Item Properties</xsl:text>
                </h4>
                <xsl:call-template name="prop_list">
                    <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
                    <xsl:with-param name="prop_list_context"
                        select="
                        $ssdc-ballad-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'item']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                        [not(mig2:labels/mig2:platformIndependent = 'language')]
                        [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                        [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"/>
                    <xsl:with-param name="resource_type" select="'ballad'"/>
                    <xsl:with-param name="set" select="'item'"/>
                </xsl:call-template>
                
                <!-- ORAL HISTORY (OH) PROPS -->
                <!-- BMR: NEW ID here -->
                <h3 id="oh_props">
                    <xsl:text>Audio - Oral Histories</xsl:text>
                </h3>
                <!-- OH CO property list -->
                <!-- BMR: ID changed here -->
                <h4 id="oh_object_props">
                    <xsl:text>Compound Object Properties</xsl:text>
                </h4>
                <xsl:call-template name="prop_list">
                    <xsl:with-param name="prop_list_context"
                        select="
                        $ssdc-oh-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'object']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
                    <!-- BMR New param here -->
                    <xsl:with-param name="resource_type" select="'oh'"/>
                    <xsl:with-param name="set" select="'object'"/>
                </xsl:call-template>
                <!-- OH CO-item property list -->
                <!-- BMR: ID changed here -->
                <h4 id="oh_item_props">
                    <xsl:text>Compound-object Item Properties</xsl:text>
                </h4>
                <xsl:call-template name="prop_list">
                    <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
                    <xsl:with-param name="prop_list_context"
                        select="
                        $ssdc-oh-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'item']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                        [not(mig2:labels/mig2:platformIndependent = 'language')]
                        [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                        [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"/>
                    <xsl:with-param name="resource_type" select="'oh'"/>
                    <xsl:with-param name="set" select="'item'"/>
                </xsl:call-template>
                
                <!-- ********** STANDALONE PROPERTY LIST ********** -->
                <!-- BMR to do; create and use a combined prop list for this? -->
                                
                <!-- ********** PROPERTY DETAILS BY RESOURCE TYPE ********** -->

                <!-- TEXT PROPERTIES DETAILS -->
                <!-- TEXT CO properties tables -->
                <xsl:call-template name="prop_detail_heading">
                    <xsl:with-param name="prop_detail_context"
                        select="
                            $ssdc-text-dd/mig:migDataDictionary/mig:properties/mig2:property
                            [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                            mig2:descriptions//mig2:instructions[@co = 'object']]
                            [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
                    <xsl:with-param name="resource_type" select="'text'"/>
                    <xsl:with-param name="set" select="'object'"/>
                </xsl:call-template>
                <!-- TEXT CO-item properties tables -->
                <xsl:call-template name="prop_detail_heading">
                    <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
                    <xsl:with-param name="prop_detail_context"
                        select="
                            $ssdc-text-dd/mig:migDataDictionary/mig:properties/mig2:property
                            [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                            mig2:descriptions//mig2:instructions[@co = 'item']]
                            [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                            [not(mig2:labels/mig2:platformIndependent = 'language')]
                            [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                            [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"/>
                    <xsl:with-param name="resource_type" select="'text'"/>
                    <xsl:with-param name="set" select="'item'"/>
                </xsl:call-template>
                
                <!-- BALLAD PROPERTIES DETAILS -->
                <!-- BALLAD CO properties tables -->
                <xsl:call-template name="prop_detail_heading">
                    <xsl:with-param name="prop_detail_context"
                        select="
                        $ssdc-ballad-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'object']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
                    <xsl:with-param name="resource_type" select="'ballad'"/>
                    <xsl:with-param name="set" select="'object'"/>
                </xsl:call-template>
                <!-- BALLAD CO-item properties tables -->
                <xsl:call-template name="prop_detail_heading">
                    <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
                    <xsl:with-param name="prop_detail_context"
                        select="
                        $ssdc-ballad-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'item']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                        [not(mig2:labels/mig2:platformIndependent = 'language')]
                        [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                        [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"/>
                    <xsl:with-param name="resource_type" select="'ballad'"/>
                    <xsl:with-param name="set" select="'item'"/>
                </xsl:call-template>
                
                <!-- ORAL HISTORY (OH) PROPERTIES DETAILS -->
                <!-- OH CO properties tables -->
                <xsl:call-template name="prop_detail_heading">
                    <xsl:with-param name="prop_detail_context"
                        select="
                        $ssdc-oh-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'object'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'object']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]"/>
                    <xsl:with-param name="resource_type" select="'oh'"/>
                    <xsl:with-param name="set" select="'object'"/>
                </xsl:call-template>
                <!-- OH CO-item properties tables -->
                <xsl:call-template name="prop_detail_heading">
                    <!-- BMR **HARD-CODING TO SUPPRESS UNWANTED CO-ITEM PROPS -->
                    <xsl:with-param name="prop_detail_context"
                        select="
                        $ssdc-ballad-dd/mig:migDataDictionary/mig:properties/mig2:property
                        [mig2:descriptions//mig2:customization[@co = 'item'][@dd = $collection] or
                        mig2:descriptions//mig2:instructions[@co = 'item']]
                        [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]
                        [not(mig2:labels/mig2:platformIndependent = 'language')]
                        [not(mig2:labels/mig2:platformIndependent = 'subjectsLcsh')]
                        [not(mig2:labels/mig2:platformIndependent = 'cataloging')]"/>
                    <xsl:with-param name="resource_type" select="'oh'"/>
                    <xsl:with-param name="set" select="'item'"/>
                </xsl:call-template>
                
                <!-- ********** STANDALONE PROPERTY DETAILS ********** -->
                <!-- BMR to do; create and use a combined prop list for this? -->

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
