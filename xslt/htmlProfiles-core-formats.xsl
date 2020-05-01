<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:j="http://www.w3.org/2005/xpath-functions"
  xmlns:brgh="https://github.com/briesenberg07/bmrLIS/" exclude-result-prefixes="j" version="3.0">
  <xsl:strip-space elements="*"/>

  <xsl:param name="brgh:format"/>
  <xsl:variable name="id" select="concat(':', $brgh:format)"/>
  <xsl:variable name="desc">
    <xsl:choose>
      <xsl:when test="$brgh:format = 'adminMetadata'">
        <xsl:text> for administrative metadata</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'dvdVideo'">
        <xsl:text> for DVD videos</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eBook'">
        <xsl:text> for e-books</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eGraphic'">
        <xsl:text> for electronic graphic materials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eMap'">
        <xsl:text> for electronic maps</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eSerial'">
        <xsl:text> for electronic serials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'etd'">
        <xsl:text> for electronic theses and dissertations</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'graphic'">
        <xsl:text> for graphic materials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'map'">
        <xsl:text> for maps</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'monograph'">
        <xsl:text> for monographs</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'serial'">
        <xsl:text> for serials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'soundRecording'">
        <xsl:text> for sound recordings</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="$brgh:format = 'adminMetadata'">
        <xsl:text> for Administrative Metadata</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'dvdVideo'">
        <xsl:text> for DVD Videos</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eBook'">
        <xsl:text> for e-Books</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eGraphic'">
        <xsl:text> for Electronic Graphic Materials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eMap'">
        <xsl:text> for Electronic Maps</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'eSerial'">
        <xsl:text> for Electronic Serials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'etd'">
        <xsl:text> for Electronic Theses and Dissertations</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'graphic'">
        <xsl:text> for Graphic Materials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'map'">
        <xsl:text> for Maps</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'monograph'">
        <xsl:text> for Monographs</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'serial'">
        <xsl:text> for Serials</xsl:text>
      </xsl:when>
      <xsl:when test="$brgh:format = 'soundRecording'">
        <xsl:text> for Sound Recordings</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

  <xsl:template match="/">
    <xsl:apply-templates select="j:map/j:map[@key = 'Profile']" mode="html"/>
  </xsl:template>
  <xsl:template match="j:map/j:map[@key = 'Profile']" mode="html">
    <!-- Would there be any advantages to outputting HTML5 over XHTML? Is this possible/advisable? -->
    <html xmlns="http://www.w3.org/1999/xhtml" version="XHTML"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
      <head>
        <title>
          <xsl:value-of select="concat('RDA/RDF profile | ', $brgh:format)"/>
        </title>
        <link href="profiles.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <h1 id="profile">
          <xsl:value-of
            select="concat('University of Washington Libraries RDA/RDF Profile', $title)"/>
        </h1>
        <xsl:apply-templates select="." mode="profileInfo"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="j:map/j:map[@key = 'Profile']" mode="profileInfo">
    <!-- Why am I getting attr xmlns="" in table element below? -->
    <table class="profileInfo">
      <thead>
        <tr>
          <th colspan="2">
            <xsl:text>Profile: </xsl:text>
            <xsl:value-of select="j:string[@key = 'title']"/>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">Title</th>
          <td>
            <xsl:value-of select="concat(j:string[@key = 'title'], $title)"/>
          </td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>
            <xsl:value-of select="concat(j:string[@key = 'id'], $id)"/>
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
            <xsl:value-of select="format-date(current-date(), '[Y0001]-[M01]-[D01]')"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Description</th>
          <td>
            <xsl:value-of select="concat('Resource templates and property templates', $desc)"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Schema</th>
          <td>
            <!-- *NOTE hard coding* -->
            <a href="https://ld4p.github.io/sinopia/schemas/0.2.1/profile.json">
              <xsl:text>https://ld4p.github.io/sinopia/schemas/0.2.1/profile.json</xsl:text>
            </a>
          </td>
        </tr>
      </tbody>
    </table>
    <!-- section element? XHTML or HTML5? Etc. Etc. -->
    <section class="rtList">
      <h2 id="rtList">
        <xsl:text>Resource Templates </xsl:text>
        <xsl:value-of select="$title"/>
      </h2>
      <ul>
        <xsl:for-each
          select="j:array[@key = 'resourceTemplates']/j:map[j:array[@key = 'propertyTemplates']/j:map/j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
          <li>
            <a href="#{translate(j:string[@key='resourceLabel'],' ','')}">
              <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </section>
    <xsl:apply-templates select="j:array[@key = 'resourceTemplates']/j:map" mode="rtInfo"/>
  </xsl:template>
  <xsl:template match="j:array[@key = 'resourceTemplates']/j:map" mode="rtInfo">
    <xsl:for-each
      select=".[j:array[@key = 'propertyTemplates']/j:map/j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
      <table class="rtInfo" id="{translate(j:string[@key='resourceLabel'],' ', '')}">
        <thead>
          <tr>
            <th colspan="2">
              <xsl:text>Resource Template: </xsl:text>
              <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
              <xsl:value-of select="$title"/>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">Resource IRI</th>
            <td>
              <a href="{j:string[@key='resourceURI']}">
                <xsl:value-of select="j:string[@key = 'resourceURI']"/>
              </a>
            </td>
          </tr>
          <tr>
            <th scope="row">Label</th>
            <td>
              <!-- Would like a way to remove 'WAU RT ' from labels here and elsewhere -->
              <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
            </td>
          </tr>
          <tr>
            <th scope="row">ID</th>
            <td>
              <xsl:value-of select="j:string[@key = 'id']"/>
            </td>
          </tr>
          <!-- <tr>
            <th scope="row" colspan="2">
              <a href="#rtList">
                <xsl:text>RETURN TO RESOURCE TEMPLATE LIST</xsl:text>
              </a>
            </th>
          </tr> -->
          <tr>
            <th scope="row" colspan="2">
              <a href="#profile">
                <xsl:text>RETURN TO PROFILE TOP</xsl:text>
              </a>
            </th>
          </tr>
        </tbody>
      </table>
      <section class="ptList">
        <h3 id="{concat(translate(j:string[@key='resourceLabel'],' ',''), 'ptList')}">
          <xsl:text>Property Templates in </xsl:text>
          <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
          <xsl:value-of select="$title"/>
        </h3>
        <!-- TO DO: SORT BY uwFormOrder
          Is this the correct place to add xsl:sort for property templates? -->
        <ul>
          <xsl:for-each
            select="j:array[@key = 'propertyTemplates']/j:map[j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
            <xsl:sort select="j:number[@key = 'uwFormOrder']" data-type="number"/>
            <li>
              <!-- NOTE translate pattern for later use when creating prop ID values -->
              <a href="#{translate(j:string[@key='propertyLabel'],' (*)','')}">
                <xsl:value-of select="j:string[@key = 'propertyLabel']"/>
              </a>
            </li>
          </xsl:for-each>
          <li>
            <a href="#{translate(j:string[@key='resourceLabel'],' ', '')}" class="toRtTop">
              <strong>
                <xsl:text>RETURN TO RESOURCE TEMPLATE TOP</xsl:text>
              </strong>
            </a>
          </li>
          <li>
            <a href="#profile" class="toRtList">
              <strong>
                <xsl:text>RETURN TO PROFILE TOP</xsl:text>
              </strong>
            </a>
          </li>
        </ul>
      </section>
    </xsl:for-each>
    <xsl:apply-templates select="j:array[@key = 'propertyTemplates']/j:map" mode="ptInfo"/>
  </xsl:template>
  <xsl:template match="j:array[@key = 'propertyTemplates']/j:map" mode="ptInfo">
    <xsl:for-each select=".[j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
      <xsl:sort select="j:number[@key = 'uwFormOrder']"/>
      <!-- See translate pattern NOTE above -->
      <section class="ptInfo" id="{translate(j:string[@key='propertyLabel'],' (*)','')}">
        <h4>
          <span>
            <xsl:text>Property Template: </xsl:text>
            <xsl:value-of select="j:string[@key = 'propertyLabel']"/>
          </span>
        </h4>
        <ul>
          <li>
            <xsl:text>Property IRI: </xsl:text>
            <a href="{j:string[@key='propertyURI']}">
              <xsl:value-of select="j:string[@key = 'propertyURI']"/>
            </a>
          </li>
          <!-- May want to double-check my node/child text elements tests,
            especially later when testing for content in child nodes;
            see prev. html transform -->
          <xsl:if test="j:string[@key = 'remark']/text()">
            <li>
              <xsl:text>RDA Toolkit Element Reference: </xsl:text>
              <!-- Would be a great place for a regex to get part of URL or part of label
                  and display rule number as hot text -->
              <a href="{j:string[@key='remark']}">
                <xsl:value-of select="j:string[@key = 'remark']"/>
              </a>
            </li>
          </xsl:if>
        </ul>
      </section>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
