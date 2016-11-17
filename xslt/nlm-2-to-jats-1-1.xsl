<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" doctype-public="-//NLM//DTD JATS (Z39.96) Journal Archiving and Interchange DTD with OASIS Tables with MathML3 v1.1 20151215//EN" doctype-system="JATS-archive-oasis-article1-mathml3.dtd" indent="yes" />

    <!-- to store the original path/filename -->
    <xsl:param name="filename"></xsl:param>


    <!-- keys and variable to wrap all permissions in the new JATS permissions tag -->
    <xsl:key name="permissions"
             match="/article/front/article-meta/copyright-statement|
                    /article/front/article-meta/copyright-year|
                    /article/front/article-meta/copyright-holder|
                    /article/front/article-meta/license"
             use="'yes'">
    </xsl:key>
    <xsl:variable name="permissions1stElement" select="name(key('permissions','yes')[1])"/>


    <!-- keys and variable to wrap all journal titles in the new JATS journal-title-group tag -->
    <xsl:key name="journal-title-group"
             match="/article/front/journal-meta/journal-title|
                    /article/front/journal-meta/journal-subtitle|
                    /article/front/journal-meta/trans-title|
                    /article/front/journal-meta/trans-subtitle|
                    /article/front/journal-meta/abbrev-journal-title"
             use="'yes'">
    </xsl:key>
    <xsl:variable name="journalTitleGroup1stElement" select="name(key('journal-title-group','yes')[1])"/>

    <!-- identity template -->
    <xsl:template match="*|@*|comment()|processing-instruction()|text()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:copy>
    </xsl:template>


    <!-- write the jats 1.1 dtd version -->
    <xsl:template match="article/@dtd-version">
        <xsl:attribute name="dtd-version">1.1</xsl:attribute>
        <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
    </xsl:template>

    <xsl:template match="journal-meta">
        <xsl:copy>
            <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="name()=$journalTitleGroup1stElement">
                        <xsl:call-template name="journal-title-group"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." />
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
                        <xsl:call-template name="permissions"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="not(/article/front/article-meta/custom-meta-group) and not(/article/front/article-meta/custom-meta-wrap)">
                <xsl:element name="custom-meta-group">
                    <xsl:call-template name="add-local-article-custom-meta"></xsl:call-template>
                </xsl:element>
            </xsl:if>
        </xsl:copy>


    </xsl:template>

    <xsl:template match="/article/front/article-meta//license/p">
        <xsl:element name="license-p">
            <xsl:apply-templates/>
        </xsl:element>

    </xsl:template>

    <!-- should add the trans-subtitle as well -->
    <xsl:template match="/article/front/article-meta/trans-title | /article/front/article-meta/title-group/trans-title">
        <xsl:element name="trans-title-group">
            <xsl:apply-templates select="@*"/>
            <xsl:element name="trans-title">
            <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>

    </xsl:template>

    <xsl:template match="custom-meta-wrap">
        <xsl:element name="custom-meta-group">
            <xsl:apply-templates/>
            <xsl:call-template name="add-local-article-custom-meta"></xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template match="custom-meta-group">
        <xsl:copy>
            <xsl:apply-templates/>
            <xsl:call-template name="add-local-article-custom-meta"></xsl:call-template>
        </xsl:copy>
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

    <!-- overriden in templates which import that -->
    <xsl:template name="pdf-filename"></xsl:template>
    <xsl:template name="source"></xsl:template>

    <xsl:template name="compute-identifier">
        <xsl:choose>
            <xsl:when test="/article/front/article-meta/article-id[@pub-id-type='doi'][string-length() &gt; 0]">
                <xsl:variable name="doi">
                    <xsl:apply-templates select="/article/front/article-meta/article-id[@pub-id-type='doi']"/>
                </xsl:variable>
                <xsl:value-of select="$doi"/>
            </xsl:when>
            <xsl:when test="/article/front/article-meta/article-id[@pub-id-type='pii'][string-length() &gt; 0]">
                <xsl:value-of select="/article/front/article-meta/article-id[@pub-id-type='pii']"></xsl:value-of>
            </xsl:when>
            <xsl:when test="/article/front/article-meta/article-id[@pub-id-type='publisher-id'][string-length() &gt; 0]">
                <xsl:value-of select="/article/front/article-meta/article-id[@pub-id-type='publisher-id']"></xsl:value-of>
            </xsl:when>
        </xsl:choose>
    </xsl:template>






    <xsl:template match="/article/front/article-meta/article-id[@pub-id-type='doi']">
        <xsl:copy>
            <xsl:copy-of select="@*"></xsl:copy-of>
            <xsl:choose>
                <xsl:when test="starts-with(., 'doi:')">
                    <xsl:value-of select="substring-after(., 'doi:')" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="." />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>








    <!-- replace xlink.href by xlink:href -->
    <xsl:template match="@xlink.href">
        <xsl:attribute name="xlink:href">
            <xsl:value-of select="."/>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:attribute>
    </xsl:template>

    <!-- replace xlink.type by xlink:type -->
    <xsl:template match="@xlink.type">
        <xsl:attribute name="xlink:type">
            <xsl:value-of select="."/>
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()" />
        </xsl:attribute>
    </xsl:template>





    <!-- write the names in the good order -->
    <xsl:template match="name">
        <xsl:copy>
            <xsl:apply-templates select="surname"/>
            <xsl:apply-templates select="given-names"/>
            <xsl:apply-templates select="prefix"/>
            <xsl:apply-templates select="suffix"/>
        </xsl:copy>
    </xsl:template>

    <!-- write the dates in the good order -->
    <xsl:template match="date">
        <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="day"/>
        <xsl:apply-templates select="month"/>
        <xsl:apply-templates select="season"/>
        <xsl:apply-templates select="year"/>
        <xsl:apply-templates select="era"/>
        <xsl:apply-templates select="string-date"/>
        </xsl:copy>
    </xsl:template>

    <!-- write the publisher fields in the good order -->
    <xsl:template match="publisher">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="publisher-name"/>
            <xsl:apply-templates select="publisher-loc"/>
        </xsl:copy>
    </xsl:template>




    <xsl:template name="permissions">
        <permissions>
            <xsl:for-each select="key('permissions','yes')">
                <xsl:apply-templates select="." mode="copy"/>
            </xsl:for-each>
        </permissions>
    </xsl:template>

    <!-- remove copyright-statement... from the original position -->
    <xsl:template match="key('permissions','yes')"/>

    <!-- copy copyright-statement... to the new position -->
    <xsl:template match="key('permissions','yes')" mode="copy">
        <xsl:copy>
            <xsl:copy-of select="@*"></xsl:copy-of>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>




    <xsl:template name="journal-title-group">
        <journal-title-group>
            <xsl:for-each select="key('journal-title-group','yes')">
                <xsl:apply-templates select="." mode="copy"/>
            </xsl:for-each>
        </journal-title-group>
    </xsl:template>

    <xsl:template match="key('journal-title-group','yes')"></xsl:template>

    <xsl:template match="key('journal-title-group','yes')" mode="copy">
        <xsl:copy>
            <xsl:copy-of select="@*"></xsl:copy-of>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>



    <!-- remove the following elements entirely -->
    <xsl:template match="/article/body"/>

    <!-- remove empty elements -->
    <xsl:template match="*[not(@*|*|comment()|processing-instruction()) and normalize-space()='']"/>

    <!-- remove subject-groups with only empty elements -->
    <xsl:template match="subj-group[not(subject/text())]"></xsl:template>

    <!-- remove contrib-groups with only empty elements -->
    <xsl:template match="contrib-group[not(*//text())]"></xsl:template>




</xsl:stylesheet>