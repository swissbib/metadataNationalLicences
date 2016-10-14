<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:import href="nlm-2-to-jats-1-1.xsl"/>


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

    <!-- store the pdf filename in self-uri -->
    <!-- sometimes it is in xlink.href (mistake : a '.' instead of ':') and sometimes in xlink:href -->
    <xsl:template match="related-article[@related-article-type='pdf']">
        <xsl:element name="self-uri">
            <xsl:attribute name="content-type">pdf</xsl:attribute>
            <xsl:attribute name="xlink:href"><xsl:value-of select="@xlink.href"/><xsl:value-of select="@xlink:href"/></xsl:attribute>
        </xsl:element>

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

    <!-- the language tag is always empty, we add it based on de gruyter journal marc records -->


    <xsl:template name="add-language">
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='abitech'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='abpr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='acv'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='advg'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ael'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='afd'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='afgs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='agph'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ajle'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='akg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='alr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ang'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='angl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='anly'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='annalen'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='anona'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='anti'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='aofo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='aot'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='apam'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='apeiron'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='apf'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='apjri'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='arbi'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='arca'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='arg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='argl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='asch'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='asia'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='auto'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='az'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bams'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bap'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bchm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bchm1'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bchm2'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bchm3'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bd'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bejeap'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bejm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bejte'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bfup'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bgsl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='biomat'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bis'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bmc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bmte'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='botm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='bue'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='byzs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='caslar'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cclm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cercles'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='char'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cjal'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cllt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cmam'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cogl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='comm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='corrrev'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cppm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cpt'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='cri'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='crll'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='crpm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='css'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dante'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dig'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dma'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dmdi'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dmvm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dnrm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dug'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dwir'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='dzph'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='east'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ecfr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='edit'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ehs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ejnm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ejss'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='em'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='eplj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='epoly'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='eqc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ercl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='erj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='etly'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='etst'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='eujal'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ev'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='evth'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='fabl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='fhep'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='figurationen'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='flih'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='flin'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='fmst'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='for'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='form'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='fr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='freq'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='frm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='futur'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gcc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gcla'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gej'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='georgejb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='germ'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gesr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gik'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='glot'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gmj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gpr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='gps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='green'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ha'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='hc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='helia'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='hfsg'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='hgjb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='hmbci'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='hpm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='htmp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='humr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='hzhz'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='iabi'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='iasl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='iber'"><xsl:attribute name="xml:lang">es</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ice'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='icom'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ihr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijamh'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijbe'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijcre'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijdhd'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijeeps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijfe'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijmsp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijnes'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijnsns'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijpt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ijsl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ils'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='indo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ins'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='iprg'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='iral'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='irm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='islm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='itit'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='iwp'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jaa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jafio'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jag'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jah'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jall'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='janeh'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbbbl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbcpp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbgsg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbkgv'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbpa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbvela'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jbwg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jcde'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jci'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jcim'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jdpa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jdrg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jeeh'"><xsl:attribute name="xml:lang">fr</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jelf'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jem'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jemc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jetl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jfwe'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jga'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jgd'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jgmo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jgs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jgth'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jhsem'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jias'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jiip'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jirspa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jisys'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jjzg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jjzg-b'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jlm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jlse'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jlt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jmbm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jmc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jnet'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jnetdy'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jnma'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jnum'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='joc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='joll'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jpem'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jplr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jpm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jpme'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jqas'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jsall'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jtl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jtms'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jtse'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='jura'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='juru'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='kadm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='kant'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='kantyb'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='kier'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='kl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='klio'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='kszw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='labm'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='labphon'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='langcog'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ldr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='lehr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='les'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='lexi'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='lhomme'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='libr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ling'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='lity'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='lpp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mamm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mcma'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mdr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mdtr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='me'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mel'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mfir'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mgmc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mgzs'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mial'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='miog'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mjb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mlt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mopp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='muk'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mult'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='mwjhr'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='naha'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ngs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='niet'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='nifo'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='nleng'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='npf'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ntrev'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='nzst'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='olzg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='omz'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='pac'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='para'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='pdtc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='peps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='phil'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='piko'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='piko.1'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='plm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='pol'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='polyeng'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='pop'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='prbs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='prhz'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='prth'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='psicl'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='pteridines'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='pubhef'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='pwp'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='qfiab'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ract'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rbm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rest'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='revac'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='revce'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='reveh'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='revic'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='revneuro'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rhet'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rhiz'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rjnamm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rle'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rmeef'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rnam'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rne'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='roma'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='romb'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='roms'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rose'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='rra'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='saeculum'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='sagmb'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='sats'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='scid'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='scipo'"><xsl:attribute name="xml:lang">mul</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='secm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='selt'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='semi'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='slaw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='snde'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='soci'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='spoet'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='spp'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='srsr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='strm'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='stuf'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='sus'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='tc'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='tcs'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='teme'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='text'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='text.1'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='thli'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='til'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='tillich'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='tjj'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='tlir'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='ur'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='vf'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='vfzg'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='wgst'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='wjk'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='wps'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='yejls'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='yop'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zaa'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zach'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zaes'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zatw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zava'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zcph'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zee'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zfal'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zfgl'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zfk'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zfr'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zfsw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zgre'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zig'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zkm'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zkri'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zksp'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='znth'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zntw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zpch'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zrgga'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zrgka'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zrgra'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zrph'"><xsl:attribute name="xml:lang">fr</xsl:attribute></xsl:if>
        <xsl:if test="normalize-space(/article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])='zstw'"><xsl:attribute name="xml:lang">de</xsl:attribute></xsl:if>
    </xsl:template>


</xsl:stylesheet>