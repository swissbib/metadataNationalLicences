<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" doctype-public="-//NLM//DTD JATS (Z39.96) Journal Archiving and Interchange DTD with OASIS Tables with MathML3 v1.1 20151215//EN" doctype-system="JATS-archive-oasis-article1-mathml3.dtd" indent="yes" />

    <xsl:key name="permissions"
             match="/article/front/article-meta/copyright-statement|
                    /article/front/article-meta/copyright-year|
                    /article/front/article-meta/copyright-holder|
                    /article/front/article-meta/license"
             use="'yes'">
    </xsl:key>
    <xsl:variable name="permissions1stElement" select="name(key('permissions','yes')[1])"></xsl:variable>


    <xsl:key name="journal-title-group"
             match="/article/front/journal-meta/journal-title|
                    /article/front/journal-meta/journal-subtitle|
                    /article/front/journal-meta/trans-title|
                    /article/front/journal-meta/trans-subtitle|
                    /article/front/journal-meta/abbrev-journal-title"
             use="'yes'">
    </xsl:key>
    <xsl:variable name="journalTitleGroup1stElement" select="name(key('journal-title-group','yes')[1])"></xsl:variable>


    <xsl:template match="article">
        <xsl:copy>
            <xsl:attribute name="dtd-version">1.1</xsl:attribute>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*|@*|comment()|processing-instruction()|text()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:copy>
    </xsl:template>


    <!-- TODO : insert this in journal-title-group somehow -->
    <xsl:template match="abbrev-journal-title[@abbrev-type='full']">
            <xsl:element name="journal-title">
                <xsl:apply-templates select="text()" />
            </xsl:element>
    </xsl:template>

    <!-- replace xlink.href by xlink:href -->
    <xsl:template match="@xlink.href">
        <xsl:attribute name="xlink:href">
            <xsl:value-of select="."></xsl:value-of>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:attribute>
    </xsl:template>



    <xsl:template match="journal-meta">
        <xsl:copy>
            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="name()=$journalTitleGroup1stElement">
                        <xsl:call-template name="journal-title-group"></xsl:call-template>
                    </xsl:when>

                    <!-- TODO improve this with a variable ! based on keys  -->
                    <xsl:when test="name()='journal-title'"></xsl:when>
                    <xsl:when test="name()='journal-subtitle'"></xsl:when>
                    <xsl:when test="name()='trans-title'"></xsl:when>
                    <xsl:when test="name()='trans-subtitle'"></xsl:when>
                    <xsl:when test="name()='abbrev-journal-title'"></xsl:when>

                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>



    <xsl:template match="article-meta">
        <xsl:copy>
            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="name()=$permissions1stElement">
                        <xsl:call-template name="permissions"></xsl:call-template>
                    </xsl:when>

                    <!-- TODO improve this with a variable ! based on key permissions -->
                    <xsl:when test="name()='copyright-statement'"></xsl:when>
                    <xsl:when test="name()='copyright-year'"></xsl:when>
                    <xsl:when test="name()='copyright-holder'"></xsl:when>
                    <xsl:when test="name()='license'"></xsl:when>

                    <!-- should move these 2 lines to a meta-name -->
                    <xsl:when test="name()='original'"></xsl:when>
                    <xsl:when test="name()='post-process'"></xsl:when>

                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="name">
        <xsl:copy>
            <xsl:apply-templates select="surname"></xsl:apply-templates>
            <xsl:apply-templates select="given-names"></xsl:apply-templates>
            <xsl:apply-templates select="prefix"></xsl:apply-templates>
            <xsl:apply-templates select="suffix"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="date">
    <xsl:copy>
    <xsl:apply-templates select="@*"></xsl:apply-templates>
    <xsl:apply-templates select="day"></xsl:apply-templates>
    <xsl:apply-templates select="month"></xsl:apply-templates>
    <xsl:apply-templates select="season"></xsl:apply-templates>
    <xsl:apply-templates select="year"></xsl:apply-templates>
    <xsl:apply-templates select="era"></xsl:apply-templates>
    <xsl:apply-templates select="string-date"></xsl:apply-templates>
    </xsl:copy>

    </xsl:template>








    <!-- remove the following elements entirely -->
    <xsl:template match="/article/body"></xsl:template>
    <xsl:template match="/article/front/article-meta/contrib-group/contrib/name/x"></xsl:template>
    <xsl:template match="/article/front/article-meta/contrib-group/contrib/name/x"></xsl:template>
    <xsl:template match="/article/front/article-meta/related-article"></xsl:template>
    <xsl:template match="/article/front/article-meta/post-process"></xsl:template>
    <xsl:template match="/article/front/article-meta/original"></xsl:template>





    <xsl:template name="permissions">
        <permissions>
            <xsl:for-each select="key('permissions','yes')">
                <xsl:copy-of select="."></xsl:copy-of>
            </xsl:for-each>
        </permissions>
    </xsl:template>


    <xsl:template name="journal-title-group">
        <journal-title-group>
            <xsl:for-each select="key('journal-title-group','yes')">
                <xsl:copy-of select="."></xsl:copy-of>
            </xsl:for-each>
        </journal-title-group>
    </xsl:template>

</xsl:stylesheet>