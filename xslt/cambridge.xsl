<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:import href="nlm-2-to-jats-1-1.xsl"/>


    <!-- Cambridge specific transformations -->


    <!-- store the pdf filename in self-uri -->
    <xsl:template name="pdf-filename">
        <xsl:element name="custom-meta">
            <!-- with custom-meta-group -->
            <xsl:if test="
            /article/front/article-meta/custom-meta-group[custom-meta/meta-value[preceding-sibling::meta-name='pdf']] or
            /article/front/article-meta/custom-meta-wrap[custom-meta/meta-value[preceding-sibling::meta-name='pdf']]
            ">
                <xsl:element name="meta-name">(swissbib)pdf-filename</xsl:element>
                <xsl:element name="meta-value"><xsl:value-of select="custom-meta/meta-value"></xsl:value-of></xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template name="source">
        <xsl:element name="custom-meta">
            <xsl:element name="meta-name">(swissbib)source</xsl:element>
            <xsl:element name="meta-value">cambridge</xsl:element>
        </xsl:element>
    </xsl:template>




    <!-- deal with the following problem (invalid xml from cambridge)

    <title-group>
        <article-title/>
        <alt-title alt-title-type="left-running">Book Reviews</alt-title>
        <alt-title alt-title-type="right-running">Book Reviews</alt-title>
    </title-group>

    if article-title is empty, fill it with <alt-title alt-title-type="left-running" or <alt-title alt-title-type="left-running"

    -->

    <xsl:template match="/article/front/article-meta/title-group/article-title[normalize-space()='']" priority="1.0">
        <xsl:for-each select="/article/front/article-meta/title-group/alt-title[(@alt-title-type='left-running' or @alt-title-type='right-running')][last()]">
            <xsl:element name="article-title">
                <xsl:value-of select="."></xsl:value-of>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- a lot of book reviews at cambridge have empty titles, the title is in
    <product product-type="book">
            <name name-style="western">
               <surname>Boardman</surname>
               <given-names>J.</given-names>
            </name>: <source>Athenian black-figure vases: a handbook</source>. <publisher-loc>London</publisher-loc>:
            <publisher-name>Thames and Hudson (World of Art Library)</publisher-name>, <year>1974</year>. <fpage>252 pp.</fpage>
            , 383 illustrations. £2.50.</product>

    -->


    <xsl:template match="/article/front/article-meta/title-group/article-title[normalize-space()='']" priority="1.0">
        <xsl:if test="/article[@article-type='book-review']">
            <xsl:element name="article-title">
                <xsl:value-of select="normalize-space(concat('Book Review : ',/article/front/article-meta/product))"></xsl:value-of>
            </xsl:element>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>