<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:variable name="sourceURL"
        select="'https://raw.githubusercontent.com/CECSpecialistI/UWLibCatProfiles/master/WAU.profile.RDA.json'"/>
    <xsl:template match="/">
        <xsl:for-each
            select="('adminMetadata', 'dvdVideo', 'eBook', 'eGraphic', 'eMap', 'eSerial', 'etd', 'graphic', 'map', 'monograph', 'serial', 'soundRecording')">
            <xsl:variable name="fmat" select="."/>
            <xsl:variable name="html-transform">
                <xsl:sequence
                    select="
                        let $t := transform(
                        map {
                            'stylesheet-location': 'htmlProfiles-core-formats.xsl',
                            'source-node': unparsed-text($sourceURL) => json-to-xml(),
                            'stylesheet-params': map {QName('https://github.com/briesenberg07/bmrLIS/', 'format'): $fmat}
                        })
                        return
                            $t?output"
                />
            </xsl:variable>
            <xsl:result-document href="../html/WAU.profile.RDA.{$fmat}.html">
                <xsl:value-of select="$html-transform"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
