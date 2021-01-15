<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mig="http://www.lib.washington.edu/msd/mig/schemas/dataDictionaries"
    xmlns:mig2="http://faculty.washington.edu/tgis/schemasProject/xsd4md"
    exclude-result-prefixes="xs">

    <xsl:include href="https://github.com/uwlib-cams/webviews/raw/master/xslt/common-elements.xsl"/>

    <xsl:output method="html" html-version="5.0" indent="yes" use-character-maps="angleBrackets"/>
    <!-- I don't understand @use-character-maps, refer to:
        https://www.saxonica.com/html/documentation/xsl-elements/output.html
        https://www.saxonica.com/html/documentation/xsl-elements/character-map.html -->
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
                <!-- Style issues TBD, linking to scratch CSS for now -->
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

    <!-- NOTE that I'm going to dispense with writing templates for modes 'standalone' and 'co' at this point;
        the current project is a 'combined' DD -->

    <xsl:template match="mig:properties" mode="combined">
        <h2>
            <xsl:text>OBJECT DESCRIPTION</xsl:text>
        </h2>
        <!-- [?] Can fn:not conditions be combined? -->
        <!-- [?] What do '//' in 3rd, 4th conditions' XPaths do? -->
        <!-- Don't understand 4th condition -->
        <!-- Possible to miss relevant prop with no default CO instruction but custom instruction for CO?
        Or, just know that no customization should be created for CO, item, or standalone until a default already exists?? -->
        <xsl:for-each
            select="
                mig2:property
                [not(mig2:cdm/mig2:cdmDatatype = 'cdmAdministrative')]
                [not(mig2:cdm/mig2:dcmDatatype = 'uwAdministrative')]
                [mig2:descriptions//mig2:instructions/@co = 'object']
                [not(mig2:labels/mig2:platformIndependent = //mig:suppressObjectProp)]">
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
                    <!-- Omitting local prop URI at this point; local prop URIs still not published? -->
                    <tr>
                        <th scope="row">
                            <xsl:text>Dublin Core Equivalent</xsl:text>
                        </th>
                        <td>
                            <xsl:choose>
                                <xsl:when test="mig2:labels/mig2:dc = 'none'">
                                    <xsl:text>[No DC equivalent]</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>PICK UP HERE</xsl:text>
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
