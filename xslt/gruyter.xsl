<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="nlm-2-to-jats-1-1.xsl"/>

    <!-- De Gruyter use often this field to store the whole name of the journal -->

    <!-- overrides to rename abbrev-journal-title -->
    <xsl:template match="key('journal-title-group','yes')" mode="copy">
        <xsl:choose>
            <xsl:when test="name(.)='abbrev-journal-title' and @abbrev-type='full'">
                <xsl:element name="journal-title">
                    <xsl:apply-templates select="text()" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:copy-of select="@*"></xsl:copy-of>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- remove these specific De Gruyter fields -->
    <xsl:template match="/article/front/article-meta/contrib-group/contrib/name/x"/>
    <xsl:template match="/article/front/article-meta/original"/>
    <xsl:template match="/article/front/article-meta/post-process"/>



</xsl:stylesheet>