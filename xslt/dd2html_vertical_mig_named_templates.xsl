<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mig="http://www.lib.washington.edu/msd/mig/schemas/dataDictionaries"
    xmlns:mig2="http://faculty.washington.edu/tgis/schemasProject/xsd4md"
    exclude-result-prefixes="xs" version="3.0">

    <!-- prop_lists -->
    <xsl:template name="prop_lists">
        <xsl:param name="set"/>
        <xsl:param name="lists_context"/>
        <xsl:if
            test="
                $lists_context
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]/node()">
            <h4>
                <xsl:text>Descriptive Properties</xsl:text>
            </h4>
            <ol>
                <xsl:for-each
                    select="
                        $lists_context
                        [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                        [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]">
                    <xsl:choose>
                        <xsl:when test="$set = 'object'">
                            <li>
                                <a href="{concat('#object_', mig2:uid)}">
                                    <xsl:value-of select="mig2:cdm/mig2:label"/>
                                </a>
                            </li>
                        </xsl:when>
                        <xsl:when test="$set = 'item'">
                            <li>
                                <a href="{concat('#item_', mig2:uid)}">
                                    <xsl:value-of select="mig2:cdm/mig2:label"/>
                                </a>
                            </li>
                        </xsl:when>
                        <xsl:when test="$set = 'no'">
                            <li>
                                <a href="{concat('#no_', mig2:uid)}">
                                    <xsl:value-of select="mig2:cdm/mig2:label"/>
                                </a>
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>ERROR HERE</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ol>
        </xsl:if>
        <xsl:if
            test="
                $lists_context
                [mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or
                mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']/node()">
            <h4>
                <xsl:text>Administrative Properties</xsl:text>
            </h4>
            <ol>
                <xsl:for-each
                    select="
                        $lists_context
                        [mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or
                        mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']">
                    <xsl:choose>
                        <xsl:when test="$set = 'object'">
                            <li>
                                <a href="{concat('#object_', mig2:uid)}">
                                    <xsl:value-of select="mig2:cdm/mig2:label"/>
                                </a>
                            </li>
                        </xsl:when>
                        <xsl:when test="$set = 'item'">
                            <li>
                                <a href="{concat('#item_', mig2:uid)}">
                                    <xsl:value-of select="mig2:cdm/mig2:label"/>
                                </a>
                            </li>
                        </xsl:when>
                        <xsl:when test="$set = 'no'">
                            <li>
                                <a href="{concat('#no_', mig2:uid)}">
                                    <xsl:value-of select="mig2:cdm/mig2:label"/>
                                </a>
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>ERROR HERE</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ol>
        </xsl:if>
    </xsl:template>

    <!-- prop_tables -->
    <!-- prop_tables template could be further modularized -->
    <xsl:template name="prop_tables">
        <xsl:param name="tables_context"/>
        <xsl:param name="set"/>
        <xsl:if
            test="
                $tables_context
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]/node()">
            <xsl:choose>
                <xsl:when test="$set = 'object'">
                    <h2>
                        <xsl:text>Compound Object Descriptive Properties</xsl:text>
                    </h2>
                </xsl:when>
                <xsl:when test="$set = 'item'">
                    <h2>
                        <xsl:text>Compound-object Item Descriptive Properties</xsl:text>
                    </h2>
                </xsl:when>
                <xsl:when test="$set = 'no'">
                    <h2>
                        <xsl:text>Standalone Object Descriptive Properties</xsl:text>
                    </h2>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>ERROR HERE</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each
                select="
                    $tables_context
                    [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                    [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]">
                <table>
                    <thead>
                        <tr>
                            <xsl:choose>
                                <xsl:when test="$set = 'object'">
                                    <th colspan="3" id="{concat('object_', mig2:uid)}"
                                        class="prop_table_head">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>. </xsl:text>
                                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                                    </th>
                                </xsl:when>
                                <xsl:when test="$set = 'item'">
                                    <th colspan="3" id="{concat('item_', mig2:uid)}"
                                        class="prop_table_head">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>. </xsl:text>
                                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                                    </th>
                                </xsl:when>
                                <xsl:when test="$set = 'no'">
                                    <th colspan="3" id="{concat('no_', mig2:uid)}"
                                        class="prop_table_head">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>. </xsl:text>
                                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                                    </th>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>ERROR HERE</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <!-- Is scope attribute correct here?? -->
                            <!-- Why would rowspan be 5!?! I do not understand this, but this works -->
                            <th rowspan="5" scope="rowgroup" class="prop_info_group">
                                <p class="pad_lr">
                                    <xsl:text>CONTENTdm field properties*</xsl:text>
                                </p>
                                <!-- BMR TO DO: complete field properties shown -
                                    large
                                    data type
                                 [?] Change order to match CONTENTdm UI -->
                                <p class="italic pad_lr">
                                    <xsl:text>*CONTENTdm Administration &#xbb; Collections &#xbb; Field properties &#xbb; </xsl:text>
                                    <a
                                        href="https://briesenberg07.github.io/libraryNotes/images/cdm_edit_field_properties.jpg">
                                        <xsl:text>edit</xsl:text>
                                    </a>
                                </p>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row" class="pad_lr">
                                <xsl:text>'DC map' setting</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:choose>
                                    <xsl:when test="mig2:labels/mig2:dc = 'none'">
                                        <xsl:text>None</xsl:text>
                                    </xsl:when>
                                    <!-- Special condition with hard-coding for the restrictions property (does not match label of equivalent DC Element) -->
                                    <xsl:when
                                        test="mig2:labels/mig2:platformIndependent = 'restrictions'">
                                        <xsl:text>rights</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="mig2:labels/mig2:dc"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Searchable?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:searchable"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Controlled vocabulary?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:cdmControlledVocab"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Hidden?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:hidden"/>
                            </td>
                        </tr>
                        <tr>
                            <!-- Don't understand "add 1 to rowspan"... -->
                            <th rowspan="6" scope="rowgroup" class="pad_lr prop_info_group">
                                <xsl:text>Required status, definition, guidance</xsl:text>
                            </th>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Required by CONTENTdm?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:cdmRequired"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Required by UW Libraries?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:uwRequired/mig2:uwObject"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Property definition</xsl:text>
                            </th>
                            <td>
                                <ul>
                                    <xsl:for-each
                                        select="mig2:descriptions/mig2:definition/mig2:para">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Input instructions</xsl:text>
                            </th>
                            <td>
                                <ul>
                                    <xsl:choose>
                                        <xsl:when
                                            test="mig2:descriptions/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/node()">
                                            <xsl:for-each
                                                select="mig2:descriptions/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/mig2:para">
                                                <li>
                                                  <xsl:value-of select="."/>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:for-each
                                                select="mig2:descriptions/mig2:instructions[@co = $set]/mig2:para">
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
                            <th class="pad_lr" scope="row">
                                <xsl:text>Input examples</xsl:text>
                            </th>
                            <td>
                                <xsl:choose>
                                    <xsl:when
                                        test="mig2:examples/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/node()">
                                        <xsl:for-each
                                            select="
                                                mig2:examples/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/mig2:para">
                                            <p class="pad_lr">
                                                <xsl:value-of select="."/>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each
                                            select="
                                                mig2:examples/mig2:example
                                                [@co = $set or @co = 'all']/mig2:para">
                                            <p class="pad_lr">
                                                <xsl:value-of select="."/>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <!-- Note that XPath here does not account for @co attribute of admin elements, ouputs all to HTML -->
                        <xsl:if test="mig2:additionalInfo/mig2:admin/mig2:para/text()">
                            <tr>
                                <th colspan="2" scope="row" class="pad_lr prop_info_group">
                                    <xsl:text>Admin notes</xsl:text>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each
                                            select="mig2:additionalInfo/mig2:admin/mig2:para">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <!-- Note that XPath here does not account for @co attribute of admin elements, ouputs all to HTML -->
                        <xsl:if test="mig2:additionalInfo/mig2:generalNotes/mig2:para/text()">
                            <tr>
                                <th colspan="2" scope="row" class="pad_lr prop_info_group">
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
                <xsl:call-template name="backlinks">
                    <xsl:with-param name="backlink_set" select="$set"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>
        <xsl:if
            test="$tables_context[mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']/node()">
            <xsl:choose>
                <xsl:when test="$set = 'object'">
                    <h2>
                        <xsl:text>Compound Object Administrative Properties</xsl:text>
                    </h2>
                </xsl:when>
                <xsl:when test="$set = 'item'">
                    <h2>
                        <xsl:text>Compound-object Item Administrative Properties</xsl:text>
                    </h2>
                </xsl:when>
                <xsl:when test="$set = 'no'">
                    <h2>
                        <xsl:text>Standalone Object Administrative Properties</xsl:text>
                    </h2>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>ERROR HERE</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each
                select="
                    $tables_context
                    [mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']">
                <table>
                    <thead>
                        <tr>
                            <xsl:choose>
                                <xsl:when test="$set = 'object'">
                                    <th colspan="3" id="{concat('object_', mig2:uid)}"
                                        class="prop_table_head">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>. </xsl:text>
                                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                                    </th>
                                </xsl:when>
                                <xsl:when test="$set = 'item'">
                                    <th colspan="3" id="{concat('item_', mig2:uid)}"
                                        class="prop_table_head">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>. </xsl:text>
                                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                                    </th>
                                </xsl:when>
                                <xsl:when test="$set = 'no'">
                                    <th colspan="3" id="{concat('no_', mig2:uid)}"
                                        class="prop_table_head">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>. </xsl:text>
                                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                                    </th>
                                </xsl:when>
                            </xsl:choose>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <!-- Is scope attribute correct here?? -->
                            <!-- Why would rowspan be 5!?! I do not understand this, but this works -->
                            <th rowspan="5" scope="rowgroup" class="prop_info_group">
                                <p class="pad_lr">
                                    <xsl:text>CONTENTdm field properties*</xsl:text>
                                </p>
                                <!-- BMR TO DO: complete field properties shown -
                                    large
                                    data type
                                 [?] Change order to match CONTENTdm UI -->
                                <p class="italic pad_lr">
                                    <xsl:text>*CONTENTdm Administration &#xbb; Collections &#xbb; Field properties &#xbb; </xsl:text>
                                    <a
                                        href="https://briesenberg07.github.io/libraryNotes/images/cdm_edit_field_properties.jpg">
                                        <xsl:text>edit</xsl:text>
                                    </a>
                                </p>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row" class="pad_lr">
                                <xsl:text>Dublin Core Equivalent</xsl:text>
                            </th>
                            <td class="pad_lr">
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
                            <th class="pad_lr" scope="row">
                                <xsl:text>Searchable?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:searchable"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Controlled vocabulary?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:cdmControlledVocab"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Hidden?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:hidden"/>
                            </td>
                        </tr>
                        <tr>
                            <!-- Don't understand "add 1 to rowspan"... -->
                            <th rowspan="6" scope="rowgroup" class="pad_lr prop_info_group">
                                <xsl:text>Required status, definition, guidance</xsl:text>
                            </th>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Required by CONTENTdm?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:cdm/mig2:cdmRequired"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Required by UW Libraries?</xsl:text>
                            </th>
                            <td class="pad_lr">
                                <xsl:value-of select="mig2:uwRequired/mig2:uwObject"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Property definition</xsl:text>
                            </th>
                            <td>
                                <ul>
                                    <xsl:for-each
                                        select="mig2:descriptions/mig2:definition/mig2:para">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th class="pad_lr" scope="row">
                                <xsl:text>Input instructions</xsl:text>
                            </th>
                            <td>
                                <ul>
                                    <xsl:choose>
                                        <xsl:when
                                            test="mig2:descriptions/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/node()">
                                            <xsl:for-each
                                                select="mig2:descriptions/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/mig2:para">
                                                <li>
                                                  <xsl:value-of select="."/>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:for-each
                                                select="mig2:descriptions/mig2:instructions[@co = $set]/mig2:para">
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
                            <th class="pad_lr" scope="row">
                                <xsl:text>Input examples</xsl:text>
                            </th>
                            <td>
                                <xsl:choose>
                                    <xsl:when
                                        test="mig2:examples/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/node()">
                                        <xsl:for-each
                                            select="
                                                mig2:examples/mig2:customization[@co = $set][@dd = ../../../../mig:cdmCode]/mig2:para">
                                            <p class="pad_lr">
                                                <xsl:value-of select="."/>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each
                                            select="
                                                mig2:examples/mig2:example
                                                [@co = $set or @co = 'all']/mig2:para">
                                            <p class="pad_lr">
                                                <xsl:value-of select="."/>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <!-- Note that XPath here does not account for @co attribute of admin elements, ouputs all to HTML -->
                        <xsl:if test="mig2:additionalInfo/mig2:admin/mig2:para/text()">
                            <tr>
                                <th colspan="2" scope="row" class="pad_lr prop_info_group">
                                    <xsl:text>Admin notes</xsl:text>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each
                                            select="mig2:additionalInfo/mig2:admin/mig2:para">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <!-- Note that XPath here does not account for @co attribute of admin elements, ouputs all to HTML -->
                        <xsl:if test="mig2:additionalInfo/mig2:generalNotes/mig2:para/text()">
                            <tr>
                                <th colspan="2" scope="row" class="pad_lr prop_info_group">
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
                <xsl:call-template name="backlinks">
                    <xsl:with-param name="backlink_set" select="$set"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <!-- backlinks -->
    <xsl:template name="backlinks">
        <xsl:param name="backlink_set"/>
        <p class="backlink italic">
            <xsl:choose>
                <xsl:when test="$backlink_set = 'object'">
                    <a href="{concat('#', $backlink_set, '_props')}">
                        <xsl:text>Return to compound-object properties</xsl:text>
                    </a>
                </xsl:when>
                <xsl:when test="$backlink_set = 'item'">
                    <a href="{concat('#', $backlink_set, '_props')}">
                        <xsl:text>Return to compound-object item properties</xsl:text>
                    </a>
                </xsl:when>
                <xsl:when test="$backlink_set = 'no'">
                    <a href="{concat('#', $backlink_set, '_props')}">
                        <xsl:text>Return to standalone object properties</xsl:text>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>ERROR HERE</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>  |  </xsl:text>
            <a href="#dd_props">
                <xsl:text>Return to data dictionary properties</xsl:text>
            </a>
        </p>
    </xsl:template>

</xsl:stylesheet>
