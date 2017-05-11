<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output encoding="UTF-8" indent="no" omit-xml-declaration="no"/>
    <!-- Feuille de style ISTEX Editeur DE GRUYTER DTD "nlm-dtd_archivearticle.dtd" vers MODS XSD MODS.v.3.4 
        =======================================================================================
        Auteur:  Stéphanie GREGORIO - INIST/CNRS
        =======================================================================================
        Version 0.1 du 14/11/2013
        Version 0.2 du 12/08/2015
        Version 0.3 du 02/11/2015
        Version 0.4 du 09/11/2015 maj article categories / identifiants related-article
        Version 0.4.1 du 24/11/2015 maj affiliation / articlecategform / language
        Version 0.4.2 du 26/11/2015 maj affiliation nettoyage balise sup et label
        Version 0.4.2.1 du 30/11/2015 maj affiliation email suite
        Version 0.5 du 04/12/2015 maj articleType  normalisation
        11/12/2015 - articleType suite
        MAJ 18/12/2015 - probleme <name> vide
        MAJ 14/01/2016 - eng par défaut
        25/01/2016 suite etude ajout type de publication (ajout <genre> à related type"host")
    23/02/2016 reprise affiliation cas particulier
    07/03/2016 reprise genre host
    15/03/2016 ajout @displayLabel à mods:genre contenant le contenu original editeur
    14/04/2016 reprise affiliation
    15/04/2016 ajout dateIssued par défaut
    22/04/2016 ajout identifiant pdf
    09/05/2016 lodex: normalisation des codes <genre>
    12/05/2016 ajout correction date de publication
    18/05/2016 suppression des isbn dans les book-reviews
    31/05/2016 suite étude type d'article other + abstract (article) article de supplément
    26/06/2016 ajout de relatedItem type otherVersion pour les erratums
    12/07/2016 titre trans-abstract polluant
    04/08/2016 redressement des langues erronées- erreur de l'éditeur
    03/10/2016 adaptation pour les licences nationales suisses (Lionel Walter)
    -->
 <!-- ******************* TRAITEMENT PRINCIPAL ******************************-->
    <xsl:template match="text()">
        <!-- 
            tabulation horizontale &#9; \t
            changement de ligne &#10; \n
            retour chariot &#13;  \r 
            a la ligne &#133;
            separateur de ligne &#8232;
            séparateur de paragraphe &#8233;
        -->
        <xsl:value-of select="translate(.,'&#9;&#13;&#10;&#133;&#8232;&#8233;&#8234;&#8235;&#8236;&#8237;','')"/>
    </xsl:template>
    <xsl:template match="p">
        <xsl:value-of select="concat(' ',.,' ')"/>
    </xsl:template>
    <xsl:template match="fn"/>
    <xsl:template match="sup">
        <xsl:if test="name(..)!='aff'">
            <xsl:value-of select="."/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="xref"/>
    <xsl:template match="label"><xsl:text> </xsl:text></xsl:template>
    <xsl:template match="/">
        <mods xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="version">
                <xsl:text>3.6</xsl:text>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="//article/front/article-meta/title-group/article-title[string-length()&gt; 0]">
                    <titleInfo xmlns="http://www.loc.gov/mods/v3">
                        <xsl:choose>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0039-3'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0038-4'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0031-3'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0041-9'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0040-x'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0037-5'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0042-8'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0030-4'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0026-0'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0029-x'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0028-y'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0034-0'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0025'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0031'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0050'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0035'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0034'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0041'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0026'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0042'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0049'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0020'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0028'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0036'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0044'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0032'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0037'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0027'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0024'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0022'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0015'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0038'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0016'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0017'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0018'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0033'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0021'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0040'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0045'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0043'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0029'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0023'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0039'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0019'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0027-z'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0047'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0048'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0046'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0030'"><xsl:attribute name="lang">en</xsl:attribute></xsl:when>
                            <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="//article/front/article-meta/title-group/article-title/@xml:lang[string-length()&gt; 0]">
                                <xsl:attribute name="lang">
                                    <xsl:value-of select="normalize-space(translate(//article/front/article-meta/title-group/article-title/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="//article/@xml:lang[string-length()&gt; 0]">
                                    <xsl:attribute name="lang">
                                        <xsl:value-of select="normalize-space(translate(//article/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                    </xsl:attribute>
                                </xsl:if> 
                            </xsl:otherwise>
                        </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- categories (ex: letter) -->
                        <xsl:if test="//article-meta/article-categories/series-title[string-length()&gt; 0]">
                            <partName xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="normalize-space(//article-meta/article-categories/series-title)"/>
                            </partName>
                        </xsl:if>
                        <title xmlns="http://www.loc.gov/mods/v3">
                            <xsl:variable name="ttl">
                                <xsl:apply-templates select="//article/front/article-meta/title-group/article-title"/>
                            </xsl:variable>
                            <xsl:value-of select="normalize-space($ttl)"/>
                            <xsl:if test="//response">
                                <xsl:if test="//article-categories/subj-group/subject[string-length() &gt; 0]">
                                    <xsl:for-each select="//article-categories/subj-group">
                                        <xsl:if test="@subj-group-type='heading'">
                                            <xsl:text> [</xsl:text>
                                            <xsl:value-of select="normalize-space(.)"/>
                                            <xsl:text>]</xsl:text>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:if>
                        </title>
                        <!-- subtitle correspond aussi au genre -->
                        <xsl:if test="//article/front/article-meta/title-group/subtitle">
                            <subTitle xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="normalize-space(//article/front/article-meta/title-group/subtitle)"/>
                            </subTitle>
                        </xsl:if>
                    </titleInfo>
                <xsl:if test="//article/front/article-meta/title-group/trans-title-group/trans-title[string-length()&gt; 0]">
                    <xsl:for-each select="//title-group/trans-title-group">
                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">translated</xsl:attribute>
                            <xsl:if test="@xml:lang[string-length()&gt; 0]">
                                <xsl:attribute name="lang">
                                    <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                </xsl:attribute>
                            </xsl:if>
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="normalize-space(trans-title)"/>
                            </title>
                            <xsl:if test="trans-subtitle">
                                <subTitle xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(trans-subtitle)"/>
                                </subTitle>
                            </xsl:if>
                        </titleInfo>

                    </xsl:for-each>
                </xsl:if>
            </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="//article-meta/article-categories/subj-group[@subj-group-type='heading']/subject[string-length()&gt; 0]">
                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="//article-meta/article-categories/subj-group[@subj-group-type='heading']/subject"/>
                            </title>
                        </titleInfo>
                    </xsl:if>
                </xsl:otherwise>
                </xsl:choose>
           <!-- ******************* Traitements des auteurs ******************************-->
            <xsl:if test="//article/front/article-meta/contrib-group[string-length() &gt; 0]">
                <xsl:for-each select="//article/front/article-meta/contrib-group">
                    <xsl:variable name="contrib">
                        <xsl:value-of select="normalize-space(count(contrib))"/>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="contrib/collab">
                            <xsl:for-each select="contrib/collab">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </namePart>
                                    <xsl:if test="not(//aff/@id) and //aff">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                            <xsl:value-of select="normalize-space(//aff)"/>
                                        </affiliation>
                                    </xsl:if>
                                    <xsl:if test="contrib/aff/@id">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">                                         
                                            <xsl:value-of select="normalize-space(contrib/aff)"/>
                                        </affiliation>
                                    </xsl:if>
                                    <xsl:if test="//contrib-group/aff/@id and not(//contrib-group/contrib/name)">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">                                         
                                            <xsl:value-of select="normalize-space(//contrib-group/aff)"/>
                                        </affiliation>
                                    </xsl:if>
                                    <xsl:if test="xref[@ref-type='aff']">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                            <xsl:if test="//aff[@id=current()/xref/@rid]">
                                                <xsl:value-of select="normalize-space(//aff[@id=current()/xref/@rid])"/>
                                            </xsl:if>
                                        </affiliation>
                                    </xsl:if>
                                    <xsl:if test="xref[@ref-type='corresp']">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                            <xsl:if test="//author-notes/corresp[@id=current()/xref[@ref-type='corresp']/@rid]">
                                                <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/xref[@ref-type='corresp']/@rid])"/>
                                            </xsl:if>
                                        </affiliation>
                                    </xsl:if>
                                   <!-- <xsl:if test="//contrib/xref[@ref-type='corresp']">
                                        <xsl:if test="//author-notes/corresp">
                                            <xsl:choose>
                                                <xsl:when test="//author-notes/corresp and not(contains(//author-notes/corresp,'Email'))">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:value-of select="normalize-space(//author-notes/corresp)"/>
                                                    </affiliation>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="//author-notes/corresp/email">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:text>E-mail: </xsl:text>
                                                        <xsl:value-of select="normalize-space(//author-notes/corresp/email)"/>
                                                    </affiliation>
                                                </xsl:when>
                                            </xsl:choose>
                                            </xsl:if>
                                    </xsl:if>-->
                                </name>
                            </xsl:for-each> 
                            <xsl:if test="//contrib/name">
                                <xsl:call-template name="MulContrib"></xsl:call-template>
                            </xsl:if>                            
                        </xsl:when>
                        <xsl:when test="$contrib = 1 and not(contrib/collab) and contrib/name ">
                            <xsl:if test="contrib/name/surname[string-length() &gt; 0]">
                            <name xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">personal</xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="contrib/name/prefix and not(contains(contrib/name/prefix,'collaboration')) ">
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                        <xsl:value-of select="normalize-space(contrib/name/prefix)"/>
                                    </namePart>  
                                </xsl:when>
                                <xsl:when test="contrib/string-name/prefix and not(contains(contrib/string-name/prefix,'collaboration'))">
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                        <xsl:value-of select="normalize-space(contrib/string-name/prefix )"/>
                                    </namePart>  
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="contrib/name/given-names[string-length() &gt; 0]">                                    
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">given</xsl:attribute>
                                    <xsl:value-of select="normalize-space(contrib/name/given-names)"/>
                                </namePart>
                            </xsl:if>
                            <xsl:if test="contrib/string-name/given-names[string-length() &gt; 0]">                                    
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">given</xsl:attribute>
                                    <xsl:value-of select="normalize-space(contrib/string-name/given-names)"/>
                                </namePart>
                            </xsl:if>
                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">family</xsl:attribute>
                                <xsl:value-of select="normalize-space(translate(contrib/name/surname,',',''))"/>
                                <xsl:value-of select="normalize-space(contrib/string-name/surname)"/>
                            </namePart>
                            <xsl:if test="contrib/name/suffix[string-length() &gt; 0]">
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                    <xsl:value-of select="normalize-space(contrib/name/suffix)"/>
                                </namePart>
                            </xsl:if> 
                            <xsl:if test="contrib/string-name/suffix[string-length() &gt; 0]">
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                    <xsl:value-of select="normalize-space(contrib/string-name/suffix)"/>
                                </namePart>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="contrib/aff/institution[string-length() &gt; 0]">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(contrib/aff/institution)"/>
                                        <xsl:if test="contrib/aff/addr-line[string-length() &gt; 0]">
                                            <xsl:text>, </xsl:text>
                                            <xsl:value-of select="contrib/aff/addr-line"/>
                                        </xsl:if>
                                    </affiliation>
                                </xsl:when>
                                <xsl:when test="contrib/aff[string-length() &gt; 0]">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(contrib/aff)"/>
                                    </affiliation>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="aff/@id and not(contrib/xref)">
                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(aff)"/>
                                </affiliation>
                            </xsl:if>                            
                            <xsl:if test="aff[string-length() &gt; 0] | //aff[string-length() &gt; 0] and not(aff/@id | //aff/@id)">
                                <xsl:choose>
                                   <xsl:when test="aff and not(aff/sup|aff/label)">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:choose>
                                                <xsl:when test="aff/institution">
                                                    <xsl:value-of select="normalize-space(aff/institution)"/>
                                                    <xsl:if test="aff/addr-line and aff/institution">
                                                        <xsl:for-each select="aff/addr-line">
                                                        <xsl:text>, </xsl:text>
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="normalize-space(aff)"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            
                                        </affiliation>
                                    </xsl:when>
                                    <xsl:when test="aff/sup|aff/label">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(substring-after(aff,aff/sup|aff/label))"/>
                                        </affiliation>
                                    </xsl:when>
                                    <xsl:when test="aff/email">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(substring-before(aff,aff/email))"/>
                                        </affiliation>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="aff2"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="//aff[@id=current()/contrib/xref/@rid]">
                                <xsl:variable name="nettSup">
                                    <xsl:apply-templates select="//aff[@id=current()/contrib/xref/@rid]"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="//aff[@id=current()/contrib/xref/@rid]">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space($nettSup)"/>
                                        </affiliation>
                                        <xsl:if test="//aff[@id=current()/contrib/xref/@rid]/email">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:text>E-mail: </xsl:text>
                                                <xsl:value-of select="normalize-space(//aff[@id=current()/contrib/xref/@rid]/email)"/>
                                            </affiliation>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:variable name="countContrib">
                                <xsl:value-of select="count(//contrib)"/>
                            </xsl:variable>
                            <xsl:if test="number($countContrib) = 1 and //author-notes/fn/p/email[string-length() &gt; 0]">
                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>E-mail: </xsl:text>
                                    <xsl:value-of select="normalize-space(//author-notes/fn/p/email)"/>
                                </affiliation>
                            </xsl:if>
                            <xsl:if test="contrib/@corresp and //author-notes/corresp ">
                                <xsl:for-each select="//author-notes/corresp">
                                    <xsl:variable name="corresp">
                                        <xsl:apply-templates select="."/>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="contains($corresp,', email:')">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:value-of select="normalize-space(substring-before($corresp,', email:'))"/>
                                            </affiliation>
                                        </xsl:when>
                                        <xsl:when test="contains($corresp,'Tel.')">
                                        </xsl:when>
                                        <xsl:when test="contains($corresp,';') and not(email) ">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:value-of select="normalize-space(substring-before($corresp,';'))"/>
                                            </affiliation>
                                        </xsl:when>
                                        </xsl:choose>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="contrib/xref/@rid and //aff">
                                    <xsl:call-template name="Affiliation"/>
                                </xsl:when>
                                <xsl:when test="not(contrib/xref) and //aff">
                                    <xsl:call-template name="authorAffSimple"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="authorSSAff"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- EMAIL -->
                            <xsl:choose>
                                <xsl:when test="//author-notes/email[string-length() &gt; 0]">
                                    <xsl:for-each select="//author-notes/email">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:text>E-mail: </xsl:text>
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </affiliation>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:when test="./email[string-length() &gt; 0]">
                                    <xsl:for-each select="./email[string-length() &gt; 0]">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:text>E-mail: </xsl:text>
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </affiliation>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:when test="//author-notes/corresp[string-length() &gt; 0] and not(//author-notes/corresp/@id)">
                                    <xsl:for-each select="//author-notes/corresp">
                                        <xsl:if test="contains(.,'E-mail:') and not(email)">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:value-of select="normalize-space(substring-before(.,'E-mail:'))"/>
                                            </affiliation>
                                        </xsl:if>
                                      <!--  <xsl:if test="//author-notes/corresp/email[string-length() &gt; 0]">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:text>E-mail: </xsl:text>
                                                <xsl:value-of select="normalize-space(//author-notes/corresp/email"/>
                                            </affiliation>
                                        </xsl:if>-->
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="contrib/email[string-length() &gt; 0]">
                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>E-mail: </xsl:text>                                        
                                    <xsl:value-of select="normalize-space(contrib/email)"/>
                                </affiliation>
                            </xsl:if> 
                            <xsl:if test="//author-notes/corresp/addr-line/named-content/email">
                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:text>E-mail: </xsl:text>
                                    <xsl:value-of select="normalize-space(//author-notes/corresp/addr-line/named-content/email)"/>
                                </affiliation>
                            </xsl:if> 
                            <xsl:if test="//author-notes/corresp and contrib/@corresp='yes' and not(contrib/xref[@ref-type='corresp'])">
                                <xsl:for-each select="//author-notes/corresp">
                                    <xsl:choose>
                                        <xsl:when test="email[string-length() &gt; 0]">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:text>E-mail: </xsl:text>
                                                <xsl:value-of select="normalize-space(email)"/>
                                            </affiliation>
                                        </xsl:when>
                                        <xsl:when test="contains(.,'Tel.')"/>
                                        <xsl:otherwise>
                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </affiliation>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="//author-notes/corresp[@id=current()/contrib/xref/@rid]/email">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:text>E-mail: </xsl:text>
                                                <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/contrib/xref/@rid]/email)"/>
                                            </affiliation>
                            </xsl:if>                             
                            <xsl:call-template name="role"/>
                            <xsl:call-template name="bio"/>
                            <xsl:if test="contrib/role[string-length() &gt; 0]">
                                <description xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:value-of select="normalize-space(contrib/role)"/>
                                </description>
                                <xsl:if test="//author-notes/fn[@fn-type='other']">
                                    <description xmlns="http://www.loc.gov/mods/v3"> 
                                        <xsl:value-of select="normalize-space(//author-notes/fn[@fn-type='other']/p)"/>
                                    </description>
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="//notes/fn-group/fn[@id=current()/contrib/xref/@rid]">
                                <description xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:value-of select="normalize-space(//notes/fn-group/fn[@id=current()/contrib/xref/@rid])"/>
                                </description>
                            </xsl:if>
                            <xsl:if test="//author-notes/fn[@fn-type='other'] and not(//author-notes/fn[@id=current()/contrib/xref/@rid]) and not(contrib/role)">
                                <description xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:value-of select="normalize-space(//author-notes/fn[@fn-type='other'])"/>
                                </description>
                            </xsl:if>
                        </name>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="//article/front/article-meta/contrib-group/contrib[string-length() &gt; 0]">
                                    <xsl:for-each select="//contrib">
                                        <xsl:if test="name/surname[string-length() &gt; 0]">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:choose>
                                                <xsl:when test="@contrib-type='group-author'">
                                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:attribute name="type">personal</xsl:attribute>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="@corresp='yes'">
                                                <xsl:attribute name="displayLabel">
                                                <xsl:text>corresp</xsl:text>
                                                </xsl:attribute> 
                                            </xsl:if>
                                            <xsl:if test="on-behalf-of[string-length() &gt; 0]">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(on-behalf-of)"/>
                                                </namePart> 
                                            </xsl:if>
                                            <xsl:choose>
                                                <xsl:when test="contrib/string-name/prefix and not(contains(contrib/string-name/prefix,'collaboration')) ">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                        <xsl:value-of select="normalize-space(string-name/prefix )"/>
                                                    </namePart>  
                                                </xsl:when>
                                                <xsl:when test="name/prefix and not(contains(name/prefix,'collaboration')) ">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                        <xsl:value-of select="normalize-space(name/prefix)"/>
                                                    </namePart>  
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="string-name/given-names[string-length() &gt; 0]">                                    
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">given</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(string-name/given-names)"/>
                                                </namePart>
                                            </xsl:if>
                                            <xsl:if test="name/given-names[string-length() &gt; 0] ">                                    
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">given</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(name/given-names)"/>
                                                </namePart>
                                            </xsl:if>
                                            <xsl:if test="name/surname[string-length() &gt; 0] | string-name/surname[string-length() &gt; 0]">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">family</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(name/surname | string-name/surname)"/>
                                                </namePart>   
                                            </xsl:if>
                                            <xsl:if test="name/suffix[string-length() &gt; 0]">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                    <xsl:value-of select="normalize-space(name/suffix)" />
                                                </namePart>
                                            </xsl:if>
                                            <xsl:if test="string-name/suffix[string-length() &gt; 0]">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                    <xsl:value-of select="normalize-space(string-name/suffix)" />
                                                </namePart>
                                            </xsl:if>
                                            <xsl:if test="//aff[@id=current()/xref/@rid]">
                                                <xsl:call-template name="Affiliation"/>
                                            </xsl:if>
                                            <!--traitement des targets-->
                                            <xsl:choose>
                                                <xsl:when test="//target[@id=current()/xref/@rid]">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(//target[@id=current()/xref/@rid]/following-sibling::text()[1])"/> 
                                                    </affiliation> 
                                                </xsl:when>
                                                <xsl:when test="//contrib-group/aff and not(xref[@ref-type='aff']) and //aff/institution">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(//aff/institution)"/>                                                        
                                                        <xsl:if test="//aff/addr-line">
                                                            <xsl:for-each select="//aff/addr-line">
                                                                <xsl:text>, </xsl:text>
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                            </xsl:for-each>
                                                        </xsl:if>
                                                        <xsl:if test="//aff/country">
                                                            <xsl:for-each select="//aff/country">
                                                                <xsl:text>, </xsl:text>
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                            </xsl:for-each>
                                                        </xsl:if>
                                                    </affiliation>
                                                </xsl:when>
                                                <xsl:when test="//contrib-group/aff and not(//contrib-group/aff/@id) and not(xref[@ref-type='aff'])">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(//aff/text())"/>
                                                    </affiliation>
                                                </xsl:when>
                                            </xsl:choose>
                                         <xsl:if test="not(//aff/@id) and not(//xref[@ref-type='aff'])">
                                                <xsl:call-template name="aff2"/>
                                         </xsl:if>
                                            <xsl:if test="//aff/@id and not(//xref[@ref-type='aff'])">
                                                <xsl:call-template name="aff2"/>
                                            </xsl:if>
                                            <xsl:variable name="target">
                                                <xsl:if test="//target[@id=current()/xref/@rid]">
                                                    <xsl:value-of select="normalize-space(//target[@id=current()/xref/@rid]/following-sibling::text()[1])"/> 
                                                </xsl:if>
                                            </xsl:variable>
                                            
                                            <!--<xsl:if test="//contrib-group/aff[string-length() &gt; 0] and not(//contrib-group/aff[@id=current()/xref/@rid])">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:value-of select="normalize-space(//contrib-group/aff)"/>
                                                </affiliation>
                                            </xsl:if>-->
                                            
                                            <xsl:choose>
                                                <xsl:when test="xref/@rid and //aff/text()">
                                                     <!-- cas pas de lien aff/contrib -->
                                                    <xsl:choose>
                                                        <xsl:when test="//author-notes/corresp[@id=current()/xref/@rid]">
                                                            <xsl:choose>
                                                                <xsl:when test="//author-notes/corresp[@id=current()/xref/@rid]/ext-link[@ext-link-type='email']">
                                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:text>E-mail: </xsl:text>
                                                                        <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/xref/@rid]/ext-link)"/>
                                                                    </affiliation>
                                                                </xsl:when>
                                                                <xsl:when test="//author-notes/corresp[@id=current()/xref/@rid]/email">
                                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:text>E-mail: </xsl:text>
                                                                        <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/xref/@rid]/email)"/>
                                                                    </affiliation>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/xref/@rid])"/>
                                                                    </affiliation>
                                                                </xsl:otherwise>
                                                            </xsl:choose>                                                           
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:if test="//aff[string-length() &gt; 0] and not(//aff/@id)">
                                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(//aff/text())"/>
                                                                </affiliation>
                                                            </xsl:if>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    
                                                       
                                                    
                                                </xsl:when>
                                                <xsl:when test="not(xref) and //aff"> 
                                                    <xsl:call-template name="authorAffSimple"/>
                                                </xsl:when>
                                                <xsl:when test="not(xref) and aff">
                                                    <xsl:call-template name="authorAffSimple"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="authorSSAff"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="not(//author-notes/corresp[@id=current()/xref/@rid])and contains(@corresp,'yes') and //author-notes/corresp[string-length() &gt; 0]">
                                                <xsl:if test="//author-notes/corresp/email">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:text>E-mail: </xsl:text>
                                                        <xsl:value-of select="normalize-space(//author-notes/corresp/email)"/>
                                                    </affiliation>
                                                </xsl:if>
                                            </xsl:if>
                                            <!-- EMAIL -->
                                            <xsl:choose>
                                                <xsl:when test="@corresp and not(contains(//@corresp,'yes')) and //author-notes/corresp/email[string-length() &gt; 0] ">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:text>E-mail: </xsl:text>
                                                        <xsl:choose>
                                                            <xsl:when test="//author-notes/corresp/email[string-length() &gt; 0]">
                                                                <xsl:value-of select="normalize-space(//author-notes/corresp/email)"/>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:if test="email[string-length() &gt; 0]">                                                      
                                                                <xsl:value-of select="normalize-space(email)"/>
                                                                </xsl:if>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </affiliation>
                                                    <xsl:if test="//author-notes/corresp">
                                                        <description xmlns="http://www.loc.gov/mods/v3">                                                        
                                                            <xsl:value-of select="normalize-space(substring-before(//author-notes/corresp,//author-notes/corresp/email))"/>
                                                        </description>
                                                    </xsl:if>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="//author-notes/email[string-length() &gt; 0]">
                                                    <xsl:for-each select="//author-notes/email">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>                                                             
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </affiliation>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="author-comment[string-length() &gt; 0]">
                                                <description xmlns="http://www.loc.gov/mods/v3">   
                                                    <xsl:value-of select="normalize-space(author-comment)" />
                                                </description>
                                            </xsl:if>
                                            <xsl:if test="//author-notes/fn[@id=current()/xref/@rid]/p/email">
                                                <xsl:for-each select="//author-notes/fn[@id=current()/xref/@rid]/p/email">
                                                    <description xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:text>E-mail: </xsl:text>
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </description>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <!-- ne pas reprendre "Author to whom any correspondence should be addressed". -->
                                            <!--<xsl:if test="//author-notes/fn[@id=current()/xref/@rid]/p and not(//author-notes/fn/p/email)">
                                                <xsl:for-each select="//author-notes/fn[@id=current()/xref/@rid]/p">
                                                    <description xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </description>
                                                </xsl:for-each>
                                            </xsl:if> -->
                                            <xsl:if test="role">
                                                    <description xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:value-of select="normalize-space(role)"/>
                                                    </description>
                                            </xsl:if>
                                            <xsl:call-template name="role"/>
                                            <xsl:call-template name="bio"/>                                             
                                        </name>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="contrib/collab">
                                        <xsl:for-each select="//contrib/name | //contrib/string-name">
                                            <name xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">personal</xsl:attribute>
                                                <xsl:choose>
                                                    <xsl:when test="prefix and not(contains(prefix,'collaboration'))">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                            <xsl:value-of select="normalize-space(prefix)"/>
                                                        </namePart>  
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="given-names[string-length() &gt; 0]">                                    
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">given</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(given-names)"/>
                                                    </namePart>
                                                </xsl:if>
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">family</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(surname)"/>
                                                </namePart>
                                                <xsl:if test="suffix[string-length() &gt; 0]">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                        <xsl:value-of select="normalize-space(suffix)" />
                                                    </namePart>
                                                </xsl:if>
                                                <xsl:choose>
                                                    <xsl:when test="xref/@rid and //aff/text()">
                                                        <xsl:call-template name="Affiliation"/>
                                                    </xsl:when>
                                                    <xsl:when test="not(xref) and //aff"> 
                                                        <xsl:call-template name="authorAffSimple"/>
                                                    </xsl:when>
                                                    <xsl:when test="not(xref) and aff"> 
                                                        <xsl:call-template name="authorAffSimple"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:call-template name="authorSSAff"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <xsl:if test="author-comment[string-length() &gt; 0]">
                                                    <affiliation xmlns="http://www.loc.gov/mods/v3">   
                                                        <xsl:value-of select="normalize-space(author-comment)" />
                                                    </affiliation>
                                                </xsl:if>
                                                <!-- EMAIL -->
                                                <xsl:choose>
                                                    <xsl:when test="@corresp and not (contains(@corresp,'yes')) ">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                            <xsl:value-of select="normalize-space(substring-before(//author-notes/corresp,//author-notes/corresp/email))"/>
                                                        </affiliation>
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>  
                                                            <xsl:value-of select="normalize-space(//author-notes/corresp/email)"/>
                                                        </affiliation>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:if test="@corresp">
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:value-of select="normalize-space(//author-notes/corresp)"/>
                                                            </affiliation>
                                                        </xsl:if>
                                                        <xsl:if test="email">
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>E-mail: </xsl:text>                                                                
                                                                <xsl:value-of select="normalize-space(email)"/>
                                                            </affiliation>
                                                        </xsl:if>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <xsl:choose>
                                                    <xsl:when test="//author-notes/email[string-length() &gt; 0]">
                                                        <xsl:for-each select="//author-notes/email">
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>E-mail: </xsl:text>                                                                
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                            </affiliation>
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                </xsl:choose>        
                                                <xsl:call-template name="role"/>
                                                <xsl:call-template name="bio"/>                          
                                            </name>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:if> 
            <!-- ******************* Traitements des multi-auteurs ******************************-->
            <xsl:if test="//contrib-group[@content-type='collaborators']">
                <xsl:call-template name="MulContrib"/>
            </xsl:if>
            <!-- ******************* Type of ressource ******************************-->
            <typeOfResource xmlns="http://www.loc.gov/mods/v3">
                <xsl:text>text</xsl:text>
            </typeOfResource>
            <!-- ******************* Genre ******************************-->
            <xsl:variable name="codeGenre1">
                <xsl:value-of select="article/@article-type"/>
            </xsl:variable>
            <xsl:variable name="codeGenre">
                <xsl:choose>
                    <xsl:when test="normalize-space($codeGenre1)='abstract'">abstract</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='addendum'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='announcement'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='article-commentary'">review-article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='book-review'">book-reviews</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='books-received'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='brief-report'">brief-communication</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='calendar'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='case-report'">case-report</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='collection'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='correction'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='dissertation'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='discussion'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='editorial'">editorial</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='in-brief'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='introduction'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='letter'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='meeting-report'">conference</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='news'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='obituary'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='oration'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='other'">
                        <xsl:choose>
                            <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0] and contains(//article-meta/fpage,'s') or contains(//article-meta/fpage,'S')">article</xsl:when>
                            <xsl:otherwise>other</xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='partial-retraction'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='poster'">conference</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='product-review'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='rapid-communication'">brief-communication</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='reply'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='reprint'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='research-article'">research-article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='retraction'">other</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='review-article'">review-article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='translation'">other</xsl:when>
                    <xsl:otherwise>
                        <xsl:text>other</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="article/@article-type[string-length()&gt; 0]">
                    <genre xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">
                            <xsl:value-of select="normalize-space($codeGenre)"/>
                        </xsl:attribute>
                        <xsl:attribute name="displayLabel">
                            <xsl:value-of select="normalize-space($codeGenre1)"/>
                        </xsl:attribute>
                    </genre>
                </xsl:when>
                <!-- si non présence d'article-type dans la notice d'origine -->
                <xsl:otherwise>
                    <genre xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">research article</xsl:attribute>
                        <xsl:attribute name="displayLabel">research article</xsl:attribute>
                    </genre>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="//article-categories/subj-group/subject[string-length() &gt; 0]">
                    <xsl:for-each select="//article-categories/subj-group">
                        <xsl:choose>
                            <xsl:when test="@subj-group-type='type-of-article'"/>
                            <xsl:when test="@subj-group-type='heading'"/>
                            <!--  ********************************** classification niveau série ******************************* -->
                            <xsl:otherwise>
                                <subject xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:if test="@subj-group-type[string-length() &gt; 0]">
                                        <genre xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="@subj-group-type"/>
                                        </genre>
                                    </xsl:if>
                                    <xsl:for-each select="subject">
                                        <xsl:choose>
                                            <xsl:when test="@content-type='region'">
                                                <geographic xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="."/>
                                                </geographic>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <topic xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:if test="@code">
                                                        <xsl:attribute name="authority">JournalSubjectCodes</xsl:attribute>
                                                        <xsl:attribute name="authorityURI">
                                                            <xsl:value-of select="@code"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </topic>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </subject>  
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="//article-categories/subj-group[@subj-group-type='type-of-article']">
                    <subject xmlns="http://www.loc.gov/mods/v3">
                        <genre xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of select="normalize-space(//article-categories/subj-group[@subj-group-type='type-of-article'])"/>
                            <xsl:if test="//article-categories/series-title[string-length() &gt; 0]">
                                <xsl:text> . </xsl:text>
                                <xsl:value-of select="normalize-space(//article-categories/series-title)"/>
                            </xsl:if> 
                        </genre>
                    </subject>
                </xsl:when>
            </xsl:choose>
            
            <!-- ******************* Origin Info ******************************-->
            <originInfo xmlns="http://www.loc.gov/mods/v3">
                <xsl:if test="//publisher-name">
                    <publisher xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="normalize-space(//publisher-name)"/>
                    </publisher>
                </xsl:if>
                <xsl:if test="//journal-meta/publisher/publisher-loc[string-length() &gt; 0]">
                    <place xmlns="http://www.loc.gov/mods/v3">
                        <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                            <xsl:attribute name="type">text</xsl:attribute>
                            <xsl:value-of select="normalize-space(//journal-meta/publisher/publisher-loc)"/> 
                        </placeTerm>
                    </place>
                </xsl:if>
                <!-- date -->
                <xsl:choose>
                    <xsl:when test="//pub-date[@pub-type='ppub']/year != 'na'">
                        <dateIssued xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:value-of select="normalize-space(//pub-date[@pub-type='ppub']/year)"/>
                            <xsl:if test="//pub-date[@pub-type='ppub']/month">
                                <xsl:variable name="month">
                                    <xsl:value-of select="normalize-space(//pub-date[@pub-type='ppub']/month)"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$month='January'"><xsl:text>-01</xsl:text></xsl:when>
                                    <xsl:when test="$month='February'"><xsl:text>-02</xsl:text></xsl:when>
                                    <xsl:when test="$month='March'"><xsl:text>-03</xsl:text></xsl:when>
                                    <xsl:when test="$month='April'"><xsl:text>-04</xsl:text></xsl:when>
                                    <xsl:when test="$month='May'"><xsl:text>-05</xsl:text></xsl:when>
                                    <xsl:when test="$month='June'"><xsl:text>-06</xsl:text></xsl:when>
                                    <xsl:when test="$month='July'"><xsl:text>-07</xsl:text></xsl:when>
                                    <xsl:when test="$month='August'"><xsl:text>-08</xsl:text></xsl:when>
                                    <xsl:when test="$month='September'"><xsl:text>-09</xsl:text></xsl:when>
                                    <xsl:when test="$month='October'"><xsl:text>-10</xsl:text></xsl:when>
                                    <xsl:when test="$month='November'"><xsl:text>-11</xsl:text></xsl:when>
                                    <xsl:when test="$month='December'"><xsl:text>-12</xsl:text></xsl:when>
                                    <xsl:when test="$month='Jan'"><xsl:text>-01</xsl:text></xsl:when>
                                    <xsl:when test="$month='Feb'"><xsl:text>-02</xsl:text></xsl:when>
                                    <xsl:when test="$month='Mar'"><xsl:text>-03</xsl:text></xsl:when>
                                    <xsl:when test="$month='Apr'"><xsl:text>-04</xsl:text></xsl:when>
                                    <xsl:when test="$month='May'"><xsl:text>-05</xsl:text></xsl:when>
                                    <xsl:when test="$month='Jun'"><xsl:text>-06</xsl:text></xsl:when>
                                    <xsl:when test="$month='Jul'"><xsl:text>-07</xsl:text></xsl:when>
                                    <xsl:when test="$month='Aug'"><xsl:text>-08</xsl:text></xsl:when>
                                    <xsl:when test="$month='Sept'"><xsl:text>-09</xsl:text></xsl:when>
                                    <xsl:when test="$month='Oct'"><xsl:text>-10</xsl:text></xsl:when>
                                    <xsl:when test="$month='Nov'"><xsl:text>-11</xsl:text></xsl:when>
                                    <xsl:when test="$month='Dec'"><xsl:text>-12</xsl:text></xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="normalize-space(format-number($month,'00'))"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when
                                    test="//pub-date[@pub-type='ppub']/day[string-length()&gt; 0]">
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="normalize-space(format-number(//pub-date[@pub-type='ppub']/day,'00'))"/>
                                </xsl:when>
                            </xsl:choose>
                        </dateIssued>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="//pub-date[@pub-type='epub']/year | //pub-date[@pub-type='epub-original']/year != 'na'">
                                <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2202/1145-6396.1174'">1999</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2478/v10227-011-0015-6'">2012</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1515/DMDI.2009.24.2-4.229'">2011</xsl:when>
                                        <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(//pub-date[@pub-type='epub']/year| //pub-date[@pub-type='epub-original']/year)"/>
                                    <xsl:if test="//pub-date[@pub-type='epub']/month | //pub-date[@pub-type='epub-original']/month">
                                        <xsl:variable name="month">
                                            <xsl:value-of select="normalize-space(//pub-date[@pub-type='epub']/month| //pub-date[@pub-type='epub-original']/month)"/>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$month='January'"><xsl:text>-01</xsl:text></xsl:when>
                                            <xsl:when test="$month='February'"><xsl:text>-02</xsl:text></xsl:when>
                                            <xsl:when test="$month='March'"><xsl:text>-03</xsl:text></xsl:when>
                                            <xsl:when test="$month='April'"><xsl:text>-04</xsl:text></xsl:when>
                                            <xsl:when test="$month='May'"><xsl:text>-05</xsl:text></xsl:when>
                                            <xsl:when test="$month='June'"><xsl:text>-06</xsl:text></xsl:when>
                                            <xsl:when test="$month='July'"><xsl:text>-07</xsl:text></xsl:when>
                                            <xsl:when test="$month='August'"><xsl:text>-08</xsl:text></xsl:when>
                                            <xsl:when test="$month='September'"><xsl:text>-09</xsl:text></xsl:when>
                                            <xsl:when test="$month='October'"><xsl:text>-10</xsl:text></xsl:when>
                                            <xsl:when test="$month='November'"><xsl:text>-11</xsl:text></xsl:when>
                                            <xsl:when test="$month='December'"><xsl:text>-12</xsl:text></xsl:when>
                                            <xsl:when test="$month='1'"><xsl:text>-01</xsl:text></xsl:when>
                                            <xsl:when test="$month='2'"><xsl:text>-02</xsl:text></xsl:when>
                                            <xsl:when test="$month='3'"><xsl:text>-03</xsl:text></xsl:when>
                                            <xsl:when test="$month='4'"><xsl:text>-04</xsl:text></xsl:when>
                                            <xsl:when test="$month='5'"><xsl:text>-05</xsl:text></xsl:when>
                                            <xsl:when test="$month='6'"><xsl:text>-06</xsl:text></xsl:when>
                                            <xsl:when test="$month='7'"><xsl:text>-07</xsl:text></xsl:when>
                                            <xsl:when test="$month='8'"><xsl:text>-08</xsl:text></xsl:when>
                                            <xsl:when test="$month='9'"><xsl:text>-09</xsl:text></xsl:when>
                                            
                                            <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="normalize-space(format-number($month,'00'))"/></xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when
                                            test="//pub-date[@pub-type='epub']/day[string-length()&gt; 0]">
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="normalize-space(format-number(//pub-date[@pub-type='epub']/day,'00'))"/>
                                        </xsl:when>
                                        <xsl:when
                                            test="//pub-date[@pub-type='epub-original']/day[string-length()&gt; 0]">
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="normalize-space(format-number(//pub-date[@pub-type='epub-original']/day,'00'))"/>
                                        </xsl:when>
                                    </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </dateIssued>
                            </xsl:when>
                            <xsl:otherwise>
                                <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2202/1145-6396.1174'">1999</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2478/v10227-011-0015-6'">2012</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1515/DMDI.2009.24.2-4.229'">2011</xsl:when>
                                        <xsl:when test="//pub-date/year[string-length()&gt; 0]">
                                                <xsl:value-of select="normalize-space(//pub-date/year)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="normalize-space(//copyright-year)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </dateIssued>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="//pub-date[@pub-type='epub']/year != 'na'">
                    <dateCreated xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2202/1145-6396.1174'">1999</xsl:when>
                            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2478/v10227-011-0015-6'">2012</xsl:when>
                            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1515/DMDI.2009.24.2-4.229'">2011</xsl:when>
                            <xsl:otherwise>
                        <xsl:value-of select="normalize-space(//pub-date[@pub-type='epub']/year)"/>
                        <xsl:if test="//pub-date[@pub-type='epub']/month">
                            <xsl:variable name="month">
                                <xsl:value-of select="normalize-space(//pub-date[@pub-type='epub']/month)"/>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="$month='January'"><xsl:text>-01</xsl:text></xsl:when>
                                <xsl:when test="$month='February'"><xsl:text>-02</xsl:text></xsl:when>
                                <xsl:when test="$month='March'"><xsl:text>-03</xsl:text></xsl:when>
                                <xsl:when test="$month='April'"><xsl:text>-04</xsl:text></xsl:when>
                                <xsl:when test="$month='May'"><xsl:text>-05</xsl:text></xsl:when>
                                <xsl:when test="$month='June'"><xsl:text>-06</xsl:text></xsl:when>
                                <xsl:when test="$month='July'"><xsl:text>-07</xsl:text></xsl:when>
                                <xsl:when test="$month='August'"><xsl:text>-08</xsl:text></xsl:when>
                                <xsl:when test="$month='September'"><xsl:text>-09</xsl:text></xsl:when>
                                <xsl:when test="$month='October'"><xsl:text>-10</xsl:text></xsl:when>
                                <xsl:when test="$month='November'"><xsl:text>-11</xsl:text></xsl:when>
                                <xsl:when test="$month='December'"><xsl:text>-12</xsl:text></xsl:when>
                                <xsl:when test="$month='Jan'"><xsl:text>-01</xsl:text></xsl:when>
                                <xsl:when test="$month='Feb'"><xsl:text>-02</xsl:text></xsl:when>
                                <xsl:when test="$month='Mar'"><xsl:text>-03</xsl:text></xsl:when>
                                <xsl:when test="$month='Apr'"><xsl:text>-04</xsl:text></xsl:when>
                                <xsl:when test="$month='May'"><xsl:text>-05</xsl:text></xsl:when>
                                <xsl:when test="$month='Jun'"><xsl:text>-06</xsl:text></xsl:when>
                                <xsl:when test="$month='Jul'"><xsl:text>-07</xsl:text></xsl:when>
                                <xsl:when test="$month='Aug'"><xsl:text>-08</xsl:text></xsl:when>
                                <xsl:when test="$month='Sept'"><xsl:text>-09</xsl:text></xsl:when>
                                <xsl:when test="$month='Oct'"><xsl:text>-10</xsl:text></xsl:when>
                                <xsl:when test="$month='Nov'"><xsl:text>-11</xsl:text></xsl:when>
                                <xsl:when test="$month='Dec'"><xsl:text>-12</xsl:text></xsl:when>
                                <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="normalize-space(format-number($month,'00'))"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="//pub-date[@pub-type='epub']/day[string-length()&gt; 0]">
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="normalize-space(format-number(//pub-date[@pub-type='epub']/day,'00'))"/>
                            </xsl:when>
                        </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </dateCreated>
                </xsl:if>
                <!-- ******************* Date Copyright ******************************-->
                    <copyrightDate xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2202/1145-6396.1174'">1999</xsl:when>
                            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2478/v10227-011-0015-6'">2012</xsl:when>
                            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1515/DMDI.2009.24.2-4.229'">2011</xsl:when>
                            <xsl:when test="//pub-date/year[string-length()&gt; 0]">
                                    <xsl:value-of select="normalize-space(//pub-date/year)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="normalize-space(//copyright-year)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </copyrightDate>
            </originInfo>
             <!-- ******************* Language ******************************-->
            <xsl:choose>
                <xsl:when test="//article/@xml:lang[string-length() &gt; 0]">
                <language xmlns="http://www.loc.gov/mods/v3">
                    <xsl:choose>
                        <!-- Language sur 3 caracteres -->
                        <xsl:when test="//article/@xml:lang[string-length() = 3]">
                            <languageTerm xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">code</xsl:attribute>
                                <xsl:attribute name="authority">iso639-2b</xsl:attribute>
                                <xsl:value-of select="normalize-space(translate(//article/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                            </languageTerm>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- Language sur 2 caracteres -->
                            <languageTerm xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">code</xsl:attribute>
                            <xsl:attribute name="authority">iso639-2b</xsl:attribute>
                            <xsl:variable name="codeLang1">
                                <xsl:value-of select="//article/@xml:lang"/>
                            </xsl:variable>
                            <xsl:variable name="codeLang">
                              <xsl:choose>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0039-3'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0038-4'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0031-3'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0041-9'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0040-x'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0037-5'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0042-8'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0030-4'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0026-0'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0029-x'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0028-y'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0034-0'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0025'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0031'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0050'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0035'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0034'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0041'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0026'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0042'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0049'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0020'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0028'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0036'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0044'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0032'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0037'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0027'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0024'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0022'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0015'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0038'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0016'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0017'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0018'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0033'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0021'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0040'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0045'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0043'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0029'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0023'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0039'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0019'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0027-z'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0047'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0048'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0046'">eng</xsl:when>
                                  <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0030'">eng</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='aa'">aar</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ab'">abk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='af'">afr</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ak'">aka</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sq'">alb</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='am'">amh</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ar'">ara</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='an'">arg</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='hy'">hye</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='hy'">arm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='as'">asm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='av'">ava</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ae'">ave</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ay'">aym</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='az'">aze</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ba'">bak</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bm'">bam</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='eu'">eus</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='eu'">baq</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='be'">bel</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bn'">ben</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bh'">bih</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bi'">bis</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bo'">bod</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bs'">bos</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='br'">bre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bg'">bul</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='my'">bur</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='my'">mya</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ca'">cat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ch'">cha</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ce'">che</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='zh'">chi</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='cu'">chu</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='cv'">chv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kw'">cor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='co'">cos</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='cr'">cre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='cy'">cym</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='cs'">cze</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='da'">dan</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='dv'">div</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='nl'">dut</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='nl'">nld</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='dz'">dzo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='en'">eng</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='eo'">epo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='et'">est</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ee'">ewe</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='fo'">fao</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='fj'">fij</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='fi'">fin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='fr'">fre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='fy'">fry</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ff'">ful</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ka'">kat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='de'">ger</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='gd'">gla</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ga'">gle</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='gl'">glg</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='gv'">glv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='el'">gre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='gn'">grn</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='gu'">guj</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ht'">hat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ha'">hau</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='he'">heb</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='hz'">her</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='hi'">hin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ho'">hmo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='hr'">hrv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='hu'">hun</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ig'">ibo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='is'">isl</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='io'">ido</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ii'">iii</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='iu'">iku</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ie'">ile</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ia'">ina</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='id'">ind</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ik'">ipk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='it'">ita</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='jv'">jav</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ja'">jpn</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kl'">kal</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kn'">kan</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ks'">kas</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kr'">kau</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kk'">kaz</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='km'">khm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ki'">kik</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='rw'">kin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ky'">kir</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kv'">kom</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kg'">kon</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ko'">kor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='kj'">kua</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ku'">kur</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='lo'">lao</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='la'">lat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='lv'">lav</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='li'">lim</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ln'">lin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='lt'">lit</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='lb'">ltz</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='lu'">lub</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='lg'">lug</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mk'">mac</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mk'">mkd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mh'">mah</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ml'">mal</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mi'">mri</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mi'">mao</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mr'">mar</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ms'">may</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ms'">msa</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mg'">mlg</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mt'">mlt</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='mn'">mon</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='na'">nau</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='nv'">nav</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='nr'">nbl</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='nd'">nde</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ng'">ndo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ne'">nep</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='nn'">nno</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='nb'">nob</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='no'">nor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ny'">nya</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='oc'">oci</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='oj'">oji</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='or'">ori</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='om'">orm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='os'">oss</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='pa'">pan</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='fa'">fas</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='fa'">per</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='pi'">pli</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='pl'">pol</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='pt'">por</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ps'">pus</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='qu'">que</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='rm'">roh</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ro'">rum</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='rn'">run</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ru'">rus</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sg'">sag</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sa'">san</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sr'">scc</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='si'">sin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sk'">slo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sk'">slk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sl'">slv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='se'">sme</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sm'">smo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sn'">sna</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sd'">snd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='so'">som</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='st'">sot</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='es'">spa</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sq'">sqi</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sc'">srd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sr'">srp</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ss'">ssw</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='su'">sun</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sw'">swa</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='sv'">swe</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ty'">tah</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ta'">tam</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='tt'">tat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='te'">tel</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='tg'">tgk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='tl'">tgl</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='th'">tha</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='bo'">tib</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ti'">tir</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='to'">ton</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='tn'">tsn</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ts'">tso</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='tk'">tuk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='tr'">tur</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='tw'">twi</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ug'">uig</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='uk'">ukr</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ur'">urd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='uz'">uzb</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ve'">ven</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='vi'">vie</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='vo'">vol</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='cy'">wel</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='wa'">wln</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='wo'">wol</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='xh'">xho</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='yi'">yid</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='yo'">yor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='za'">zha</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='zh'">zho</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='zu'">zul</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AA'">aar</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AB'">abk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AF'">afr</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AK'">aka</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SQ'">alb</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AM'">amh</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AR'">ara</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AN'">arg</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HY'">hye</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HY'">arm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AS'">asm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AV'">ava</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AE'">ave</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AY'">aym</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='AZ'">aze</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BA'">bak</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BM'">bam</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='EU'">eus</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='EU'">baq</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BE'">bel</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BN'">ben</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BH'">bih</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BI'">bis</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BO'">bod</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BS'">bos</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BR'">bre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BG'">bul</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MY'">bur</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MY'">mya</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CA'">cat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CH'">cha</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CE'">che</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ZH'">chi</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CU'">chu</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CV'">chv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KW'">cor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CO'">cos</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CR'">cre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CY'">cym</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CS'">cze</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='DA'">dan</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='DV'">div</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NL'">dut</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NL'">nld</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='DZ'">dzo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='EN'">eng</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='EO'">epo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ET'">est</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='EE'">ewe</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FO'">fao</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FJ'">fij</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FI'">fin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FR'">fre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FY'">fry</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FF'">ful</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KA'">kat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='DE'">ger</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='GD'">gla</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='GA'">gle</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='GL'">glg</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='GV'">glv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='EL'">gre</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='GN'">grn</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='GU'">guj</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HT'">hat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HA'">hau</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HE'">heb</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HZ'">her</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HI'">hin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HO'">hmo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HR'">hrv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='HU'">hun</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IG'">ibo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IS'">isl</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IO'">ido</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='II'">iii</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IU'">iku</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IE'">ile</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IA'">ina</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ID'">ind</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IK'">ipk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='IT'">ita</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='JV'">jav</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='JA'">jpn</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KL'">kal</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KN'">kan</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KS'">kas</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KR'">kau</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KK'">kaz</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KM'">khm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KI'">kik</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='RW'">kin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KY'">kir</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KV'">kom</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KG'">kon</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KO'">kor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KJ'">kua</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='KU'">kur</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LO'">lao</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LA'">lat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LV'">lav</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LI'">lim</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LN'">lin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LT'">lit</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LB'">ltz</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LU'">lub</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='LG'">lug</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MK'">mac</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MK'">mkd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MH'">mah</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ML'">mal</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MI'">mri</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MI'">mao</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MR'">mar</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MS'">may</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MS'">msa</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MG'">mlg</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MT'">mlt</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='MN'">mon</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NA'">nau</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NV'">nav</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NR'">nbl</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ND'">nde</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NG'">ndo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NE'">nep</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NN'">nno</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NB'">nob</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NO'">nor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='NY'">nya</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='OC'">oci</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='OJ'">oji</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='OR'">ori</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='OM'">orm</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='OS'">oss</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='PA'">pan</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FA'">fas</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='FA'">per</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='PI'">pli</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='PL'">pol</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='PT'">por</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='PS'">pus</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='QU'">que</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='RM'">roh</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='RO'">rum</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='RN'">run</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='RU'">rus</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SG'">sag</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SA'">san</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SR'">scc</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SI'">sin</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SK'">slo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SK'">slk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SL'">slv</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SE'">sme</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SM'">smo</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SN'">sna</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SD'">snd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SO'">som</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ST'">sot</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ES'">spa</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SQ'">sqi</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SC'">srd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SR'">srp</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SS'">ssw</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SU'">sun</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SW'">swa</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='SV'">swe</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TY'">tah</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TA'">tam</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TT'">tat</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TE'">tel</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TG'">tgk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TL'">tgl</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TH'">tha</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='BO'">tib</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TI'">tir</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TO'">ton</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TN'">tsn</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TS'">tso</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TK'">tuk</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TR'">tur</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='TW'">twi</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='UG'">uig</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='UK'">ukr</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='UR'">urd</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='UZ'">uzb</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='VE'">ven</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='VI'">vie</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='VO'">vol</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='CY'">wel</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='WA'">wln</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='WO'">wol</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='XH'">xho</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='YI'">yid</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='YO'">yor</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ZA'">zha</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ZH'">zho</xsl:when>
                                  <xsl:when test="normalize-space($codeLang1)='ZU'">zul</xsl:when>
                              </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="normalize-space($codeLang)"/>
                        </languageTerm>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- Language sur 3 caracteres -->
                    <xsl:choose>
                        <xsl:when test="//article/@xml:lang[string-length() = 3]">
                            <languageTerm xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">code</xsl:attribute>
                                <xsl:attribute name="authority">rfc3066</xsl:attribute>
                                <xsl:variable name="codeLang1">
                                    <xsl:value-of select="//article/@xml:lang"/>
                                </xsl:variable>
                                <xsl:variable name="codeLang">
                                    <xsl:choose>
                                        <xsl:when test="normalize-space($codeLang1)='aar'">aa</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='abk'">ab</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='afr'">af</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='aka'">ak</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='alb'">sq</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='amh'">am</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ara'">ar</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='arg'">an</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='hye'">hy</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='arm'">hy</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='asm'">as</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ava'">av</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ave'">ae</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='aym'">ay</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='aze'">az</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bak'">ba</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bam'">bm</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='eus'">eu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='baq'">eu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bel'">be</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ben'">bn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bih'">bh</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bis'">bi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bod'">bo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bos'">bs</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bre'">br</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bul'">bg</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='bur'">my</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mya'">my</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='cat'">ca</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ces'">cs</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='cha'">ch</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='che'">ce</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='chi'">zh</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='chu'">cu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='chv'">cv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='cor'">kw</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='cos'">co</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='cre'">cr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='cym'">cy</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='cze'">cs</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='dan'">da</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='deu'">de</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='div'">dv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='dut'">nl</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nld'">nl</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='dzo'">dz</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='eng'">en</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='epo'">eo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='est'">et</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ewe'">ee</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='fao'">fo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='fij'">fj</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='fin'">fi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='fre'">fr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='fra'">fr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='fry'">fy</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ful'">ff</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='geo'">ka</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kat'">ka</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ger'">de</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='gla'">gd</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='gle'">ga</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='glg'">gl</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='glv'">gv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='gre'">el</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ell'">el</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='grn'">gn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='guj'">gu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='hat'">ht</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='hau'">ha</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='heb'">he</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='her'">hz</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='hin'">hi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='hmo'">ho</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='hrv'">hr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='scr'">hr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='hun'">hu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ibo'">ig</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ice'">is</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='isl'">is</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ido'">io</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='iii'">ii</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='iku'">iu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ile'">ie</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ina'">ia</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ind'">id</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ipk'">ik</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ita'">it</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='jav'">jv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='jpn'">ja</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kal'">kl</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kan'">kn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kas'">ks</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kau'">kr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kaz'">kk</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='khm'">km</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kik'">ki</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kin'">rw</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kir'">ky</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kom'">kv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kon'">kg</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kor'">ko</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kua'">kj</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='kur'">ku</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lao'">lo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lat'">la</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lav'">lv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lim'">li</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lin'">ln</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lit'">lt</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ltz'">lb</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lub'">lu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='lug'">lg</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mac'">mk</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mkd'">mk</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mah'">mh</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mal'">ml</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mri'">mi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mao'">mi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mar'">mr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='may'">ms</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='msa'">ms</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mlg'">mg</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mlt'">mt</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='mon'">mn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nau'">na</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nav'">nv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nbl'">nr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nde'">nd</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ndo'">ng</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nep'">ne</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nno'">nn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nob'">nb</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nor'">no</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='nya'">ny</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='oci'">oc</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='oji'">oj</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ori'">or</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='orm'">om</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='oss'">os</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='pan'">pa</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='fas'">fa</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='per'">fa</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='pli'">pi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='pol'">pl</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='por'">pt</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='pus'">ps</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='que'">qu</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='roh'">rm</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ron'">ro</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='rum'">ro</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='run'">rn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='rus'">ru</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='sag'">sg</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='san'">sa</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='scc'">sr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='sin'">si</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='slo'">sk</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='slk'">sk</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='slv'">sl</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='sme'">se</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='smo'">sm</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='sna'">sn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='snd'">sd</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='som'">so</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='sot'">st</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='spa'">es</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='sqi'">sq</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='srd'">sc</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='srp'">sr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ssw'">ss</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='sun'">su</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='swa'">sw</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='swe'">sv</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tah'">ty</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tam'">ta</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tat'">tt</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tel'">te</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tgk'">tg</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tgl'">tl</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tha'">th</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tib'">bo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tir'">ti</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ton'">to</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tsn'">tn</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tso'">ts</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tuk'">tk</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='tur'">tr</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='twi'">tw</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='uig'">ug</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ukr'">uk</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='urd'">ur</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='uzb'">uz</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='ven'">ve</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='vie'">vi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='vol'">vo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='wel'">cy</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='wln'">wa</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='wol'">wo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='xho'">xh</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='yid'">yi</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='yor'">yo</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='zha'">za</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='zho'">zh</xsl:when>
                                        <xsl:when test="normalize-space($codeLang1)='zul'">zu</xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$codeLang"/>
                            </languageTerm>
                        </xsl:when>
                        <xsl:otherwise>
                            <languageTerm xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">code</xsl:attribute>
                                <xsl:attribute name="authority">rfc3066</xsl:attribute>
                                <xsl:choose>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0039-3'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0038-4'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0031-3'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0041-9'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0040-x'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0037-5'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10167-010-0042-8'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0030-4'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0026-0'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0029-x'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0028-y'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0034-0'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0025'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0031'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0050'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0035'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0034'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0041'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0026'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0042'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0049'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0020'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0028'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0036'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0044'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0032'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0037'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0027'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0024'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0022'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0015'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0038'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0016'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0017'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0018'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0033'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0021'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0040'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0045'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0043'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0029'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0023'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0039'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0019'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/v10111-012-0027-z'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0047'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0048'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0046'">en</xsl:when>
                                <xsl:when test="normalize-space(//article-id[@pub-id-type='doi'])='10.2478/rehab-2013-0030'">en</xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="normalize-space(translate(//article/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                              </xsl:otherwise>
                                </xsl:choose>
                            </languageTerm>
                        </xsl:otherwise>
                    </xsl:choose>
            </language>
                </xsl:when>
                <xsl:otherwise>
                    <!-- ******************* Language / eng par défaut ******************************-->
                    <language xmlns="http://www.loc.gov/mods/v3">
                        <languageTerm xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">code</xsl:attribute>
                            <xsl:attribute name="authority">iso639-2b</xsl:attribute>
                            <xsl:text>eng</xsl:text>
                        </languageTerm>
                        <languageTerm xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">code</xsl:attribute>
                            <xsl:attribute name="authority">rfc3066</xsl:attribute>
                            <xsl:text>en</xsl:text>
                        </languageTerm>
                    </language>
                </xsl:otherwise>
            </xsl:choose>
            <!-- ******************* PhysicalDescription ******************************-->
            <physicalDescription xmlns="http://www.loc.gov/mods/v3">
                <internetMediaType xmlns="http://www.loc.gov/mods/v3">
                    <xsl:text>text/html</xsl:text>
                </internetMediaType>
                <!-- words -->
                <xsl:if test="//article-meta/counts/word-count/@count[string-length() &gt; 0]  !='NA'">
                    <xsl:if test="//article-meta/counts/word-count/@count[string-length() &gt; 0]  !=0">
                        <extent xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="unit">words</xsl:attribute>
                                <xsl:value-of select="normalize-space(//article-meta/counts/word-count/@count)"/>
                        </extent>
                    </xsl:if>
                </xsl:if>
                <!-- figure -->
                <xsl:if test="//article-meta/counts/fig-count/@count[string-length() &gt; 0]  !='NA'">
                    <xsl:if test="//article-meta/counts/fig-count/@count[string-length() &gt; 0]  !=0">
                        <extent xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="unit">figures</xsl:attribute>
                                <xsl:value-of select="normalize-space(//article-meta/counts/fig-count/@count)"/>
                        </extent>
                    </xsl:if>
                </xsl:if>
                <!-- tables -->
                <xsl:if test="//article-meta/counts/table-count/@count[string-length() &gt; 0]  !='NA'">
                    <xsl:if test="//article-meta/counts/table-count/@count[string-length() &gt; 0]  !=0">
                        <extent xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="unit">tables</xsl:attribute>
                                <xsl:value-of select="normalize-space(//article-meta/counts/table-count/@count)"/>
                        </extent>
                    </xsl:if>
                </xsl:if>
                <!-- equations -->
                <xsl:if test="//article-meta/counts/equation-count/@count[string-length() &gt; 0]  !='NA'">
                    <xsl:if test="//article-meta/counts/equation-count/@count[string-length() &gt; 0]  !=0">
                        <extent xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="unit">equations</xsl:attribute>
                                <xsl:value-of select="normalize-space(//article-meta/counts/equation-count/@count)"/>
                        </extent>
                    </xsl:if>
                </xsl:if>
                <!-- references -->
                <xsl:if test="//article-meta/counts/ref-count/@count[string-length() &gt; 0]  !='NA'">
                    <xsl:if test="//article-meta/counts/ref-count/@count[string-length() &gt; 0]  !=0">
                        <extent xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="unit">references</xsl:attribute>
                                <xsl:value-of select="normalize-space(//article-meta/counts/ref-count/@count)"/>
                        </extent>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="contains(//article-meta/article-id[@pub-id-type='publisher-id'],'[')">
                    <note xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">edition</xsl:attribute>
                        <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='publisher-id'])"/>
                    </note>
                </xsl:if>
            </physicalDescription>
            <!-- ******************* Abstract ******************************-->
            <xsl:if test="article/front/article-meta/abstract[string-length() &gt; 0]">
                <xsl:for-each select="article/front/article-meta/abstract">
                    <xsl:choose>
                        <xsl:when test="p and not(p/@xml:lang)">
                            <abstract xmlns="http://www.loc.gov/mods/v3">
                                <xsl:if test="@abstract-type">
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="normalize-space(@abstract-type)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@xml:lang[string-length()&gt; 0]">
                                        <xsl:attribute name="lang">
                                            <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="//article/@xml:lang">
                                            <xsl:attribute name="lang">
                                                <xsl:value-of select="normalize-space(translate(//article/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:variable name="abstract">
                                    <xsl:apply-templates select="."/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(substring-after($abstract,title))"/>
                            </abstract>
                        </xsl:when>
                        <xsl:when test="p/@xml:lang">
                            <xsl:for-each select="p[@xml:lang]">
                            <abstract xmlns="http://www.loc.gov/mods/v3">
                                <xsl:if test="@abstract-type">
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="normalize-space(@abstract-type)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@xml:lang[string-length()&gt; 0]">
                                    <xsl:attribute name="lang">
                                        <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:variable name="abs">
                                    <xsl:apply-templates select="."/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($abs)"/>
                            </abstract>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <abstract xmlns="http://www.loc.gov/mods/v3">
                                <xsl:if test="@abstract-type">
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="normalize-space(@abstract-type)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@xml:lang[string-length()&gt; 0]">
                                    <xsl:attribute name="lang">
                                        <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:variable name="abs">
                                    <xsl:apply-templates select="."/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($abs)"/>
                            </abstract>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:if>
            <!-- ******************* trans-Abstract ******************************-->
            <xsl:if test="//trans-abstract[string-length() &gt; 0]">
                <xsl:for-each select="//trans-abstract">
                    <xsl:choose>
                        <xsl:when test="./p and not(./p/@xml:lang)">
                            <abstract xmlns="http://www.loc.gov/mods/v3">
                                <xsl:if test="@abstract-type">
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="normalize-space(@abstract-type)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@xml:lang[string-length()&gt; 0]">
                                    <xsl:attribute name="lang">
                                        <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:variable name="trans-abstract">
                                    <xsl:apply-templates select="."/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(substring-after($trans-abstract,title))"/>
                            </abstract>
                        </xsl:when>
                        <xsl:when test="./p/@xml:lang">
                            <abstract xmlns="http://www.loc.gov/mods/v3">
                                <xsl:if test="@abstract-type">
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="normalize-space(@abstract-type)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@xml:lang[string-length()&gt; 0]">
                                    <xsl:attribute name="lang">
                                        <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:variable name="trans-abs">
                                    <xsl:apply-templates select="."/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($trans-abs)"/>
                            </abstract>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:if>
            <!-- ******************* note ******************************-->
            <xsl:if test="//article/front/article-meta/permissions[string-length() &gt; 0 ]">
                <xsl:choose>
                    <xsl:when test="//article/front/article-meta/product">
                        <note xmlns="http://www.loc.gov/mods/v3">
                            <xsl:variable name="note">
                                <xsl:value-of select="normalize-space(//article/front/article-meta/product)"/>
                            </xsl:variable>
                            <xsl:value-of select="normalize-space($note)"/>
                        </note>
                    </xsl:when>
                    <xsl:when test="//article/front/article-meta/article-id[@pub-id-type='coden']">
                        <note xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of select="normalize-space(//article/front/article-meta/article-id[@pub-id-type='coden'])"/>
                        </note>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="//article/front/notes[string-length() &gt; 0 ]">
                <note xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="normalize-space(//article/front/notes)"/>
                </note>
            </xsl:if>
            <xsl:if test="//article-meta/author-notes/fn/p[string-length() &gt; 0 ]">
                <note xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">
                        <xsl:text>footnotes</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/author-notes/fn/p)"/>
                </note>
            </xsl:if>
            <xsl:if test="//article-meta/author-notes/corresp[string-length() &gt; 0 ] and not(//article-meta/author-notes/corresp/addr-line/named-content/email) and not(//article-meta/author-notes/corresp/email)">
                <note xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">
                        <xsl:text>author-notes</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/author-notes/corresp)"/>
                </note>
            </xsl:if>
          
           <!-- <xsl:if test="//article-meta/author-notes/fn[string-length() &gt; 0 ]">
                <note xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">
                        <xsl:text>other</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/author-notes/fn)"/>
                </note>
            </xsl:if>-->
            <xsl:if test="//article/front/article-meta/title-group/alt-title[@alt-title-type='foot-running']">
                <note xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="normalize-space(//article/front/article-meta/title-group/alt-title[@alt-title-type='foot-running'])"/>
                </note>
            </xsl:if>
            <xsl:if test="//article/front/article-meta/title-group/article-title/fn">
                <note xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">
                        <xsl:text>foot-notes</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="normalize-space(//article/front/article-meta/title-group/article-title/fn)"/>
                </note>
            </xsl:if>
            <xsl:if test="//article/front/article-meta/title-group/fn-group/fn[@fn-type='other']">
                <note xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="normalize-space(//article/front/article-meta/title-group/fn-group/fn/p)"/>
                </note>
            </xsl:if>
            <xsl:if test="contains(//related-article/@related-article-type,'corrected-article')">
                <xsl:for-each select="//related-article[@related-article-type='corrected-article']">
                    <xsl:choose>
                        <xsl:when test="//related-article[@related-article-type='corrected-article'][string-length() &gt; 0 ]">
                            <note xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">content</xsl:attribute>
                                <xsl:text>Correction: </xsl:text>
                                <xsl:value-of select="normalize-space(.)"/>
                            </note>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="//related-article[@related-article-type='corrected-article']/@vol[string-length() &gt; 0 ] | //related-article[@related-article-type='corrected-article']/@page[string-length() &gt; 0 ]">
                                <note xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">content</xsl:attribute>
                                    <xsl:text>Correction </xsl:text>
                                    <xsl:if test="//related-article[@related-article-type='corrected-article']/@vol[string-length() &gt; 0 ]">
                                        <xsl:text>Volume(</xsl:text>
                                        <xsl:value-of select="//related-article[@related-article-type='corrected-article']/@vol"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                    <xsl:text> </xsl:text>
                                    <xsl:if test="//related-article[@related-article-type='corrected-article']/@page[string-length() &gt; 0 ]">
                                        <xsl:text>Page(</xsl:text>
                                        <xsl:value-of select="//related-article[@related-article-type='corrected-article']/@page"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </note>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:if>
            <!-- *************************************** Mots clés niveau article ******************************-->
                <xsl:choose>
                    <xsl:when test="//kwd-group[string-length() &gt; 0 ]">
                        <xsl:for-each select="//kwd-group">
                            <xsl:choose>
                                <xsl:when test=". and not(./@xml:lang)">
                                    <subject xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:choose>
                                            <xsl:when test="title">
                                                <genre xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:value-of select="normalize-space(translate(title,':',''))"/>
                                                </genre>
                                            </xsl:when>
                                            <xsl:when test="@kwd-group-type and not(@kwd-group-type='author')">
                                                <genre xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:value-of select="normalize-space(@kwd-group-type)"/>
                                                </genre>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <genre xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:text>keywords</xsl:text>
                                                </genre>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:for-each select="kwd">
                                            <topic xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </topic>
                                        </xsl:for-each>
                                    </subject>
                                </xsl:when>
                                <xsl:when test="./@xml:lang">
                                    <subject xmlns="http://www.loc.gov/mods/v3">
                                        <!-- code langue subject hors langue article -->
                                        <xsl:if test="@xml:lang[string-length()&gt; 0]">
                                            <xsl:attribute name="lang">
                                                <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <!-- prendre la valeur contenue dans la balise <Heading> MCA suivant classification spécifique -->
                                        <xsl:choose>
                                            <xsl:when test="title">
                                            <genre xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:value-of select="normalize-space(translate(title,':',''))"/>
                                            </genre>
                                            </xsl:when>
                                            <xsl:when test="@kwd-group-type and not(@kwd-group-type='author')">
                                                <genre xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:value-of select="normalize-space(@kwd-group-type)"/>
                                                </genre>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <genre xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:text>keywords</xsl:text>
                                                </genre>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:for-each select="kwd">
                                            <xsl:if test="./text()">
                                            <topic xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </topic>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </subject>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            <!-- ********************************************* relatedItem (niveau série) ***************************************************-->
            <relatedItem xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">host</xsl:attribute>
                <xsl:if test="//journal-meta[string-length() &gt; 0]">
                    <xsl:choose>
                        <xsl:when test="//journal-meta/journal-title[string-length() &gt; 0]">
                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//journal-meta/journal-title)"/>
                                </title>
                                <xsl:if test="//journal-meta/journal-subtitle[string-length() &gt; 0]">
                                    <subTitle xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(//journal-meta/journal-subtitle)"/>
                                    </subTitle>
                                </xsl:if>
                            </titleInfo>
                        </xsl:when>
                        <xsl:when test="//journal-meta/journal-title-group/journal-title[string-length() &gt; 0]">
                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//journal-meta/journal-title-group/journal-title)"/>
                                </title>
                                <xsl:if test="//journal-meta/journal-subtitle[string-length() &gt; 0]">
                                    <subTitle xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(//journal-meta/journal-subtitle)"/>
                                    </subTitle>
                                </xsl:if>
                            </titleInfo>
                        </xsl:when>
                        <xsl:otherwise>
                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                <xsl:choose>
                                    <xsl:when test="//journal-meta/abbrev-journal-title[@abbrev-type='full'][string-length() &gt; 0]">
                                        <title xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//journal-meta/abbrev-journal-title[@abbrev-type='full'])"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:when test="//journal-meta/journal-title-group/abbrev-journal-title[@abbrev-type='full'][string-length() &gt; 0] and not(//journal-title-group/journal-title)">
                                        <title xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//journal-meta/journal-title-group/abbrev-journal-title[@abbrev-type='full'])"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="//journal-id[@journal-id-type='publisher'][string-length() &gt; 0]">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(//journal-id[@journal-id-type='publisher'])"/>
                                            </title>
                                        </xsl:if> 
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="//journal-meta/journal-title-group/journal-subtitle[string-length() &gt; 0]">
                                    <subTitle xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(//journal-meta/journal-title-group/journal-subtitle)"/>
                                    </subTitle>
                                </xsl:if>
                            </titleInfo>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="//article/front/journal-meta/abbrev-journal-title[string-length() &gt; 0]">
                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type"><xsl:text>abbreviated</xsl:text></xsl:attribute>
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="normalize-space(//article/front/journal-meta/abbrev-journal-title)"/>
                            </title>
                        </titleInfo>
                    </xsl:when>
                    <xsl:when test="//journal-id[@journal-id-type='nlm-ta'][string-length() &gt; 0]">
                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type"><xsl:text>abbreviated</xsl:text></xsl:attribute>
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="normalize-space(//journal-id[@journal-id-type='nlm-ta'])"/>
                            </title>
                            <xsl:if test="//journal-id[@journal-id-type='pmc'][string-length() &gt; 0]">
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//journal-id[@journal-id-type='pmc'])"/>
                                </title>
                            </xsl:if>
                        </titleInfo>
                    </xsl:when>
                    <xsl:when test="//journal-meta/abbrev-journal-title[@abbrev-type='pubmed'][string-length() &gt; 0]">
                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type"><xsl:text>abbreviated</xsl:text></xsl:attribute>
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="normalize-space(//journal-meta/abbrev-journal-title[@abbrev-type='pubmed'])"/>
                            </title>
                            <xsl:if test="//journal-meta/abbrev-journal-title[@abbrev-type='publisher'][string-length() &gt; 0]">
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//journal-meta/abbrev-journal-title[@abbrev-type='publisher'])"/>
                                </title>
                            </xsl:if>
                        </titleInfo>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="//journal-meta/abbrev-journal-title[@abbrev-type='publisher'][string-length() &gt; 0]">
                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type"><xsl:text>abbreviated</xsl:text></xsl:attribute>
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//journal-meta/abbrev-journal-title[@abbrev-type='publisher'])"/>
                                </title>
                            </titleInfo>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- genre de publication -->
                <xsl:choose>
                    <xsl:when test="//issn[@pub-type='isbn'][string-length() &gt; 0] and //journal-meta/issn[@pub-type='ppub']">
                        <genre xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">book_series</xsl:attribute>
                            <xsl:text>book_series</xsl:text>
                        </genre>
                    </xsl:when>
                    <xsl:when test="//issn[@pub-type='isbn'][string-length() &gt; 0] and not(//journal-meta/issn[@pub-type='ppub'])">
                        <genre xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">book</xsl:attribute>
                            <xsl:text>book</xsl:text>
                        </genre>
                    </xsl:when>
                    <xsl:otherwise>
                        <genre xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">journal</xsl:attribute>
                            <xsl:text>journal</xsl:text>
                        </genre>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="//article/front/article-meta/product/publisher-name [string-length() &gt; 0]">
                    <originInfo xmlns="http://www.loc.gov/mods/v3">
                            <publisher xmlns="http://www.loc.gov/mods/v3">
                                <xsl:for-each select="//article/front/article-meta/product/publisher-name">
                                    <xsl:value-of select="normalize-space(.)"/>
                                    <xsl:text>. </xsl:text>
                                </xsl:for-each>
                            </publisher>
                        <xsl:if test="//article/front/article-meta/product/publisher-loc[string-length() &gt; 0]">
                            <place xmlns="http://www.loc.gov/mods/v3">
                                <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:attribute name="type">text</xsl:attribute>
                                    <xsl:value-of select="normalize-space(//article/front/article-meta/product/publisher-loc)"/> 
                                </placeTerm>
                            </place>
                        </xsl:if>
                    </originInfo>
                </xsl:if>
                <!-- ********************************** Identifier *******************************-->
                <xsl:if test="//issn[@pub-type='ppub'][string-length() &gt; 0]">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">ISSN</xsl:attribute>
                        <xsl:value-of select="normalize-space(//issn[@pub-type='ppub'])"/>
                    </identifier>
                </xsl:if>
                <xsl:if test="//issn[@pub-type='epub'][string-length() &gt; 0]">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">eISSN</xsl:attribute>
                        <xsl:value-of select="normalize-space(//issn[@pub-type='epub'])"/>
                    </identifier>
                </xsl:if>
                <xsl:if test="//issn[@pub-type='isbn'][string-length() &gt; 0]">
                    <xsl:for-each select="//issn[@pub-type='isbn']">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">ISBN</xsl:attribute>
                            <xsl:value-of select="normalize-space(.)"/>
                        </identifier>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="//journal-id[@journal-id-type='publisher-id'][string-length() &gt; 0]">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">PublisherID</xsl:attribute>
                        <xsl:value-of select="normalize-space(//journal-id[@journal-id-type='publisher-id'])"/>
                    </identifier>
                </xsl:if>
                <xsl:if test="//journal-id[@journal-id-type='hwp'][string-length() &gt; 0]">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">PublisherID-hwp</xsl:attribute>
                        <xsl:value-of select="normalize-space(//journal-id[@journal-id-type='hwp'])"/>
                    </identifier>
                </xsl:if>
                <xsl:if test="//journal-id[@journal-id-type='nlm-ta'][string-length() &gt; 0]">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">PublisherID-nlm-ta</xsl:attribute>
                        <xsl:value-of select="normalize-space(//journal-id[@journal-id-type='nlm-ta'])"/>
                    </identifier>
                </xsl:if>
                <!-- ********************************** Part *******************************-->
                <xsl:if
                    test="//volume[string-length() &gt; 0] | //issue[string-length() &gt; 0]">
                    <part xmlns="http://www.loc.gov/mods/v3">
                        <xsl:choose>
                            <xsl:when test="//pub-date[@pub-type='ppub']/year">
                                <date xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//pub-date[@pub-type='ppub']/year)"/>
                                </date>
                            </xsl:when>
                            <xsl:when test="//pub-date[@pub-type='epub']/year">
                                <date xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:choose>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2202/1145-6396.1174'">1999</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2478/v10227-011-0015-6'">2012</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1515/DMDI.2009.24.2-4.229'">2011</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="normalize-space(//pub-date[@pub-type='epub']/year)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </date>
                            </xsl:when>
                            <xsl:when test="//pub-date/year[string-length() &gt; 0]">
                                <date xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//pub-date/year)"/>
                                </date>
                            </xsl:when>
                            <xsl:otherwise>
                                <date xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:choose>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2202/1145-6396.1174'">1999</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.2478/v10227-011-0015-6'">2012</xsl:when>
                                        <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1515/DMDI.2009.24.2-4.229'">2011</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="normalize-space(//copyright-year)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </date>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="normalize-space(//article-meta/issue-title)">
                            <detail xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">title</xsl:attribute>
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//article-meta/issue-title)"/>
                                </title>
                            </detail>
                        </xsl:if>
                        <xsl:if test="//volume[string-length() &gt; 0]">
                            <detail xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">volume</xsl:attribute>
                                <caption xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>vol.</xsl:text>
                                </caption>
                                <number xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//volume)"/>
                                </number>
                            </detail>
                        </xsl:if>
                        <xsl:if test="//article/front/article-meta/issue[string-length() &gt; 0]">
                            <xsl:for-each select="//article/front/article-meta/issue">
                                <detail xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:choose>
                                        <xsl:when test="contains(.,'supp')">
                                            <xsl:attribute name="type">supplement</xsl:attribute>
                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </number>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="type">issue</xsl:attribute>
                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:text>no.</xsl:text>
                                            </caption>
                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </number>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </detail>
                            </xsl:for-each>
                        </xsl:if>
                        <!-- ******************* pagination ******************************-->
                        <xsl:if test="//article-meta/fpage [string-length() &gt; 0]| //article-meta/lpage[string-length() &gt; 0] | //article-meta/counts/page-count/@count[string-length() &gt; 0]">
                                <extent xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="unit">pages</xsl:attribute>
                                    <xsl:if test="//article-meta/fpage[string-length() &gt; 0]">
                                        <start xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//article-meta/fpage)"/>
                                        </start>
                                    </xsl:if>
                                    <xsl:if test="//article-meta/lpage[string-length() &gt; 0]">
                                        <end xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//article-meta/lpage)"/>
                                        </end>
                                    </xsl:if>
                                    <xsl:if test="//article-meta/counts/page-count/@count[string-length() &gt; 0]">
                                        <total xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//article-meta/counts/page-count/@count)"/>
                                        </total>
                                    </xsl:if>
                                    <xsl:if test="//article-meta/page-range[string-length() &gt; 0]">
                                        <list xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//article-meta/page-range)"/>
                                        </list>
                                    </xsl:if>
                                </extent>
                        </xsl:if>
                    </part>
                </xsl:if>
            </relatedItem>
            <!-- article-reference -->
            <xsl:if test="//article/front/article-meta/related-article and not(//article/front/article-meta/related-article/@related-article-type='pdf')">
                <xsl:for-each select="//article/front/article-meta/related-article">
                    <relatedItem xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">reviewOf</xsl:attribute>
                        <xsl:if test="@xlink:href[string-length() &gt; 0] and @ext-link-type[string-length() &gt; 0]  or not(@related-article-type='pdf')">
                            <identifier xmlns="http://www.loc.gov/mods/v3">
                                <xsl:choose>
                                    <xsl:when test="@ext-link-type[string-length() &gt; 0]">
                                        <xsl:attribute name="type">
                                            <xsl:value-of select="@ext-link-type"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="@related-article-type[string-length() &gt; 0]">
                                        <xsl:attribute name="type">
                                            <xsl:value-of select="@related-article-type"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:value-of select="normalize-space(@xlink:href)"/>
                            </identifier>
                        </xsl:if>
                        <xsl:if test="@vol[string-length() &gt; 0]">
                            <part xmlns="http://www.loc.gov/mods/v3">
                                <detail xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">volume</xsl:attribute>
                                    <caption xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:text>vol.</xsl:text>
                                    </caption>
                                    <number xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(@vol)"/>
                                    </number>
                                </detail>
                                <xsl:if test="@page[string-length() &gt; 0]">
                                    <extent xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="unit">pages</xsl:attribute>
                                        <start xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(@page)"/>
                                        </start>
                                    </extent>
                                </xsl:if>
                            </part>
                        </xsl:if>
                    </relatedItem>
                </xsl:for-each>
            </xsl:if>
            <!-- article en relation avec le book review -->
            <xsl:variable name="cptSource"><xsl:value-of select="normalize-space(count(//article/front/article-meta/product/source))"/></xsl:variable>
            <xsl:choose>
                <xsl:when test="//article/front/article-meta/product/person-group and //article/front/article-meta/product/source">
                    <relatedItem xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">reviewOf</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="//article/front/article-meta/product/person-group and //article/front/article-meta/product/source">
                                <xsl:choose>
                                    <xsl:when test="//article/front/article-meta/product/source">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(//article/front/article-meta/product/source)"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:for-each select="//article/front/article-meta/product/person-group/name | //article/front/article-meta/product/person-group/string-name | //article/front/article-meta/product/name">
                            <name xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">personal</xsl:attribute>
                                    <xsl:if test="prefix">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                            <xsl:value-of select="normalize-space(prefix)"/>
                                        </namePart>  
                                    </xsl:if>
                                    <xsl:if test="given-names[string-length() &gt; 0]">
                                        <xsl:for-each select="given-names">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">given</xsl:attribute>
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </namePart>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">family</xsl:attribute>
                                        <xsl:value-of select="normalize-space(surname)"/>
                                    </namePart>
                                    <xsl:if test="suffix[string-length() &gt; 0]">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                            <xsl:value-of select="normalize-space(suffix)" />
                                        </namePart>
                                    </xsl:if>
                            </name>
                            </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$cptSource =1">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(//article/front/article-meta/product/source)"/>
                                                </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="$cptSource &gt;1">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(//article/front/article-meta/product)"/>
                                                </title>
                                        </titleInfo>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="$cptSource =1 and //article/front/article-meta/product/name">
                                    <xsl:for-each select="//article/front/article-meta/product/name">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">personal</xsl:attribute>
                                            
                                            <xsl:if test="prefix">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                    <xsl:value-of select="normalize-space(prefix)"/>
                                                </namePart>  
                                            </xsl:if>
                                            <xsl:if test="given-names[string-length() &gt; 0]">
                                                <xsl:for-each select="given-names">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">given</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </namePart>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">family</xsl:attribute>
                                                <xsl:value-of select="normalize-space(surname)"/>
                                            </namePart>
                                            <xsl:if test="suffix[string-length() &gt; 0]">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                    <xsl:value-of select="normalize-space(suffix)" />
                                                </namePart>
                                            </xsl:if>
                                        </name>
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="$cptSource =1 and //article/front/article-meta/product/publisher-name | //article/front/article-meta/product/publisher-loc">
                        <originInfo xmlns="http://www.loc.gov/mods/v3">
                            <xsl:if test="//article/front/article-meta/product/publisher-name[string-length() &gt; 0]">
                            <publisher xmlns="http://www.loc.gov/mods/v3">
                                <xsl:for-each select="//article/front/article-meta/product/publisher-name">
                                <xsl:value-of select="normalize-space(.)"/>
                                    <xsl:text>. </xsl:text>
                                </xsl:for-each>
                            </publisher>
                            </xsl:if>
                            <xsl:if test="//article/front/article-meta/product/publisher-loc[string-length() &gt; 0]">
                                <place xmlns="http://www.loc.gov/mods/v3">
                                    <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                        <xsl:attribute name="type">text</xsl:attribute>
                                        <xsl:value-of select="normalize-space(//article/front/article-meta/product/publisher-loc)"/> 
                                    </placeTerm>
                                </place>
                            </xsl:if>
                        </originInfo>
                        </xsl:if>
                        <xsl:if test="$cptSource=1 and //article/front/article-meta/product/isbn[string-length() &gt; 0]">
                            <identifier xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">ISBN</xsl:attribute>
                                <xsl:value-of select="normalize-space(//article/front/article-meta/product/isbn)"/>
                            </identifier>
                        </xsl:if>
                        <xsl:if test="$cptSource=1 and //article/front/article-meta/product/fpage [string-length() &gt; 0]| //lpage[string-length() &gt; 0] | //counts/page-count/@count[string-length() &gt; 0]">
                            <part xmlns="http://www.loc.gov/mods/v3">
                                <xsl:if test="//article/front/article-meta/product/year">
                                    <date xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(//article/front/article-meta/product/year)"/>
                                    </date>
                                </xsl:if>
                                <xsl:if test="//article/front/article-meta/product/page-range[string-length() &gt; 0]">
                                    <extent xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="unit">pages</xsl:attribute>
                                        <list xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//article/front/article-meta/product/page-range)"/>
                                        </list>
                                    </extent> 
                                </xsl:if>
                                <xsl:if test="//article/front/article-meta/product/fpage[string-length() &gt; 0] and not(contains(//article/front/article-meta/product/fpage,' '))">
                                <xsl:variable name="cptFpage">
                                    <xsl:value-of select="normalize-space(count(//article/front/article-meta/product/fpage))"/>
                                </xsl:variable>
                                    <xsl:if test="$cptFpage=1">
                                    <extent xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="unit">pages</xsl:attribute>
                                        <total xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(//article/front/article-meta/product/fpage)"/>
                                        </total>
                                    </extent>
                                    </xsl:if>
                                </xsl:if>
                            </part>
                        </xsl:if>
                    </relatedItem>
                </xsl:when>
                <!-- plusieurs réponses dans 1 notice - 1 seul DOI (ex: letter) -->
                <xsl:when test="//article/response| //article/sub-article">
                    <xsl:for-each select="//article/response | //article/sub-article">
                        <relatedItem xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">references</xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="front/article-meta/title-group/article-title[string-length()&gt; 0]">
                                    <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                        <title xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(front/article-meta/title-group/article-title)"/>
                                        </title>
                                    </titleInfo>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:variable name="aff">
                                <xsl:choose>
                                    <xsl:when test="front/article-meta/aff/target/sup">
                                        <xsl:value-of select="substring-after(front/article-meta/aff,front/article-meta/aff/target/sup)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(front/article-meta/aff)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:if test="front/article-meta/contrib-group/contrib/name">
                                <xsl:for-each select="front/article-meta/contrib-group">
                                    <xsl:for-each select="contrib">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">personal</xsl:attribute>
                                            <xsl:choose>
                                                <xsl:when test="name/prefix and not(contains(name/prefix,'collaboration')) ">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                        <xsl:value-of select="normalize-space(name/prefix)"/>
                                                    </namePart>  
                                                </xsl:when>
                                                <xsl:when test="string-name/prefix and not(contains(string-name/prefix,'collaboration'))">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                        <xsl:value-of select="normalize-space(string-name/prefix) "/>
                                                    </namePart>  
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="name/given-names[string-length() &gt; 0]">
                                                <xsl:for-each select="name/given-names">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                            </xsl:if>
                                            <xsl:if test="string-name/given-names[string-length() &gt; 0]">
                                                <xsl:for-each select="string-name/given-names">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">given</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </namePart>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">family</xsl:attribute>
                                                <xsl:value-of select="normalize-space(translate(name/surname,',',''))"/>
                                                <xsl:value-of select="normalize-space(string-name/surname)"/>
                                            </namePart>
                                            <xsl:if test="name/suffix[string-length() &gt; 0]">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                    <xsl:value-of select="normalize-space(name/suffix)" />
                                                </namePart>
                                            </xsl:if> 
                                            <xsl:if test="string-name/suffix[string-length() &gt; 0]">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                    <xsl:value-of select="normalize-space(string-name/suffix)" />
                                                </namePart>
                                            </xsl:if>
                                            <xsl:if test="//front/article-meta/aff and not(//front/article-meta/aff[@id=current()/xref/@rid]) ">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space($aff)"/>
                                                </affiliation>
                                            </xsl:if>
                                            <xsl:if test="//front/article-meta/aff[@id=current()/xref/@rid]">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(substring-after(//front/article-meta/aff[@id=current()/xref/@rid],//front/article-meta/aff[@id=current()/xref/@rid]/sup|//front/article-meta/aff[@id=current()/xref/@rid]/label))"/>
                                                </affiliation>
                                            </xsl:if>
                                            <xsl:if test="aff[string-length() &gt; 0]">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(aff)"/>
                                                </affiliation>
                                            </xsl:if>                            
                                            <xsl:if test="aff[string-length() &gt; 0] | //aff[string-length() &gt; 0] and not(aff/@id | //aff/@id)">
                                                <xsl:choose>
                                                    <xsl:when test="aff and not(aff/sup|aff/label)">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:choose>
                                                                <xsl:when test="aff/institution">
                                                                    <xsl:value-of select="normalize-space(aff/institution)"/>
                                                                    <xsl:if test="aff/addr-line and aff/institution">
                                                                        <xsl:for-each select="aff/addr-line">
                                                                            <xsl:text>, </xsl:text>
                                                                            <xsl:value-of select="normalize-space(.)"/>
                                                                        </xsl:for-each>
                                                                    </xsl:if>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="normalize-space(aff)"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                            
                                                        </affiliation>
                                                    </xsl:when>
                                                    <xsl:when test="aff/sup|aff/label">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(substring-after(aff,aff/sup|aff/label))"/>
                                                        </affiliation>
                                                    </xsl:when>
                                                    <xsl:when test="aff/email">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>
                                                            <xsl:value-of select="normalize-space(substring-before(aff,aff/email))"/>
                                                        </affiliation>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:if>
                                            <xsl:if test="@corresp and front/article-meta/author-notes/corresp ">
                                                <xsl:for-each select="//author-notes/corresp">
                                                    <xsl:choose>
                                                        <xsl:when test="contains(.,', email:')">
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:value-of select="normalize-space(substring-before(.,', email:'))"/>
                                                            </affiliation>
                                                        </xsl:when>
                                                        <xsl:when test="contains(.,';')">
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:value-of select="normalize-space(substring-before(.,';'))"/>
                                                            </affiliation>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                            </affiliation>
                                                            <xsl:if test="email">
                                                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                                    <xsl:text>E-mail: </xsl:text>
                                                                    <xsl:value-of select="normalize-space(email)"/>
                                                                </affiliation>
                                                            </xsl:if>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <!-- EMAIL -->
                                            <xsl:choose>
                                                <xsl:when test="front/article-meta/author-notes/email[string-length() &gt; 0]">
                                                    <xsl:for-each select="//author-notes/email">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </affiliation>
                                                    </xsl:for-each>
                                                </xsl:when>
                                                <xsl:when test="front/article-meta/author-notes/corresp[string-length() &gt; 0] and not(front/article-meta/author-notes/corresp/@id)">
                                                    <xsl:for-each select="//author-notes/corresp">
                                                        <xsl:if test="contains(.,'E-mail:')">
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:value-of select="normalize-space(substring-before(.,'E-mail:'))"/>
                                                            </affiliation>
                                                        </xsl:if>
                                                        <xsl:if test="front/article-meta/author-notes/corresp/email[string-length() &gt; 0]">
                                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:text>E-mail: </xsl:text>
                                                                <xsl:value-of select="normalize-space(front/article-meta/author-notes/corresp/email)"/>
                                                            </affiliation>
                                                        </xsl:if>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="email[string-length() &gt; 0]">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>                                        
                                                    <xsl:value-of select="normalize-space(email)"/>
                                                </affiliation>
                                            </xsl:if> 
                                            <xsl:if test="front/article-meta/author-notes/corresp/addr-line/named-content/email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:value-of select="normalize-space(front/article-meta/author-notes/corresp/addr-line/named-content/email)"/>
                                                </affiliation>
                                            </xsl:if>                            
                                            <xsl:call-template name="role"/>
                                            <xsl:call-template name="bio"/>
                                                <xsl:if test="front/article-meta/author-notes/fn[@fn-type='other']">
                                                    <description xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:value-of select="normalize-space(front/article-meta/author-notes/fn[@fn-type='other']/p)"/>
                                                    </description>
                                                </xsl:if>
                                            <xsl:if test="front/article-meta/notes/fn-group/fn[@id=current()/xref/@rid]">
                                                <description xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:value-of select="normalize-space(front/article-meta/notes/fn-group/fn[@id=current()/xref/@rid])"/>
                                                </description>
                                            </xsl:if>
                                            <xsl:if test="front/article-meta/author-notes/fn[@fn-type='other'] and not(front/article-meta/author-notes/fn[@id=current()/xref/@rid]) and not(role)">
                                                <description xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:value-of select="normalize-space(front/article-meta/author-notes/fn[@fn-type='other'])"/>
                                                </description>
                                            </xsl:if>
                                        </name>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:if>
                            <!-- genre -->
                            <xsl:if test="@article-type[string-length()&gt; 0]">
                                <genre xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(@article-type)"/>
                                </genre>
                            </xsl:if>
                            <xsl:if test="//response/@response-type[string-length()&gt; 0]">
                                <genre xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//response/@response-type)"/>
                                </genre>
                            </xsl:if>
                            <xsl:if test="front/journal-meta">
                                <originInfo xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:if test="front/journal-meta/publisher/publisher-name[string-length() &gt; 0]">
                                        <publisher xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:for-each select="front/journal-meta/publisher/publisher-name">
                                                <xsl:value-of select="normalize-space(.)"/>
                                                <xsl:text>. </xsl:text>
                                            </xsl:for-each>
                                        </publisher>
                                    </xsl:if>
                                    <xsl:if test="front/journal-meta/publisher/publisher-loc[string-length() &gt; 0]">
                                        <place xmlns="http://www.loc.gov/mods/v3">
                                            <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:attribute name="type">text</xsl:attribute>
                                                <xsl:value-of select="normalize-space(front/journal-meta/publisher/publisher-loc)"/> 
                                            </placeTerm>
                                        </place>
                                    </xsl:if>
                                    <!-- date -->
                                    <xsl:choose>
                                        <xsl:when test="front/article-meta/pub-date[@pub-type='ppub']/year != 'na'">
                                            <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                                <xsl:value-of select="normalize-space(//pub-date[@pub-type='ppub']/year)"/>
                                                <xsl:if test="front/article-meta/pub-date[@pub-type='ppub']/month">
                                                    <xsl:variable name="month">
                                                        <xsl:value-of select="normalize-space(front/article-meta/pub-date[@pub-type='ppub']/month)"/>
                                                    </xsl:variable>
                                                    <xsl:choose>
                                                        <xsl:when test="$month='January'"><xsl:text>-01</xsl:text></xsl:when>
                                                        <xsl:when test="$month='February'"><xsl:text>-02</xsl:text></xsl:when>
                                                        <xsl:when test="$month='March'"><xsl:text>-03</xsl:text></xsl:when>
                                                        <xsl:when test="$month='April'"><xsl:text>-04</xsl:text></xsl:when>
                                                        <xsl:when test="$month='May'"><xsl:text>-05</xsl:text></xsl:when>
                                                        <xsl:when test="$month='June'"><xsl:text>-06</xsl:text></xsl:when>
                                                        <xsl:when test="$month='July'"><xsl:text>-07</xsl:text></xsl:when>
                                                        <xsl:when test="$month='August'"><xsl:text>-08</xsl:text></xsl:when>
                                                        <xsl:when test="$month='September'"><xsl:text>-09</xsl:text></xsl:when>
                                                        <xsl:when test="$month='October'"><xsl:text>-10</xsl:text></xsl:when>
                                                        <xsl:when test="$month='November'"><xsl:text>-11</xsl:text></xsl:when>
                                                        <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="normalize-space(format-number($month,'00'))"/></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:if>
                                                <xsl:choose>
                                                    <xsl:when
                                                        test="front/article-meta/pub-date[@pub-type='ppub']/day[string-length()&gt; 0]">
                                                        <xsl:text>-</xsl:text>
                                                        <xsl:value-of select="normalize-space(format-number(front/article-meta/pub-date[@pub-type='ppub']/day,'00'))"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </dateIssued>
                                        </xsl:when>
                                    </xsl:choose>
                                </originInfo>
                                </xsl:if>
                           <!-- <xsl:if test="@xml:lang[string-length()&gt; 0]">
                                <language xmlns="http://www.loc.gov/mods/v3">
                                    <languageTerm xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">code</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="@xml:lang[string-length() = 3]">
                                                <xsl:attribute name="authority">iso639-2b</xsl:attribute>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="authority">rfc3066</xsl:attribute>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:value-of select="normalize-space(translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
                                    </languageTerm>
                                </language>
                            </xsl:if>-->
                            <!-- journal -->
                            <xsl:if test="front/journal-meta/journal-title[string-length()&gt; 0]">
                            <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">host</xsl:attribute>
                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                    <title xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(front/journal-meta/journal-title)"/>
                                    </title>
                                    <xsl:if test="front/journal-meta/journal-subtitle[string-length() &gt; 0]">
                                        <subTitle xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(front/journal-meta/journal-subtitle)"/>
                                        </subTitle>
                                    </xsl:if>
                                </titleInfo>
                                <xsl:choose>
                                    <xsl:when test="front/journal-meta/journal-id[@journal-id-type='nlm-ta'][string-length() &gt; 0]">
                                        <titleInfo>
                                            <xsl:attribute name="type"><xsl:text>abbreviated</xsl:text></xsl:attribute>
                                            <title>
                                                <xsl:value-of select="normalize-space(front/journal-meta/journal-id[@journal-id-type='nlm-ta'])"/>
                                            </title>
                                            <xsl:if test="front/journal-meta/journal-id[@journal-id-type='pmc'][string-length() &gt; 0]">
                                                <title>
                                                    <xsl:value-of select="normalize-space(front/journal-meta/journal-id[@journal-id-type='pmc'])"/>
                                                </title>
                                            </xsl:if>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="front/journal-meta/journal-meta/abbrev-journal-title[@abbrev-type='pubmed'][string-length() &gt; 0]">
                                        <titleInfo>
                                            <xsl:attribute name="type"><xsl:text>abbreviated</xsl:text></xsl:attribute>
                                            <title>
                                                <xsl:value-of select="normalize-space(front/journal-meta/journal-meta/abbrev-journal-title[@abbrev-type='pubmed'])"/>
                                            </title>
                                            <xsl:if test="front/journal-meta/journal-meta/abbrev-journal-title[@abbrev-type='publisher'][string-length() &gt; 0]">
                                                <title>
                                                    <xsl:value-of select="normalize-space(front/journal-meta/abbrev-journal-title[@abbrev-type='publisher'])"/>
                                                </title>
                                            </xsl:if>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="front/journal-meta/abbrev-journal-title[@abbrev-type='publisher'][string-length() &gt; 0]">
                                            <titleInfo>
                                                <xsl:attribute name="type"><xsl:text>abbreviated</xsl:text></xsl:attribute>
                                                <title>
                                                    <xsl:value-of select="normalize-space(front/journal-meta/abbrev-journal-title[@abbrev-type='publisher'])"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!-- ********************************** Genre *******************************-->
                                <xsl:if test="front/article-meta//article-categories/subj-group/subject[string-length() &gt; 0]">
                                    <xsl:for-each select="front/article-meta/article-categories/subj-group">
                                        <xsl:choose>
                                            <xsl:when test="@subj-group-type='type-of-article'"/>
                                            <!--  ********************************** classification niveau série ******************************* -->
                                            <xsl:when test="subject">
                                                <subject xmlns="http://www.loc.gov/mods/v3">
                                                    <genre xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="@subj-group-type"/>
                                                    </genre>
                                                    <xsl:for-each select="subject">
                                                        <topic xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:if test="@code">
                                                                <xsl:attribute name="authority">JournalSubjectCodes</xsl:attribute>
                                                                <xsl:attribute name="authorityURI">
                                                                    <xsl:value-of select="@code"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </topic>
                                                    </xsl:for-each>
                                                </subject>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:if>
                                <!-- ********************************** Identifier *******************************-->
                                <xsl:if test="front/journal-meta/issn[@pub-type='ppub'][string-length() &gt; 0]">
                                    <identifier xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">ISSN</xsl:attribute>
                                        <xsl:value-of select="normalize-space(front/journal-meta/issn[@pub-type='ppub'])"/>
                                    </identifier>
                                </xsl:if>
                                <xsl:if test="front/journal-meta/issn[@pub-type='epub'][string-length() &gt; 0]">
                                    <identifier xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">eISSN</xsl:attribute>
                                        <xsl:value-of select="normalize-space(front/journal-meta/issn[@pub-type='epub'])"/>
                                    </identifier>
                                </xsl:if>
                                <xsl:if test="front/journal-meta/journal-id[@journal-id-type='doi'][string-length() &gt; 0]">
                                    <identifier xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">DOI</xsl:attribute>
                                        <xsl:value-of select="normalize-space(front/journal-meta/journal-id[@journal-id-type='doi'])"/>
                                    </identifier>
                                </xsl:if>
                                <xsl:if test="front/journal-meta/journal-id[@journal-id-type='publisher-id'][string-length() &gt; 0]">
                                    <identifier xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">PublisherID</xsl:attribute>
                                        <xsl:value-of select="normalize-space(front/journal-meta/journal-id[@journal-id-type='publisher-id'])"/>
                                    </identifier>
                                </xsl:if>
                                <xsl:if test="front/journal-meta/journal-id[@journal-id-type='hwp'][string-length() &gt; 0]">
                                    <identifier xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">PublisherID-hwp</xsl:attribute>
                                        <xsl:value-of select="normalize-space(front/journal-meta/journal-id[@journal-id-type='hwp'])"/>
                                    </identifier>
                                </xsl:if>
                                <xsl:if test="front/journal-meta/journal-id[@journal-id-type='nlm-ta'][string-length() &gt; 0]">
                                    <identifier xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">PublisherID-nlm-ta</xsl:attribute>
                                        <xsl:value-of select="normalize-space(front/journal-meta/journal-id[@journal-id-type='nlm-ta'])"/>
                                    </identifier>
                                </xsl:if>
                                <!-- ********************************** Part *******************************-->
                                <xsl:if test="front/article-meta/pub-date[@pub-type='ppub']/year[string-length() &gt; 0]">
                                    <part xmlns="http://www.loc.gov/mods/v3">
                                        <date xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(front/article-meta/pub-date[@pub-type='ppub']/year)"/>
                                        </date>
                                        <xsl:if test="front/article-meta/volume[string-length() &gt; 0]">
                                            <detail xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">volume</xsl:attribute>
                                                <number xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(front/article-meta/volume)"/>
                                                </number>
                                            </detail> 
                                        </xsl:if>
                                        <xsl:if test="front/article-meta/issue[string-length() &gt; 0]">
                                            <detail xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">issue</xsl:attribute>
                                                <number xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(front/article-meta/issue)"/>
                                                </number>
                                            </detail> 
                                        </xsl:if>
                                        <xsl:if test="front/article-meta/fpage[string-length() &gt; 0]">
                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                <start xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(front/article-meta/fpage)"/>
                                                </start>
                                            </extent> 
                                        </xsl:if>
                                        <xsl:if test="front/article-meta/lpage[string-length() &gt; 0]">
                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                <end xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(front/article-meta/lpage)"/>
                                                </end>
                                            </extent> 
                                        </xsl:if>
                                    </part>
                                </xsl:if>
                                <xsl:if test="front/article-meta/permissions/copyright-statement[string-length() &gt; 0]">
                                    <accessCondition xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">use and reproduction</xsl:attribute>
                                        <xsl:attribute name="contentType">copyright</xsl:attribute>
                                        <xsl:value-of select="normalize-space(front/article-meta/permissions/copyright-statement)"/>
                                    </accessCondition>
                                </xsl:if>
                            </relatedItem>
                            </xsl:if>
                            <!-- *****************************************************************
                relatedItem (relie les erratums aux articles))
                *************************************************************************-->
                            <xsl:choose>
                                <xsl:when test="//related-article[@related-article-type='corrected-article'][string-length() &gt; 0 ]">
                                    <xsl:for-each select="//related-article[@related-article-type='corrected-article']">
                                        <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">otherVersion</xsl:attribute>
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(.)"/>  
                                                </title>
                                            </titleInfo>
                                            <genre xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type"><xsl:value-of select="normalize-space(@related-article-type)"/></xsl:attribute>
                                            </genre>
                                            <xsl:if test="@vol[string-length() &gt; 0 ] or @issue[string-length() &gt; 0 ] or @page[string-length() &gt; 0 ]">
                                                <part xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:if test="@vol[string-length() &gt; 0]">
                                                        <detail xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">volume</xsl:attribute>
                                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>vol.</xsl:text>
                                                            </caption>
                                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(@vol)"/>
                                                            </number>
                                                        </detail>
                                                    </xsl:if>
                                                    <xsl:if test="@issue[string-length() &gt; 0]">
                                                        <detail xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">issue</xsl:attribute>
                                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>no.</xsl:text>
                                                            </caption>
                                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(@issue)"/>
                                                            </number>
                                                        </detail>
                                                    </xsl:if>
                                                    <xsl:if test="@page[string-length() &gt; 0]">
                                                        <extent xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="unit">pages</xsl:attribute>
                                                            <start xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(@page)"/>
                                                            </start>
                                                        </extent>
                                                    </xsl:if>
                                                </part>
                                            </xsl:if>
                                            <xsl:if test="@id">
                                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">ArticleID</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(@id)"/> 
                                                </identifier>
                                            </xsl:if>
                                            <xsl:if test="contains(.,'doi:')">
                                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">DOI</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(substring-after(.,'doi:'))"/> 
                                                </identifier>
                                            </xsl:if>
                                            <xsl:if test="@xlink:href and @ext-link-type='uri'">
                                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">URI</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(@xlink:href)"/> 
                                                </identifier>
                                            </xsl:if>
                                            
                                            <xsl:if test="contains(SimplePara/ExternalRef/RefTarget/@Address,'doi')">
                                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">URL</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(SimplePara/ExternalRef/RefTarget/@Address)"/> 
                                                </identifier>
                                            </xsl:if>
                                        </relatedItem>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <!-- references / citations -->
                            <xsl:for-each select="back/ref-list/ref">
                                <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">isReferencedBy</xsl:attribute>
                                    <xsl:if test="@id">
                                        <xsl:attribute name="displayLabel">
                                            <xsl:value-of select="normalize-space(@id)"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="nlm-citation/article-title[string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(nlm-citation/article-title)"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:when>
                                        <xsl:when test="mixed-citation[string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(mixed-citation)"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:when>
                                        <xsl:when test="citation[@citation-type='other'][string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(citation[@citation-type='other'])"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="nlm-citation/source[string-length()&gt; 0]">
                                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                    <title xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/source)"/>
                                                    </title>
                                                </titleInfo>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:if test="nlm-citation/person-group/name | nlm-citation/person-group/collab">
                                        <xsl:for-each select="nlm-citation/person-group">
                                            <xsl:for-each select="name">
                                                <name xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">personal</xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="prefix and not(contains(prefix,'collaboration')) ">
                                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                                <xsl:value-of select="normalize-space(prefix)"/>
                                                            </namePart>  
                                                        </xsl:when>
                                                    </xsl:choose>
                                                    <xsl:if test="given-names[string-length() &gt; 0]">
                                                        <xsl:for-each select="given-names">
                                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="type">given</xsl:attribute>
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                            </namePart>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">family</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(translate(surname,',',''))"/>
                                                        <xsl:if test="suffix[string-length() &gt; 0]">
                                                            <xsl:text> </xsl:text>
                                                            <xsl:value-of select="normalize-space(suffix)" />
                                                        </xsl:if> 
                                                    </namePart>
                                                </name>
                                            </xsl:for-each>
                                            <xsl:if test="collab[string-length() &gt; 0]">
                                            <xsl:for-each select="collab">
                                                <name xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </namePart>
                                                </name>
                                            </xsl:for-each>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="not(nlm-citation/article-title) and nlm-citation/publisher-name[string-length() &gt; 0] | nlm-citation/publisher-loc[string-length() &gt; 0]">
                                        <originInfo xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:if test="nlm-citation/publisher-name[string-length() &gt; 0]">
                                                <publisher xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:for-each select="nlm-citation/publisher-name">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                        <xsl:text>. </xsl:text>
                                                    </xsl:for-each>
                                                </publisher>
                                            </xsl:if>
                                            <xsl:if test="nlm-citation/publisher-loc[string-length() &gt; 0]">
                                                <place xmlns="http://www.loc.gov/mods/v3">
                                                    <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:attribute name="type">text</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(nlm-citation/publisher-loc)"/> 
                                                    </placeTerm>
                                                </place>
                                            </xsl:if>
                                        </originInfo>
                                    </xsl:if>
                                    <!-- genre -->
                                    <xsl:if test="nlm-citation/@citation-type[string-length()&gt; 0]">
                                        <genre xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(nlm-citation/@citation-type)"/>
                                        </genre>
                                    </xsl:if>
                                    <xsl:if test="nlm-citation/article-title[string-length() &gt; 0] and nlm-citation/source[string-length() &gt; 0]">
                                        <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">host</xsl:attribute>
                                            <xsl:choose>
                                                <xsl:when test="nlm-citation/source[string-length() &gt; 0]">
                                                    <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                        <title xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(nlm-citation/source)"/>
                                                        </title>
                                                    </titleInfo>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="nlm-citation/publisher-name[string-length() &gt; 0] | nlm-citation/publisher-loc[string-length() &gt; 0]">
                                                <originInfo xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:if test="nlm-citation/publisher-name[string-length() &gt; 0]">
                                                        <publisher xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:for-each select="nlm-citation/publisher-name">
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                                <xsl:text>. </xsl:text>
                                                            </xsl:for-each>
                                                        </publisher>
                                                    </xsl:if>
                                                    <xsl:if test="nlm-citation/publisher-loc[string-length() &gt; 0]">
                                                        <place xmlns="http://www.loc.gov/mods/v3">
                                                            <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:attribute name="type">text</xsl:attribute>
                                                                <xsl:value-of select="normalize-space(nlm-citation/publisher-loc)"/> 
                                                            </placeTerm>
                                                        </place>
                                                    </xsl:if>
                                                </originInfo>
                                            </xsl:if>
                                            <!-- ********************************** Part *******************************-->
                                            <xsl:if
                                                test="nlm-citation/volume[string-length() &gt; 0] | nlm-citation/issue[string-length() &gt; 0] | nlm-citation/year[string-length() &gt; 0] | nlm-citation/fpage[string-length() &gt; 0]| nlm-citation/lpage[string-length() &gt; 0]">
                                                <part xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:choose>
                                                        <xsl:when test="nlm-citation/year[string-length() &gt; 0]">
                                                            <date xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(nlm-citation/year)"/>
                                                            </date>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                    <xsl:if test="nlm-citation/volume[string-length() &gt; 0]">
                                                        <detail xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">volume</xsl:attribute>
                                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>vol.</xsl:text>
                                                            </caption>
                                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(nlm-citation/volume)"/>
                                                            </number>
                                                        </detail>
                                                    </xsl:if>
                                                    <xsl:if test="nlm-citation/issue[string-length() &gt; 0]">
                                                        <detail xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">issue</xsl:attribute>
                                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>no.</xsl:text>
                                                            </caption>
                                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(nlm-citation/issue)"/>
                                                            </number>
                                                        </detail>
                                                    </xsl:if>
                                                    <xsl:if test="nlm-citation/fpage[string-length() &gt; 0] | nlm-citation/lpage[string-length() &gt; 0]">
                                                        <extent xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="unit">pages</xsl:attribute>
                                                            <xsl:if test="nlm-citation/fpage[string-length() &gt; 0]">
                                                                <start xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:value-of select="normalize-space(nlm-citation/fpage)"/>
                                                                </start>
                                                            </xsl:if>
                                                            <xsl:if test="nlm-citation/lpage[string-length() &gt; 0]">
                                                                <end xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:value-of select="normalize-space(nlm-citation/lpage)"/>
                                                                </end>
                                                            </xsl:if>
                                                        </extent>
                                                    </xsl:if>
                                                </part>
                                            </xsl:if>
                                        </relatedItem>
                                    </xsl:if>
                                    <xsl:if
                                        test="not(nlm-citation/article-title) and nlm-citation/volume[string-length() &gt; 0] | nlm-citation/issue[string-length() &gt; 0] | nlm-citation/year[string-length() &gt; 0] | nlm-citation/fpage[string-length() &gt; 0]| nlm-citation/lpage[string-length() &gt; 0]">
                                        <part xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:choose>
                                                <xsl:when test="nlm-citation/year[string-length() &gt; 0]">
                                                    <date xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/year)"/>
                                                    </date>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="nlm-citation/volume[string-length() &gt; 0]">
                                                <detail xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">volume</xsl:attribute>
                                                    <caption xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:text>vol.</xsl:text>
                                                    </caption>
                                                    <number xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/volume)"/>
                                                    </number>
                                                </detail>
                                            </xsl:if>
                                            <xsl:if test="nlm-citation/issue[string-length() &gt; 0]">
                                                <detail xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">issue</xsl:attribute>
                                                    <caption xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:text>no.</xsl:text>
                                                    </caption>
                                                    <number xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/issue)"/>
                                                    </number>
                                                </detail>
                                            </xsl:if>
                                            <xsl:if test="nlm-citation/fpage[string-length() &gt; 0] | nlm-citation/lpage[string-length() &gt; 0]">
                                                <extent xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="unit">pages</xsl:attribute>
                                                    <xsl:if test="nlm-citation/fpage[string-length() &gt; 0]">
                                                        <start xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(nlm-citation/fpage)"/>
                                                        </start>
                                                    </xsl:if>
                                                    <xsl:if test="nlm-citation/lpage[string-length() &gt; 0]">
                                                        <end xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(nlm-citation/lpage)"/>
                                                        </end>
                                                    </xsl:if>
                                                </extent>
                                            </xsl:if>
                                        </part>
                                    </xsl:if>
                                </relatedItem>
                            </xsl:for-each>
                            <!-- element-citation -->
                            <!-- references / citations -->
                            <xsl:for-each select="back/ref-list/ref">
                                <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">isReferencedBy</xsl:attribute>
                                    <xsl:if test="@id">
                                        <xsl:attribute name="displayLabel">
                                            <xsl:value-of select="normalize-space(@id)"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="element-citation/article-title[string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(element-citation/article-title)"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:when>
                                        <xsl:when test="mixed-citation[string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(mixed-citation)"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:when>
                                        <xsl:when test="citation[@citation-type='other'][string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(citation[@citation-type='other'])"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="element-citation/source[string-length()&gt; 0]">
                                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                    <title xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(element-citation/source)"/>
                                                    </title>
                                                </titleInfo>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:if test="element-citation/person-group/name | element-citation/person-group/collab">
                                        <xsl:for-each select="element-citation/person-group">
                                            <xsl:for-each select="name">
                                                <name xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">personal</xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="prefix and not(contains(prefix,'collaboration')) ">
                                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                                <xsl:value-of select="normalize-space(prefix)"/>
                                                            </namePart>  
                                                        </xsl:when>
                                                    </xsl:choose>
                                                    <xsl:if test="given-names[string-length() &gt; 0]">
                                                        <xsl:for-each select="given-names">
                                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="type">given</xsl:attribute>
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                            </namePart>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">family</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(translate(surname,',',''))"/>
                                                        <xsl:if test="suffix[string-length() &gt; 0]">
                                                            <xsl:text> </xsl:text>
                                                            <xsl:value-of select="normalize-space(suffix)" />
                                                        </xsl:if> 
                                                    </namePart>
                                                </name>
                                            </xsl:for-each>
                                            <xsl:for-each select="collab">
                                                <name xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </namePart>
                                                </name>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="not(element-citation/article-title) and element-citation/publisher-name[string-length() &gt; 0] | element-citation/publisher-loc[string-length() &gt; 0]">
                                        <originInfo xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:if test="element-citation/publisher-name[string-length() &gt; 0]">
                                                <publisher xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:for-each select="element-citation/publisher-name">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                        <xsl:text>. </xsl:text>
                                                    </xsl:for-each>
                                                </publisher>
                                            </xsl:if>
                                            <xsl:if test="element-citation/publisher-loc[string-length() &gt; 0]">
                                                <place xmlns="http://www.loc.gov/mods/v3">
                                                    <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:attribute name="type">text</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(element-citation/publisher-loc)"/> 
                                                    </placeTerm>
                                                </place>
                                            </xsl:if>
                                        </originInfo>
                                    </xsl:if>
                                    <!-- genre -->
                                    <xsl:if test="element-citation/@citation-type[string-length()&gt; 0]">
                                        <genre xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(element-citation/@citation-type)"/>
                                        </genre>
                                    </xsl:if>
                                    <xsl:if test="element-citation/article-title[string-length() &gt; 0] and element-citation/source[string-length() &gt; 0]">
                                        <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">host</xsl:attribute>
                                            <xsl:choose>
                                                <xsl:when test="element-citation/source[string-length() &gt; 0]">
                                                    <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                        <title xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(element-citation/source)"/>
                                                        </title>
                                                    </titleInfo>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="element-citation/publisher-name[string-length() &gt; 0] | element-citation/publisher-loc[string-length() &gt; 0]">
                                                <originInfo xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:if test="element-citation/publisher-name[string-length() &gt; 0]">
                                                        <publisher xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:for-each select="element-citation/publisher-name">
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                                <xsl:text>. </xsl:text>
                                                            </xsl:for-each>
                                                        </publisher>
                                                    </xsl:if>
                                                    <xsl:if test="element-citation/publisher-loc[string-length() &gt; 0]">
                                                        <place xmlns="http://www.loc.gov/mods/v3">
                                                            <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                                <xsl:attribute name="type">text</xsl:attribute>
                                                                <xsl:value-of select="normalize-space(element-citation/publisher-loc)"/> 
                                                            </placeTerm>
                                                        </place>
                                                    </xsl:if>
                                                </originInfo>
                                            </xsl:if>
                                            <!-- ********************************** Part *******************************-->
                                            <xsl:if
                                                test="element-citation/volume[string-length() &gt; 0] | element-citation/issue[string-length() &gt; 0] | element-citation/year[string-length() &gt; 0] | element-citation/fpage[string-length() &gt; 0]| element-citation/lpage[string-length() &gt; 0]">
                                                <part xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:choose>
                                                        <xsl:when test="element-citation/year[string-length() &gt; 0]">
                                                            <date xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(element-citation/year)"/>
                                                            </date>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                    <xsl:if test="element-citation/volume[string-length() &gt; 0]">
                                                        <detail xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">volume</xsl:attribute>
                                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>vol.</xsl:text>
                                                            </caption>
                                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(element-citation/volume)"/>
                                                            </number>
                                                        </detail>
                                                    </xsl:if>
                                                    <xsl:if test="element-citation/issue[string-length() &gt; 0]">
                                                        <detail xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">issue</xsl:attribute>
                                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:text>no.</xsl:text>
                                                            </caption>
                                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:value-of select="normalize-space(element-citation/issue)"/>
                                                            </number>
                                                        </detail>
                                                    </xsl:if>
                                                    <xsl:if test="element-citation/fpage[string-length() &gt; 0] | element-citation/lpage[string-length() &gt; 0]">
                                                        <extent xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="unit">pages</xsl:attribute>
                                                            <xsl:if test="element-citation/fpage[string-length() &gt; 0]">
                                                                <start xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:value-of select="normalize-space(element-citation/fpage)"/>
                                                                </start>
                                                            </xsl:if>
                                                            <xsl:if test="element-citation/lpage[string-length() &gt; 0]">
                                                                <end xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:value-of select="normalize-space(element-citation/lpage)"/>
                                                                </end>
                                                            </xsl:if>
                                                        </extent>
                                                    </xsl:if>
                                                </part>
                                            </xsl:if>
                                        </relatedItem>
                                    </xsl:if>
                                    <xsl:if
                                        test="not(element-citation/article-title) and element-citation/volume[string-length() &gt; 0] | element-citation/issue[string-length() &gt; 0] | element-citation/year[string-length() &gt; 0] | element-citation/fpage[string-length() &gt; 0]| element-citation/lpage[string-length() &gt; 0]">
                                        <part xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:choose>
                                                <xsl:when test="element-citation/year[string-length() &gt; 0]">
                                                    <date xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(element-citation/year)"/>
                                                    </date>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="element-citation/volume[string-length() &gt; 0]">
                                                <detail xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">volume</xsl:attribute>
                                                    <caption xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:text>vol.</xsl:text>
                                                    </caption>
                                                    <number xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(element-citation/volume)"/>
                                                    </number>
                                                </detail>
                                            </xsl:if>
                                            <xsl:if test="element-citation/issue[string-length() &gt; 0]">
                                                <detail xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">issue</xsl:attribute>
                                                    <caption xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:text>no.</xsl:text>
                                                    </caption>
                                                    <number xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(element-citation/issue)"/>
                                                    </number>
                                                </detail>
                                            </xsl:if>
                                            <xsl:if test="element-citation/fpage[string-length() &gt; 0] | element-citation/lpage[string-length() &gt; 0]">
                                                <extent xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="unit">pages</xsl:attribute>
                                                    <xsl:if test="element-citation/fpage[string-length() &gt; 0]">
                                                        <start xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(element-citation/fpage)"/>
                                                        </start>
                                                    </xsl:if>
                                                    <xsl:if test="element-citation/lpage[string-length() &gt; 0]">
                                                        <end xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(element-citation/lpage)"/>
                                                        </end>
                                                    </xsl:if>
                                                </extent>
                                            </xsl:if>
                                        </part>
                                    </xsl:if>
                                </relatedItem>
                            </xsl:for-each>
                        </relatedItem>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="article/back/ref-list/ref/mixed-citation[string-length() &gt; 0] and not(article/back/ref-list/ref/mixed-citation/article-title) and not(article/back/ref-list/ref/mixed-citation/source)">
                    <xsl:for-each select="article/back/ref-list/ref">
                        <relatedItem xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">isReferencedBy</xsl:attribute>
                            <xsl:if test="@id">
                                <xsl:attribute name="displayLabel">
                                    <xsl:value-of select="normalize-space(@id)"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="mixed-citation[string-length()&gt; 0]">
                                    <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                        <title xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(mixed-citation)"/>
                                        </title>
                                    </titleInfo>
                                </xsl:when>
                            </xsl:choose>
                        </relatedItem>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="article/back/ref-list/ref[string-length() &gt; 0]">
                        <!-- references / citations -->
                    <xsl:if test="contains(article/back/ref-list/title,'Ref') or contains(article/back/ref-list/title,'ref') or contains(article/back/ref-list/title,'Cita') or contains(article/back/ref-list/title,'cita')">
                    <xsl:for-each select="article/back/ref-list/ref">
                            <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">isReferencedBy</xsl:attribute>
                                <xsl:if test="@id">
                                    <xsl:attribute name="displayLabel">
                                        <xsl:value-of select="normalize-space(@id)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="nlm-citation/article-title[string-length()&gt; 0]">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(nlm-citation/article-title)"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="nlm-mixed-citation[string-length()&gt; 0]">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(nlm-mixed-citation)"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="nlm-citation[@citation-type='other'][string-length()&gt; 0] and not(nlm-citation/source)">
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="nlm-citation/source[string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(nlm-citation/source)"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:if>
                                        <xsl:if test="nlm-citation[@citation-type='web'][string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(nlm-citation/text())"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="element-citation/article-title[string-length()&gt; 0]">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(element-citation/article-title)"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="element-mixed-citation[string-length()&gt; 0]">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(element-mixed-citation)"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="element-citation[@citation-type='other'][string-length()&gt; 0] and not(element-citation/source)">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(element-citation[@citation-type='other']/text())"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="element-citation/source[string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(element-citation/source)"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:if>
                                        <xsl:if test="element-citation[@citation-type='web'][string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(element-citation/text())"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="citation/article-title[string-length()&gt; 0]">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(citation/article-title)"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="mixed-citation[string-length()&gt; 0]">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(mixed-citation)"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:when test="citation[@citation-type='other'][string-length()&gt; 0] and not(citation/source)">
                                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                            <title xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(citation[@citation-type='other']/text())"/>
                                            </title>
                                        </titleInfo>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="citation/source[string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(citation/source)"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:if>
                                        <xsl:if test="citation[@citation-type='web'][string-length()&gt; 0]">
                                            <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                <title xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(citation/text())"/>
                                                </title>
                                            </titleInfo>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="nlm-citation/person-group/name | nlm-citation/person-group/collab">
                                    <xsl:for-each select="nlm-citation/person-group">
                                        <xsl:variable name="role">
                                            <xsl:if test="@person-group-type[string-length() &gt; 0]">
                                                <role xmlns="http://www.loc.gov/mods/v3"> 
                                                    <roleTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:attribute name="type">text</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(@person-group-type)"/>
                                                    </roleTerm>
                                                </role>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:if test="name/surname[string-length() &gt; 0]">
                                        <xsl:for-each select="name">
                                            <name xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">personal</xsl:attribute>
                                                <xsl:choose>
                                                    <xsl:when test="prefix and not(contains(prefix,'collaboration')) ">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                            <xsl:value-of select="normalize-space(prefix)"/>
                                                        </namePart>  
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="given-names[string-length() &gt; 0]">
                                                    <xsl:for-each select="given-names">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                                </xsl:if>
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">family</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(translate(surname,',',''))"/>
                                                    <xsl:if test="suffix[string-length() &gt; 0]">
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="normalize-space(suffix)" />
                                                    </xsl:if>
                                                </namePart>
                                                <xsl:if test="string-length($role) &gt; 0">
                                                    <role xmlns="http://www.loc.gov/mods/v3"> 
                                                        <roleTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                            <xsl:attribute name="type">text</xsl:attribute>
                                                            <xsl:value-of select="$role"/>
                                                        </roleTerm>
                                                    </role>
                                                </xsl:if>
                                            </name>
                                        </xsl:for-each>
                                        </xsl:if>
                                        <xsl:for-each select="collab">
                                            <name xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">corporate</xsl:attribute>
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </namePart>
                                            </name>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="element-citation/person-group/name | element-citation/person-group/collab">
                                    <xsl:for-each select="element-citation/person-group">
                                        <xsl:variable name="role">
                                            <xsl:if test="@person-group-type[string-length() &gt; 0]">
                                                <role xmlns="http://www.loc.gov/mods/v3"> 
                                                    <roleTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:attribute name="type">text</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(@person-group-type)"/>
                                                    </roleTerm>
                                                </role>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="name">
                                            <name xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">personal</xsl:attribute>
                                                <xsl:choose>
                                                    <xsl:when test="prefix and not(contains(prefix,'collaboration')) ">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                            <xsl:value-of select="normalize-space(prefix)"/>
                                                        </namePart>  
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="given-names[string-length() &gt; 0]">
                                                    <xsl:for-each select="given-names">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                                </xsl:if>
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">family</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(translate(surname,',',''))"/>
                                                    <xsl:if test="suffix[string-length() &gt; 0]">
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="normalize-space(suffix)" />
                                                    </xsl:if>
                                                </namePart>
                                                <xsl:if test="string-length($role) &gt; 0">
                                                    <role xmlns="http://www.loc.gov/mods/v3"> 
                                                        <roleTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                            <xsl:attribute name="type">text</xsl:attribute>
                                                            <xsl:value-of select="$role"/>
                                                        </roleTerm>
                                                    </role>
                                                </xsl:if>
                                            </name>
                                        </xsl:for-each>
                                        <xsl:for-each select="collab">
                                            <name xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">corporate</xsl:attribute>
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </namePart>
                                            </name>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="citation/person-group/name | citation/person-group/collab">
                                    <xsl:for-each select="citation/person-group">
                                        <xsl:variable name="rolePerson">
                                            <xsl:if test="contains(@person-group-type,'author')">
                                                <xsl:text>author</xsl:text>
                                            </xsl:if>
                                            <xsl:if test="contains(@person-group-type,'editor')">
                                                <xsl:text>editor</xsl:text>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="name">
                                            <name xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">personal</xsl:attribute>
                                                <xsl:choose>
                                                    <xsl:when test="prefix and not(contains(prefix,'collaboration')) ">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                                            <xsl:value-of select="normalize-space(prefix)"/>
                                                        </namePart>  
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="given-names[string-length() &gt; 0]">
                                                    <xsl:for-each select="given-names">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                                </xsl:if>
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">family</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(translate(surname,',',''))"/>
                                                    <xsl:if test="suffix[string-length() &gt; 0]">
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="normalize-space(suffix)" />
                                                    </xsl:if> 
                                                </namePart>
                                                <role xmlns="http://www.loc.gov/mods/v3"> 
                                                    <roleTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                        <xsl:attribute name="type">text</xsl:attribute>
                                                        <xsl:value-of select="$rolePerson"/> 
                                                    </roleTerm>
                                                </role>
                                            </name>
                                        </xsl:for-each>
                                        <xsl:for-each select="collab">
                                            <name xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">corporate</xsl:attribute>
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </namePart>
                                            </name>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="nlm-citation/collab[string-length() &gt; 0] | nlm-element-citation/collab[string-length() &gt; 0]">
                                    <xsl:for-each select="nlm-citation/collab | nlm-element-citation/collab">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">corporate</xsl:attribute>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </namePart>
                                        </name>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="element-citation/collab[string-length() &gt; 0][string-length() &gt; 0]">
                                    <xsl:for-each select="element-citation/collab">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">corporate</xsl:attribute>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </namePart>
                                        </name>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="citation/collab[string-length() &gt; 0] | element-citation/collab[string-length() &gt; 0]">
                                    <xsl:for-each select="citation/collab | element-citation/collab">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">corporate</xsl:attribute>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </namePart>
                                        </name>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="not(nlm-citation/article-title) and nlm-citation/publisher-name[string-length() &gt; 0] | nlm-citation/publisher-loc[string-length() &gt; 0]">
                                    <originInfo xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="nlm-citation/publisher-name[string-length() &gt; 0]">
                                            <publisher xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:for-each select="nlm-citation/publisher-name">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                    <xsl:text>. </xsl:text>
                                                </xsl:for-each>
                                            </publisher>
                                        </xsl:if>
                                        <xsl:if test="nlm-citation/publisher-loc[string-length() &gt; 0]">
                                            <place xmlns="http://www.loc.gov/mods/v3">
                                                <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:attribute name="type">text</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(nlm-citation/publisher-loc)"/> 
                                                </placeTerm>
                                            </place>
                                        </xsl:if>
                                    </originInfo>
                                </xsl:if>
                                <xsl:if test="not(element-citation/article-title) and element-citation/publisher-name[string-length() &gt; 0] | element-citation/publisher-loc[string-length() &gt; 0]">
                                    <originInfo xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="element-citation/publisher-name[string-length() &gt; 0]">
                                            <publisher xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:for-each select="element-citation/publisher-name">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                    <xsl:text>. </xsl:text>
                                                </xsl:for-each>
                                            </publisher>
                                        </xsl:if>
                                        <xsl:if test="element-citation/publisher-loc[string-length() &gt; 0]">
                                            <place xmlns="http://www.loc.gov/mods/v3">
                                                <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:attribute name="type">text</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(element-citation/publisher-loc)"/> 
                                                </placeTerm>
                                            </place>
                                        </xsl:if>
                                    </originInfo>
                                </xsl:if>
                                <xsl:if test="not(citation/article-title) and citation/publisher-name[string-length() &gt; 0] | citation/publisher-loc[string-length() &gt; 0]">
                                    <originInfo xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="citation/publisher-name[string-length() &gt; 0]">
                                            <publisher xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:for-each select="citation/publisher-name">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                    <xsl:text>. </xsl:text>
                                                </xsl:for-each>
                                            </publisher>
                                        </xsl:if>
                                        <xsl:if test="citation/publisher-loc[string-length() &gt; 0]">
                                            <place xmlns="http://www.loc.gov/mods/v3">
                                                <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                    <xsl:attribute name="type">text</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(citation/publisher-loc)"/> 
                                                </placeTerm>
                                            </place>
                                        </xsl:if>
                                    </originInfo>
                                </xsl:if>
                                <!-- genre -->
                                <xsl:if test="nlm-citation/@citation-type[string-length()&gt; 0]">
                                    <genre xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(nlm-citation/@citation-type)"/>
                                    </genre>
                                </xsl:if>
                                <xsl:if test="element-citation/@citation-type[string-length()&gt; 0]">
                                    <genre xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(element-citation/@citation-type)"/>
                                    </genre>
                                </xsl:if>
                                <xsl:if test="citation/@citation-type[string-length()&gt; 0]">
                                    <genre xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(citation/@citation-type)"/>
                                    </genre>
                                </xsl:if>
                                <!--<xsl:if test="nlm-citation/comment[string-length()&gt; 0] | nlm-element-citation/comment[string-length()&gt; 0]">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(nlm-citation/comment | nlm-element-citation/comment)"/>
                                    </note>
                                </xsl:if>-->
                                <xsl:if test="element-citation/comment[string-length()&gt; 0]">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(element-citation/comment)"/>
                                    </note>
                                </xsl:if>
                                <!--<xsl:if test="citation/comment[string-length()&gt; 0] | element-citation/comment[string-length()&gt; 0]">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(citation/comment | element-citation/comment)"/>
                                    </note>
                                </xsl:if>-->
                                <xsl:if test="nlm-citation[string-length()&gt; 0] and not(nlm-citation/person-group)">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(nlm-citation)"/>
                                    </note>
                                </xsl:if>
                                <xsl:if test="nlm-element-citation[string-length()&gt; 0] and not(nlm-citation/person-group)">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(nlm-element-citation)"/>
                                    </note>
                                </xsl:if>
                                <xsl:if test="citation[string-length()&gt; 0]and not(citation/person-group)">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(citation )"/>
                                    </note>
                                </xsl:if>
                                <xsl:if test="element-citation[string-length()&gt; 0] and not(citation/person-group)">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(element-citation)"/>
                                    </note>
                                </xsl:if>
                                <xsl:if test="note/p[string-length()&gt; 0]">
                                    <note xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(note/p/text())"/>
                                    </note>
                                </xsl:if>
                                <xsl:if test="nlm-citation/article-title[string-length() &gt; 0] and nlm-citation/source[string-length() &gt; 0]">
                                    <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">host</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="nlm-citation/source[string-length() &gt; 0]">
                                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                    <title xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/source)"/>
                                                    </title>
                                                </titleInfo>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:if test="nlm-citation/publisher-name[string-length() &gt; 0] | nlm-citation/publisher-loc[string-length() &gt; 0]">
                                            <originInfo xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:if test="nlm-citation/publisher-name[string-length() &gt; 0]">
                                                    <publisher xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:for-each select="nlm-citation/publisher-name">
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                            <xsl:text>. </xsl:text>
                                                        </xsl:for-each>
                                                    </publisher>
                                                </xsl:if>
                                                <xsl:if test="nlm-citation/publisher-loc[string-length() &gt; 0]">
                                                    <place xmlns="http://www.loc.gov/mods/v3">
                                                        <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                            <xsl:attribute name="type">text</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(nlm-citation/publisher-loc)"/> 
                                                        </placeTerm>
                                                    </place>
                                                </xsl:if>
                                                <xsl:if test="nlm-citation/edition[string-length() &gt; 0]">
                                                    <edition xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/edition)"/>
                                                    </edition>
                                                </xsl:if>
                                            </originInfo>
                                        </xsl:if>
                                        <!-- ********************************** Part *******************************-->
                                        <xsl:if
                                            test="nlm-citation/volume[string-length() &gt; 0] | nlm-citation/issue[string-length() &gt; 0] | nlm-citation/year[string-length() &gt; 0] | nlm-citation/fpage[string-length() &gt; 0]| nlm-citation/lpage[string-length() &gt; 0]">
                                            <part xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:choose>
                                                    <xsl:when test="nlm-citation/year[string-length() &gt; 0]">
                                                        <date xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(nlm-citation/year)"/>
                                                        </date>
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="nlm-citation/volume[string-length() &gt; 0]">
                                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">volume</xsl:attribute>
                                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>vol.</xsl:text>
                                                        </caption>
                                                        <number xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(nlm-citation/volume)"/>
                                                        </number>
                                                    </detail>
                                                </xsl:if>
                                                <xsl:if test="nlm-citation/issue[string-length() &gt; 0]">
                                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">issue</xsl:attribute>
                                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>no.</xsl:text>
                                                        </caption>
                                                        <number xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(nlm-citation/issue)"/>
                                                        </number>
                                                    </detail>
                                                </xsl:if>
                                                <xsl:choose>
                                                    <xsl:when test="nlm-citation/fpage[string-length() &gt; 0] &gt; nlm-citation/lpage[string-length() &gt; 0]">
                                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                                <xsl:if test="nlm-citation/fpage[string-length() &gt; 0]">
                                                                    <list xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(nlm-citation/fpage)"/>
                                                                        <xsl:if test="nlm-citation/lpage[string-length() &gt; 0]">
                                                                            <xsl:text>-</xsl:text>
                                                                            <xsl:value-of select="normalize-space(nlm-citation/lpage)"/>
                                                                        </xsl:if>
                                                                    </list>
                                                                </xsl:if>
                                                            </extent>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:if test="nlm-citation/fpage[string-length() &gt; 0]  |nlm-citation/lpage[string-length() &gt; 0] | nlm-element-citation/fpage[string-length() &gt; 0] | nlm-element-citation/lpage[string-length() &gt; 0]">
                                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                                <xsl:if test="nlm-citation/fpage[string-length() &gt; 0] | nlm-element-citation/fpage[string-length() &gt; 0]">
                                                                    <start xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(nlm-citation/fpage | nlm-element-citation/fpage)"/>
                                                                    </start>
                                                                </xsl:if>
                                                                <xsl:if test="nlm-citation/lpage[string-length() &gt; 0] | nlm-element-citation/lpage[string-length() &gt; 0]">
                                                                    <end xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(nlm-citation/lpage | nlm-element-citation/lpage)"/>
                                                                    </end>
                                                                </xsl:if>
                                                            </extent>
                                                        </xsl:if>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </part>
                                        </xsl:if>
                                    </relatedItem>
                                </xsl:if>
                                <xsl:if test="element-citation/article-title[string-length() &gt; 0] and element-citation/source[string-length() &gt; 0]">
                                    <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">host</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="element-citation/source[string-length() &gt; 0]">
                                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                    <title xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(element-citation/source)"/>
                                                    </title>
                                                </titleInfo>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:if test="element-citation/publisher-name[string-length() &gt; 0] | element-citation/publisher-loc[string-length() &gt; 0]">
                                            <originInfo xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:if test="element-citation/publisher-name[string-length() &gt; 0]">
                                                    <publisher xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:for-each select="element-citation/publisher-name">
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                            <xsl:text>. </xsl:text>
                                                        </xsl:for-each>
                                                    </publisher>
                                                </xsl:if>
                                                <xsl:if test="element-citation/publisher-loc[string-length() &gt; 0]">
                                                    <place xmlns="http://www.loc.gov/mods/v3">
                                                        <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                            <xsl:attribute name="type">text</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(element-citation/publisher-loc)"/> 
                                                        </placeTerm>
                                                    </place>
                                                </xsl:if>
                                                <xsl:if test="element-citation/edition[string-length() &gt; 0]">
                                                    <edition xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(element-citation/edition)"/>
                                                    </edition>
                                                </xsl:if>
                                            </originInfo>
                                        </xsl:if>
                                        <!-- ********************************** Part *******************************-->
                                        <xsl:if
                                            test="element-citation/volume[string-length() &gt; 0] | element-citation/issue[string-length() &gt; 0] | element-citation/year[string-length() &gt; 0] | element-citation/fpage[string-length() &gt; 0]| element-citation/lpage[string-length() &gt; 0]">
                                            <part xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:choose>
                                                    <xsl:when test="element-citation/year[string-length() &gt; 0]">
                                                        <date xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(element-citation/year)"/>
                                                        </date>
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="element-citation/volume[string-length() &gt; 0]">
                                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">volume</xsl:attribute>
                                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>vol.</xsl:text>
                                                        </caption>
                                                        <number xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(element-citation/volume)"/>
                                                        </number>
                                                    </detail>
                                                </xsl:if>
                                                <xsl:if test="element-citation/issue[string-length() &gt; 0]">
                                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">issue</xsl:attribute>
                                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>no.</xsl:text>
                                                        </caption>
                                                        <number xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(element-citation/issue)"/>
                                                        </number>
                                                    </detail>
                                                </xsl:if>
                                                <xsl:choose>
                                                    <xsl:when test="nlm-citation/fpage[string-length() &gt; 0] &gt; nlm-citation/lpage[string-length() &gt; 0]">
                                                        <extent xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="unit">pages</xsl:attribute>
                                                            <xsl:if test="nlm-citation/fpage[string-length() &gt; 0]">
                                                                <list xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:value-of select="normalize-space(nlm-citation/fpage)"/>
                                                                    <xsl:if test="nlm-citation/lpage[string-length() &gt; 0]">
                                                                        <xsl:text>-</xsl:text>
                                                                        <xsl:value-of select="normalize-space(nlm-citation/lpage)"/>
                                                                    </xsl:if>
                                                                </list>
                                                            </xsl:if>
                                                        </extent>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:if test="nlm-citation/fpage[string-length() &gt; 0]  |nlm-citation/lpage[string-length() &gt; 0] | nlm-element-citation/fpage[string-length() &gt; 0] | nlm-element-citation/lpage[string-length() &gt; 0]">
                                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                                <xsl:if test="nlm-citation/fpage[string-length() &gt; 0] | nlm-element-citation/fpage[string-length() &gt; 0]">
                                                                    <start xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(nlm-citation/fpage | nlm-element-citation/fpage)"/>
                                                                    </start>
                                                                </xsl:if>
                                                                <xsl:if test="nlm-citation/lpage[string-length() &gt; 0] | nlm-element-citation/lpage[string-length() &gt; 0]">
                                                                    <end xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(nlm-citation/lpage | nlm-element-citation/lpage)"/>
                                                                    </end>
                                                                </xsl:if>
                                                            </extent>
                                                        </xsl:if>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </part>
                                        </xsl:if>
                                    </relatedItem>
                                </xsl:if>
                                <xsl:if test="citation/article-title[string-length() &gt; 0] and citation/source[string-length() &gt; 0]">
                                    <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">host</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="citation/source[string-length() &gt; 0]">
                                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                                    <title xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(citation/source)"/>
                                                    </title>
                                                </titleInfo>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:if test="citation/publisher-name[string-length() &gt; 0] | citation/publisher-loc[string-length() &gt; 0]">
                                            <originInfo xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:if test="citation/publisher-name[string-length() &gt; 0]">
                                                    <publisher xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:for-each select="citation/publisher-name">
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                            <xsl:text>. </xsl:text>
                                                        </xsl:for-each>
                                                    </publisher>
                                                </xsl:if>
                                                <xsl:if test="citation/publisher-loc[string-length() &gt; 0]">
                                                    <place xmlns="http://www.loc.gov/mods/v3">
                                                        <placeTerm xmlns="http://www.loc.gov/mods/v3"> 
                                                            <xsl:attribute name="type">text</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(citation/publisher-loc)"/> 
                                                        </placeTerm>
                                                    </place>
                                                </xsl:if>
                                            </originInfo>
                                        </xsl:if>
                                        <!-- ********************************** Part *******************************-->
                                        <xsl:if
                                            test="citation/volume[string-length() &gt; 0] | citation/issue[string-length() &gt; 0] | citation/year[string-length() &gt; 0] | citation/fpage[string-length() &gt; 0]| citation/lpage[string-length() &gt; 0]">
                                            <part xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:choose>
                                                    <xsl:when test="citation/year[string-length() &gt; 0]">
                                                        <date xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(citation/year)"/>
                                                        </date>
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="citation/volume[string-length() &gt; 0]">
                                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">volume</xsl:attribute>
                                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>vol.</xsl:text>
                                                        </caption>
                                                        <number xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(citation/volume)"/>
                                                        </number>
                                                    </detail>
                                                </xsl:if>
                                                <xsl:if test="citation/issue[string-length() &gt; 0]">
                                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">issue</xsl:attribute>
                                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>no.</xsl:text>
                                                        </caption>
                                                        <number xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:value-of select="normalize-space(citation/issue)"/>
                                                        </number>
                                                    </detail>
                                                </xsl:if>
                                                <xsl:choose>
                                                    <xsl:when test="citation/fpage[string-length() &gt; 0] &gt; citation/lpage[string-length() &gt; 0]">
                                                        <extent xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="unit">pages</xsl:attribute>
                                                            <xsl:if test="citation/fpage[string-length() &gt; 0]">
                                                                <list xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:value-of select="normalize-space(citation/fpage)"/>
                                                                    <xsl:if test="citation/lpage[string-length() &gt; 0]">
                                                                        <xsl:text>-</xsl:text>
                                                                        <xsl:value-of select="normalize-space(citation/lpage)"/>
                                                                    </xsl:if>
                                                                </list>
                                                            </xsl:if>
                                                        </extent>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:if test="citation/fpage[string-length() &gt; 0] | citation/lpage[string-length() &gt; 0] | element-citation/fpage[string-length() &gt; 0] | element-citation/lpage[string-length() &gt; 0]">
                                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                                <xsl:if test="citation/fpage[string-length() &gt; 0] | element-citation/fpage[string-length() &gt; 0]">
                                                                    <start xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(citation/fpage | element-citation/fpage)"/>
                                                                    </start>
                                                                </xsl:if>
                                                                <xsl:if test="citation/lpage[string-length() &gt; 0] | element-citation/lpage[string-length() &gt; 0]">
                                                                    <end xmlns="http://www.loc.gov/mods/v3">
                                                                        <xsl:value-of select="normalize-space(citation/lpage | element-citation/lpage)"/>
                                                                    </end>
                                                                </xsl:if>
                                                            </extent>
                                                        </xsl:if>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </part>
                                        </xsl:if>
                                    </relatedItem>
                                </xsl:if>
                                <xsl:if test="nlm-citation/ext-link[string-length() &gt; 0]">
                                    <xsl:for-each select="nlm-citation/ext-link">
                                    <identifier xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="@ext-link-type[string-length() &gt; 0]">
                                        <xsl:attribute name="type">
                                            <xsl:value-of select="@ext-link-type"/>
                                        </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </identifier>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="citation/ext-link[string-length() &gt; 0]">
                                    <xsl:for-each select="citation/ext-link">
                                        <identifier xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:if test="@ext-link-type[string-length() &gt; 0]">
                                                <xsl:attribute name="type">
                                                    <xsl:value-of select="@ext-link-type"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </identifier>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if
                                    test="not(nlm-citation/article-title) and nlm-citation/volume[string-length() &gt; 0] | nlm-citation/issue[string-length() &gt; 0] | nlm-citation/year[string-length() &gt; 0] | nlm-citation/fpage[string-length() &gt; 0]| nlm-citation/lpage[string-length() &gt; 0]">
                                    <part xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:choose>
                                            <xsl:when test="nlm-citation/year[string-length() &gt; 0]">
                                                <date xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(nlm-citation/year)"/>
                                                </date>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:if test="nlm-citation/volume[string-length() &gt; 0]">
                                            <detail xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">volume</xsl:attribute>
                                                <caption xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>vol.</xsl:text>
                                                </caption>
                                                <number xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(nlm-citation/volume)"/>
                                                </number>
                                            </detail>
                                        </xsl:if>
                                        <xsl:if test="nlm-citation/issue[string-length() &gt; 0]">
                                            <detail xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">issue</xsl:attribute>
                                                <caption xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>no.</xsl:text>
                                                </caption>
                                                <number xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(nlm-citation/issue)"/>
                                                </number>
                                            </detail>
                                        </xsl:if>
                                        <xsl:if test="nlm-citation/fpage[string-length() &gt; 0] | nlm-citation/lpage[string-length() &gt; 0]">
                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                <xsl:if test="nlm-citation/fpage[string-length() &gt; 0]">
                                                    <start xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/fpage)"/>
                                                    </start>
                                                </xsl:if>
                                                <xsl:if test="nlm-citation/lpage[string-length() &gt; 0]">
                                                    <end xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(nlm-citation/lpage)"/>
                                                    </end>
                                                </xsl:if>
                                            </extent>
                                        </xsl:if>
                                    </part>
                                </xsl:if>
                                <xsl:if
                                    test="not(citation/article-title) and citation/volume[string-length() &gt; 0] | citation/issue[string-length() &gt; 0] | citation/year[string-length() &gt; 0] | citation/fpage[string-length() &gt; 0]| citation/lpage[string-length() &gt; 0]">
                                    <part xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:choose>
                                            <xsl:when test="citation/year[string-length() &gt; 0]">
                                                <date xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(citation/year)"/>
                                                </date>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:if test="citation/volume[string-length() &gt; 0]">
                                            <detail xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">volume</xsl:attribute>
                                                <caption xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>vol.</xsl:text>
                                                </caption>
                                                <number xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(citation/volume)"/>
                                                </number>
                                            </detail>
                                        </xsl:if>
                                        <xsl:if test="citation/issue[string-length() &gt; 0]">
                                            <detail xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">issue</xsl:attribute>
                                                <caption xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>no.</xsl:text>
                                                </caption>
                                                <number xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(citation/issue)"/>
                                                </number>
                                            </detail>
                                        </xsl:if>
                                        <xsl:if test="citation/fpage[string-length() &gt; 0] | citation/lpage[string-length() &gt; 0]">
                                            <extent xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="unit">pages</xsl:attribute>
                                                <xsl:if test="citation/fpage[string-length() &gt; 0]">
                                                    <start xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(citation/fpage)"/>
                                                    </start>
                                                </xsl:if>
                                                <xsl:if test="citation/lpage[string-length() &gt; 0]">
                                                    <end xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:value-of select="normalize-space(citation/lpage)"/>
                                                    </end>
                                                </xsl:if>
                                            </extent>
                                        </xsl:if>
                                    </part>
                                </xsl:if>
                            </relatedItem>
                        </xsl:for-each>
                </xsl:if>
                </xsl:when>
            </xsl:choose>

           <xsl:choose>
               <xsl:when test="//article-meta/article-id[@pub-id-type='doi'][string-length() &gt; 0]">
                   <identifier xmlns="http://www.loc.gov/mods/v3">
                       <xsl:attribute name="type">DOI</xsl:attribute>
                       <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='doi'])"/>
                   </identifier>
               </xsl:when>
               <xsl:when test="//article-meta/article-id[@pub-id-type='url'][string-length() &gt; 0] and not(//article-meta/article-id[@pub-id-type='doi'][string-length() &gt; 0])">
                   <identifier xmlns="http://www.loc.gov/mods/v3">
                       <xsl:attribute name="type">DOI</xsl:attribute>
                       <xsl:value-of select="normalize-space(substring-after(//article-meta/article-id[@pub-id-type='url'],'abs/'))"/>
                   </identifier>
               </xsl:when>
           </xsl:choose>
            <xsl:if test="//article-meta/article-id[@pub-id-type='url'][string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">URI</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='url'])"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article-meta/article-id[@pub-id-type='filename'][string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">filenameID</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='filename'])"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article-meta/article-id[@pub-id-type='sici'][string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">SICI</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='sici'])"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article/front/article-meta/self-uri[string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">URI</xsl:attribute>
                    <xsl:value-of select="normalize-space(//self-uri)"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article/front/article-meta/article-id[@pub-id-type='original-pdf'][string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">original-pdf</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='original-pdf'])"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article/front/article-meta/self-uri/@xlink:href[string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">href</xsl:attribute>
                    <xsl:value-of select="normalize-space(//self-uri/@xlink:href)"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article-meta/article-id[@pub-id-type='publisher-id'][string-length() &gt; 0] and not(contains(//article-meta/article-id[@pub-id-type='publisher-id'],'['))">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">ArticleID</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='publisher-id'])"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article-meta/article-id[@pub-id-type='pmid'][string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">PMID</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='pmid'])"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//article-meta/article-id[@pub-id-type='pii'][string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">PII</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='pii'])"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//related-article[@related-article-type='pdf']/@xlink:href[string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">pdf</xsl:attribute>
                    <xsl:value-of select="normalize-space(//related-article[@related-article-type='pdf']/@xlink:href)"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//related-article/@xlink:href[string-length() &gt; 0] and not(//related-article[@ related-article-type='pdf'])">
                <xsl:for-each select="//related-article/@xlink:href">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">Related-article-href</xsl:attribute>
                        <xsl:value-of select="normalize-space(.)"/>
                    </identifier>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="//related-article/@id[string-length() &gt; 0]">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">related-article-ID</xsl:attribute>
                        <xsl:value-of select="normalize-space(//related-article/@id)"/>
                    </identifier>
            </xsl:if>
            <xsl:if test="//article-meta/article-id[@pub-id-type='other'][string-length() &gt; 0]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">local</xsl:attribute>
                    <xsl:value-of select="normalize-space(//article-meta/article-id[@pub-id-type='other'])"/>
                </identifier>
            </xsl:if>

            <!-- swissbib id -->
            <identifier xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">swissbib</xsl:attribute>
                    <xsl:value-of select="//article-meta/custom-meta-group/custom-meta/meta-name[.='(swissbib)identifier']/following-sibling::*"></xsl:value-of>
            </identifier>

            <!-- ********************************** Access Condition *******************************-->
            <xsl:choose>
                <xsl:when test="//article/front/article-meta/permissions/license[@license-type='open-access']/license-p[string-length() &gt; 0]">
                    <accessCondition xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">use and reproduction</xsl:attribute>
                        <xsl:attribute name="contentType">
                            <xsl:value-of select="//permissions/license/@license-type[string-length() &gt; 0]"/>
                        </xsl:attribute>
                        <xsl:value-of select="normalize-space(//permissions/license/license-p)"/>
                    </accessCondition>
                </xsl:when>
                <xsl:when test="//article/front/article-meta/permissions/license[@license-type='openaccess']/license-p[string-length() &gt; 0]">
                    <accessCondition xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">use and reproduction</xsl:attribute>
                        <xsl:attribute name="contentType">open-access</xsl:attribute>
                        <xsl:value-of select="normalize-space(//permissions/license/license-p)"/>
                    </accessCondition>
                </xsl:when>
                <xsl:when test="//article/front/article-meta/permissions/license[@license-type='creative-commons']/license-p[string-length() &gt; 0]">
                    <accessCondition xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">use and reproduction</xsl:attribute>
                        <xsl:attribute name="contentType">
                            <xsl:value-of select="//permissions/license/@license-type[string-length() &gt; 0]"/>
                        </xsl:attribute>
                        <xsl:value-of select="normalize-space(//permissions/license/license-p)"/>
                    </accessCondition>
                </xsl:when>
                <xsl:when test="//article/front/article-meta/permissions/copyright-statement[string-length() &gt; 0]">
                    <accessCondition xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">use and reproduction</xsl:attribute>
                        <xsl:attribute name="contentType">copyright</xsl:attribute>
                        <xsl:value-of select="normalize-space(//article/front/article-meta/permissions/copyright-statement)"/>
                    </accessCondition>
                </xsl:when>
                <xsl:when test="//article/front/article-meta/copyright-statement[string-length() &gt; 0]">
                    <accessCondition xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">use and reproduction</xsl:attribute>
                        <xsl:attribute name="contentType">copyright</xsl:attribute>
                        <xsl:value-of select="normalize-space(//article/front/article-meta/copyright-statement)"/>
                    </accessCondition>
                </xsl:when>
            </xsl:choose>
            <!-- *************************************** RecordInfo niveau ouvrage *******************************************************-->
            <recordInfo xmlns="http://www.loc.gov/mods/v3">
                <recordContentSource xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="//article-meta/custom-meta-group/custom-meta/meta-name[.='(swissbib)source']/following-sibling::*"></xsl:value-of>
                </recordContentSource>
                <xsl:if test="//copyright-holder[string-length() &gt; 0]">
                    <recordOrigin xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="normalize-space(//copyright-holder)"/>
                    </recordOrigin>
                </xsl:if>
                <xsl:if test="//article-meta/custom-meta-group/custom-meta/meta-name[.='(swissbib)metadata-license']/following-sibling::*[string-length() &gt; 0]">
                    <recordInfoNote xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="//article-meta/custom-meta-group/custom-meta/meta-name[.='(swissbib)metadata-license']/following-sibling::*"></xsl:value-of>
                    </recordInfoNote>
                </xsl:if>
            </recordInfo>
            <extension>
                <metadata-filename>
                    <xsl:value-of select="//article-meta/custom-meta-group/custom-meta/meta-name[.='(swissbib)metadata-filename']/following-sibling::*"></xsl:value-of>
                </metadata-filename>
                <pdf-filename>
                    <xsl:value-of select="//article-meta/custom-meta-group/custom-meta/meta-name[.='(swissbib)pdf-filename']/following-sibling::*"></xsl:value-of>
                </pdf-filename>
            </extension>
        </mods>
    </xsl:template>
    <!--Fin  Traitement Principal -->
    <!-- Début des templates -->
    <xsl:template name="authorAffRid">
        <xsl:if test="contains(//aff,'E-Mail:')">
            <xsl:call-template name="authorSSAff"/>
        </xsl:if>
                <!-- collab -->
        <xsl:if test="//contrib-group/contrib/collab">
            <xsl:for-each select="//contrib-group/contrib/collab">
                <name xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">corporate</xsl:attribute>
                    <namePart xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="normalize-space(.)"/>
                    </namePart>
                </name>
            </xsl:for-each>
        </xsl:if>   
    </xsl:template>
    
    <!--Auteur(s) sans affiliation-->
    <xsl:template name="authorSSAff">
        <xsl:for-each select="article/front/article-meta/contrib-group/contrib">
                <xsl:choose>
                    <xsl:when test="//author-notes/email[string-length() &gt; 0]">
                        <xsl:for-each select="Contact/Email">
                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                <xsl:text>E-mail: </xsl:text>                                
                                <xsl:value-of select="normalize-space(.)"/>
                            </affiliation>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
            <xsl:call-template name="role"/>
            <xsl:call-template name="bio"/>
        </xsl:for-each>
    </xsl:template>
    <!--Auteur(s) sans affiliation-->
    <xsl:template name="authorAffSimple">
        <!-- lorsque présence de 1 seul contrib dans contrib-group -->
            <xsl:choose>
                <xsl:when test="not(email)">
            <xsl:choose>
                    <xsl:when test="label">
                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                            <xsl:value-of select="normalize-space(substring-after(.,label))"/>
                        </affiliation>
                    </xsl:when>
                  <!--  <xsl:otherwise>
                        <xsl:if test="contrib/aff and not(contrib/collab)">
                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                            <xsl:value-of select="normalize-space(contrib/aff)"/>
                            <xsl:choose>
                                <xsl:when test="aff/email">
                                    <xsl:value-of select="normalize-space(substring-before(aff,aff/email))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(//aff)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </affiliation>
                        </xsl:if>
                    </xsl:otherwise>-->
                </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                        <xsl:choose>
                            <xsl:when test="email">
                                <xsl:value-of select="normalize-space(substring-before(.,email))"/>
                            </xsl:when>
                        </xsl:choose>
                    </affiliation>
                </xsl:otherwise>
            </xsl:choose>
                <!-- hors contrib-group -->
                <xsl:if test="//article/front/article-meta/aff[string-length() &gt; 0]">
                    <xsl:for-each select="//article/front/article-meta/aff">
                        <xsl:if test="not(./email)">
                            <xsl:choose>
                                <xsl:when test="./sup">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                        <xsl:value-of select="normalize-space(substring-after(.,sup))"/>
                                    </affiliation>
                                </xsl:when>
                                <xsl:otherwise>
                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </affiliation>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="email">
                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                <xsl:value-of select="normalize-space(substring-before(.,email))"/>
                            </affiliation>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if> 
                <!-- EMAIL sous plusieurs formes-->
                <xsl:if test="//aff/email[string-length() &gt; 0]">
                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                        <xsl:text>E-mail: </xsl:text>
                        <xsl:value-of select="normalize-space(//aff/email)"/>
                    </affiliation>
                </xsl:if>
                <xsl:if test="//author-notes/corresp[@id=current()/contrib/xref/@rid]/text()">
                    <xsl:if test="//author-notes/corresp[@id=current()/contrib/xref/@rid]/text() and not(//corresp/email)">
                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                            <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/contrib/xref/@rid]/text())"/>
                        </affiliation>
                    </xsl:if>
                    <xsl:if test="//corresp/email">
                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                            <xsl:text>E-mail: </xsl:text>
                            <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/contrib/xref/@rid]/email)"/>
                        </affiliation>
                    </xsl:if>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="//author-notes/email[string-length() &gt; 0]">
                        <xsl:for-each select="Contact/Email">
                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                <xsl:text>E-mail: </xsl:text>                                
                                <xsl:value-of select="normalize-space(.)"/>
                            </affiliation>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose> 
        <xsl:if test="//author-notes/fn[@id=current()/xref/@rid]/p/email">
            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                <xsl:value-of select="normalize-space(//author-notes/fn[@id=current()/xref/@rid]/p/email)"/>
            </affiliation>
        </xsl:if>  
    </xsl:template>
    <!-- Traitement des affiliations -->
    <xsl:template name="Affiliation">
       <!-- <xsl:if test="//article-meta/aff[@id=current()/contrib/xref/@rid]">
            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                <xsl:value-of select="normalize-space(//article-meta/aff[@id=current()/contrib/xref/@rid]"/>
            </affiliation>
            </xsl:if>-->
        <!-- Affiliation 1  -->
        <xsl:choose>
            <xsl:when test="contains(./xref/@rid,' ')">
                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                    <xsl:variable name="traitAff">
                        <xsl:value-of select="normalize-space(substring-before(./xref/@rid,' '))"/>
                    </xsl:variable>
                    <xsl:if test="//aff[@id=$traitAff]">
                        <xsl:value-of select="normalize-space(//aff[@id=$traitAff]/text())"/>
                    </xsl:if>
                </affiliation>
                <!-- affiliation 2  -->
                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                    <xsl:variable name="traitAff2">
                        <xsl:value-of select="normalize-space(substring-after(./xref/@rid,' '))"/>
                    </xsl:variable>
                    <xsl:variable name="traitAff2bis">
                        <xsl:value-of select="normalize-space(substring-before($traitAff2,' '))"/>
                    </xsl:variable>
                    <xsl:if test="//aff[@id=$traitAff2]/text()">
                        <xsl:value-of select="normalize-space(//aff[@id=$traitAff2]/text())"/>
                    </xsl:if>
                    <!-- traitement quand plus de 2 affiliations renseignées -->
                    <xsl:if test="//aff[@id=$traitAff2bis]/text()">
                        <xsl:value-of select="normalize-space(//aff[@id=$traitAff2bis]/text())"/>
                    </xsl:if>
                </affiliation>
                <!-- affiliation 3  -->
                <xsl:if test="substring-before(substring-after(./xref/@rid,' '),' ')">
                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                        <xsl:variable name="traitAff2">
                            <xsl:value-of select="normalize-space(substring-after(./xref/@rid,' '))"/>
                        </xsl:variable>
                        <xsl:variable name="traitAff2bis">
                            <xsl:value-of select="normalize-space(substring-after($traitAff2,' '))"/>
                        </xsl:variable>
                        <!-- traitement quand plus de 2 affiliations renseignées -->
                        <xsl:if test="//aff[@id=$traitAff2bis]/text()">
                            <xsl:value-of select="normalize-space(//aff[@id=$traitAff2bis]//text())"/>
                        </xsl:if>
                    </affiliation>
                </xsl:if>
            </xsl:when>
            <!-- Traitement normal, 1 affiliation par attribut -->
            <xsl:otherwise>
                <xsl:if test="//aff/@id ">
                    <xsl:choose>
                        <xsl:when test="//aff[@id=current()/xref/@rid]">
                            <xsl:for-each select="//aff[@id=current()/xref/@rid]">
                                <xsl:choose>
                                    <xsl:when test="./email">
                                        <xsl:if test="contains(.,',')">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(substring-after(.,./x | ./label | ./sup))"/>
                                            </affiliation>
                                        </xsl:if>
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:text>E-mail: </xsl:text>
                                            <xsl:value-of select="normalize-space(./email)"/>
                                        </affiliation>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:variable name="sup">
                                                <xsl:apply-templates select="."/>
                                            </xsl:variable>
                                            <xsl:value-of select="normalize-space($sup)"/>
                                        </affiliation>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="//ext-link[@id=current()/xref/@rid]">
                            <xsl:for-each select="//ext-link[@id=current()/xref/@rid]">
                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>E-mail: </xsl:text>
                                    <xsl:value-of select="normalize-space(.)"/>
                                </affiliation>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
                <!-- ne pas reprendre "Author to whom any correspondence should be addressed". -->
                <!--<xsl:if test="//author-notes/fn[@id=current()/xref/@rid]/p and not(//author-notes/fn/p/email)">
                    <xsl:for-each select="//author-notes/fn[@id=current()/xref/@rid]/p">
                        <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                            <xsl:value-of select="normalize-space(.)"/>
                        </affiliation>
                    </xsl:for-each>
                </xsl:if>-->
                <xsl:if test="//author-notes/corresp/email">
                    <xsl:choose>
                        <xsl:when test="not(//author-notes/corresp/@id) and not(//contrib/@corresp)">
                            <xsl:choose>
                                <xsl:when test="contains(//author-notes/corresp,' E-mail:')">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                        <xsl:value-of select="normalize-space(substring-before(//author-notes/corresp,' E-mail:'))"/>
                                    </affiliation>  
                                </xsl:when>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="//author-notes/corresp[@id=current()/xref/@rid]">
                    <!-- <xsl:if test="//author-notes/corresp[@id=current()/xref/@rid]/email">
                            <xsl:for-each select="//author-notes/corresp[@id=current()/xref/@rid]/email">
                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:text>E-mail: </xsl:text>  
                                    <xsl:value-of select="normalize-space(.)"/>
                                </affiliation>
                            </xsl:for-each>
                        </xsl:if>-->
                   <xsl:if test="not(//author-notes/corresp[@id=current()/xref/@rid]/email)">
                        <xsl:for-each select="//author-notes/corresp[@id=current()/xref/@rid]">
                            <xsl:choose>
                                <xsl:when test="//author-notes/corresp/sup">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(substring-after(//author-notes/corresp,sup))"/>
                                    </affiliation>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="contains(.,'E-mail')">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">  
                                            <xsl:value-of select="normalize-space(substring-before(.,'E-mail:'))"/>
                                        </affiliation>
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:text>E-mail: </xsl:text>  
                                            <xsl:value-of select="normalize-space(substring-after(.,'E-mail:'))"/>
                                        </affiliation>
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
       <!-- <xsl:if test="email">
            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                <xsl:text>E-mail: </xsl:text>
                <xsl:value-of select="normalize-space(email)"/>
            </affiliation>
            </xsl:if>-->
        <!-- address de correspondance repris dans <mods:note> et non pas dans <mods:description>-->
        <!--<xsl:if test="//author-notes/corresp and @corresp='yes' and xref/@ref-type='corresp'">
            <description xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of select="normalize-space(//author-notes/corresp)"/>
            </description>
        </xsl:if>-->
    </xsl:template>
    
    <xsl:template name="MulContrib">
        <xsl:for-each select="//contrib">
            <xsl:if test="name | string-name">
                <name xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">personal</xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="name/prefix | string-name/prefix and not(contains(name/prefix | string-name/prefix,'collaboration'))">
                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                                <xsl:value-of select="normalize-space(name/prefix | string-name/prefix )"/>
                            </namePart>  
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="name/given-names[string-length() &gt; 0]| string-name/given-names[string-length() &gt; 0]">                                    
                        <xsl:for-each select="name/given-names">
                        <namePart xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">given</xsl:attribute>
                            <xsl:value-of select="normalize-space(.)"/>
                        </namePart>
                        </xsl:for-each>
                        <xsl:for-each select="string-name/given-names">
                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">given</xsl:attribute>
                                <xsl:value-of select="normalize-space(.)"/>
                            </namePart>
                        </xsl:for-each>
                    </xsl:if>                                    
                    <namePart xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">family</xsl:attribute>
                        <xsl:value-of select="normalize-space(name/surname | string-name/surname)"/>
                    </namePart>
                    <xsl:if test="name/suffix[string-length() &gt; 0]| string-name/suffix[string-length() &gt; 0]">
                        <namePart xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>   
                            <xsl:value-of select="normalize-space(name/suffix | string-name/suffix)" />
                        </namePart>
                    </xsl:if>
                    <!-- affiliations -->
                    <xsl:if test="//aff[@id=current()/xref/@rid]">
                        <xsl:for-each select="//aff[@id=current()/xref/@rid]">
                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="normalize-space(substring-after(.,x | label | sup))"/>
                            </affiliation>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="//contrib-group/aff[string-length() &gt; 0] and not(//aff[@id=current()/xref/@rid])">
                        <xsl:choose>
                            <xsl:when test="contains(./xref/@rid,' ')">
                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:variable name="traitAff">
                                        <xsl:value-of select="normalize-space(substring-before(./xref/@rid,' '))"/>
                                    </xsl:variable>
                                    <xsl:if test="//aff[@id=$traitAff]">
                                        <xsl:value-of select="normalize-space(//aff[@id=$traitAff]/text())"/>
                                    </xsl:if>
                                </affiliation>
                                <!-- affiliation 2  -->
                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:variable name="traitAff2">
                                        <xsl:value-of select="normalize-space(substring-after(./xref/@rid,' '))"/>
                                    </xsl:variable>
                                    <xsl:variable name="traitAff2bis">
                                        <xsl:value-of select="normalize-space(substring-before($traitAff2,' '))"/>
                                    </xsl:variable>
                                    <xsl:if test="//aff[@id=$traitAff2]/text()">
                                        <xsl:value-of select="normalize-space(//aff[@id=$traitAff2]/text())"/>
                                    </xsl:if>
                                    <!-- traitement quand plus de 2 affiliations renseignées -->
                                    <xsl:if test="//aff[@id=$traitAff2bis]/text()">
                                        <xsl:value-of select="normalize-space(//aff[@id=$traitAff2bis]/text())"/>
                                    </xsl:if>
                                </affiliation>
                                <!-- affiliation 3  -->
                                <xsl:if test="substring-before(substring-after(./xref/@rid,' '),' ')">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                        <xsl:variable name="traitAff2">
                                            <xsl:value-of select="normalize-space(substring-after(./xref/@rid,' '))"/>
                                        </xsl:variable>
                                        <xsl:variable name="traitAff2bis">
                                            <xsl:value-of select="normalize-space(substring-after($traitAff2,' '))"/>
                                        </xsl:variable>
                                        <!-- traitement quand plus de 2 affiliations renseignées -->
                                        <xsl:if test="//aff[@id=$traitAff2bis]/text()">
                                            <xsl:value-of select="normalize-space(//aff[@id=$traitAff2bis]//text())"/>
                                        </xsl:if>
                                    </affiliation>
                                </xsl:if>
                            </xsl:when>
                            <!-- Traitement normal, 1 affiliation par attribut -->
                            <xsl:otherwise>
                                <xsl:if test="//aff/@id ">
                                    <xsl:choose>
                                        <xsl:when test="//aff[@id=current()/xref/@rid]">
                                            <xsl:for-each select="//aff[@id=current()/xref/@rid]">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(substring-after(.,./x | ./label | ./sup))"/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                        <xsl:when test="//aff[@id=current()/contrib/xref/@rid]">
                                            <xsl:for-each select="//aff[@id=current()/contrib/xref/@rid]">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(substring-after(.,./x | ./label | ./sup))"/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="not(//aff/@id) ">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                        <xsl:value-of select="normalize-space(//aff)"/>
                                    </affiliation>
                                </xsl:if>
                                <xsl:if test="//author-notes/corresp/email">
                                    <xsl:choose>
                                        <xsl:when test="not(//author-notes/corresp/@id) and not(//contrib/@corresp)">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:value-of select="normalize-space(substring-before(//author-notes/corresp,//author-notes/corresp/email))"/>
                                            </affiliation>
                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:text>E-mail: </xsl:text>  
                                                <xsl:value-of select="normalize-space(//author-notes/corresp/email)"/>
                                            </affiliation>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="//author-notes/corresp[@id=current()/xref/@rid]">
                                    <xsl:if test="//author-notes/corresp[@id=current()/xref/@rid]/email">
                                        <xsl:for-each select="//author-notes/corresp[@id=current()/xref/@rid]/email">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                                <xsl:text>E-mail: </xsl:text>  
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </affiliation>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="author-comment[string-length() &gt; 0]">
                        <affiliation xmlns="http://www.loc.gov/mods/v3">   
                            <xsl:value-of select="normalize-space(author-comment)"/>
                        </affiliation>
                    </xsl:if>
                    <!-- EMAIL -->
                    <xsl:choose>
                        <xsl:when test="@corresp and not(contains(@corresp,'yes'))">
                            <xsl:if test="@corresp and not(contains(@corresp,'no'))">
                                <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                    <xsl:value-of select="normalize-space(substring-before(//author-notes/corresp,//author-notes/corresp/email))"/>
                                </affiliation>
                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>E-mail: </xsl:text>  
                                    <xsl:value-of select="normalize-space(//author-notes/corresp/email)"/>
                                </affiliation>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="//author-notes/corresp[@id=current()/xref/@rid]">
                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                <xsl:choose>
                                    <xsl:when test="contains(//author-notes/corresp[@id=current()/xref/@rid],' E-mail:')">                             
                                        <xsl:value-of select="normalize-space(substring-before(//author-notes/corresp[@id=current()/xref/@rid],' E-mail:'))"/>
                                    </xsl:when>
                                    <xsl:when test="//author-notes/corresp[@id=current()/xref/@rid]/sup">
                                        <xsl:value-of select="normalize-space(substring-after(//author-notes/corresp[@id=current()/xref/@rid],//author-notes/corresp[@id=current()/xref/@rid]/sup))"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="//author-notes/corresp[@id=current()/xref/@rid]/email[string-length() &gt; 0]">
                                                <xsl:text>E-mail: </xsl:text>
                                                <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/xref/@rid]/email)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()/xref/@rid])"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </affiliation>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="@corresp and //author-notes/corresp ">
                                <xsl:for-each select="//author-notes/corresp">
                                    <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </affiliation>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="email[string-length() &gt; 0]">
                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>E-mail: </xsl:text>
                                    <xsl:value-of select="normalize-space(email)"/>
                                </affiliation>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="//author-notes/fn[@id=current()/xref/@rid]/p/email">
                        <xsl:for-each select="//author-notes/fn[@id=current()/xref/@rid]/p/email">
                            <affiliation xmlns="http://www.loc.gov/mods/v3"> 
                                <xsl:text>E-mail: </xsl:text>
                                <xsl:value-of select="normalize-space(.)"/>
                            </affiliation>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="//author-notes/email[string-length() &gt; 0]">
                            <xsl:for-each select="//author-notes/email">
                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>E-mail: </xsl:text>                                    
                                    <xsl:value-of select="normalize-space(.)"/>
                                </affiliation>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>        
                    <xsl:call-template name="role"/>
                    <xsl:call-template name="bio"/>                 
                </name>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!-- traitement du role auteur-->
    <xsl:template name="role">
        <xsl:choose>
            <xsl:when test="role[string-length() &gt; 0]">
                <role xmlns="http://www.loc.gov/mods/v3"> 
                    <roleTerm xmlns="http://www.loc.gov/mods/v3"> 
                        <xsl:attribute name="type">text</xsl:attribute>
                        <xsl:text>author</xsl:text>
                    </roleTerm>
                </role>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="@contrib-type[string-length() &gt; 0]">
                    <role xmlns="http://www.loc.gov/mods/v3"> 
                        <roleTerm xmlns="http://www.loc.gov/mods/v3"> 
                            <xsl:attribute name="type">text</xsl:attribute>
                            <xsl:value-of select="normalize-space(@contrib-type)"/>
                        </roleTerm>
                    </role>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- traitement des biographies -->
    <xsl:template name="bio">
        <xsl:choose>
            <xsl:when test="//bio/p[string-length() &gt; 0]">
                <xsl:choose>
                    <xsl:when test="//bio[@id=current()/xref/@rid]">
                        <description xmlns="http://www.loc.gov/mods/v3"> 
                            <xsl:value-of select="normalize-space(//bio[@id=current()/xref/@rid]/p)"/>
                        </description>  
                    </xsl:when>
                    <xsl:when test="bio/p">
                            <description xmlns="http://www.loc.gov/mods/v3">                               
                                <xsl:value-of select="normalize-space(bio/p)"/>
                            </description>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="aff2">
        <xsl:choose>
            <xsl:when test="contrib/xref[@ref-type='corresp']">
            <xsl:if test="//aff and not(//aff/id)">
                <affiliation xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="normalize-space(//aff)"/>
                </affiliation>
            </xsl:if>
            <!--<affiliation xmlns="http://www.loc.gov/mods/v3"> 
                <xsl:if test="//author-notes/corresp[@id=current()//xref/@rid]">
                    <xsl:variable name="corres">
                        <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()//xref/@rid])"/>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="//author-notes/corresp/email">
                            <xsl:text>E-mail: </xsl:text>
                            <xsl:value-of select="normalize-space(//author-notes/corresp[@id=current()//xref/@rid]/email)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space(substring-after($corres,//author-notes/corresp/label | //author-notes/corresp/sup))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </affiliation>-->
            </xsl:when>
            <xsl:when test="aff and not(contrib/xref)">
                <affiliation xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="normalize-space(aff)"/>
                </affiliation>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
