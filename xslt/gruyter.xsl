<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="nlm-2-to-jats-1-1.xsl"/>


    <!-- De Gruyter stores namespaces in front instead of article tag -->
    <xsl:template match="/article/front">
        <xsl:element name="front">
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/article">
        <article xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oasis="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table">
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"></xsl:apply-templates>
        </article>
    </xsl:template>




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
    <xsl:template match="/article/front/article-meta/contrib-group/contrib/name/x" />
    <xsl:template match="/article/front/article-meta/original" />
    <xsl:template match="/article/front/article-meta/origional" />
    <xsl:template match="/article/front/article-meta/post-process" />
    <xsl:template match="/article/front/article-meta/issue-sequence" />
    <xsl:template match="/article/front/article-meta/xml-citation-post-process" />
    <xsl:template match="/article/front/article-meta/article-categories/subj-group/subject/@code" />


    <!-- the table of contents files from De Gruyter -->
    <xsl:template match="/issue-xml"/>






</xsl:stylesheet>