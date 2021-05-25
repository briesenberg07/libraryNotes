<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mig="http://www.lib.washington.edu/msd/mig/schemas/dataDictionaries"
    xmlns:mig2="http://faculty.washington.edu/tgis/schemasProject/xsd4md"
    exclude-result-prefixes="xs" version="3.0">

    <!-- prop_list -->
    <!-- creates 2 lists, descriptive props and admin props -->
    <xsl:template name="prop_list">
        <xsl:param name="prop_list_context"/>
        <xsl:param name="resource_type"/>
        <xsl:param name="set"/>
        
        <!-- descriptive props; first test to make sure that descriptive-prop nodes exist in the DD prop list -->
        <xsl:if
            test="
                $prop_list_context
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]/node()">
            <h5>
                <xsl:text>Descriptive Properties</xsl:text>
            </h5>
            <ol>
                <xsl:for-each
                    select="
                        $prop_list_context
                        [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                        [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]">
                    <li>
                        <!-- BMR: Change href for prop details -->
                        <a href="{concat('#', $resource_type, '_', $set, '_', mig2:uid)}">
                            <xsl:value-of select="mig2:cdm/mig2:label"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ol>
        </xsl:if>
        
        <!-- administrative props; first test for nodes as above -->
        <xsl:if
            test="
                $prop_list_context
                [mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or
                mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']/node()">
            <h5>
                <xsl:text>Administrative Properties</xsl:text>
            </h5>
            <ol>
                <xsl:for-each
                    select="
                        $prop_list_context
                        [mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or
                        mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']">
                    <li>
                        <!-- BMR: Change href for prop details -->
                        <a href="{concat('#', $resource_type, '_', $set, '_', mig2:uid)}">
                            <xsl:value-of select="mig2:cdm/mig2:label"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ol>
        </xsl:if>
    </xsl:template>

    <!-- prop_detail_heading -->
    <xsl:template name="prop_detail_heading">
        <xsl:param name="prop_detail_context"/>
        <xsl:param name="resource_type"/>
        <xsl:param name="set"/>
        <h2>
            <xsl:text>Property Details: </xsl:text>
            <xsl:choose>
                <xsl:when test="$resource_type = 'text'">
                    <xsl:text>Textual Resources</xsl:text>
                </xsl:when>
                <!-- BMR note choices for set param values here -->
                <xsl:when test="$resource_type = 'ballad'">
                    <xsl:text>Audio - Ballads</xsl:text>
                </xsl:when>
                <xsl:when test="$resource_type = 'oh'">
                    <xsl:text>Audio - Oral Histories</xsl:text>
                </xsl:when>
            </xsl:choose>
        </h2>
        <!-- BMR: breaks here...
        BECAUSE the transform can't get from the DD to the prop files,
        BECAUSE the DD is accessed by a URL, but then it gives filepaths for the prop files!!
        Hmmmm...
        But I think I fixed that (??) and it still doesn't seem to be able to get any data from this point on...
        -->
        <xsl:if
            test="
                $prop_detail_context
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]/node()">
            <h3>
                <xsl:choose>
                    <xsl:when test="$resource_type = 'text'">
                        <xsl:text>Textual Resources</xsl:text>
                    </xsl:when>
                    <!-- BMR note choices for set param values here -->
                    <xsl:when test="$resource_type = 'ballad'">
                        <xsl:text>Audio - Ballads</xsl:text>
                    </xsl:when>
                    <xsl:when test="$resource_type = 'oh'">
                        <xsl:text>Audio - Oral Histories</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:text>: </xsl:text>
                <xsl:choose>
                    <xsl:when test="$set = 'object'">
                        <xsl:text>Compound-Object Descriptive Properties</xsl:text>
                    </xsl:when>
                    <xsl:when test="$set = 'item'">
                        <xsl:text>Compound-Object Item Descriptive Properties</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>ERROR HERE</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </h3>
            <xsl:call-template name="prop_detail_table">
                <xsl:with-param name="prop_detail_table_context"
                    select="
                        $prop_detail_context
                        [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                        [not(mig2:cdm/mig2:cdmDatatype = 'uwAdministrative')]"/>
                <xsl:with-param name="table_resource_type" select="$resource_type"/>
                <xsl:with-param name="table_set" select="$set"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if
            test="$prop_detail_context[mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']/node()">
                <h2>
                    <xsl:choose>
                        <xsl:when test="$resource_type = 'text'">
                            <xsl:text>Textual Resources</xsl:text>
                        </xsl:when>
                        <!-- BMR note choices for set param values here -->
                        <xsl:when test="$resource_type = 'ballad'">
                            <xsl:text>Audio - Ballads</xsl:text>
                        </xsl:when>
                        <xsl:when test="$resource_type = 'oh'">
                            <xsl:text>Audio - Oral Histories</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text>: </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$set = 'object'">
                            <xsl:text>Compound Object Administrative Properties</xsl:text>
                        </xsl:when>
                        <xsl:when test="$set = 'object'">
                            <xsl:text>Compound-Object Item Administrative Properties</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>ERROR HERE</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </h2>
            <xsl:call-template name="prop_detail_table">
                <xsl:with-param name="prop_detail_table_context"
                    select="
                        $prop_detail_context
                        [mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative' or mig2:cdm/mig2:cdmDatatype = 'uwAdministrative']"/>
                <xsl:with-param name="table_resource_type" select="$resource_type"/>
                <xsl:with-param name="table_set" select="$set"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- prop_detail_table -->
    <xsl:template name="prop_detail_table">
        <xsl:param name="prop_detail_table_context"/>
        <xsl:param name="table_resource_type"/>
        <xsl:param name="table_set"/>
        <xsl:for-each select="$prop_detail_table_context">
            <table>
                <thead>
                    <tr>
                        <th colspan="3"
                            id="{concat($table_resource_type, '_', $table_set, '_', mig2:uid)}"
                            class="prop_table_head">
                            <xsl:value-of select="position()"/>
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="mig2:cdm/mig2:label"/>
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
                                <xsl:for-each select="mig2:descriptions/mig2:definition/mig2:para">
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
                                        test="mig2:descriptions/mig2:customization[@co = $table_set][@dd = ../../../../mig:cdmCode]/node()">
                                        <xsl:for-each
                                            select="mig2:descriptions/mig2:customization[@co = $table_set][@dd = ../../../../mig:cdmCode]/mig2:para">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each
                                            select="mig2:descriptions/mig2:instructions[@co = $table_set]/mig2:para">
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
                                    test="mig2:examples/mig2:customization[@co = $table_set][@dd = ../../../../mig:cdmCode]/node()">
                                    <xsl:for-each
                                        select="
                                            mig2:examples/mig2:customization[@co = $table_set][@dd = ../../../../mig:cdmCode]/mig2:para">
                                        <p class="pad_lr">
                                            <xsl:value-of select="."/>
                                        </p>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each
                                        select="
                                            mig2:examples/mig2:example
                                            [@co = $table_set or @co = 'all']/mig2:para">
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
                                    <xsl:for-each select="mig2:additionalInfo/mig2:admin/mig2:para">
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
                <xsl:with-param name="backlink_resource_type" select="$table_resource_type"/>
                <xsl:with-param name="backlink_set" select="$table_set"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <!-- backlinks -->
    <xsl:template name="backlinks">
        <xsl:param name="backlink_resource_type"/>
        <xsl:param name="backlink_set"/>
        <p class="backlink italic">
            <xsl:text>Return to </xsl:text>
            <!-- return to DD > resource_type > set -->
            <a href="{concat('#', $backlink_resource_type, '_', $backlink_set, '_props')}">
                <xsl:choose>
                    <xsl:when test="$backlink_resource_type = 'text'">
                        <xsl:text>Textual Resources</xsl:text>
                    </xsl:when>
                    <xsl:when test="$backlink_resource_type = 'ballad'">
                        <xsl:text>Audio - Ballads</xsl:text>
                    </xsl:when>
                    <xsl:when test="$backlink_resource_type = 'oh'">
                        <xsl:text>Audio - Oral Histories</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:text> &gt; </xsl:text>
                <xsl:choose>
                    <xsl:when test="$backlink_set = 'object'">
                        <xsl:text>Compound-Object Properties</xsl:text>
                    </xsl:when>
                    <xsl:when test="$backlink_set = 'item'">
                        <xsl:text>Compound-Object Item Properties</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </a>
            <xsl:text>  |  </xsl:text>
            <!-- return to DD> resource_type -->
            <a href="{concat('#', $backlink_resource_type, '_props')}">
                <xsl:choose>
                    <xsl:when test="$backlink_resource_type = 'text'">
                        <xsl:text>Textual Resource</xsl:text>
                    </xsl:when>
                    <xsl:when test="$backlink_resource_type = 'ballad'">
                        <xsl:text>Audio - Ballad</xsl:text>
                    </xsl:when>
                    <xsl:when test="$backlink_resource_type = 'oh'">
                        <xsl:text>Audio - Oral History</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:text> Properties</xsl:text>
            </a>
            <xsl:text>  |  </xsl:text>
            <!-- return to DD -->
            <a href="#dd_props">
                <xsl:text>Data Dictionary Properties</xsl:text>
            </a>
        </p>
    </xsl:template>

</xsl:stylesheet>
