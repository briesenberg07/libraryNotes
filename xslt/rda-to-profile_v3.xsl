<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdakit="http://metadataregistry.org/uri/profile/rdakit/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:reg="http://metadataregistry.org/uri/profile/regap/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:j="http://www.w3.org/2005/xpath-functions"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="3.0">
    
    <!-- Does indentation cause problems when converting to JSON? -->
    <xsl:output indent="yes"/>
    
    <!--  -->
    <xsl:key name="labels" match="rdf:Description" use="@rdf:about"/>
    
    <!-- Changing var document values to pull from Registry online -->
    <!-- Don't understand why no w var was in v02, adding below -->
    <xsl:variable name="c" select="document('http://rdaregistry.info/Elements/c.xml')"/>
    
    <xsl:variable name="w" select="document('http://rdaregistry.info/Elements/w.xml')"/>
    <xsl:variable name="e" select="document('http://rdaregistry.info/Elements/e.xml')"/>
    <xsl:variable name="m" select="document('http://rdaregistry.info/Elements/m.xml')"/>
    <xsl:variable name="i" select="document('http://rdaregistry.info/Elements/i.xml')"/>
    
    <xsl:variable name="a" select="document('http://rdaregistry.info/Elements/a.xml')"/>
    <xsl:variable name="n" select="document('http://rdaregistry.info/Elements/n.xml')"/>
    <xsl:variable name="p" select="document('http://rdaregistry.info/Elements/p.xml')"/>
    <xsl:variable name="t" select="document('http://rdaregistry.info/Elements/t.xml')"/>
    
    <!-- Currently not including the following property sets in source:
        RDA Entity props
        Unconstrained props
        etc. -->

    <xsl:template match="/">
        <j:map>
            <j:map key="Profile">
                <xsl:apply-templates select="rdf:RDF"/>
            </j:map>
        </j:map>
    </xsl:template>
    <xsl:template match="rdf:RDF">
        <j:string key="title">University of Washington Libraries source RDA profile</j:string>
        <j:string key="id">WAU:profile:RDA:source</j:string>
        <j:string key="author">CAMS (uwlib-cams@uw.edu)</j:string>
        <j:string key="date">
            <xsl:value-of select="format-date(j:current-date(), '[Y0001]-[M01]-[D01]')"/>
        </j:string>
        <j:string key="description">Properties for RDA resources for use in format-specific profiles</j:string>
        <!-- Possible to leave schema string empty? -->
        <j:string key="schema"></j:string>
        <j:array key="resourceTemplates">
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($w//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Work</j:string>
                <j:string key="id">rt:rda:work</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($e//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Expression</j:string>
                <j:string key="id">rt:rda:expression</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$e/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($m//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Manifestation</j:string>
                <j:string key="id">rt:rda:manifestation</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$m/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($i//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Item</j:string>
                <j:string key="id">rt:rda:item</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$i/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($a//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Agent</j:string>
                <j:string key="id">rt:rda:agent</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$a/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($n//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Nomen</j:string>
                <j:string key="id">rt:rda:nomen</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$n/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($p//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Place</j:string>
                <j:string key="id">rt:rda:place</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$p/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($t//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Timespan</j:string>
                <j:string key="id">rt:rda:timespan</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$t/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
        </j:array>
    </xsl:template>
    <xsl:template match="rdf:Description">
        <xsl:if test="reg:status/@rdf:resource != 'http://metadataregistry.org/uri/RegStatus/1008'">
            <j:map>
                <j:string key="propertyLabel">
                    <xsl:choose>
                        <xsl:when test="rdakit:instructionNumber">
                            <xsl:value-of
                                select="concat(rdfs:label[@xml:lang = 'en'], ' (RDA ', rdakit:instructionNumber, ')')"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="rdfs:label[@xml:lang = 'en']"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </j:string>
                <j:string key="propertyURI">
                    <xsl:value-of select="@rdf:about"/>
                </j:string>
                <j:string key="mandatory"/>
                <j:string key="repeatable"/>
                <j:string key="type"/>
                <j:map key="valueConstraint">
                    <j:array key="useValuesFrom"/>
                    <j:map key="valueDataType">
                        <j:string key="dataTypeURI"/>
                    </j:map>
                    <j:array key="defaults">
                            <j:map>
                                <j:string key="defaultURI"/>
                                <j:string key="defaultLiteral"/>
                            </j:map>
                        </j:array>
                </j:map>
                <j:string key="uwFormOrder"/>
                <j:string key="statusUw"/>
                <j:string key="noteUw"/>
                <j:string key="qUw"/>
                <j:array key="usedInProfile"/>
            </j:map>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
