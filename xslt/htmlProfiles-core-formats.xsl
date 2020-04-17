<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    xmlns:j="http://www.w3.org/2005/xpath-functions"    xmlns="http://www.w3.org/2005/xpath-functions"    xmlns:brgh="https://github.com/briesenberg07/bmrLIS/" version="3.0">
  <xsl:strip-space elements="*"/>
  <xsl:param name="brgh:format"/>
  <!-- TO DOs:
    1) Create vars/param(s)/ to give format names capitalized, spelled-out, etc. as needed
    2) Other string values needed? -->
  <xsl:template match="/">
    <xsl:apply-templates select="j:map/j:map[@key = 'Profile']"/>
  </xsl:template>
  <xsl:template match="j:map/j:map[@key = 'Profile']">
    <html xmlns="http://www.w3.org/1999/xhtml" version="XHTML"            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"            xsi:schemaLocation="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
      <head>
        <!-- Need meta? -->
        <title>
          <!-- HOW TO: Get string value of $brgh:format and capitalize the first letter?
                Same as TO DO above -->
          <xsl:value-of select="concat('RDA Profile: ', $brgh:format)"/>
        </title>
        <link href="profiles.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <h1 id="profileTop">
          <xsl:value-of                        select="concat('University of Washington Libraries RDA Registry Profile for format: ', $brgh:format)"                    />
        </h1>
        <!-- Why did I use a moded template here? -->
        <xsl:apply-templates select="." mode="profileAttrs"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="." mode="profileAttrs">
    <table class="profileAttrs">
      <thead>
        <tr>
          <th>
            <xsl:text>Profile Information</xsl:text>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">Title</th>
          <td>
            <xsl:value-of select="concat(j:string[@key = 'title'],': ', $brgh:format)"/>
          </td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>
            <xsl:value-of select="concat(j:string[@key = 'id'], ':', $brgh:format)"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Author</th>
          <td>
            <xsl:value-of select="j:string[@key = 'author']"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Last Updated</th>
          <td>
            <xsl:value-of select="j:string[@key = 'date']"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Description</th>
          <td>
            <xsl:value-of select="j:string[@key = 'description']"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Schema</th>
          <td>
            <a href="{j:string[@key='schema']}">
              <xsl:value-of select="j:string[@key = 'schema']"/>
            </a>
          </td>
        </tr>
      </tbody>
    </table>
    <section class="rtsHead">
      <h2 id="rtList">
        <xsl:text>Resource Templates in </xsl:text>
        <xsl:value-of select="j:string[@key = 'title']"/>
      </h2>
      <ul>
        <xsl:for-each                    select="j:array[@key = 'resourceTemplates']/j:map/j:string[@key = 'resourceLabel']">
          <li>
            <a href="#{translate(., ' ', '')}">
              <xsl:value-of select="."/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </section>
    <xsl:apply-templates select="j:array[@key = 'resourceTemplates']/j:map" mode="rtsAttrs"/>
  </xsl:template>
  <xsl:template match="j:map" mode="rtsAttrs">
    <table class="rtsAttrs" id="{translate(j:string[@key = 'resourceLabel'], ' ', '')}">
      <thead>
        <tr>
          <th>
            <xsl:text>Resource template information: </xsl:text>
            <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">Resource IRI</th>
          <!-- Currently multiple RT URIs for Agent in source RDA profile; unsightly HTML created here -->
          <td>
            <a href="{j:string[@key='resourceURI']}">
              <xsl:value-of select="j:string[@key = 'resourceURI']"/>
            </a>
          </td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>
            <xsl:value-of select="j:string[@key = 'id']"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Last Updated</th>
          <td>
            <xsl:value-of select="j:string[@key = 'date']"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Author</th>
          <td>
            <xsl:value-of select="j:string[@key = 'author']"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Schema</th>
          <td>
            <a href="{j:string[@key = 'schema']}">
              <xsl:value-of select="j:string[@key = 'schema']"/>
            </a>
          </td>
        </tr>
        <tr>
          <th scope="row">
            <a href="#rtList">
              <i class="strong">
                <xsl:text>RETURN TO RESOURCE TEMPLATE LIST</xsl:text>
              </i>
            </a>
          </th>
        </tr>
      </tbody>
    </table>
    <section class="propsHead">
      <h3>
        <xsl:text>Properties in </xsl:text>
        <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
      </h3>
      <ul>
        <xsl:for-each select="j:array[@key = 'propertyTemplates']/j:map">
          <li>
            <a href="#{translate(j:string[@key='propertyLabel'], ' ', '')}">
              <xsl:value-of select="j:string[@key = 'propertyLabel']"/>
            </a>
          </li>
        </xsl:for-each>
        <li>
          <a href="#{translate(j:string[@key = 'resourceLabel'], ' ', '')}">
            <i class="strong">
              <xsl:text>RETURN TO RESOURCE TEMPLATE TOP</xsl:text>
            </i>
          </a>
        </li>
        <li>
          <a href="#profileTop">
            <i class="strong">
              <xsl:text>RETURN TO PAGE TOP</xsl:text>
            </i>
          </a>
        </li>
      </ul>
    </section>
    <xsl:apply-templates select="j:array[@key = 'propertyTemplates']/j:map" mode="ptsAttrs"/>
  </xsl:template>
  <xsl:template match="j:map" mode="ptsAttrs">
    <table class="ptsAttrs" id="{translate(j:string[@key='propertyLabel'], ' ', '')}">
      <thead>
        <tr>
          <th>
            <xsl:text>Property template: </xsl:text>
            <xsl:value-of select="j:string[@key = 'propertyLabel']"/>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <a href="{j:string[@key = 'propertyURI']}">
              <xsl:value-of select="j:string[@key = 'propertyURI']"/>
            </a>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:choose>
              <xsl:when test="j:string[@key = 'mandatory'] = 'true'">
                <xsl:text>Mandatory</xsl:text>
              </xsl:when>
              <xsl:when test="j:string[@key = 'mandatory'] = 'false'">
                <xsl:text>Optional</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>Missing/incorrect value for 'mandatory' (!)</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:choose>
              <xsl:when test="j:string[@key = 'repeatable'] = 'true'">
                <xsl:text>Repeatable</xsl:text>
              </xsl:when>
              <xsl:when test="j:string[@key = 'repeatable'] = 'false'">
                <xsl:text>Not repeatable</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>Missing/incorrect value for 'repeatable' (!)</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:choose>
              <xsl:when test="j:string[@key = 'type'][text()]">
                <xsl:text>Type: </xsl:text>
                <xsl:value-of select="j:string[@key = 'type']"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>Property type not given (!)</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <th scope="row">
            <xsl:text>Value constraints</xsl:text>
          </th>
          <xsl:choose>
            <xsl:when test="j:map[@key = 'valueConstraint']/descendant::text()">
              <xsl:apply-templates select="j:map[@key = 'valueConstraint']" mode="vc"                            />
            </xsl:when>
            <xsl:otherwise>
              <td>
                <xsl:text>N/A</xsl:text>
              </td>
            </xsl:otherwise>
          </xsl:choose>
        </tr>
        <tr>
          <th scope="row">
            <a href="#{translate(../../j:string[@key = 'resourceLabel'], ' ', '')}">
              <i class="strong">
                <xsl:text>RETURN TO RESOURCE TEMPLATE TOP</xsl:text>
              </i>
            </a>
          </th>
        </tr>
        <tr>
          <th scope="row">
            <a href="#profileTop">
              <i class="strong">
                <xsl:text>RETURN TO PROFILE TOP</xsl:text>
              </i>
            </a>
          </th>
        </tr>
      </tbody>
    </table>
  </xsl:template>
  <xsl:template match="j:map[@key = 'valueConstraint']" mode="vc">
    <xsl:choose>
      <xsl:when test="j:array[@key = 'valueTemplateRefs']/descendant::text()">
        <tr>
          <td/>
          <th scope="row">
            <xsl:text>Value template references</xsl:text>
          </th>
          <xsl:for-each select="j:array[@key = 'valueTemplateRefs']/j:string">
            <td>
              <xsl:value-of select="."/>
            </td>
          </xsl:for-each>
        </tr>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="j:array[@key = 'useValuesFrom']/descendant::text()">
        <tr>
          <td/>
          <th scope="row">
            <xsl:text>Use values from</xsl:text>
          </th>
          <xsl:for-each select="j:array[@key = 'useValuesFrom']/j:string">
            <td>
              <xsl:value-of select="."/>
            </td>
          </xsl:for-each>
        </tr>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="j:map[@key = 'valueDataType']/j:string[@key = 'dataTypeURI'][text()]">
        <tr>
          <td/>
          <th scope="row">
            <xsl:text>Value datatype</xsl:text>
          </th>
          <!-- Not sure if this needs to be a for-each: Are there ever multiple datatype IRIs? -->
          <xsl:for-each                        select="j:map[@key = 'valueDataType']/j:string[@key = 'dataTypeURI']">
            <td>
              <a href="{.}">
                <xsl:value-of select="."/>
              </a>
            </td>
          </xsl:for-each>
        </tr>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="j:array[@key = 'defaults']/descendant::text()">
        <tr>
          <td/>
          <th scope="row">
            <xsl:text>Defaults</xsl:text>
          </th>
        </tr>
        <xsl:for-each                    select="j:array[@key = 'defaults']/j:map/j:string[@key = 'defaultURI']/text()">
          <tr>
            <td/>
            <td/>
            <th scope="row">
              <xsl:text>Default IRI</xsl:text>
            </th>
            <td>
              <a href="{.}">
                <xsl:value-of select="."/>
              </a>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:for-each                    select="j:array[@key = 'defaults']/j:map/j:string[@key = 'defaultLiteral']/text()">
          <tr>
            <td/>
            <td/>
            <th scope="row">
              <xsl:text>Default Literal</xsl:text>
            </th>
            <td>
              <xsl:value-of select="."/>
            </td>
          </tr>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
