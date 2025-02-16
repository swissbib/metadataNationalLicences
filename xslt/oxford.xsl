<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:import href="nlm-2-to-jats-1-1.xsl"/>
    <xsl:variable name="publisher-name">oxford</xsl:variable>

    <!-- Oxford specific transformations -->
    <xsl:template name="pdf-filename">
        <xsl:if test="/article/front/article-meta/self-uri[string-length(@xlink:href)&gt; 0]">
            <xsl:element name="custom-meta">
                <!-- with custom-meta-group -->
                    <xsl:element name="meta-name">(swissbib)pdf-filename</xsl:element>
                    <xsl:element name="meta-value"><xsl:value-of select="/article/front/article-meta/self-uri/@xlink:href"></xsl:value-of></xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template name="source">
        <xsl:element name="custom-meta">
            <xsl:element name="meta-name">(swissbib)source</xsl:element>
            <xsl:element name="meta-value">oxford</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="identifier">
        <xsl:element name="custom-meta">
            <xsl:element name="meta-name">(swissbib)identifier</xsl:element>
            <xsl:element name="meta-value">
                <xsl:value-of select="$publisher-name"></xsl:value-of><xsl:text>-</xsl:text>
                <xsl:call-template name="compute-identifier"></xsl:call-template>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="metadata-license">
    <!-- this is clear for content <=2015, for content >=2016, the license is not really clear in the contract -->
        <xsl:element name="custom-meta">
            <xsl:element name="meta-name">(swissbib)metadata-license</xsl:element>
            <xsl:element name="meta-value"><uri>http://creativecommons.org/licenses/by-nc/4.0</uri></xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>