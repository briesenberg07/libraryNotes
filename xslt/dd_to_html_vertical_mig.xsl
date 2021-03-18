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
        <h1 id="dd_top">
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
            <!-- Should be the same as XPath the for CO-props template -->
            <xsl:for-each
                select="
                    mig:properties/mig2:property
                    [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                    [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]
                    [mig2:descriptions//mig2:instructions/@co = 'object']
                    [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]">
                <li>
                    <a href="{concat('#co_object_', mig2:uid)}">
                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                    </a>
                </li>
            </xsl:for-each>
        </ol>
        <xsl:choose>
            <!-- NOTE template mode conditions here -->
            <!-- This transform does not include templates:
                match="mig:properties" mode="standalone" 
                match="mig:properties" mode="co" -->
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

    <xsl:template match="mig:properties" mode="combined">
        <h2>
            <xsl:text>COMPOUND-OBJECT DESCRIPTION</xsl:text>
        </h2>
        <!-- 3rd predicate will result in omitting properties? -->
        <!-- [?] Can fn:not conditions be combined? -->
        <!-- [?] What do '//' in 3rd, 4th conditions' XPaths do? -->
        <!-- [?] Don't understand 4th condition -->
        <!-- Possible to miss relevant prop with no default CO instruction but custom instruction for CO? -->
        <xsl:for-each
            select="
                mig2:property
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]
                [mig2:descriptions//mig2:instructions/@co = 'object']
                [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]">
            <!-- table structure differs from original -->
            <table>
                <thead>
                    <tr>
                        <th colspan="3" id="{concat('co_object_', mig2:uid)}"
                            class="prop_table_head">
                            <xsl:value-of select="position()"/>
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="mig2:cdm/mig2:label"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Why am I stating the label here again after it is in the thead??
                    <tr>
                        <th colspan="2" scope="row">
                            <xsl:text>Label</xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="mig2:cdm/mig2:label"/>
                        </td>
                    </tr> -->
                    <!-- Omitting URI for local properties; there currently are no URIs for local properties -->
                    <!-- TEST -->
                    <tr>
                        <!-- Is scope attribute correct here?? -->
                        <!-- Why would rowspan be 5!?! I do not understand this, but this works -->
                        <th rowspan="5" scope="rowgroup" class="prop_info_group">
                            <p>
                                <xsl:text>CONTENTdm field properties*</xsl:text>
                            </p>
                            <p class="note">
                                <xsl:text>*CONTENTdm Administration &#xbb; Collections &#xbb; Field properties &#xbb; </xsl:text>
                                <a
                                    href="https://briesenberg07.github.io/libraryNotes/images/cdm_edit_field_properties.jpg">
                                    <xsl:text>edit</xsl:text>
                                </a>
                            </p>
                        </th>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>Dublin Core Equivalent</xsl:text>
                            <br/>

                        </th>
                        <td>
                            <xsl:choose>
                                <xsl:when test="mig2:labels/mig2:dc = 'none'">
                                    <xsl:text>[No DC equivalent]</xsl:text>
                                </xsl:when>
                                <!-- Special condition with hard-coding for the restrictions property (does not match label of equivalent DC Element) -->
                                <xsl:when
                                    test="mig2:labels/mig2:platformIndependent = 'restrictions'">
                                    <a href="http://purl.org/dc/elements/1.1/rights">rights</a>
                                    <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                                </xsl:when>
                                <!-- Condition for equivalents which 1) are OWL datatype props and 2) match DC Element names -->
                                <xsl:when test="mig2:rdf/mig2:owlDatatypeProperty = 'yes'">
                                    <a
                                        href="{concat('http://purl.org/dc/elements/1.1/', mig2:labels/mig2:dc)}">
                                        <xsl:value-of select="mig2:labels/mig2:dc"/>
                                    </a>
                                    <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                                </xsl:when>
                                <!-- Condition for equivalents which 2) are *not* OWL datatype props and 2) match DC Element names -->
                                <xsl:when test="mig2:rdf/mig2:owlDatatypeProperty = 'no'">
                                    <a
                                        href="{concat('http://purl.org/dc/elements/1.1/', mig2:labels/mig2:dc)}">
                                        <xsl:value-of select="mig2:labels/mig2:dc"/>
                                    </a>
                                    <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a
                                        href="{concat('http://purl.org/dc/terms/', mig2:labels/mig2:dc)}">
                                        <xsl:value-of select="mig2:labels/mig2:dc"/>
                                    </a>
                                    <xsl:text> [DCMI Metadata Terms]</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>CONTENTdm searchable?</xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="mig2:cdm/mig2:searchable"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>Turn on controlled vocabulary for this property?</xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="mig2:cdm/mig2:cdmControlledVocab"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>CONTENTdm hidden?</xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="mig2:cdm/mig2:hidden"/>
                        </td>
                    </tr>
                    <tr>
                        <!-- Again, don't understand "add 1 to rowspan"... -->
                        <th rowspan="6" scope="rowgroup" class="prop_info_group">
                            <p>
                                <xsl:text>Required status, definition, guidance</xsl:text>
                            </p>
                        </th>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>Required by CONTENTdm?</xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="mig2:cdm/mig2:cdmRequired"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>Required by UW Libraries?</xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="mig2:uwRequired/mig2:uwObject"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>Property definition</xsl:text>
                        </th>
                        <td>
                            <ul>
                                <xsl:for-each select="mig2:descriptions/mig2:definition/mig2:para">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>Input instructions</xsl:text>
                        </th>
                        <td>
                            <ul>
                                <xsl:choose>
                                    <!-- See comment in the original XSLT...is there a problem here? -->
                                    <xsl:when
                                        test="../../mig:cdmCode = mig2:descriptions/mig2:customization/@dd">
                                        <xsl:for-each
                                            select="mig2:descriptions/mig2:customization[@co = 'object'][@dd = ../../../../mig:cdmCode]/mig2:para">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each
                                            select="mig2:descriptions/mig2:instructions[@co = 'object']/mig2:para">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <xsl:text>Input examples</xsl:text>
                        </th>
                        <td>
                            <xsl:choose>
                                <xsl:when
                                    test="../../mig:cdmCode = mig2:examples/mig2:customization/@dd">
                                    <xsl:for-each
                                        select="
                                            mig2:examples/mig2:customization[@co = 'object']
                                            [@dd = ../../../../mig:cdmCode]/mig2:para">
                                        <p>
                                            <xsl:value-of select="."/>
                                        </p>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each
                                        select="
                                            mig2:examples/mig2:example
                                            [@co = 'object' or @co = 'all']/mig2:para">
                                        <p>
                                            <xsl:value-of select="."/>
                                        </p>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                    <xsl:if test="mig2:additionalInfo/mig2:admin/mig2:para/text()">
                        <tr>
                            <th colspan="2" scope="row" class="prop_info_group">
                                <xsl:text>Admin notes</xsl:text>
                            </th>
                            <td>
                                <ul>
                                    <xsl:for-each select="mig2:additionalInfo/mig2:admin/mig2:para">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="mig2:additionalInfo/mig2:generalNotes/mig2:para/text()">
                        <tr>
                            <th colspan="2" scope="row" class="prop_info_group">
                                <xsl:text>General notes</xsl:text>
                            </th>
                            <td>
                                <ul>
                                    <xsl:for-each
                                        select="mig2:additionalInfo/mig2:generalNotes/mig2:para">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </xsl:if>
                </tbody>
            </table>
            <p class="backlink">
                <a href="#co_props">
                    <xsl:text>Return to compound-object properties</xsl:text>
                </a>
                <br/>
                <a href="#dd_props">
                    <xsl:text>Return to data dictionary properties</xsl:text>
                </a>
            </p>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
