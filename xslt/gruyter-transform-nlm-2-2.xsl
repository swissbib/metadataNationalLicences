<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml"/>


    <xsl:template match="*|@*|comment()|processing-instruction()|text()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:copy>
    </xsl:template>


    <xsl:template match="/article/front/journal-meta/publisher">
        <xsl:text>Youhou</xsl:text>
        <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
    </xsl:template>


    <xsl:template match="abbrev-journal-title">
        <xsl:element name="journal-title-group">
            <xsl:text>helllllllo</xsl:text>
            <xsl:copy>
                <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
            </xsl:copy>
        </xsl:element>
    </xsl:template>

    <!-- replace xlink.href by xlink:href -->
    <xsl:template match="@xlink.href">
        <xsl:attribute name="xlink:href">
            <xsl:value-of select="."></xsl:value-of>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:attribute>
    </xsl:template>

    <!-- TODO match other kind of titles, deal well with attributes -->
    <xsl:template match="abbrev-journal-title[@abbrev-type = 'full']">
        <xsl:element name="journal-title-group">
            <xsl:element name="journal-title">
                <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
            </xsl:element>
        </xsl:element>
    </xsl:template>





    <xsl:template match="article-meta">
        <xsl:copy>
            <xsl:variable name="permissions1stElement" select="name((copyright-statement|copyright-year|copyright-holder|licence)[1])"></xsl:variable>

            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="name()=$permissions1stElement">
                        <xsl:call-template name="permissions"></xsl:call-template>
                    </xsl:when>

                    <!-- TODO improve this with a variable? -->
                    <xsl:when test="name()='copyright-statement'">

                    </xsl:when>
                    <xsl:when test="name()='copyright-year'">

                    </xsl:when>
                    <xsl:when test="name()='copyright-holder'">

                    </xsl:when>
                    <xsl:when test="name()='license'">

                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:apply-templates></xsl:apply-templates>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>


            </xsl:for-each>
        </xsl:copy>




    </xsl:template>







    <!-- remove the following elements entirely -->
    <xsl:template match="/article/body"></xsl:template>
    <xsl:template match="/article/front/article-meta/contrib-group/contrib/name/x"></xsl:template>



    <!-- remove permissions from the first place -->

    <xsl:template name="permissions">
        <permissions>
            <xsl:copy-of select="/article/front/article-meta/copyright-year"></xsl:copy-of>
            <xsl:copy-of select="/article/front/article-meta/copyright-statement"></xsl:copy-of>
            <xsl:copy-of select="/article/front/article-meta/copyright-holder"></xsl:copy-of>
            <xsl:copy-of select="/article/front/article-meta/license"></xsl:copy-of>
        </permissions>
    </xsl:template>





</xsl:stylesheet>