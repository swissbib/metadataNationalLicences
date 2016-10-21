<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:import href="nlm-2-to-jats-1-1.xsl"/>
    <xsl:variable name="publisher-name">gruyter</xsl:variable>


    <!-- De Gruyter stores namespaces in front instead of article tag -->
    <xsl:template match="/article/front">
        <xsl:element name="front">
            <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/article">
        <article xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oasis="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table">

            <xsl:if test="not(@xml:lang)">
                <xsl:call-template name="add-language"></xsl:call-template>
            </xsl:if>
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



    <xsl:template name="pdf-filename">
        <xsl:for-each select="/article/front/article-meta/related-article[@related-article-type='pdf']">
            <xsl:element name="custom-meta">
                <xsl:element name="meta-name">(swissbib)pdf-filename</xsl:element>
                    <xsl:element name="meta-value">
                        <!-- sometimes it is in xlink.href (mistake : a '.' instead of ':') and sometimes in xlink:href -->
                        <xsl:value-of select="@xlink.href"/>
                        <xsl:value-of select="@xlink:href"/>
                    </xsl:element>
            </xsl:element>
        </xsl:for-each>
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







    <!-- the table of contents files from De Gruyter -->
    <xsl:template match="/issue-xml"/>

    <!-- the language tag is always empty, we add it based on de gruyter journal marc records -->
    <xsl:template name="add-language">
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='abitech'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='abpr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='acv'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='advg'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ael'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='afd'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='afgs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='agph'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ajle'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='akg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='alr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ang'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='angl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='anly'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='annalen'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='anona'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='anti'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='aofo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='aot'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='apam'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='apeiron'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='apf'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='apjri'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='arbi'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='arca'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='arg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='argl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='asch'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='asia'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='auto'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='az'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bams'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bap'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bchm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bchm1'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bchm2'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bchm3'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bd'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bejeap'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bejm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bejte'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bfup'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bgsl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='biomat'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bis'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bmc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bmte'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='botm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='bue'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='byzs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='caslar'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cclm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cercles'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='char'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cjal'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cllt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cmam'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cogl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='comm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='corrrev'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cppm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cpt'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='cri'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='crll'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='crpm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='css'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dante'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dig'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dma'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dmdi'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dmvm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dnrm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dug'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dwir'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='dzph'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='east'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ecfr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='edit'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ehs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ejnm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ejss'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='em'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='eplj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='epoly'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='eqc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ercl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='erj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='etly'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='etst'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='eujal'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ev'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='evth'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='fabl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='fhep'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='figurationen'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='flih'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='flin'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='fmst'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='for'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='form'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='fr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='freq'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='frm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='futur'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gcc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gcla'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gej'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='georgejb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='germ'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gesr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gik'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='glot'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gmj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gpr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='gps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='green'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ha'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='hc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='helia'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='hfsg'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='hgjb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='hmbci'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='hpm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='htmp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='humr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='hzhz'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='iabi'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='iasl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='iber'"><xsl:attribute name="xml:lang">es</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ice'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='icom'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ihr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijamh'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijbe'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijcre'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijdhd'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijeeps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijfe'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijmsp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijnes'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijnsns'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijpt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ijsl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ils'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='indo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ins'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='iprg'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='iral'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='irm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='islm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='itit'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='iwp'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jaa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jafio'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jag'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jah'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jall'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='janeh'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbbbl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbcpp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbgsg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbkgv'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbpa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbvela'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jbwg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jcde'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jci'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jcim'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jdpa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jdrg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jeeh'"><xsl:attribute name="xml:lang">fr</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jelf'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jem'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jemc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jetl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jfwe'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jga'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jgd'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jgmo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jgs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jgth'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jhsem'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jias'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jiip'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jirspa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jisys'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jjzg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jjzg-b'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jlm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jlse'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jlt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jmbm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jmc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jnet'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jnetdy'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jnma'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jnum'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='joc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='joll'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jpem'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jplr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jpm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jpme'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jqas'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jsall'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jtl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jtms'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jtse'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='jura'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='juru'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='kadm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='kant'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='kantyb'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='kier'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='kl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='klio'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='kszw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='labm'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='labphon'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='langcog'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ldr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='lehr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='les'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='lexi'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='lhomme'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='libr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ling'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='lity'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='lpp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mamm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mcma'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mdr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mdtr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='me'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mel'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mfir'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mgmc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mgzs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mial'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='miog'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mjb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mlt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mopp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='muk'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mult'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='mwjhr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='naha'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ngs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='niet'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='nifo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='nleng'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='npf'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ntrev'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='nzst'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='olzg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='omz'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='pac'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='para'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='pdtc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='peps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='phil'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='piko'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='piko.1'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='plm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='pol'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='polyeng'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='pop'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='prbs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='prhz'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='prth'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='psicl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='pteridines'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='pubhef'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='pwp'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='qfiab'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ract'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rbm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rest'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='revac'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='revce'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='reveh'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='revic'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='revneuro'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rhet'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rhiz'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rjnamm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rle'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rmeef'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rnam'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rne'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='roma'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='romb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='roms'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rose'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='rra'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='saeculum'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='sagmb'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='sats'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='scid'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='scipo'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='secm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='selt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='semi'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='slaw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='snde'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='soci'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='spoet'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='spp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='srsr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='strm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='stuf'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='sus'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='tc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='tcs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='teme'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='text'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='text.1'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='thli'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='til'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='tillich'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='tjj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='tlir'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='ur'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='vf'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='vfzg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='wgst'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='wjk'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='wps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='yejls'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='yop'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zaa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zach'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zaes'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zatw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zava'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zcph'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zee'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zfal'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zfgl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zfk'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zfr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zfsw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zgre'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zig'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zkm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zkri'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zksp'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='znth'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zntw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zpch'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zrgga'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zrgka'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zrgra'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zrph'"><xsl:attribute name="xml:lang">fr</xsl:attribute></xsl:if>
        <xsl:if test="translate(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='zstw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>

    </xsl:template>


</xsl:stylesheet>