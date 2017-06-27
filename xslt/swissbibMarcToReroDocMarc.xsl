<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:param name="fileName" select="'journals-categories/journals-cdu.xml'" />
    <xsl:param name="journals" select="document($fileName)" />



    <xsl:output method="xml" indent="yes" />

    <xsl:template match="node() | @*" name="identity">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <record xmlns:xs="http://www.w3.org/2001/XMLSchema">
            <xsl:for-each select="//recordData/record">
                <xsl:apply-templates></xsl:apply-templates>
            </xsl:for-each>
        </record>
    </xsl:template>





    <!-- removed fields -->
    <xsl:template match="//leader"></xsl:template>
    <xsl:template match="//controlfield"></xsl:template>

    <xsl:template match="//datafield[@tag='022']"/>


    <xsl:template match="//datafield[@tag='024']">
        <xsl:choose>
            <xsl:when test="contains(subfield[@code='2'],'pii')">
                <!-- remove field -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="datafield">
                    <xsl:attribute name="tag">024</xsl:attribute>
                    <xsl:attribute name="ind1"><xsl:value-of select="@ind1"></xsl:value-of></xsl:attribute>
                    <xsl:attribute name="ind2"><xsl:value-of select="@ind2"></xsl:value-of></xsl:attribute>
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:element>

            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>



    <xsl:template match="//datafield[@tag='100']/subfield[@code='D'] | //datafield[@tag='700']/subfield[@code='D']"></xsl:template>
    <xsl:template match="//datafield[@tag='100']/subfield[@code='4'] | //datafield[@tag='700']/subfield[@code='4']"></xsl:template>

    <xsl:template match="//datafield[@tag='245']/subfield[@code='c']"></xsl:template>
    <xsl:template match="//datafield[@tag='245']/subfield[@code='h']"></xsl:template>

    <xsl:template match="//datafield[@tag='500']"/>
    <xsl:template match="//datafield[@tag='502']"/>
    <xsl:template match="//datafield[@tag='506']"/>

    <xsl:template match="//datafield[@tag='690'][position()>1]"/>


    <xsl:template match="//datafield[@tag='773']/subfield[@code='q']"></xsl:template>
    <xsl:template match="//datafield[@tag='773']/subfield[@code='1']"></xsl:template>
    <xsl:template match="//datafield[@tag='773']/subfield[@code='2']"></xsl:template>
    <xsl:template match="//datafield[@tag='773']/subfield[@code='o']"></xsl:template>


    <xsl:template match="//datafield[@tag='898']"></xsl:template>
    <xsl:template match="//datafield[@tag='900']"></xsl:template>
    <xsl:template match="//datafield[@tag='908']"></xsl:template>
    <xsl:template match="//datafield[@tag='909']"></xsl:template>



    <xsl:template match="//datafield[@tag='949']"></xsl:template>
    <xsl:template match="//datafield[@tag='950']"></xsl:template>
    <xsl:template match="//datafield[@tag='986']"></xsl:template>




    <!-- modified fields -->

    <!-- modified indicators -->
    <xsl:template match="//datafield[@tag='245']/@ind1">
        <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>
    <xsl:template match="//datafield[@tag='245']/@ind2">
        <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>

    <xsl:template match="//datafield[@tag='246']/@ind1">
        <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>
    <xsl:template match="//datafield[@tag='246']/@ind2">
        <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>


    <xsl:template match="//datafield[@tag='520']/@ind1">
        <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>
    <xsl:template match="//datafield[@tag='520']/@ind2">
        <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>

    <xsl:template match="//datafield[@tag='100']/@ind1">
        <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>

    <xsl:template match="//datafield[@tag='700']/@ind1">
        <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>

    <xsl:template match="//datafield[@tag='773']/@ind1">
        <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
    </xsl:template>














    <xsl:template match="//datafield[@tag='100']/subfield[@code='a'] | //datafield[@tag='700']/subfield[@code='a']">
        <xsl:element name="subfield">
            <xsl:attribute name="code">a</xsl:attribute>
            <xsl:value-of select="."></xsl:value-of>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="../subfield[@code='D']"></xsl:value-of>
        </xsl:element>

    </xsl:template>



    <!-- don't take editors in 100-->
    <xsl:template match="//datafield[@tag='100']">
        <xsl:choose>
            <xsl:when test="starts-with(subfield[@code='4'],'edt')">
                <!-- remove element -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="datafield">
                    <xsl:attribute name="tag">100</xsl:attribute>
                    <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- don't take editors in 700-->
    <xsl:template match="//datafield[@tag='700']">
        <xsl:choose>
            <xsl:when test="starts-with(subfield[@code='4'],'edt')">
                <!-- remove element -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="datafield">
                    <xsl:attribute name="tag">700</xsl:attribute>
                    <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- move first 700 field to 100 -->
    <xsl:template match="//datafield[@tag='700'][1]">
        <xsl:choose>
            <xsl:when test="//datafield[@tag='100']">
                <xsl:element name="datafield">
                    <xsl:attribute name="tag">700</xsl:attribute>
                    <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="datafield">
                    <xsl:attribute name="tag">100</xsl:attribute>
                    <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>




    <xsl:template match="//datafield[@tag='035']">
        <xsl:choose>
            <xsl:when test="starts-with(subfield[@code='a'],'(NATIONALLICENCE)')">
                <xsl:element name="datafield">
                    <xsl:attribute name="tag">037</xsl:attribute>
                    <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
                    <xsl:element name="subfield">
                        <xsl:attribute name="code">a</xsl:attribute>
                        <xsl:text>swissbib.ch:</xsl:text>
                        <xsl:value-of select="./subfield[@code='a']"></xsl:value-of>
                    </xsl:element>
                </xsl:element>
                <xsl:call-template name="language"></xsl:call-template>
                <xsl:call-template name="cdu"></xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
            <!-- remove field -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//datafield[@tag='856']">
        <xsl:element name="datafield">
            <xsl:attribute name="tag">775</xsl:attribute>
            <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
            <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
            <xsl:element name="subfield">
                <xsl:attribute name="code">o</xsl:attribute>
                <xsl:value-of select="./subfield[@code='u']"></xsl:value-of>
            </xsl:element>
            <xsl:element name="subfield">
                <xsl:attribute name="code">g</xsl:attribute>
                <xsl:text>Publisher's version</xsl:text>
            </xsl:element>
        </xsl:element>
    </xsl:template>



    <xsl:template match="//datafield[@tag='773']/subfield[@code='g']">
        <xsl:element name="subfield">
            <xsl:attribute name="code">g</xsl:attribute>
            <!-- original : 27/1(2014-06), 119-130-->
            <!-- year -->
            <xsl:value-of select="../subfield[@code='1']"></xsl:value-of>
            <xsl:text>/</xsl:text>
            <!-- volume -->
            <xsl:value-of select="../subfield[@code='2']"></xsl:value-of>
            <xsl:text>/</xsl:text>
            <!-- issue -->
            <xsl:value-of select="substring-after(substring-before(../subfield[@code='g'],'('),'/')"></xsl:value-of>
            <xsl:text>/</xsl:text>
            <!-- start-page -->
            <xsl:value-of select="substring-before(substring-after(../subfield[@code='g'],', '),'-')"></xsl:value-of>
            <xsl:text>-</xsl:text>
            <!-- end-page -->
            <xsl:value-of select="substring-after(substring-after(../subfield[@code='g'],','),'-')"></xsl:value-of>
        </xsl:element>
    </xsl:template>

    <!-- language -->
    <xsl:template name="language">
        <xsl:element name="datafield">
            <xsl:attribute name="tag">041</xsl:attribute>
            <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
            <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
            <xsl:element name="subfield">
                <xsl:attribute name="code">a</xsl:attribute>
                <xsl:value-of select="substring(//controlfield[@tag='008'],'36','3')"></xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- subjects-->
    <xsl:template match="//datafield[@tag='690'][1]">
        <xsl:element name="datafield">
            <xsl:attribute name="tag">695</xsl:attribute>
            <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
            <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
            <xsl:element name="subfield">
                <xsl:attribute name="code">a</xsl:attribute>
                <xsl:for-each select="//datafield[@tag='690']">
                    <xsl:if test="position() > 1">
                        <xsl:text> ; </xsl:text>
                    </xsl:if>
                    <xsl:value-of select="subfield[@code='a']"></xsl:value-of>

                </xsl:for-each>

            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="cdu">
        <xsl:variable name="issn" select="//datafield[@tag='773']/subfield[@code='x']"></xsl:variable>
        <xsl:variable name="cdu" select="$journals//journal[@issn=$issn]/cdu"></xsl:variable>
        <xsl:if test="string-length($cdu)&gt;0">
            <xsl:element name="datafield">
                <xsl:attribute name="tag">080</xsl:attribute>
                <xsl:attribute name="ind1"><xsl:text> </xsl:text></xsl:attribute>
                <xsl:attribute name="ind2"><xsl:text> </xsl:text></xsl:attribute>
                <xsl:element name="subfield">
                    <xsl:attribute name="code">a</xsl:attribute>
                        <xsl:value-of select="$cdu"></xsl:value-of>
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>








</xsl:stylesheet>