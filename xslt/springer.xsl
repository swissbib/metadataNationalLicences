<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" doctype-public="-//NLM//DTD JATS (Z39.96) Journal Archiving and Interchange DTD with OASIS Tables with MathML3 v1.1 20151215//EN" doctype-system="JATS-archive-oasis-article1-mathml3.dtd" indent="yes" />
    <xsl:param name="filename"></xsl:param>
    <xsl:variable name="publisher-name">springer</xsl:variable>
    <xsl:template match="/">
        <article>
            <xsl:attribute name="dtd-version">1.1</xsl:attribute>
            <front>
                <journal-meta>
                    <journal-title-group>
                        <journal-title>
                            <xsl:value-of select="//JournalTitle"></xsl:value-of>
                        </journal-title>

                    </journal-title-group>
                    <issn>
                        <xsl:attribute name="pub-type">
                            <xsl:text>ppub</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="//JournalPrintISSN"></xsl:value-of>
                    </issn>
                    <issn>
                        <xsl:attribute name="pub-type">
                            <xsl:text>epub</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="//JournalElectronicISSN"></xsl:value-of>
                    </issn>
                </journal-meta>

                <article-meta>
                    <title-group>
                        <article-title>
                            <xsl:value-of select="//ArticleTitle"></xsl:value-of>

                        </article-title>
                    </title-group>

                    <custom-meta-group>
                        <xsl:call-template name="add-local-article-custom-meta"></xsl:call-template>

                    </custom-meta-group>

                </article-meta>
            </front>








        </article>
    </xsl:template>









    <!-- does nothing by default, but this can be overriden in templates that import this stylesheet -->
    <xsl:template name="add-local-article-custom-meta">
        <xsl:call-template name="metadata-filename"></xsl:call-template>
        <xsl:call-template name="pdf-filename"></xsl:call-template>
        <xsl:call-template name="source"></xsl:call-template>
        <xsl:call-template name="metadata-license"></xsl:call-template>
        <xsl:call-template name="identifier"></xsl:call-template>
    </xsl:template>

    <xsl:template name="metadata-filename">
        <xsl:if test="$filename">
            <xsl:element name="custom-meta">
                <xsl:element name="meta-name">(swissbib)metadata-filename</xsl:element>
                <xsl:element name="meta-value"><xsl:value-of select="$filename"></xsl:value-of></xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>



    <xsl:template name="pdf-filename">
        <xsl:variable name="identifier">
            <xsl:call-template name="compute-identifier"></xsl:call-template>
        </xsl:variable>
        <xsl:element name="custom-meta">
            <!-- the name probably needs to be url-encoded -->
                <xsl:element name="meta-name">(swissbib)pdf-filename</xsl:element>
                <xsl:element name="meta-value"><xsl:value-of select="$identifier" />.pdf</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="source">
        <xsl:element name="custom-meta">
            <xsl:element name="meta-name">(swissbib)source</xsl:element>
            <xsl:element name="meta-value"><xsl:value-of select="$publisher-name"></xsl:value-of></xsl:element>
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

    <xsl:template name="compute-identifier">
        <xsl:choose>
            <xsl:when test="//ArticleDOI[string-length() &gt; 0 ] | //ChapterDOI[string-length() &gt; 0 ]">
                    <xsl:value-of select="//ArticleDOI | //ChapterDOI"/>

            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="metadata-license">
        <xsl:element name="custom-meta">
            <xsl:element name="meta-name">(swissbib)metadata-license</xsl:element>
            <xsl:element name="meta-value">special springer license</xsl:element>
        </xsl:element>
    </xsl:template>




</xsl:stylesheet>