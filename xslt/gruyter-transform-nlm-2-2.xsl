<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml"/>

    <xsl:key name="permissions"
             match="/article/front/article-meta/copyright-year|
                    /article/front/article-meta/copyright-statement|
                    /article/front/article-meta/copyright-holder|
                    /article/front/article-meta/license"
             use="'yes'">
    </xsl:key>
    <xsl:variable name="permissions1stElement" select="name(key('permissions','yes')[1])"></xsl:variable>


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
            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="name()=$permissions1stElement">
                        <xsl:call-template name="permissions"></xsl:call-template>
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
            <xsl:for-each select="key('permissions','yes')">
                <xsl:copy-of select="."></xsl:copy-of>
            </xsl:for-each>
        </permissions>
    </xsl:template>





</xsl:stylesheet>