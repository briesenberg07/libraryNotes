<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.loc.gov/MARC21/slim"
    version="2.0" exclude-result-prefixes="oai dc">

<!-- 
     Version: 3.1
     Date: August 7, 2017
 -->
    <!-- BMR note: Only need to preserve in leader? Not 006, 007, etc.? -->
    <xsl:preserve-space elements="leader"/>
    <xsl:output indent="yes" encoding="UTF-8"/>

    <!-- Declare root element -->
    <xsl:template match="/">
        <collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
            <xsl:apply-templates select="oai:OAI-PMH"/>
        </collection>
    </xsl:template>

    <!-- No special instructions for the root element of the source document -->
    <xsl:template match="oai:OAI-PMH">
        <xsl:apply-templates select="oai:ListRecords"/>
    </xsl:template>

    <!-- Production of leader and control fields for each oai:record -->
    <xsl:template match="oai:ListRecords">
        <xsl:for-each select="oai:record">

            <!-- variable for shortening path to dc: elements -->
            <xsl:variable name="path" select="./oai:metadata/oai_dc:dc"/>


            <record>
                <!--********** Production of leader and control fields for each oai:record **********-->
                <!-- leader should be 24 positions: #####nam#a2200349Ii#4500 -->
                <leader>
                    <xsl:text>&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>
                    <xsl:text>nam</xsl:text>
                    <xsl:text>&#x20;</xsl:text>
                    <xsl:text>a22</xsl:text>
                    <xsl:text>&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>
                    <xsl:text>Ii</xsl:text>
                    <xsl:text>&#x20;</xsl:text>
                    <xsl:text>4500</xsl:text>
                </leader>

                <!-- 006 should be 18 positions: m#####o##d#s###### -->
                <!-- The 006 is used to describe the characteristics of the electronic resource not accounted for in the 008 becase the 008 describes a "book" -->
                <controlfield tag="006">
                    <xsl:text>m&#x20;&#x20;&#x20;&#x20;&#x20;o&#x20;&#x20;d&#x20;s&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>
                </controlfield>

                <!-- BMR note: Use of octothorpe versus pipe in leader, 006 (all octothorpe) versus 007 (some octothorpe, some pipe)? -->
                <!-- 007 should be 14 positions: cr#||#|||||||| -->
                <controlfield tag="007">
                    <xsl:text>cr&#x20;||&#x20;||||||||</xsl:text>
                </controlfield>

                <!-- BMR note: Funny MARC stuff: 07-10 date 1 and 11-14 date 2 are the same value repeated? -->
                <!-- 008 should be 40 positions: ######t[date:YYYY][date:YYYY]waua####obm##s000#0#eng#d -->
                <controlfield tag="008">
                    <xsl:text>&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;t</xsl:text>
                    <xsl:for-each select="$path/dc:date">
                        <xsl:choose>
                            <xsl:when test="matches(., '\d{4}-\d{2}$') or matches(., '\d{4}$')">
                                <xsl:choose>
                                    <xsl:when test="contains(., '-')">
                                        <xsl:value-of select="substring-before(., '-')"/>
                                        <xsl:value-of select="substring-before(., '-')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <!-- BMR note: Output *no value* in case of YYYY-MM-DD? -->
                            <xsl:when test="matches(.,'\d{4}-\d{2}-.+')"/>
                            <xsl:otherwise>
                                <xsl:text>&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:text>waua&#x20;&#x20;&#x20;&#x20;obm&#x20;&#x20;s000&#x20;0&#x20;</xsl:text>
                    <xsl:text>eng&#x20;d</xsl:text>
                </controlfield>

                <!--********** Production of variable fields for each oai:record **********-->
                <datafield tag="040" ind1=" " ind2=" ">
                    <subfield code="a">WAU</subfield>
                    <subfield code="b">eng</subfield>
                    <subfield code="e">rda</subfield>
                    <subfield code="e">pn</subfield>
                    <subfield code="c">WAU</subfield>
                </datafield>

                <!-- 100 field, removing punctuation from the original if necessary -->
                <!-- 100 field below accounts specifically for the following name forms:
                                            Paul B.
                                            Paul Bunfield
                                            Paul B
                     but not these name forms (which is done with the xsl:otherwise):
                                            Paul Bunfield.
                                            PAUL BUNFIELD
                                            Paul Bunfield,
                -->
                <datafield tag="100" ind1="1" ind2=" ">
                    <xsl:choose>
                        <xsl:when test="matches($path/dc:creator, '.*\.')">
                            <subfield code="a">
                                <xsl:value-of select="normalize-space($path/dc:creator)"/>
                                <xsl:text>, </xsl:text>
                            </subfield>
                        </xsl:when>
                        <xsl:when test="matches($path/dc:creator, '[a-z]{2}$')">
                            <subfield code="a">
                                <xsl:value-of select="normalize-space($path/dc:creator)"/>
                                <xsl:text>, </xsl:text>
                            </subfield>
                        </xsl:when>
                        <xsl:when test="matches($path/dc:creator, '\s[A-Z]{1}$')">
                            <subfield code="a">
                                <xsl:value-of select="normalize-space($path/dc:creator)"/>
                                <xsl:text>., </xsl:text>
                            </subfield>
                        </xsl:when>
                        <xsl:otherwise>
                            <subfield code="a">
                                <xsl:value-of select="normalize-space($path/dc:creator)"/>
                                <xsl:text>, </xsl:text>
                            </subfield>
                        </xsl:otherwise>
                    </xsl:choose>
                    <subfield code="e">
                        <xsl:text>author.</xsl:text>
                    </subfield>
                </datafield>

                <!-- 245 field and with conditional indicator value -->
                <!-- BMR note: Oooh xsl:element* Haven't had much opportunity to use it... -->
                <xsl:element name="datafield">
                    <xsl:variable name="title-ind2">
                        <xsl:choose>
                            <!-- BMR note: Trying to come up with any other initial articles which may need to be accounted for... -->
                            <xsl:when test="starts-with($path/dc:title, 'A ')">2</xsl:when>
                            <xsl:when test="starts-with($path/dc:title, 'An ')">3</xsl:when>
                            <xsl:when test="starts-with($path/dc:title, 'The ')">4</xsl:when>
                            <xsl:otherwise>0</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:variable name="titleProper">
                        <!-- BMR note: Any other title/subtitle dividers to account for? \n, hyphen, etc.? -->
                        <xsl:value-of
                            select="normalize-space(substring-before($path/dc:title, ':'))"/>
                        <xsl:text> : </xsl:text>
                    </xsl:variable>
                    <xsl:variable name="titleRemainder">
                        <xsl:value-of select="normalize-space(substring-after($path/dc:title, ':'))"
                        />
                    </xsl:variable>

                    <xsl:attribute name="tag">245</xsl:attribute>
                    <xsl:attribute name="ind1">1</xsl:attribute>
                    <xsl:attribute name="ind2">
                        <xsl:value-of select="$title-ind2"/>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="contains($path/dc:title, ':')">
                            <xsl:element name="subfield">
                                <xsl:attribute name="code">a</xsl:attribute>
                                <xsl:value-of select="normalize-space($titleProper)"/>
                            </xsl:element>
                            <xsl:element name="subfield">
                                <xsl:attribute name="code">b</xsl:attribute>
                                <xsl:value-of select="normalize-space($titleRemainder)"/>
                                <xsl:text>.</xsl:text>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="subfield">
                                <xsl:attribute name="code">a</xsl:attribute>
                                <xsl:value-of select="normalize-space($path/dc:title)"/>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>

                <!-- First of two 264 fields -->
                <datafield tag="264" ind1=" " ind2="1">
                    <subfield code="a">
                        <xsl:text>[Seattle] : </xsl:text>
                    </subfield>
                    <subfield code="b">
                        <xsl:text>[University of Washington Libraries], </xsl:text>
                    </subfield>
                    <subfield code="c">
                        <xsl:text>[</xsl:text>
                        <xsl:for-each select="$path/dc:date">
                                <xsl:choose>
                                    <xsl:when test="matches(.,'\d{4}$')">
                                        <xsl:value-of select="."/>
                                    </xsl:when>
                                    <xsl:when test="matches(.,'\d{4}-\d{2}$')">
                                        <xsl:value-of select="substring-before(.,'-')"/>
                                    </xsl:when>
                                    <!-- BMR note: As above, no date ouput for patterns that don't match? 
                                        Ah! Of course, this is a save file to be reviewed. -->
                                    <xsl:otherwise/>
                                </xsl:choose>
                        </xsl:for-each>
                        <xsl:text>]</xsl:text>
                    </subfield>
                </datafield>

                <!-- Second of two 264 fields -->
                <datafield tag="264" ind1=" " ind2="4">
                    <subfield code="c">
                        <xsl:text>&#xa9;</xsl:text>
                        <xsl:for-each select="$path/dc:date">
                            <xsl:choose>
                                <xsl:when test="matches(.,'\d{4}$')">
                                    <xsl:value-of select="."/>
                                </xsl:when>
                                <xsl:when test="matches(.,'\d{4}-\d{2}$')">
                                    <xsl:value-of select="substring-before(.,'-')"/>
                                </xsl:when>
                                <!-- See BMR note just above -->
                                <xsl:otherwise/>
                            </xsl:choose>
                        </xsl:for-each>
                    </subfield>
                </datafield>

                <datafield tag="300" ind1=" " ind2=" ">
                    <subfield code="a">1 online resource : </subfield>
                    <subfield code="b">illustrations</subfield>
                </datafield>

                <datafield tag="336" ind1=" " ind2=" ">
                    <subfield code="a">text </subfield>
                    <subfield code="b">txt </subfield>
                    <subfield code="2">rdacontent</subfield>
                </datafield>

                <datafield tag="337" ind1=" " ind2=" ">
                    <subfield code="a">computer </subfield>
                    <subfield code="b">c </subfield>
                    <subfield code="2">rdamedia</subfield>
                </datafield>

                <datafield tag="338" ind1=" " ind2=" ">
                    <subfield code="a">online resource </subfield>
                    <subfield code="b">cr </subfield>
                    <subfield code="2">rdacarrier</subfield>
                </datafield>

                <datafield tag="347" ind1=" " ind2=" ">
                    <subfield code="a">text file </subfield>
                    <subfield code="2">rdaft</subfield>
                </datafield> 
                
                <datafield tag="347" ind1=" " ind2=" ">
                    <subfield code="b">PDF</subfield>
                </datafield>

                <!-- BMR note: This block likely not needed for SSDC work -->
                <!-- 502 field will not output if there isn't a dc:description field beginning "Thesis" -->
                <xsl:if test="$path/dc:description[starts-with(., 'Thesis')]">
                    <datafield tag="502" ind1=" " ind2=" ">
                        <xsl:for-each select="$path/dc:description[starts-with(., 'Thesis')]">
                            <subfield code="b">
                                <xsl:choose>
                                    <xsl:when test="contains(., 'Ph.')">
                                        <xsl:text>Ph. D.</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(., 'Master')">
                                        <xsl:text>Master's </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                            </subfield>
                            <subfield code="c">
                                <xsl:text>University of Washington </xsl:text>
                            </subfield>
                            <subfield code="d">
                           <xsl:for-each select="../dc:date">     
                                <xsl:choose>
                                    <xsl:when test="matches(., '\d{4}$')">
                                        <xsl:value-of select="."/>
                                    </xsl:when>
                                    <xsl:when test="matches(., '\d{4}-\d{2}$')">
                                        <xsl:value-of select="substring-before(.,'-')"/>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                </xsl:for-each>
                                <xsl:text>.</xsl:text>
                            </subfield>
                        </xsl:for-each>
                    </datafield>
                </xsl:if>

                <datafield tag="504" ind1=" " ind2=" ">
                    <subfield code="a">Includes bibliographical references.</subfield>
                </datafield>

                <xsl:if test="$path/dc:description[not(starts-with(., 'Thesis'))]">
                    <datafield tag="520" ind1="3" ind2=" ">
                        <xsl:for-each select="$path/dc:description[not(starts-with(., 'Thesis'))]">
                            <subfield code="a">
                                <xsl:value-of select="normalize-space(.)"/>
                            </subfield>
                        </xsl:for-each>
                    </datafield>
                </xsl:if>

                <datafield tag="588" ind1="0" ind2=" ">
                    <subfield code="a">Online resource; title from PDF title page (ResearchWorks Archive, viewed [date]).</subfield>
                </datafield>

               <!--  Altho the for-each below aspires to split keywords:
                     (1) It didn't work, which went unnoticed;
                     (2) Keywords are now split.
                     (note from 2016-07-21.)
                     Consequently this whole block of code is now commented out:
                <xsl:for-each select="$path/dc:subject">
                    <xsl:variable name="keywords" select="normalize-space(.)"/>
                    <xsl:variable name="split_keyword" select="tokenize($keywords, ';\s?')"/>
                    <xsl:choose>
                        <xsl:when test="matches(., '.+;.+')">
                            <xsl:for-each select="$split_keyword">
                                <datafield tag="653" ind1="0" ind2=" ">
                                    <subfield code="a">
                                        <xsl:value-of
                                            select="normalize-space(concat(upper-case(substring(., 1, 1)), substring(., 2)))"
                                        />
                                    </subfield>
                                </datafield>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:for-each>
                -->
                
                <!-- 653 field added 2016-07-21 -->
                <xsl:for-each select="$path/dc:subject">
                <datafield tag="653" ind1="0" ind2=" ">
                    <subfield code="a">
                        <xsl:choose>
                            <!-- BMR note: Empty xsl:when does nothing, right? No result output -->
                            <xsl:when test="not(text())"/>
                            <!-- BMR note: I don't think I've seen fn:matches used with fn:text... -->
                            <xsl:when test="matches(text(),'^[a-z]')">
                                <!-- BMR note: Don't yet understand this function chain.
                                    Could use 3.0 function-chaining arrow here and elsewhere? -->
                                <xsl:value-of select="concat(upper-case(substring(., 1, 1)), substring(., 2))"/>
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
                        </xsl:choose>
                        
                        
                        
                    </subfield>
                </datafield>
                </xsl:for-each>
                
                <!-- 655 field added 2015-02-24 to use the lcgft heading for theses -->
                <datafield tag="655" ind1=" " ind2="7">
                    <subfield code="a">Academic theses.</subfield>
                    <subfield code="2">lcgft</subfield>
                </datafield>

                <!-- 2nd 655 field, local genre heading -->
                <datafield tag="655" ind1=" " ind2="4">
                    <subfield code="a">Theses</subfield>
                    <subfield code="x">
                        <xsl:value-of
                            select="normalize-space(concat(upper-case(substring($path/dc:subject[last()], 1, 1)), substring($path/dc:subject[last()], 2)))"/>
                        <xsl:text>.</xsl:text>
                    </subfield>
                </datafield>

                <!-- 700 field for each dc:contributor, which should be the thesis advisor(s) -->
                <xsl:for-each select="$path/dc:contributor">
                    <datafield tag="700" ind1="1" ind2=" ">
                        <xsl:choose>
                            <xsl:when test="matches(., '.{2,500}\.')">
                                <subfield code="a">
                                    <xsl:value-of select="normalize-space(.)"/>
                                    <xsl:text>, </xsl:text>
                                </subfield>
                            </xsl:when>
                            <xsl:when test="matches(., '[A-Z]{1}$')">
                                <subfield code="a">
                                    <xsl:value-of select="normalize-space(.)"/>., <xsl:text/>
                                </subfield>
                            </xsl:when>
                            <xsl:when test="matches(., '[A-Z]{1}\.$')">
                                <subfield code="a">
                                    <xsl:value-of select="normalize-space($path/dc:contributor)"/>,
                                    <xsl:text/>
                                </subfield>
                            </xsl:when>
                            <xsl:otherwise>
                                <subfield code="a">
                                    <xsl:value-of select="normalize-space(.)"/>
                                    <xsl:text>, </xsl:text>
                                </subfield>
                            </xsl:otherwise>
                        </xsl:choose>
                        <subfield code="e">degree supervisor.</subfield>
                    </datafield>
                </xsl:for-each>

                <datafield tag="856" ind1="4" ind2="0">
                    <subfield code="u">
                        <xsl:for-each select="$path/dc:identifier">
                            <xsl:if test="starts-with(., 'htt')">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:if>
                        </xsl:for-each>
                    </subfield>
                </datafield>

                <!-- suppress oai:header info -->
                <xsl:apply-templates select="oai:header"/>

            </record>

        </xsl:for-each>

        <!-- suppress oai:resumptionToken info -->
        <xsl:apply-templates select="oai:resumptionToken"/>

    </xsl:template>

    <!-- BMR note: OAI headers and tokens present at multiple levels of XML hierarchy? -->
    <!-- suppress oai:header info -->
    <xsl:template match="oai:header"/>
    <!-- suppress oai:resumptionToken info -->
    <xsl:template match="oai:resumptionToken"/>

</xsl:stylesheet>
