<?xml version="1.0" encoding="UTF-8"?>
<!-- Copied/modified from dds-to-html-vertical-staff.xsl ('original')-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mig="http://www.lib.washington.edu/msd/mig/schemas/dataDictionaries"
    xmlns:mig2="http://faculty.washington.edu/tgis/schemasProject/xsd4md"
    exclude-result-prefixes="xs">

    <xsl:template name="prop_list_items">
        <xsl:param name="context"/>
        <xsl:param name="set"/>
        <xsl:choose>
            <xsl:when test="$set = 'co'">
                <li>
                    <a href="{concat('#co_object_', mig2:uid)}">
                        <xsl:value-of select="mig2:cdm/mig2:label"/>
                    </a>
                </li>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>STILL TO-DO</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="prop_tables">
        <xsl:param name="context"/>
        <xsl:param name="set"/>
        <table>
            <thead>
                <tr>
                    <th colspan="3" id="{concat('co_object_', $context/mig2:uid)}"
                        class="prop_table_head">
                        <xsl:value-of select="position()"/>
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="$context/mig2:cdm/mig2:label"/>
                    </th>
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
                            <xsl:when test="$context/mig2:labels/mig2:dc = 'none'">
                                <xsl:text>[No DC equivalent]</xsl:text>
                            </xsl:when>
                            <!-- Special condition with hard-coding for the restrictions property (does not match label of equivalent DC Element) -->
                            <xsl:when
                                test="$context/mig2:labels/mig2:platformIndependent = 'restrictions'">
                                <a href="http://purl.org/dc/elements/1.1/rights">rights</a>
                                <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                            </xsl:when>
                            <!-- Condition for equivalents which 1) are OWL datatype props and 2) match DC Element names -->
                            <xsl:when test="$context/mig2:rdf/mig2:owlDatatypeProperty = 'yes'">
                                <a
                                    href="{concat('http://purl.org/dc/elements/1.1/', $context/mig2:labels/mig2:dc)}">
                                    <xsl:value-of select="$context/mig2:labels/mig2:dc"/>
                                </a>
                                <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                            </xsl:when>
                            <!-- Condition for equivalents which 2) are *not* OWL datatype props and 2) match DC Element names -->
                            <xsl:when test="$context/mig2:rdf/mig2:owlDatatypeProperty = 'no'">
                                <a
                                    href="{concat('http://purl.org/dc/elements/1.1/', $context/mig2:labels/mig2:dc)}">
                                    <xsl:value-of select="$context/mig2:labels/mig2:dc"/>
                                </a>
                                <xsl:text> [Dublin Core Element Set 1.1]</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <a
                                    href="{concat('http://purl.org/dc/terms/', $context/mig2:labels/mig2:dc)}">
                                    <xsl:value-of select="$context/mig2:labels/mig2:dc"/>
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
                        <xsl:value-of select="$context/mig2:cdm/mig2:searchable"/>
                    </td>
                </tr>
                <tr>
                    <th class="pad_lr" scope="row">
                        <xsl:text>Controlled vocabulary?</xsl:text>
                    </th>
                    <td class="pad_lr">
                        <xsl:value-of select="$context/mig2:cdm/mig2:cdmControlledVocab"/>
                    </td>
                </tr>
                <tr>
                    <th class="pad_lr" scope="row">
                        <xsl:text>Hidden?</xsl:text>
                    </th>
                    <td class="pad_lr">
                        <xsl:value-of select="$context/mig2:cdm/mig2:hidden"/>
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
                        <xsl:value-of select="$context/mig2:cdm/mig2:cdmRequired"/>
                    </td>
                </tr>
                <tr>
                    <th class="pad_lr" scope="row">
                        <xsl:text>Required by UW Libraries?</xsl:text>
                    </th>
                    <td class="pad_lr">
                        <xsl:value-of select="$context/mig2:uwRequired/mig2:uwObject"/>
                    </td>
                </tr>
                <tr>
                    <th class="pad_lr" scope="row">
                        <xsl:text>Property definition</xsl:text>
                    </th>
                    <td>
                        <ul>
                            <xsl:for-each
                                select="$context/mig2:descriptions/mig2:definition/mig2:para">
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
                                <!-- See comment in the original XSLT...is there a problem here? -->
                                <xsl:when
                                    test="$context/../../mig:cdmCode = mig2:descriptions/mig2:customization/@dd">
                                    <xsl:for-each
                                        select="$context/mig2:descriptions/mig2:customization[@co = 'object'][@dd = ../../../../mig:cdmCode]/mig2:para">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each
                                        select="$context/mig2:descriptions/mig2:instructions[@co = 'object']/mig2:para">
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
                                test="$context/../../mig:cdmCode = mig2:examples/mig2:customization/@dd">
                                <xsl:for-each
                                    select="
                                        $context/mig2:examples/mig2:customization[@co = 'object']
                                        [@dd = ../../../../mig:cdmCode]/mig2:para">
                                    <p class="pad_lr">
                                        <xsl:value-of select="."/>
                                    </p>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:for-each
                                    select="
                                        $context/mig2:examples/mig2:example
                                        [@co = 'object' or @co = 'all']/mig2:para">
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
                                    select="$context/mig2:additionalInfo/mig2:admin/mig2:para">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                    </tr>
                </xsl:if>
                <!-- Note that XPath here does not account for @co attribute of admin elements, ouputs all to HTML -->
                <xsl:if test="$context/mig2:additionalInfo/mig2:generalNotes/mig2:para/text()">
                    <tr>
                        <th colspan="2" scope="row" class="pad_lr prop_info_group">
                            <xsl:text>General notes</xsl:text>
                        </th>
                        <td>
                            <ul>
                                <xsl:for-each
                                    select="$context/mig2:additionalInfo/mig2:generalNotes/mig2:para">
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
        <p class="backlink italic">
            <xsl:choose>
                <xsl:when test="$set = 'co'">
                    <a href="#co_props">
                        <xsl:text>Return to compound-object properties</xsl:text>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>STILL TO-DO</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>  |  </xsl:text>
            <a href="#dd_props">
                <xsl:text>Return to data dictionary properties</xsl:text>
            </a>
        </p>
    </xsl:template>

</xsl:stylesheet>
