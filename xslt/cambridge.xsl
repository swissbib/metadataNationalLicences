<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:import href="nlm-2-to-jats-1-1.xsl"/>


    <!-- Cambridge specific transformations -->


    <!-- store the pdf filename in self-uri -->
    <xsl:template match="/article/front/article-meta/custom-meta-wrap[custom-meta/meta-value[preceding-sibling::meta-name='pdf']]">
        <xsl:element name="self-uri">
            <xsl:attribute name="content-type">pdf</xsl:attribute>
            <xsl:attribute name="xlink:href"><xsl:value-of select="custom-meta/meta-value"/></xsl:attribute>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>