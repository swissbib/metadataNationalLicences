<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output encoding="UTF-8" method="xml" indent="no" omit-xml-declaration="no"/>
    <xsl:param name="idistex"/>
    <xsl:param name="datecreation"/>
    <!-- Feuille de style ISTEX Editeur Springer vers format mods v3.5
        =======================================================================================
        Auteur:  Stéphanie GREGORIO - INIST/CNRS
        =======================================================================================
        Version 0.1 du 13/07/2012
        [...]
        Version 0.10 du 19/12/2013
        Version 0.11.3 du 24/02/2014
        Version 0.11.4 du 21/08/2014
        Version 0.11.5 du 09/09/2014
        Version 0.11.7 du 12/09/2014
        Version 0.11.8 du 19/09/2014
        Version 0.11.9 du 07/10/2014
        Version 0.11.10 du 17/10/2014
        Version 0.11.11 du 21/11/2014
        Version 0.11.12 du 09/12/2014
        Version 0.11.13 du 15/12/2014
        Version 0.11.14 du 19/12/2014 (reprise identifiants)
        Version 0.11.15 du 20/02/2015 (@xml:lang)
        Version 0.11.16 du 13/04/2015 nettoyage du fichier en entrée (caracteres)
        Version 0.11.17 du 16/04/2015 (suppression de dateValid RegistrationDate non repris)
        Version 0.11.18 du 02/07/2015 (ajout code langue iso 639-2b)
        Version 0.11.19 du 02/11/2015 (maj date issued)
        Version 0.11.19.1 du 03/11/2015 (bug fix: des problemes de saut de ligne et balises tronquées)
        Version 0.11.19.2 du 06/11/2015 (reprise des categories article)
        Version 0.11.19.3 du 01/12/2015 maj language CES en CZE les 2 codes existent
        Version 0.11.20 du 03/12/2015 maj articleType <genre> + attribut "type" 9 categories
        Version 0.11.21 du 11/12/2015 maj articleType <genre> suite
        Version 0.11.22 du 11/01/2016 maj articleType <genre> suite
        Version 0.11.23 du 22/01/2016 maj documentType <genre> book, book series, journal + reprise series
                           26/01/2016 maj documentType <genre> book, book series, journal + reprise series
                           7/03/2016 maj documentType <genre> abandon de genre niveau article pour les books
                           15/03/2016 ajout @displayLabel à mods:genre contenant le articleType original editeur
                           17/03/2016 ajout mods:genre ="chapter" + "conference"
                           11/04/2016 ajout modification "conference" et plus dépliage type article (ex: conference [research-article])
                           12/04/2016 remonte du 2éme identifiant articleID en 1ere position
                           12/04/2016 ajout de relatedItem type otherVersion pour les erratum
                           19/04/2016 reprise date de publication pour les chapitres
                           09/05/2016 lodex: normalisation des codes <genre>
                           12/05/2016 ajout correction date de publication code 203
                           19/05/2016 reprise copyright au niveau d'article
                           26/05/2016 reprise lien erratum
                           31/05/2016 ajout type d'article 'announcement' normalisé en 'article' (beaux articles score 8)
                            20/06/2016 reprise des données en openAccess
                            04/07/2016 ajout relatedItem otherVersion pour signalement des erratums
                            04/08/2016 redressement langue erronée
    -->
    <!-- reformatage des données Springer DTD A++2.4.dtd (Common.dtd, Journal.dtd et Book.dtd)  vers MODS XSD MODS.v.3.6  -->
    <!-- ASPECTS  FONCTIONNELS :-->
    <!-- TOOK - MAJ du 31/12/2013 - revoir les roles avec des exemples structurés -->
    <!-- Indice et exposant "Superscript" "Subscript" -->
    <!-- Janvier 2014 - Titre brut en cdata placé dans "<titleInfo type="alternative">"suite demande J. Ducloy janvier 2014-->
    <!-- Janvier 2014 - Modif suite réunion J. Ducloy - identifiant utilisé par API web -->
    <!-- Septembre 2014 - Modif hierarchie des elements dans mods
        - Cas 2 - pas d'abstract connu - Modif abstract contenant "<UnorderedList Mark="Bullet">"-->

    <!-- ===============================================================================================
        Variable pour référencer les schémas MODS à utiliser pour vérification
        =====================================================================================================-->


    <!-- ==================================================================================================
        Début des templates
        ========================================================================================================-->

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
    <xsl:template match="Emphasis"><xsl:value-of select="concat(' ',.,' ')"/></xsl:template>
    <xsl:template match="Heading"><xsl:value-of select="concat('',.,': ')"/></xsl:template>
    <xsl:template match="ItemContent"><xsl:value-of select="concat('',.,'')"/></xsl:template>
    <xsl:template match="Para"><xsl:value-of select="concat(' ',.,' ')"/></xsl:template>
    <xsl:template match="/">
        <xsl:comment>
            <xsl:text>Version 0.11 générée le </xsl:text>
            <xsl:value-of select="$datecreation"/>
        </xsl:comment>
        <mods xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="version">
                <xsl:text>3.6</xsl:text>
            </xsl:attribute>
            <!-- ******************************** Titre niveau article ************************************-->
            <xsl:if test="//ArticleTitle | //ChapterTitle">
                <xsl:call-template name="Titre"/>
            </xsl:if>
            <xsl:if test="//Publisher/Book/BookInfo/BookTitle and not(//ChapterTitle)">
                <titleInfo xmlns="http://www.loc.gov/mods/v3">

                    <xsl:if test="//Publisher/Book/BookInfo/BookTitle">
                        <title xmlns="http://www.loc.gov/mods/v3">
                            <xsl:variable name="book">
                                <xsl:apply-templates select="//Publisher/Book/BookInfo/BookTitle"/>
                            </xsl:variable>
                            <xsl:value-of select="normalize-space($book)"/>
                        </title>
                        <xsl:if test="//Publisher/Book/BookInfo/BookSubTitle [string-length() &gt; 0 ]">
                            <subTitle xmlns="http://www.loc.gov/mods/v3">
                                <xsl:variable name="subbook">
                                    <xsl:apply-templates select="//Publisher/Book/BookInfo/BookSubTitle"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($subbook)"/>>
                            </subTitle>
                        </xsl:if>
                    </xsl:if>
                </titleInfo>
            </xsl:if>
            <xsl:if test="//Series/Book/BookInfo/BookTitle and not(//ChapterTitle)">
                <titleInfo xmlns="http://www.loc.gov/mods/v3">

                    <xsl:if test="//BookInfo/BookTitle">
                        <title xmlns="http://www.loc.gov/mods/v3">
                            <xsl:variable name="book">
                                <xsl:apply-templates select="//Series/Book/BookInfo/BookTitle"/>
                            </xsl:variable>
                            <xsl:value-of select="normalize-space($book)"/>
                        </title>
                        <xsl:if test="//Series/Book/BookInfo/BookSubTitle [string-length() &gt; 0 ]">
                            <subTitle xmlns="http://www.loc.gov/mods/v3">
                                <xsl:variable name="book">
                                    <xsl:apply-templates select="//Series/Book/BookInfo/BookSubTitle"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space($book)"/>
                            </subTitle>
                        </xsl:if>
                    </xsl:if>
                </titleInfo>
            </xsl:if>
            <!-- ==========================================================================================================================
                TRAITEMENTS DES AUTEURS AFFILIATIONS NIVEAU ARTICLE DE PERIODIQUES, MONOGRAPHIES EN SERIES, MONOGRAPHIES
                =============================================================================================================================== -->
            <!-- ************************************ Auteur personne morale niveau article ********************************-->
            <xsl:choose>
                <!-- Editeur personne morale-->
                <xsl:when test="//ArticleHeader/EditorGroup/InstitutionalEditor | //BookHeader/EditorGroup/InstitutionalEditor">
                    <xsl:for-each select="//InstitutionalEditor">
                        <name xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">corporate</xsl:attribute>
                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                <xsl:for-each select="//InstitutionalEditorName">
                                    <xsl:value-of select="normalize-space(.)"/>
                                </xsl:for-each>
                            </namePart>
                            <xsl:choose>
                                <xsl:when test="//@AffiliationIDS">
                                    <xsl:call-template name="Affiliation"/>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="//Contact/Email">
                                    <xsl:for-each select="Contact/Email">
                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </affiliation>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <!-- traitement des roles -->
                            <xsl:call-template name="role"/>
                            <!-- traitement des biographies -->
                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                <description xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:variable name="norm">
                                        <xsl:apply-templates select="Biography/FormalPara"/>
                                    </xsl:variable>
                                    <xsl:value-of select="normalize-space($norm)"/>
                                </description>
                            </xsl:if>
                        </name>
                    </xsl:for-each>
                </xsl:when>
                <!-- Auteur personne morale-->
                <xsl:when test="//ArticleHeader/AuthorGroup/InstitutionalAuthor | //BookHeader/AuthorGroup/InstitutionalAuthor">
                    <xsl:for-each select="//InstitutionalAuthor">
                        <name xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">corporate</xsl:attribute>
                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                <xsl:for-each select="InstitutionalAuthorName">
                                    <xsl:variable name="norm">
                                        <xsl:apply-templates select="."/>
                                    </xsl:variable>
                                    <xsl:value-of select="normalize-space($norm)"/>
                                </xsl:for-each>
                            </namePart>
                            <xsl:choose>
                                <xsl:when test="//@AffiliationIDS">
                                    <xsl:call-template name="Affiliation"/>
                                </xsl:when>
                            </xsl:choose>
                            <!-- traitement des biographies -->
                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                <description xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:variable name="norm">
                                        <xsl:apply-templates select="Biography/FormalPara"/>
                                    </xsl:variable>
                                    <xsl:value-of select="normalize-space($norm)"/>
                                </description>
                            </xsl:if>
                        </name>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>

            <!-- ********************** Auteurs niveau article + niveau article dans chapter + niveau monographie ********************************-->
            <!-- editeur -->
            <xsl:choose>
                <xsl:when test="//ArticleHeader/EditorGroup">
                    <xsl:for-each select="//Editor">
                        <name xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">personal</xsl:attribute>
                            <xsl:if test="@CorrespondingAffiliationID">
                                <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="EditorName/Prefix">
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                    <xsl:apply-templates select="EditorName/Prefix"/>
                                </namePart>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="EditorName/GivenName">
                                    <xsl:choose>
                                        <xsl:when test="EditorName/GivenName">
                                            <xsl:for-each select="EditorName/GivenName">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">given</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </namePart>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="EditorName/FamilyName">
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">family</xsl:attribute>
                                    <xsl:if test="EditorName/NativeName">
                                        <xsl:attribute name="transliteration">
                                            <xsl:value-of select="normalize-space(EditorName/NativeName)" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="EditorName/Particule">
                                        <xsl:for-each select="EditorName/Particle">
                                            <xsl:value-of select="normalize-space(.)"/>
                                            <xsl:text> </xsl:text>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:for-each select="EditorName/FamilyName">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:for-each>
                                    <xsl:if test="EditorName/Suffix">
                                        <xsl:for-each select="EditorName/Suffix">
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </xsl:if>
                                </namePart>
                            </xsl:if>
                            <xsl:if test="EditorName/Degrees">
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                    <xsl:for-each select="EditorName/Degrees">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:for-each>
                                </namePart>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="@AffiliationIDS">
                                    <xsl:call-template name="Affiliation"/>
                                </xsl:when>
                            </xsl:choose>
                            <!-- traitement des roles -->
                            <xsl:call-template name="role2"/>
                            <!-- traitement des biographies -->
                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                <description xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                </description>
                            </xsl:if>
                        </name>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
            <!-- *********************************** Auteurs niveau article + niveau thema dans chapter ********************************-->
            <!-- auteur -->
            <xsl:choose>
                <xsl:when test="//ArticleHeader/AuthorGroup | //ChapterHeader/AuthorGroup">
                    <xsl:call-template name="AuthorArticleChapter"/>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="//Publisher/Book">
                <xsl:if test="not(//ChapterHeader/EditorGroup) or not(//ChapterHeader/AuthorGroup) ">
                    <xsl:if test="//Book/BookHeader/EditorGroup">
                        <xsl:for-each select="//Editor">
                            <name xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">personal</xsl:attribute>
                                <xsl:if test="@CorrespondingAffiliationID">
                                    <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="EditorName/Prefix">
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                        <xsl:for-each select="EditorName/Prefix">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </namePart>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="EditorName/GivenName">
                                        <xsl:choose>
                                            <xsl:when test="EditorName/GivenName">
                                                <xsl:for-each select="EditorName/GivenName">
                                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                                        <xsl:attribute name="type">given</xsl:attribute>
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </namePart>
                                                </xsl:for-each>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">family</xsl:attribute>
                                    <xsl:if test="EditorName/NativeName">
                                        <xsl:attribute name="transliteration">
                                            <xsl:value-of select="normalize-space(EditorName/NativeName)"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:for-each select="EditorName/Particle">
                                        <xsl:value-of select="normalize-space(.)"/>
                                        <xsl:text> </xsl:text>
                                    </xsl:for-each>
                                    <xsl:for-each select="EditorName/FamilyName">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:for-each>
                                    <xsl:if test="EditorName/Suffix">
                                        <xsl:for-each select="EditorName/Suffix">
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </xsl:if>
                                </namePart>
                                <xsl:if test="EditorName/Degrees">
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                        <xsl:for-each select="EditorName/Degrees">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </namePart>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="EditorName/Contact/Email">
                                        <xsl:for-each select="Contact/Email">
                                            <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:text>E-mail: </xsl:text>
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </affiliation>
                                        </xsl:for-each>
                                    </xsl:when>
                                </xsl:choose>
                                <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                                <xsl:choose>
                                    <xsl:when test="@AffiliationIDS">
                                        <xsl:call-template name="Affiliation"/>
                                    </xsl:when>
                                </xsl:choose>
                                <!-- role-->
                                <xsl:call-template name="role2"/>
                                <!-- traitement des biographies -->
                                <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                    <description xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                    </description>
                                </xsl:if>
                            </name>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:if>
            </xsl:if>
            <!-- Traitement des auteurs MONO sans chapter -->
            <xsl:choose>
                <xsl:when test="//Book/BookHeader/AuthorGroup and not(//ChapterHeader/AuthorGroup | //ChapterHeader/EditorGroup)">
                    <xsl:for-each select="//Book/BookHeader/AuthorGroup/Author">
                        <name xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">personal</xsl:attribute>
                            <xsl:if test="@CorrespondingAffiliationID">
                                <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="AuthorName/Prefix">
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                    <xsl:for-each select="AuthorName/Prefix">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:for-each>
                                </namePart>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="AuthorName/GivenName">
                                    <xsl:choose>
                                        <xsl:when test="AuthorName/GivenName">
                                            <xsl:for-each select="AuthorName/GivenName">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">given</xsl:attribute>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </namePart>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                            </xsl:choose>
                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">family</xsl:attribute>
                                <xsl:if test="AuthorName/NativeName">
                                    <xsl:attribute name="transliteration">
                                        <xsl:value-of select="normalize-space(AuthorName/NativeName)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:for-each select="AuthorName/Particle">
                                    <xsl:value-of select="normalize-space(.)"/>
                                    <xsl:text> </xsl:text>
                                </xsl:for-each>
                                <xsl:for-each select="AuthorName/FamilyName">
                                    <xsl:value-of select="normalize-space(.)"/>
                                </xsl:for-each>
                                <xsl:if test="AuthorName/Suffix">
                                    <xsl:for-each select="AuthorName/Suffix">
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:for-each>
                                </xsl:if>
                            </namePart>
                            <xsl:if test="AuthorName/Degrees">
                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                    <xsl:for-each select="AuthorName/Degrees">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:for-each>
                                </namePart>
                            </xsl:if>
                            <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                            <xsl:choose>
                                <xsl:when test="//Book/BookHeader/AuthorGroup/Author/@AffiliationIDS">
                                    <xsl:call-template name="Affiliation"/>
                                </xsl:when>
                            </xsl:choose>
                            <!-- traitement des biographies -->
                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                <description xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                </description>
                            </xsl:if>
                        </name>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
            <!-- ==========================================================================================================================
                FIN  -  TRAITEMENTS DES AUTEURS AFFILIATIONS NIVEAU ARTICLE DE PERIODIQUES, MONOGRAPHIES EN SERIES, MONOGRAPHIES
                =============================================================================================================================== -->
            <!-- **************************************** type de la ressource ***********************************-->
            <typeOfResource>
                <xsl:text>text</xsl:text>
            </typeOfResource>

            <!-- **************************************** genre de la ressource ***********************************-->
            <xsl:variable name="codeGenre1">
                <xsl:value-of select="//ArticleInfo/@ArticleType | //Series/Book/Chapter/ChapterInfo/@ChapterType | //Series/Book/Part/Chapter/ChapterInfo/@ChapterType| //Publisher/Book/Chapter/ChapterInfo/@ChapterType | //Publisher/Book/Part/Chapter/ChapterInfo/@ChapterType"/>
            </xsl:variable>
            <xsl:variable name="codeGenre">
                <xsl:choose>
                    <xsl:when test="normalize-space($codeGenre1)='OriginalPaper'">research-article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='Article'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='Report'">research-article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='Letter'">review-article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='Legacy'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='News'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='ContinuingEducation'">article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='ReviewPaper'">review-article</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='BriefCommunication'">brief-communication</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='EditorialNotes'">editorial</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='BookReview'">book-reviews</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='Abstract'">abstract</xsl:when>
                    <xsl:when test="normalize-space($codeGenre1)='CaseReport'">case-report</xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="normalize-space($codeGenre1)='Announcement' and //Abstract[string-length()&gt; 0]">article</xsl:when>
                            <xsl:otherwise>other</xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:if test="//BookBackmatter">
                <genre xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">other</xsl:attribute>
                    <xsl:attribute name="displayLabel">book-backmatter</xsl:attribute>
                </genre>
            </xsl:if>
            <xsl:if test="//BookFrontmatter">
                <genre xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">other</xsl:attribute>
                    <xsl:attribute name="displayLabel">book-frontmatter</xsl:attribute>
                </genre>
            </xsl:if>
            <xsl:if test="//ArticleInfo/@ArticleType[string-length()&gt; 0]">
                <genre xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">
                        <xsl:value-of select="normalize-space($codeGenre)"/>
                    </xsl:attribute>
                    <xsl:attribute name="displayLabel">
                        <xsl:value-of select="normalize-space($codeGenre1)"/>
                    </xsl:attribute>
                </genre>
            </xsl:if>
            <xsl:if test="//Series/Book/Chapter/ChapterInfo/@ChapterType[string-length()&gt; 0]">
                <genre xmlns="http://www.loc.gov/mods/v3">
                    <xsl:choose>
                        <xsl:when test="//Series/Book/BookInfo[@BookProductType='Proceedings']">
                            <xsl:attribute name="type">conference</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="type">
                                <xsl:value-of select="normalize-space($codeGenre)"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:attribute name="displayLabel">
                        <xsl:value-of select="normalize-space($codeGenre1)"/>
                    </xsl:attribute>
                </genre>
            </xsl:if>
            <xsl:if test="//Series/Book/Part/Chapter/ChapterInfo/@ChapterType[string-length()&gt; 0]">
                <genre xmlns="http://www.loc.gov/mods/v3">
                    <xsl:choose>
                        <xsl:when test="//Series/Book/BookInfo[@BookProductType='Proceedings']">
                            <xsl:attribute name="type">conference</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="type">
                                <xsl:value-of select="normalize-space($codeGenre)"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:attribute name="displayLabel">
                        <xsl:value-of select="normalize-space($codeGenre1)"/>
                    </xsl:attribute>
                </genre>
            </xsl:if>
            <xsl:if test="//Publisher/Book[string-length()&gt; 0]">
                <genre xmlns="http://www.loc.gov/mods/v3">
                    <xsl:choose>
                        <xsl:when test="//Publisher/Book/BookInfo[@BookProductType='Proceedings']">
                            <xsl:attribute name="type">conference</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="type">chapter</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:attribute name="displayLabel">
                        <xsl:value-of select="normalize-space($codeGenre1)"/>
                    </xsl:attribute>
                </genre>
            </xsl:if>

            <!-- ****************************** OriginInfo ********************************-->
            <originInfo xmlns="http://www.loc.gov/mods/v3">
                <xsl:if test="//PublisherName[string-length()&gt; 0]">
                    <publisher xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="normalize-space(//PublisherName)"/>
                        <xsl:if test="//CoPublisher">
                            <xsl:text>; </xsl:text>
                            <xsl:value-of select="//CoPublisher"/>
                        </xsl:if>
                        <xsl:if test="//PublisherURL">
                            <xsl:text>; </xsl:text>
                            <xsl:value-of select="//PublisherURL"/>
                        </xsl:if>
                    </publisher>
                </xsl:if>
                <xsl:if test="//PublisherLocation[string-length() &gt; 0]">
                    <place xmlns="http://www.loc.gov/mods/v3">
                        <placeTerm xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">text</xsl:attribute>
                            <xsl:value-of select="normalize-space(//PublisherLocation)"/>
                        </placeTerm>
                    </place>
                </xsl:if>
                <xsl:if test="//ArticleHistory/Received[string-length()&gt; 0]">
                    <dateCreated xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                        <xsl:value-of select="//ArticleHistory/Received/Year"/>
                        <xsl:variable name="month">
                            <xsl:value-of select="//ArticleHistory/Received/Month"/>
                        </xsl:variable>
                        <xsl:variable name="day">
                            <xsl:value-of select="//ArticleHistory/Received/Day"/>
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
                            <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="format-number($month,'00')"/></xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="//ArticleHistory/Received/Day">
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="format-number($day,'00')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>-01</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </dateCreated>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="//ArticleHistory/CoverDate/Year[string-length()&gt; 0]">
                        <dateIssued xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:value-of select="//ArticleHistory/CoverDate/Year"/>
                            <xsl:variable name="month">
                                <xsl:value-of select="//ArticleHistory/CoverDate/Month"/>
                            </xsl:variable>
                            <xsl:variable name="day">
                                <xsl:value-of select="//ArticleHistory/CoverDate/Day"/>
                            </xsl:variable>
                            <xsl:if test="$month">
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
                                    <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="format-number($month,'00')"/></xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="//ArticleHistory/CoverDate/Day">
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="format-number($day,'00')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>-01</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </dateIssued>
                    </xsl:when>
                    <xsl:when test="//IssueHistory/CoverDate/Year[string-length()&gt; 0]">
                        <dateIssued xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:value-of select="//IssueHistory/CoverDate/Year"/>
                            <xsl:variable name="month">
                                <xsl:value-of select="//IssueHistory/CoverDate/Month"/>
                            </xsl:variable>
                            <xsl:variable name="day">
                                <xsl:value-of select="//IssueHistory/CoverDate/Day"/>
                            </xsl:variable>
                            <xsl:if test="$month">
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
                                    <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="format-number($month,'00')"/></xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="//IssueHistory/CoverDate/Day">
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="format-number($day,'00')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>-01</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </dateIssued>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="//ChapterHistory/OnlineDate/Year[string-length()&gt; 0]">
                        <xsl:choose>
                            <xsl:when test="//ChapterHistory/OnlineDate[string-length()&gt; 0]">
                                <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:value-of select="//ChapterHistory/OnlineDate/Year"/>
                                    <xsl:variable name="month">
                                        <xsl:value-of select="//ChapterHistory/OnlineDate/Month"/>
                                    </xsl:variable>
                                    <xsl:variable name="day">
                                        <xsl:value-of select="//ChapterHistory/OnlineDate/Day"/>
                                    </xsl:variable>
                                    <xsl:if test="$month">
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
                                            <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="format-number($month,'00')"/></xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="//ChapterHistory/OnlineDate/Day">
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="format-number($day,'00')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>-01</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </dateIssued>
                            </xsl:when>
                            <xsl:otherwise>
                                <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:value-of select="//ChapterHistory/CoverDate/Year"/>
                                    <xsl:variable name="month">
                                        <xsl:value-of select="//ChapterHistory/CoverDate/Month"/>
                                    </xsl:variable>
                                    <xsl:variable name="day">
                                        <xsl:value-of select="//ChapterHistory/CoverDate/Day"/>
                                    </xsl:variable>
                                    <xsl:if test="$month">
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
                                            <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="format-number($month,'00')"/></xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="//ChapterHistory/CoverDate/Day">
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="format-number($day,'00')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>-01</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </dateIssued>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="//ChapterCopyright/CopyrightYear[string-length()&gt; 0]">
                            <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                <xsl:value-of select="//ChapterCopyright/CopyrightYear"/>
                            </dateIssued>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="//ArticleCopyright/CopyrightYear[string-length()&gt; 0]|//ChapterCopyright/CopyrightYear[string-length()&gt; 0]">
                        <copyrightDate xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="number(//ArticleCopyright/CopyrightYear|//ChapterCopyright/CopyrightYear)">
                                    <xsl:choose>
                                        <xsl:when test="//ArticleDOI|//ChapterDOI='10.1007/3-540-36415-3_27'">2003</xsl:when>
                                        <xsl:when test="//ArticleDOI|//ChapterDOI='10.1007/3-540-36413-7_14'">2003</xsl:when>
                                        <xsl:when test="//ArticleDOI|//ChapterDOI='10.1007/3-540-36413-7_17'">2003</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="number(//ArticleCopyright/CopyrightYear|//ChapterCopyright/CopyrightYear)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="number(//CoverDate/Year)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </copyrightDate>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="//CopyrightYear[string-length()&gt; 0]">
                            <copyrightDate xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                <xsl:value-of select="//CopyrightYear"/>
                            </copyrightDate>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="//ArticleCopyright/CopyrightYear | //ChapterCopyright/CopyrightYear">

                </xsl:if>
                <!-- niveau Book -->
                <xsl:if test="//Publisher/Book/BookInfo and not(//ChapterTitle)">
                    <xsl:if test="//Book/BookInfo">
                        <xsl:if test="//Book/BookInfo/BookCopyright/CopyrightYear[string-length()&gt; 0]">
                            <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                <xsl:value-of select="//Book/BookInfo/BookCopyright/CopyrightYear"/>
                            </dateIssued>
                            <copyrightDate xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                <xsl:value-of select="//Book/BookInfo/BookCopyright/CopyrightYear"/>
                            </copyrightDate>
                        </xsl:if>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="//Publisher/Book and not(//ChapterTitle)">
                    <!-- ******************* <issuance xmlns="http://www.loc.gov/mods/v3">  Definition: a term that designates how the resource is issued. **************** -->
                    <issuance xmlns="http://www.loc.gov/mods/v3">monographic</issuance>
                </xsl:if>
            </originInfo>
            <!-- **********************
                Language niveau article
                ****************************-->
            <xsl:if test="//ArticleInfo/@Language[string-length()&gt; 0] | //BookInfo/@Language[string-length()&gt; 0]">
                <language xmlns="http://www.loc.gov/mods/v3">
                    <languageTerm xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">code</xsl:attribute>
                        <xsl:attribute name="authority">rfc3066</xsl:attribute>
                        <xsl:variable name="codeLang">
                            <xsl:value-of select="translate(//ArticleInfo/@Language| //BookInfo/@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$codeLang"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </languageTerm>
                    <languageTerm xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">code</xsl:attribute>
                        <xsl:attribute name="authority">iso639-2b</xsl:attribute>
                        <xsl:variable name="codeLang1">
                            <xsl:value-of select="translate(//ArticleInfo/@Language| //BookInfo/@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                        </xsl:variable>
                        <xsl:variable name="codeLang">
                            <xsl:choose>
                                <xsl:when test="//ArticleDOI='10.1007/BF02584710'">por</xsl:when>
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
                        <xsl:value-of select="$codeLang"/>
                    </languageTerm>
                </language>
            </xsl:if>
            <!-- **************************
                PhysicalDescription
                ********************************-->
            <physicalDescription xmlns="http://www.loc.gov/mods/v3">
                <internetMediaType xmlns="http://www.loc.gov/mods/v3">
                    <xsl:text>text/html</xsl:text>
                </internetMediaType>
            </physicalDescription>
            <!-- **************************************************
                Résumé niveau article
                ********************************************************-->
            <xsl:if test="not(//Para/UnorderedList[@Mark='Bullet'])">
                <xsl:for-each select="//Abstract">
                    <abstract xmlns="http://www.loc.gov/mods/v3">
                        <xsl:if test="@Language">
                            <xsl:attribute name="lang">
                                <xsl:variable name="codeLang">
                                    <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                </xsl:variable>
                                <xsl:value-of select="$codeLang"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:variable name="ab">
                            <xsl:apply-templates select="."/>
                        </xsl:variable>
                        <xsl:value-of select="normalize-space($ab)"/>
                    </abstract>
                </xsl:for-each>
            </xsl:if>
            <!-- NOTE -->
            <!-- **************************** note ********************************* -->
            <xsl:choose>
                <xsl:when test="//ArticleInfo/ArticleCategory[string-length()&gt; 0]">
                    <note xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="normalize-space(//ArticleInfo/ArticleCategory)"/>
                        <xsl:if test="//ArticleInfo/ArticleSubCategory[string-length()&gt; 0]">
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="//ArticleInfo/ArticleSubCategory"/>
                        </xsl:if>
                    </note>
                </xsl:when>
                <xsl:when test="//ArticleInfo/ArticleCategory[string-length()&gt; 0]">
                    <xsl:for-each select="//ArticleInfo/ArticleCategory">
                        <note xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of select="normalize-space(.)"/>
                        </note>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>

            <xsl:if test="//Abstract/Para/UnorderedList[@Mark='Bullet']">
                <xsl:for-each select="//Abstract/Para/UnorderedList[@Mark='Bullet']/ItemContent/Para">
                    <note xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">
                            <xsl:text>content</xsl:text>
                        </xsl:attribute>
                        <xsl:variable name="note">
                            <xsl:apply-templates select="."/>
                        </xsl:variable>
                        <xsl:value-of select="normalize-space($note)"/>
                    </note>
                </xsl:for-each>
            </xsl:if>
            <!-- ******************************************************************
                Mots clés niveau article
                ************************************************************************-->
            <xsl:if test="//KeywordGroup">
                <xsl:choose>
                    <xsl:when test="//KeywordGroup[string-length() &gt; 0 ]">
                        <xsl:for-each select="//KeywordGroup">
                            <xsl:choose>
                                <xsl:when test="contains(Heading,'Classification')">
                                    <xsl:variable name="Heading">
                                        <xsl:value-of select="Heading"/>
                                    </xsl:variable>
                                    <xsl:for-each select="Keyword">
                                        <classification xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:choose>
                                                <!-- ne pas ouvrir @lang si @Language="_ _" -->
                                                <xsl:when test="contains(@Language,'--')"/>
                                                <xsl:otherwise>
                                                    <xsl:if test="@Language">
                                                        <xsl:attribute name="lang">
                                                            <xsl:variable name="codeLang">
                                                                <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                            </xsl:variable>
                                                            <xsl:value-of select="$codeLang"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:attribute name="displayLabel">
                                                <xsl:value-of select="$Heading"/>
                                            </xsl:attribute>
                                            <xsl:apply-templates select="."/>
                                        </classification>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:when test="contains(@Language,'--') and not(contains(Heading,'Keywords'))">
                                    <xsl:variable name="Heading">
                                        <xsl:value-of select="Heading"/>
                                    </xsl:variable>
                                    <xsl:for-each select="Keyword">
                                        <classification xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="displayLabel">
                                                <xsl:value-of select="$Heading"/>
                                            </xsl:attribute>
                                            <xsl:apply-templates select="."/>
                                        </classification>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!--<subject xmlns="http://www.loc.gov/mods/v3">
                                          <xsl:choose>
                                              <xsl:when test="contains(@Language,'- -')"/>
                                              <xsl:otherwise>
                                                  <xsl:if test="@Language">
                                                      <xsl:attribute name="lang">
                                                          <xsl:variable name="codeLang">
                                                              <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                          </xsl:variable>
                                                          <xsl:value-of select="$codeLang"/>
                                                      </xsl:attribute>
                                                  </xsl:if>
                                              </xsl:otherwise>
                                          </xsl:choose>
                                          <xsl:if test="Heading">
                                              <genre xmlns="http://www.loc.gov/mods/v3">
                                                  <xsl:value-of select="Heading"/>
                                              </genre>
                                          </xsl:if>
                                          <xsl:for-each select="Keyword">
                                              <topic xmlns="http://www.loc.gov/mods/v3">
                                                  <xsl:variable name="kwd">
                                                      <xsl:apply-templates select="."/>
                                                  </xsl:variable>
                                                  <xsl:value-of select="normalize-space($kwd)"/>
                                              </topic>
                                          </xsl:for-each>
                                          </subject>  -->
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="//AbbreviationGroup[string-length() &gt; 0 ]">
                        <xsl:for-each select="//AbbreviationGroup">
                            <subject xmlns="http://www.loc.gov/mods/v3">
                                <xsl:if test="Heading">
                                    <genre xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="Heading"/>
                                    </genre>
                                </xsl:if>
                                <xsl:for-each select="DefinitionList/DefinitionListEntry">
                                    <topic xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:apply-templates select="Term"/>
                                        <xsl:if test="Description/Para">
                                            <xsl:text> : </xsl:text>
                                            <xsl:value-of select="normalize-space(Description/Para)"/>
                                        </xsl:if>
                                    </topic>
                                </xsl:for-each>
                            </subject>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>

            <!-- ********************************** Mots Clés niveau série MONO*******************************-->
            <xsl:if test="//Publisher/Book/BookInfo/BookSubjectGroup and not(//ChapterTitle)">
                <xsl:choose>
                    <xsl:when test="//Publisher/Book/BookInfo/BookSubjectGroup/BookSubject/@Code[string-length() &gt; 0 ]">
                        <subject xmlns="http://www.loc.gov/mods/v3">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:text>Book-Subject-Group</xsl:text>
                            </genre>
                            <xsl:for-each select="//Publisher/Book/BookInfo/BookSubjectGroup/BookSubject">
                                <topic xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:if test="@Code">
                                        <xsl:attribute name="authority">SpringerSubjectCodes</xsl:attribute>
                                        <xsl:attribute name="authorityURI">
                                            <xsl:value-of select="@Code"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="normalize-space(.)"/>
                                </topic>
                            </xsl:for-each>
                        </subject>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="//Publisher/Book/BookInfo/BookSubjectGroup[string-length() &gt; 0 ]">
                            <subject xmlns="http://www.loc.gov/mods/v3">
                                <xsl:for-each select="//Book/BookInfo/BookSubjectGroup/BookSubject">
                                    <xsl:if test="contains(@Type,'Primary')">
                                        <genre xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </genre>
                                    </xsl:if>
                                    <xsl:if test="contains(@Type,'Secondary')">
                                        <topic xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </topic>
                                    </xsl:if>
                                </xsl:for-each>
                            </subject>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <!-- *****************************************************************
                relatedItem (niveau book et journal)
                *************************************************************************-->
            <xsl:if test="//JournalInfo/JournalTitle[string-length() &gt; 0 ] or //Book[string-length() &gt; 0 ]">
                <relatedItem xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">host</xsl:attribute>
                    <!-- ********************************* Titre du journal ************************-->
                    <titleInfo xmlns="http://www.loc.gov/mods/v3">

                        <xsl:if test="//JournalInfo/JournalTitle | //BookInfo/BookTitle">
                            <xsl:variable name="ttl">
                                <xsl:apply-templates select="//JournalInfo/JournalTitle | //BookInfo/BookTitle"/>
                            </xsl:variable>
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:choose>
                                    <xsl:when test="normalize-space($ttl)='J Biosci'">Journal of Biosciences</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space($ttl)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </title>
                            <xsl:variable name="subttl">
                                <xsl:apply-templates select="//JournalInfo/JournalSubTitle |//BookInfo/BookSubTitle"/>
                            </xsl:variable>
                            <xsl:if test="//JournalInfo/JournalSubTitle [string-length() &gt; 0 ]|//BookInfo/BookSubTitle[string-length() &gt; 0 ]">
                                <subTitle xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space($subttl)"/>
                                </subTitle>
                            </xsl:if>
                        </xsl:if>
                    </titleInfo>
                    <!-- ********************************* Titre du journal en abrégé ************************-->
                    <xsl:if test="//JournalAbbreviatedTitle[string-length() &gt; 0 ]">
                        <titleInfo xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">abbreviated</xsl:attribute>
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:apply-templates select="//JournalAbbreviatedTitle"/>
                            </title>
                        </titleInfo>
                    </xsl:if>
                    <!-- ==========================================================================================================================
                        TRAITEMENTS DES AUTEURS/EDITEURS/AFFILIATIONS NIVEAU SERIE, MONOGRAPHIES EN SERIES, MONOGRAPHIES
                        =============================================================================================================================== -->
                    <!-- *********************************** Editeur personne morale niveau série *************************************-->
                    <!-- editeur -->
                    <xsl:choose>
                        <xsl:when test="//Book/BookHeader/EditorGroup/InstitutionalEditor| //Issue/IssueHeader/EditorGroup/InstitutionalEditor">
                            <xsl:for-each select="//InstitutionalEditor">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:for-each select="InstitutionalEditorName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </namePart>
                                    <xsl:choose>
                                        <xsl:when test="Contact/Email">
                                            <xsl:for-each select="Contact/Email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:apply-templates select="."/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                    <!-- traitement des roles -->
                                    <xsl:call-template name="role2"/>
                                    <!-- traitement des biographies -->
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- InstitutionalAuthor -->
                    <xsl:choose>
                        <xsl:when test="//Book/BookHeader/AuthorGroup/InstitutionalAuthor| //Issue/IssueHeader/AuthorGroup/InstitutionalAuthor">
                            <xsl:for-each select="//InstitutionalAuthor">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:for-each select="InstitutionalAuthorName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </namePart>
                                    <xsl:choose>
                                        <xsl:when test="Contact/Email">
                                            <xsl:for-each select="Contact/Email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- traitement des roles -->
                                    <xsl:call-template name="role"/>
                                    <!-- traitement des biographies -->
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- *************************************************** Editeurs ********************************************-->
                    <xsl:choose>
                        <xsl:when test="//Book/BookHeader/EditorGroup| //Issue/IssueHeader/EditorGroup">
                            <xsl:for-each select="//Book/BookHeader/EditorGroup/Editor | //Issue/IssueHeader/EditorGroup/Editor">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">personal</xsl:attribute>
                                    <xsl:if test="@CorrespondingAffiliationID">
                                        <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="EditorName/Prefix">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="EditorName/Prefix">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="EditorName/GivenName">
                                            <xsl:choose>
                                                <xsl:when test="EditorName/GivenName">
                                                    <xsl:for-each select="EditorName/GivenName">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                    </xsl:choose>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">family</xsl:attribute>
                                        <xsl:if test="EditorName/NativeName">
                                            <xsl:attribute name="transliteration">
                                                <xsl:value-of select="normalize-space(EditorName/NativeName)"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:for-each select="EditorName/Particle">
                                            <xsl:value-of select="normalize-space(.)"/>
                                            <xsl:text> </xsl:text>
                                        </xsl:for-each>
                                        <xsl:for-each select="EditorName/FamilyName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                        <xsl:if test="EditorName/Suffix">
                                            <xsl:for-each select="EditorName/Suffix">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </namePart>
                                    <xsl:if test="EditorName/Degrees">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="EditorName/Degrees">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="EditorName/Contact/Email">
                                            <xsl:for-each select="EditorName/Contact/Email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                                    <xsl:choose>
                                        <xsl:when test="@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- role-->
                                    <xsl:call-template name="role2"/>
                                    <!-- traitement des biographies -->
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- Author -->
                    <xsl:choose>
                        <xsl:when test="//Book/BookHeader/AuthorGroup| //Issue/IssueHeader/AuthorGroup">
                            <xsl:for-each select="//Book/BookHeader/AuthorGroup/Author | //Issue/IssueHeader/AuthorGroup/Author">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">personal</xsl:attribute>
                                    <xsl:if test="@CorrespondingAffiliationID">
                                        <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="AuthorName/Prefix">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="AuthorName/Prefix">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="AuthorName/GivenName">
                                            <xsl:choose>
                                                <xsl:when test="AuthorName/GivenName">
                                                    <xsl:for-each select="AuthorName/GivenName">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                    </xsl:choose>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">family</xsl:attribute>
                                        <xsl:if test="AuthorName/NativeName">
                                            <xsl:attribute name="transliteration">
                                                <xsl:value-of select="normalize-space(AuthorName/NativeName)"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:for-each select="AuthorName/Particle">
                                            <xsl:value-of select="normalize-space(.)"/>
                                            <xsl:text> </xsl:text>
                                        </xsl:for-each>
                                        <xsl:for-each select="AuthorName/FamilyName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                        <xsl:if test="AuthorName/Suffix">
                                            <xsl:for-each select="AuthorName/Suffix">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </namePart>
                                    <xsl:if test="AuthorName/Degrees">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="AuthorName/Degrees">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                                    <xsl:choose>
                                        <xsl:when test="//Book/BookHeader/AuthorGroup/Author/@AffiliationIDS | //Issue/IssueHeader/AuthorGroup/Author/@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- traitement des biographies -->
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- ****************************************** Genre niveau host ************************************-->
                    <xsl:choose>
                        <xsl:when test="contains(//JournalInfo/@JournalProductType,'NonStandardArchiveJournal')">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">journal</xsl:attribute>
                                <xsl:attribute name="displayLabel">Non Standard Archive Journal</xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="contains(//JournalInfo/@JournalProductType,'ArchiveJournal')">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">journal</xsl:attribute>
                                <xsl:attribute name="displayLabel">Archive Journal</xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="Publisher/Book and contains(//Book/BookInfo/@BookProductType,'NonStandardArchiveJournal')">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book</xsl:attribute>
                                <xsl:attribute name="displayLabel">Non Standard Archive Journal</xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="Publisher/Book and contains(//BookInfo/@BookProductType,'ArchiveJournal')">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book</xsl:attribute>
                                <xsl:attribute name="displayLabel">Archive Journal</xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="Publisher/Series and contains(//Book/BookInfo/@BookProductType,'NonStandardArchiveJournal')">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book-series</xsl:attribute>
                                <xsl:attribute name="displayLabel">Non Standard Archive Journal</xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="Publisher/Series and contains(//BookInfo/@BookProductType,'ArchiveJournal')">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book-series</xsl:attribute>
                                <xsl:attribute name="displayLabel">ArchiveJournal</xsl:attribute>
                            </genre>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="Publisher/Series and //Book/BookInfo/@BookProductType[string-length()&gt; 0]">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book-series</xsl:attribute>
                                <xsl:attribute name="displayLabel">
                                    <xsl:value-of select="normalize-space(//Book/BookInfo/@BookProductType)"/>
                                </xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="Publisher/Book and //Book/BookInfo/@BookProductType[string-length()&gt; 0]">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book</xsl:attribute>
                                <xsl:attribute name="displayLabel">
                                    <xsl:value-of select="//Book/BookInfo/@BookProductType"/>
                                </xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="Publisher/Series and //Book/BookInfo/@MediaType[string-length()&gt; 0]">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book-series</xsl:attribute>
                                <xsl:attribute name="displayLabel">
                                    <xsl:value-of select="//Book/BookInfo/@MediaType"/>
                                </xsl:attribute>
                            </genre>
                        </xsl:when>
                        <xsl:when test="Publisher/Book and //Book/BookInfo/@MediaType[string-length()&gt; 0]">
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">book</xsl:attribute>
                                <xsl:attribute name="displayLabel">
                                    <xsl:value-of select="//Book/BookInfo/@MediaType"/>
                                </xsl:attribute>
                            </genre>
                        </xsl:when>
                    </xsl:choose>
                    <!-- ****************************************** OriginInfo niveau série ********************************-->
                    <originInfo xmlns="http://www.loc.gov/mods/v3">
                        <!-- ********************** Date Issued Article périodique ******************-->
                        <xsl:if test="//Journal">
                            <xsl:choose>
                                <xsl:when test="//IssueHistory/OnlineDate[string-length()&gt; 0]">
                                    <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                        <xsl:value-of select="//IssueHistory/OnlineDate/Year"/>
                                        <xsl:variable name="month">
                                            <xsl:value-of select="//IssueHistory/OnlineDate/Month"/>
                                        </xsl:variable>
                                        <xsl:variable name="day">
                                            <xsl:value-of select="//IssueHistory/OnlineDate/Day"/>
                                        </xsl:variable>
                                        <xsl:if test="$month">
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
                                                <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="format-number($month,'00')"/></xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <xsl:choose>
                                            <xsl:when test="//IssueHistory/OnlineDate/Day">
                                                <xsl:text>-</xsl:text>
                                                <xsl:value-of select="format-number($day,'00')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>-01</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </dateIssued>
                                </xsl:when>
                                <xsl:otherwise>
                                    <dateIssued xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                        <xsl:value-of select="//IssueHistory/CoverDate/Year"/>
                                        <xsl:variable name="month">
                                            <xsl:value-of select="//IssueHistory/CoverDate/Month"/>
                                        </xsl:variable>
                                        <xsl:variable name="day">
                                            <xsl:value-of select="//IssueHistory/CoverDate/Day"/>
                                        </xsl:variable>
                                        <xsl:if test="$month">
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
                                                <xsl:otherwise><xsl:text>-</xsl:text><xsl:value-of select="format-number($month,'00')"/></xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <xsl:choose>
                                            <xsl:when test="//IssueHistory/CoverDate/Day">
                                                <xsl:text>-</xsl:text>
                                                <xsl:value-of select="format-number($day,'00')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>-01</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </dateIssued>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="//IssueCopyright/CopyrightYear">
                                <copyrightDate xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="number(//IssueCopyright/CopyrightYear)">
                                            <xsl:value-of select="number(//IssueCopyright/CopyrightYear)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="number(//CoverDate/Year)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </copyrightDate>
                            </xsl:if>
                        </xsl:if>
                        <!-- niveau Book -->
                        <xsl:if test="//Book/BookInfo">
                            <xsl:if test="//Book/BookInfo/BookCopyright/CopyrightYear[string-length()&gt; 0]">

                                <copyrightDate xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:value-of select="//Book/BookInfo/BookCopyright/CopyrightYear"/>
                                </copyrightDate>
                            </xsl:if>
                        </xsl:if>
                        <!-- ********************************** Copyright niveau Book ***********************************-->
                        <xsl:if test="//Book">
                            <!-- ******************* <issuance xmlns="http://www.loc.gov/mods/v3">  Definition: a term that designates how the resource is issued. **************** -->
                            <issuance xmlns="http://www.loc.gov/mods/v3">monographic</issuance>
                        </xsl:if>
                        <!-- Ajout de l'édition en subtitle - revised edition - pour les monographies -->
                        <xsl:if test="//Book/BookInfo/BookEdition[string-length() &gt; 0 ]">
                            <edition xmlns="http://www.loc.gov/mods/v3">
                                <xsl:apply-templates select="//Book/BookInfo/BookEdition"/>
                            </edition>
                        </xsl:if>
                    </originInfo>
                    <!-- ********************************** Mots Clés niveau série *******************************-->
                    <!-- ********************************** 19/09/2014 réécriture avec insertion code *******************************-->
                    <xsl:choose>
                        <xsl:when test="//JournalSubjectGroup/SubjectCollection/@Code[string-length() &gt; 0 ]">
                            <subject xmlns="http://www.loc.gov/mods/v3">
                                <genre xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>Journal-Subject-Collection</xsl:text>
                                </genre>
                                <xsl:for-each select="//JournalSubjectGroup/SubjectCollection">
                                    <topic xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="@Code">
                                            <xsl:attribute name="authority">SpringerSubjectCodes</xsl:attribute>
                                            <xsl:attribute name="authorityURI">
                                                <xsl:value-of select="@Code"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </topic>
                                </xsl:for-each>
                            </subject>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="//JournalSubjectGroup/SubjectCollection[string-length() &gt; 0 ]">
                                <subject xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:for-each select="//JournalSubjectGroup/SubjectCollection">
                                        <xsl:if test="contains(@Type,'Primary')">
                                            <genre xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </genre>
                                        </xsl:if>
                                        <xsl:if test="contains(@Type,'Secondary')">
                                            <topic xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </topic>
                                        </xsl:if>
                                    </xsl:for-each>
                                </subject>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- ********************************** 26/03/2013 classification niveau indexation/ genre *******************************-->
                    <xsl:choose>
                        <xsl:when test="//Book/BookInfo/BookSubjectGroup/SubjectCollection/@Code[string-length() &gt; 0 ]">
                            <subject xmlns="http://www.loc.gov/mods/v3">
                                <genre xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>Book-Subject-Collection</xsl:text>
                                </genre>
                                <xsl:for-each select="//Book/BookInfo/BookSubjectGroup/SubjectCollection">
                                    <topic xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="@Code">
                                            <xsl:attribute name="authority">SpringerSubjectCodes</xsl:attribute>
                                            <xsl:attribute name="authorityURI">
                                                <xsl:value-of select="@Code"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </topic>
                                </xsl:for-each>
                            </subject>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="//Book/BookInfo/BookSubjectGroup/SubjectCollection[string-length() &gt; 0 ]">
                                <subject xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:for-each select="//Book/BookInfo/BookSubjectGroup/SubjectCollection">
                                        <xsl:if test="contains(@Type,'Primary')">
                                            <genre xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </genre>
                                        </xsl:if>
                                        <xsl:if test="contains(@Type,'Secondary')">
                                            <topic xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </topic>
                                        </xsl:if>
                                    </xsl:for-each>
                                </subject>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- ********************************** 26/03/2013 classification niveau indexation/ genre *******************************-->
                    <xsl:choose>
                        <xsl:when test="//JournalSubjectGroup/JournalSubject/@Code[string-length() &gt; 0 ]">
                            <subject xmlns="http://www.loc.gov/mods/v3">
                                <genre xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>Journal-Subject-Group</xsl:text>
                                </genre>
                                <xsl:for-each select="//JournalSubject">
                                    <topic xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="@Code">
                                            <xsl:attribute name="authority">SpringerSubjectCodes</xsl:attribute>
                                            <xsl:attribute name="authorityURI">
                                                <xsl:value-of select="@Code"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </topic>
                                </xsl:for-each>
                            </subject>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="//JournalSubjectGroup[string-length() &gt; 0 ]">
                                <subject xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:for-each select="//JournalSubject">
                                        <xsl:if test="contains(@Type,'Primary')">
                                            <genre xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </genre>
                                        </xsl:if>
                                        <xsl:if test="contains(@Type,'Secondary')">
                                            <topic xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </topic>
                                        </xsl:if>
                                    </xsl:for-each>
                                </subject>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- ********************************** Mots Clés niveau série MONO*******************************-->
                    <xsl:choose>
                        <xsl:when test="//Book/BookInfo/BookSubjectGroup/BookSubject/@Code">
                            <subject xmlns="http://www.loc.gov/mods/v3">
                                <genre xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text>Book-Subject-Group</xsl:text>
                                </genre>
                                <xsl:for-each select="//Book/BookInfo/BookSubjectGroup/BookSubject">
                                    <topic xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="@Code">
                                            <xsl:attribute name="authority">SpringerSubjectCodes</xsl:attribute>
                                            <xsl:attribute name="authorityURI">
                                                <xsl:value-of select="@Code"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </topic>
                                </xsl:for-each>
                            </subject>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="//Book/BookInfo/BookSubjectGroup">
                                <subject xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:for-each select="//Book/BookInfo/BookSubjectGroup/BookSubject">
                                        <xsl:if test="contains(@Type,'Primary')">
                                            <genre xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </genre>
                                        </xsl:if>
                                        <xsl:if test="contains(@Type,'Secondary')">
                                            <topic xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </topic>
                                        </xsl:if>
                                    </xsl:for-each>
                                </subject>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>

                    <!-- *********************************** identifiants niveau série *******************************-->
                    <xsl:if test="//JournalPrintISSN [string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">ISSN</xsl:attribute>
                            <xsl:value-of select="//JournalPrintISSN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//JournalElectronicISSN [string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">eISSN</xsl:attribute>
                            <xsl:value-of select="//JournalElectronicISSN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//JournalID[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">JournalID</xsl:attribute>
                            <xsl:value-of select="//JournalID"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//JournalSPIN[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">JournalSPIN</xsl:attribute>
                            <xsl:value-of select="//JournalSPIN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//IssueArticleCount[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">IssueArticleCount</xsl:attribute>
                            <xsl:value-of select="//IssueArticleCount"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//VolumeIssueCount[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">VolumeIssueCount</xsl:attribute>
                            <xsl:value-of select="//VolumeIssueCount"/>
                        </identifier>
                    </xsl:if>
                    <!-- niveau mono -->
                    <xsl:if test="//Book/BookInfo/BookDOI[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">DOI</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookDOI"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Book/BookInfo/BookPrintISBN[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">ISBN</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookPrintISBN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Book/BookInfo/BookElectronicISBN[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">eISBN</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookElectronicISBN"/>
                        </identifier>
                    </xsl:if>
                    <!-- *********************************** identifiants niveau série *******************************-->
                    <xsl:if test="//Series/SeriesInfo/SeriesPrintISSN[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">ISSN</xsl:attribute>
                            <xsl:value-of select="//Series/SeriesInfo/SeriesPrintISSN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Series/SeriesInfo/SeriesElectronicISSN[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">eISSN</xsl:attribute>
                            <xsl:value-of select="//Series/SeriesInfo/SeriesElectronicISSN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Book/BookInfo/BookTitleID[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">BookTitleID</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookTitleID"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Book/BookInfo/BookID[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">BookID</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookID"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Book/BookInfo/BookChapterCount[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">BookChapterCount</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookChapterCount"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Book/BookInfo/BookVolumeNumber[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">BookVolumeNumber</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookVolumeNumber"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Book/BookInfo/BookSequenceNumber[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">BookSequenceNumber</xsl:attribute>
                            <xsl:value-of select="//Book/BookInfo/BookSequenceNumber"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//PartChapterCount[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">PartChapterCount</xsl:attribute>
                            <xsl:value-of select="//PartChapterCount"/>
                        </identifier>
                    </xsl:if>

                    <!-- ******************************** Millesime ******************************-->
                    <part xmlns="http://www.loc.gov/mods/v3">
                        <xsl:choose>
                            <xsl:when test="number(//Issue/IssueCopyright/CopyrightYear)">
                                <date xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="number(//Issue/IssueCopyright/CopyrightYear)"/>
                                </date>
                            </xsl:when>
                            <xsl:when test="number(//Book/BookInfo/BookCopyright/CopyrightYear)">
                                <date xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="number(//Book/BookInfo/BookCopyright/CopyrightYear)"/>
                                </date>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="//CoverDate/Year">
                                    <date xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="number(//CoverDate/Year)"/>
                                    </date>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="//IssueTitle">
                            <xsl:for-each select="//IssueTitle">
                                <detail xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">issue</xsl:attribute>
                                    <title xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="//IssueSubTitle">
                                            <xsl:value-of select="//IssueSubTitle"/>
                                            <xsl:text>: </xsl:text>
                                        </xsl:if>
                                        <xsl:apply-templates select="."/>
                                    </title>
                                </detail>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//PartTitle">
                            <xsl:for-each select="//PartTitle">
                                <detail xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">part</xsl:attribute>
                                    <title xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:if test="//PartNumber">
                                            <xsl:value-of select="//PartNumber"/>
                                            <xsl:text>: </xsl:text>
                                        </xsl:if>
                                        <xsl:apply-templates select="."/>
                                    </title>
                                </detail>
                            </xsl:for-each>
                        </xsl:if>
                        <!-- ******************************* Volume niveau serie mono ******************-->
                        <xsl:if test="//Publisher/Series | //Publisher/Book">
                            <xsl:choose>
                                <xsl:when test="//BookVolumeNumber[string-length()&gt; 0] ">
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">volume</xsl:attribute>
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="//BookVolumeNumber"/>
                                        </number>
                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:text>vol.</xsl:text>
                                        </caption>
                                    </detail>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="Publisher/Journal | Publisher/Series">
                                        <detail xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">volume</xsl:attribute>
                                            <number xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:value-of select="//ArticleCopyright/CopyrightYear[string-length()&gt; 0]| //ChapterCopyright/CopyrightYear[string-length()&gt; 0] "/>
                                            </number>
                                            <caption xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:text>vol.</xsl:text>
                                            </caption>
                                        </detail>
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <!-- **************************** Volume périodique**********************-->
                        <xsl:if test="//Publisher/Journal">
                            <xsl:choose>
                                <xsl:when
                                        test="//VolumeIDStart [string-length()&gt; 0] != //VolumeIDEnd [string-length()&gt; 0]">
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">volume</xsl:attribute>
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="concat (//VolumeIDStart ,'-', //VolumeIDEnd)"/>
                                        </number>
                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:text>vol.</xsl:text>
                                        </caption>
                                    </detail>
                                </xsl:when>
                                <xsl:otherwise>
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">volume</xsl:attribute>
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="//VolumeIDStart [string-length()&gt; 0]"/>
                                        </number>
                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:text>vol.</xsl:text>
                                        </caption>
                                    </detail>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <!-- *************************** "Part" dans DTD book ***********************-->
                        <xsl:if test="//Publisher/Book">
                            <xsl:if test="//PartNumber[string-length()&gt; 0]">
                                <detail xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">part</xsl:attribute>
                                    <number xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="//PartNumber"/>
                                    </number>
                                </detail>
                            </xsl:if>
                        </xsl:if>
                        <!-- ***************************** Numéro niveau mono en série - mono *****************-->
                        <xsl:if test="//Publisher/Series | //Publisher/Book">
                            <xsl:choose>
                                <xsl:when test="//BookIssueNumber[string-length()&gt; 0]">
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">
                                            <xsl:text>issue</xsl:text>
                                        </xsl:attribute>
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="//BookIssueNumber"/>
                                        </number>
                                    </detail>
                                </xsl:when>
                                <xsl:when test="//ChapterNumber[string-length()&gt; 0]">
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">
                                            <xsl:text>chapter</xsl:text>
                                        </xsl:attribute>
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="//ChapterNumber"/>
                                        </number>
                                    </detail>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:if>
                        <!-- ****************************** Numéro niveau analytique *****************************-->
                        <xsl:if test="/Publisher/Journal/Volume">
                            <xsl:choose>
                                <xsl:when test="//IssueInfo/IssueIDStart != //IssueInfo/IssueIDEnd ">
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:choose>
                                            <xsl:when test="contains(//Issue/@IssueType, 'Supplement') or contains(//IssueInfo/@IssueType, 'Supplement')">
                                                <xsl:attribute name="type">
                                                    <xsl:text>supplement</xsl:text>
                                                </xsl:attribute>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="type">
                                                    <xsl:text>issue</xsl:text>
                                                </xsl:attribute>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <!-- traitement des supplements -->
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:if test="contains(//Issue/@IssueType, 'Supplement') or contains(//IssueInfo/@IssueType, 'Supplement')">
                                                <xsl:text>Suppl. </xsl:text>
                                            </xsl:if>
                                            <xsl:value-of select="concat (//IssueInfo/IssueIDStart ,'-', //IssueInfo/IssueIDEnd)"/>
                                        </number>
                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:choose>
                                                <xsl:when test="contains(//Issue/@IssueType, 'Supplement') or contains(//IssueInfo/@IssueType, 'Supplement')">
                                                    <xsl:text>suppl. </xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>no.</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </caption>
                                    </detail>
                                </xsl:when>
                                <xsl:otherwise>
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:choose>
                                            <xsl:when test="contains(//Issue/@IssueType, 'Supplement') or contains(//IssueInfo/@IssueType, 'Supplement')">
                                                <xsl:attribute name="type">
                                                    <xsl:text>supplement</xsl:text>
                                                </xsl:attribute>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="type">
                                                    <xsl:text>issue</xsl:text>
                                                </xsl:attribute>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <!-- traitement des supplements -->
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="//IssueInfo/IssueIDStart"/>
                                        </number>
                                        <caption xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:choose>
                                                <xsl:when test="contains(//Issue/@IssueType, 'Supplement') or contains(//IssueInfo/@IssueType, 'Supplement')">
                                                    <xsl:text>suppl. </xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>no.</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </caption>
                                    </detail>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <!-- *************************************************** Pagination **************************************************-->
                        <xsl:if test="//ArticleFirstPage[string-length() &gt; 0 ] | //ChapterFirstPage[string-length() &gt; 0 ]">
                            <extent xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="unit">pages</xsl:attribute>
                                <start xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="//ArticleFirstPage | //ChapterFirstPage"/>
                                </start>
                                <end xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="//ArticleLastPage | //ChapterLastPage"/>
                                </end>
                            </extent>
                        </xsl:if>
                        <xsl:if test="//BookBackmatterFirstPage[string-length() &gt; 0 ]">
                            <extent xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="unit">pages</xsl:attribute>
                                <start xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="//BookBackmatterFirstPage"/>
                                </start>
                                <xsl:if test="//BookBackmatterLastPage[string-length() &gt; 0 ]">
                                    <end xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="//BookBackmatterLastPage"/>
                                    </end>
                                </xsl:if>
                            </extent>
                        </xsl:if>
                        <xsl:if test="//BookFrontmatterFirstPage[string-length() &gt; 0 ]">
                            <extent xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="unit">pages</xsl:attribute>
                                <start xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="//BookFrontmatterFirstPage"/>
                                </start>
                                <xsl:if test="//BookFrontmatterLastPage[string-length() &gt; 0 ]">
                                    <end xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="//BookFrontmatterLastPage"/>
                                    </end>
                                </xsl:if>
                            </extent>
                        </xsl:if>
                        <xsl:if test="//CoverFirstPage[string-length() &gt; 0 ]">
                            <extent xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="unit">pages</xsl:attribute>
                                <start xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="//CoverFirstPage"/>
                                </start>
                                <xsl:if test="//CoverLastPage[string-length() &gt; 0 ]">
                                    <end xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="//CoverLastPage"/>
                                    </end>
                                </xsl:if>
                            </extent>
                        </xsl:if>
                    </part>
                    <!-- ***************************** RecordInfo niveau Série *************************-->
                    <xsl:choose>
                        <xsl:when test="//IssueCopyright/CopyrightHolderName[string-length() &gt; 0 ] | //BookCopyright/CopyrightHolderName[string-length() &gt; 0 ]">
                            <recordInfo xmlns="http://www.loc.gov/mods/v3">
                                <recordOrigin xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//IssueCopyright/CopyrightHolderName | //BookCopyright/CopyrightHolderName)"/>
                                    <xsl:if test="//IssueCopyright/CopyrightYear  | //BookCopyright/CopyrightYear">
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of select="normalize-space(//IssueCopyright/CopyrightYear  | //BookCopyright/CopyrightYear)"/>
                                    </xsl:if>
                                </recordOrigin>
                            </recordInfo>
                        </xsl:when>
                        <xsl:otherwise>
                            <recordInfo xmlns="http://www.loc.gov/mods/v3">
                                <recordOrigin xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="//ArticleCopyright/CopyrightHolderName| //ChapterCopyright/CopyrightHolderName"/>
                                    <xsl:if test="//ArticleCopyright/CopyrightYear[string-length() &gt; 0 ]| //ChapterCopyright/CopyrightYear[string-length() &gt; 0 ]">
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of select="normalize-space(//ArticleCopyright/CopyrightYear | //ChapterCopyright/CopyrightYear)"/>
                                    </xsl:if>
                                </recordOrigin>
                            </recordInfo>
                        </xsl:otherwise>
                    </xsl:choose>
                </relatedItem>
            </xsl:if>

            <!-- *****************************************************************
                relatedItem (niveau série mono)
                *************************************************************************-->
            <xsl:if test="//SeriesInfo/SeriesTitle[string-length() &gt; 0 ]">
                <relatedItem xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">series</xsl:attribute>
                    <!-- ********************************* Titre du journal ************************-->
                    <titleInfo xmlns="http://www.loc.gov/mods/v3">

                        <xsl:if test="//SeriesInfo/SeriesTitle">
                            <title xmlns="http://www.loc.gov/mods/v3">
                                <xsl:apply-templates select="//SeriesInfo/SeriesTitle"/>
                            </title>
                            <xsl:if test="//SeriesInfo/SeriesSubTitle[string-length() &gt; 0 ]">
                                <subTitle xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:apply-templates select="//SeriesInfo/SeriesSubTitle"/>
                                </subTitle>
                            </xsl:if>
                        </xsl:if>
                    </titleInfo>
                    <!-- ==========================================================================================================================
                        TRAITEMENTS DES AUTEURS/EDITEURS/AFFILIATIONS NIVEAU SERIE, MONOGRAPHIES EN SERIES, MONOGRAPHIES
                        =============================================================================================================================== -->
                    <!-- *********************************** Editeur personne morale niveau série *************************************-->
                    <!-- editeur -->
                    <xsl:choose>
                        <xsl:when test="//SeriesHeader/EditorGroup/InstitutionalEditor">
                            <xsl:for-each select="//InstitutionalEditor">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:for-each select="InstitutionalEditorName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </namePart>
                                    <xsl:choose>
                                        <xsl:when test="Contact/Email">
                                            <xsl:for-each select="Contact/Email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:apply-templates select="."/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                    <!-- traitement des roles -->
                                    <xsl:call-template name="role2"/>
                                    <!-- traitement des biographies -->
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- InstitutionalAuthor -->
                    <xsl:choose>
                        <xsl:when test="//SeriesHeader/AuthorGroup/InstitutionalAuthor">
                            <xsl:for-each select="//InstitutionalAuthor">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">corporate</xsl:attribute>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:for-each select="InstitutionalAuthorName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                    </namePart>
                                    <xsl:choose>
                                        <xsl:when test="Contact/Email">
                                            <xsl:for-each select="Contact/Email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- traitement des roles -->
                                    <xsl:call-template name="role"/>
                                    <!-- traitement des biographies -->
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- *************************************************** Editeurs ********************************************-->
                    <xsl:choose>
                        <xsl:when test="//SeriesHeader/EditorGroup">
                            <xsl:for-each select="//SeriesHeader/EditorGroup/Editor">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">personal</xsl:attribute>
                                    <xsl:if test="@CorrespondingAffiliationID">
                                        <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="EditorName/Prefix">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="EditorName/Prefix">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="EditorName/GivenName">
                                            <xsl:choose>
                                                <xsl:when test="EditorName/GivenName">
                                                    <xsl:for-each select="EditorName/GivenName">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                    </xsl:choose>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">family</xsl:attribute>
                                        <xsl:if test="EditorName/NativeName">
                                            <xsl:attribute name="transliteration">
                                                <xsl:value-of select="normalize-space(EditorName/NativeName)"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:for-each select="EditorName/Particle">
                                            <xsl:value-of select="normalize-space(.)"/>
                                            <xsl:text> </xsl:text>
                                        </xsl:for-each>
                                        <xsl:for-each select="EditorName/FamilyName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                        <xsl:if test="EditorName/Suffix">
                                            <xsl:for-each select="EditorName/Suffix">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </namePart>
                                    <xsl:if test="EditorName/Degrees">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="EditorName/Degrees">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="EditorName/Contact/Email">
                                            <xsl:for-each select="Contact/Email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                                    <xsl:choose>
                                        <xsl:when test="@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- traitement des roles -->
                                    <xsl:call-template name="role2"/>
                                    <!-- traitement des biographies -->
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- Author -->
                    <xsl:choose>
                        <xsl:when test="//SeriesHeader/AuthorGroup">
                            <xsl:for-each select="//SeriesHeader/AuthorGroup/Author">
                                <name xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">personal</xsl:attribute>
                                    <xsl:if test="@CorrespondingAffiliationID">
                                        <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="AuthorName/Prefix">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="AuthorName/Prefix">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="AuthorName/GivenName">
                                            <xsl:choose>
                                                <xsl:when test="AuthorName/GivenName">
                                                    <xsl:for-each select="AuthorName/GivenName">
                                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:attribute name="type">given</xsl:attribute>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </namePart>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                    </xsl:choose>
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">family</xsl:attribute>
                                        <xsl:if test="AuthorName/NativeName">
                                            <xsl:attribute name="transliteration">
                                                <xsl:value-of select="normalize-space(AuthorName/NativeName)"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:for-each select="AuthorName/Particle">
                                            <xsl:value-of select="normalize-space(.)"/>
                                            <xsl:text> </xsl:text>
                                        </xsl:for-each>
                                        <xsl:for-each select="AuthorName/FamilyName">
                                            <xsl:value-of select="normalize-space(.)"/>
                                        </xsl:for-each>
                                        <xsl:if test="AuthorName/Suffix">
                                            <xsl:for-each select="AuthorName/Suffix">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </namePart>
                                    <xsl:if test="AuthorName/Degrees">
                                        <namePart xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                            <xsl:for-each select="AuthorName/Degrees">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </namePart>
                                    </xsl:if>
                                    <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                                    <xsl:choose>
                                        <xsl:when test="//SeriesHeader/AuthorGroup/Author/@AffiliationIDS">
                                            <xsl:call-template name="Affiliation"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="Contact/Email">
                                            <xsl:for-each select="Contact/Email">
                                                <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:text>E-mail: </xsl:text>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </affiliation>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                        <description xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                        </description>
                                    </xsl:if>
                                </name>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <!-- ****************************************** Genre niveau série ************************************-->
                    <!--  <xsl:choose>
                          <xsl:when test="Publisher/Series and contains(//BookInfo/@BookProductType,'NonStandardArchiveJournal')">
                              <genre xmlns="http://www.loc.gov/mods/v3">
                                  <xsl:attribute name="type">Series</xsl:attribute>
                                  <xsl:attribute name="displayLabel">Non Standard Archive Journal</xsl:attribute>
                              </genre>
                          </xsl:when>
                          <xsl:when test="Publisher/Series and contains(//BookInfo/@BookProductType,'ArchiveJournal')">
                              <genre xmlns="http://www.loc.gov/mods/v3">
                                  <xsl:attribute name="type">Series</xsl:attribute>
                                  <xsl:attribute name="displayLabel">Archive Journal</xsl:attribute>
                              </genre>
                          </xsl:when>
                          <xsl:otherwise>
                              <genre xmlns="http://www.loc.gov/mods/v3">
                                  <xsl:attribute name="type">Series</xsl:attribute>
                                  <xsl:attribute name="displayLabel">Series</xsl:attribute>
                              </genre>
                          </xsl:otherwise>
                      </xsl:choose>-->
                    <!-- ****************************************** OriginInfo niveau série ********************************-->
                    <originInfo xmlns="http://www.loc.gov/mods/v3">
                        <!-- ********************************** Copyright niveau Book ***********************************-->
                        <xsl:if test="//Publisher/Series">
                            <xsl:choose>
                                <xsl:when test="//BookCopyright[string-length()&gt; 0]">
                                    <copyrightDate xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="number(//Series/Book/BookInfo/BookCopyright/CopyrightYear)">
                                                <xsl:value-of select="number(//Series/Book/BookInfo/BookCopyright/CopyrightYear)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="number(//CoverDate/Year)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </copyrightDate>
                                </xsl:when>
                            </xsl:choose>
                            <!-- ******************* <issuance xmlns="http://www.loc.gov/mods/v3">  Definition: a term that designates how the resource is issued. **************** -->
                            <issuance xmlns="http://www.loc.gov/mods/v3">serial</issuance>
                        </xsl:if>
                    </originInfo>
                    <!-- *****************************************************************
                        relatedItem (niveau SUBsérie) explication "https://wiki.dlib.indiana.edu/display/DLFAquifer/Introduction+to+the+stylesheet"
                        *************************************************************************-->
                    <xsl:if test="//SubSeriesInfo/SubSeriesTitle[string-length() &gt; 0 ]">
                        <relatedItem xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">constituent</xsl:attribute>
                            <!-- ********************************* Titre du journal ************************-->
                            <titleInfo xmlns="http://www.loc.gov/mods/v3">

                                <xsl:if test="//SubSeriesInfo/SubSeriesTitle">
                                    <xsl:variable name="subseries">
                                        <xsl:apply-templates select="//SubSeriesInfo/SubSeriesTitle"/>
                                    </xsl:variable>
                                    <xsl:variable name="subseriessubtitle">
                                        <xsl:apply-templates select="//SubSeriesInfo/SubSeriesSubTitle"/>
                                    </xsl:variable>
                                    <title xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space($subseries)"/>
                                    </title>
                                    <xsl:if test="//SubSeriesInfo/SubSeriesSubTitle[string-length() &gt; 0 ]">
                                        <subTitle xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="normalize-space($subseriessubtitle)"/>
                                        </subTitle>
                                    </xsl:if>
                                </xsl:if>
                            </titleInfo>
                            <!-- ==========================================================================================================================
                                TRAITEMENTS DES AUTEURS/EDITEURS/AFFILIATIONS NIVEAU SERIE, MONOGRAPHIES EN SERIES, MONOGRAPHIES
                                =============================================================================================================================== -->
                            <!-- *********************************** Editeur personne morale niveau série *************************************-->
                            <!-- editeur -->
                            <xsl:choose>
                                <xsl:when test="//SubSeriesHeader/EditorGroup/InstitutionalEditor">
                                    <xsl:for-each select="//InstitutionalEditor">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">corporate</xsl:attribute>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:for-each select="InstitutionalEditorName">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </xsl:for-each>
                                            </namePart>
                                            <xsl:choose>
                                                <xsl:when test="Contact/Email">
                                                    <xsl:for-each select="Contact/Email">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>
                                                            <xsl:apply-templates select="."/>
                                                        </affiliation>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="@AffiliationIDS">
                                                    <xsl:call-template name="Affiliation"/>
                                                </xsl:when>
                                                <xsl:otherwise/>
                                            </xsl:choose>
                                            <!-- traitement des roles -->
                                            <xsl:call-template name="role2"/>
                                            <!-- traitement des biographies -->
                                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                                <description xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                                </description>
                                            </xsl:if>
                                        </name>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <!-- InstitutionalAuthor -->
                            <xsl:choose>
                                <xsl:when test="//SubSeriesHeader/AuthorGroup/InstitutionalAuthor">
                                    <xsl:for-each select="//InstitutionalAuthor">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">corporate</xsl:attribute>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:for-each select="InstitutionalAuthorName">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </xsl:for-each>
                                            </namePart>
                                            <xsl:choose>
                                                <xsl:when test="Contact/Email">
                                                    <xsl:for-each select="Contact/Email">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </affiliation>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="@AffiliationIDS">
                                                    <xsl:call-template name="Affiliation"/>
                                                </xsl:when>
                                            </xsl:choose>
                                            <!-- traitement des roles -->
                                            <xsl:call-template name="role"/>
                                            <!-- traitement des biographies -->
                                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                                <description xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                                </description>
                                            </xsl:if>
                                        </name>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <!-- *************************************************** Editeurs ********************************************-->
                            <xsl:choose>
                                <xsl:when test="//SubSeriesHeader/EditorGroup">
                                    <xsl:for-each select="//Editor">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">personal</xsl:attribute>
                                            <xsl:if test="@CorrespondingAffiliationID">
                                                <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                                            </xsl:if>
                                            <xsl:if test="EditorName/Prefix">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                                    <xsl:for-each select="EditorName/Prefix">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </xsl:for-each>
                                                </namePart>
                                            </xsl:if>
                                            <xsl:choose>
                                                <xsl:when test="EditorName/GivenName">
                                                    <xsl:choose>
                                                        <xsl:when test="EditorName/GivenName">
                                                            <xsl:for-each select="EditorName/GivenName">
                                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:attribute name="type">given</xsl:attribute>
                                                                    <xsl:value-of select="normalize-space(.)"/>
                                                                </namePart>
                                                            </xsl:for-each>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:when>
                                            </xsl:choose>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">family</xsl:attribute>
                                                <xsl:if test="EditorName/NativeName">
                                                    <xsl:attribute name="transliteration">
                                                        <xsl:value-of select="normalize-space(EditorName/NativeName)"/>
                                                    </xsl:attribute>
                                                </xsl:if>
                                                <xsl:for-each select="EditorName/Particle">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                    <xsl:text> </xsl:text>
                                                </xsl:for-each>
                                                <xsl:for-each select="EditorName/FamilyName">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </xsl:for-each>
                                                <xsl:if test="EditorName/Suffix">
                                                    <xsl:for-each select="EditorName/Suffix">
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </xsl:for-each>
                                                </xsl:if>
                                            </namePart>
                                            <xsl:if test="EditorName/Degrees">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                                    <xsl:for-each select="EditorName/Degrees">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </xsl:for-each>
                                                </namePart>
                                            </xsl:if>
                                            <xsl:choose>
                                                <xsl:when test="EditorName/Contact/Email">
                                                    <xsl:for-each select="Contact/Email">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </affiliation>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                            <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                                            <xsl:choose>
                                                <xsl:when test="@AffiliationIDS">
                                                    <xsl:call-template name="Affiliation"/>
                                                </xsl:when>
                                            </xsl:choose>
                                            <!-- traitement des roles -->
                                            <xsl:call-template name="role2"/>
                                            <!-- traitement des biographies -->
                                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                                <description xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                                </description>
                                            </xsl:if>
                                        </name>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <!-- Author -->
                            <xsl:choose>
                                <xsl:when test="//SubSeriesHeader/AuthorGroup">
                                    <xsl:for-each select="//SubSeriesHeader/AuthorGroup/Author">
                                        <name xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:attribute name="type">personal</xsl:attribute>
                                            <xsl:if test="@CorrespondingAffiliationID">
                                                <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                                            </xsl:if>
                                            <xsl:if test="AuthorName/Prefix">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                                    <xsl:for-each select="AuthorName/Prefix">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </xsl:for-each>
                                                </namePart>
                                            </xsl:if>
                                            <xsl:choose>
                                                <xsl:when test="AuthorName/GivenName">
                                                    <xsl:choose>
                                                        <xsl:when test="AuthorName/GivenName">
                                                            <xsl:for-each select="AuthorName/GivenName">
                                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                                    <xsl:attribute name="type">given</xsl:attribute>
                                                                    <xsl:value-of select="normalize-space(.)"/>
                                                                </namePart>
                                                            </xsl:for-each>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:when>
                                            </xsl:choose>
                                            <namePart xmlns="http://www.loc.gov/mods/v3">
                                                <xsl:attribute name="type">family</xsl:attribute>
                                                <xsl:if test="AuthorName/NativeName">
                                                    <xsl:attribute name="transliteration">
                                                        <xsl:value-of select="normalize-space(AuthorName/NativeName)"/>
                                                    </xsl:attribute>
                                                </xsl:if>
                                                <xsl:for-each select="AuthorName/Particle">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                    <xsl:text> </xsl:text>
                                                </xsl:for-each>
                                                <xsl:for-each select="AuthorName/FamilyName">
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </xsl:for-each>
                                                <xsl:if test="AuthorName/Suffix">
                                                    <xsl:for-each select="AuthorName/Suffix">
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </xsl:for-each>
                                                </xsl:if>
                                            </namePart>
                                            <xsl:if test="AuthorName/Degrees">
                                                <namePart xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                                                    <xsl:for-each select="AuthorName/Degrees">
                                                        <xsl:value-of select="normalize-space(.)"/>
                                                    </xsl:for-each>
                                                </namePart>
                                            </xsl:if>
                                            <!-- ****************************** Affiliations niveau editeur serie **************************************-->
                                            <xsl:choose>
                                                <xsl:when test="//SubSeriesHeader/AuthorGroup/Author/@AffiliationIDS">
                                                    <xsl:call-template name="Affiliation"/>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="Contact/Email">
                                                    <xsl:for-each select="Contact/Email">
                                                        <affiliation xmlns="http://www.loc.gov/mods/v3">
                                                            <xsl:text>E-mail: </xsl:text>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </affiliation>
                                                    </xsl:for-each>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                                                <description xmlns="http://www.loc.gov/mods/v3">
                                                    <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                                                </description>
                                            </xsl:if>
                                        </name>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <genre xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">sub-series</xsl:attribute>
                            </genre>
                            <!-- *********************************** identifiants niveau série *******************************-->
                            <xsl:if test="//SubSeriesPrintISSN[string-length() &gt; 0 ]">
                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">ISSN</xsl:attribute>
                                    <xsl:value-of select="//SubSeriesPrintISSN"/>
                                </identifier>
                            </xsl:if>
                            <xsl:if test="//SubSeriesElectronicISSN[string-length() &gt; 0 ]">
                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">eISSN</xsl:attribute>
                                    <xsl:value-of select="//SubSeriesElectronicISSN"/>
                                </identifier>
                            </xsl:if>
                            <xsl:if test="//SubSeriesID[string-length() &gt; 0 ]">
                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">SubSeriesID</xsl:attribute>
                                    <xsl:value-of select="//SubSeriesID"/>
                                </identifier>
                            </xsl:if>
                        </relatedItem>
                    </xsl:if>
                    <!-- identifier -->
                    <xsl:if test="//Publisher/Series/SeriesInfo/SeriesPrintISSN[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">ISSN</xsl:attribute>
                            <xsl:value-of select="//Publisher/Series/SeriesInfo/SeriesPrintISSN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Publisher/Series/SeriesInfo/SeriesElectronicISSN[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">eISSN</xsl:attribute>
                            <xsl:value-of select="//Publisher/Series/SeriesInfo/SeriesElectronicISSN"/>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="//Publisher/Series/SeriesInfo/SeriesID[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">SeriesID</xsl:attribute>
                            <xsl:value-of select="//Publisher/Series/SeriesInfo/SeriesID"/>
                        </identifier>
                    </xsl:if>
                    <!-- ******************************** Millesime ******************************-->
                    <xsl:if test="//PartNumber [string-length()&gt; 0]| //BookIssueNumber[string-length()&gt; 0] | //ChapterNumber[string-length()&gt; 0]">
                        <part xmlns="http://www.loc.gov/mods/v3">
                            <!-- *************************** "Part" dans DTD book ***********************-->

                            <xsl:if test="//PartNumber[string-length()&gt; 0]">
                                <detail xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">volume</xsl:attribute>
                                    <number xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="//PartNumber"/>
                                    </number>
                                    <caption xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:text>vol.</xsl:text>
                                    </caption>
                                </detail>
                            </xsl:if>
                            <!-- ***************************** Numéro niveau mono en série - mono *****************-->

                            <xsl:choose>
                                <xsl:when test="//BookIssueNumber[string-length()&gt; 0]">
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">issue</xsl:attribute>
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="//BookIssueNumber"/>
                                        </number>
                                    </detail>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="//ChapterNumber[string-length()&gt; 0]">
                                    <detail xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">chapter</xsl:attribute>
                                        <number xmlns="http://www.loc.gov/mods/v3">
                                            <xsl:value-of select="//ChapterNumber"/>
                                        </number>
                                    </detail>
                                </xsl:when>
                            </xsl:choose>
                        </part>
                    </xsl:if>
                    <!-- ***************************** RecordInfo niveau Série *************************-->
                    <xsl:choose>
                        <xsl:when test="//BookCopyright/CopyrightHolderName[string-length() &gt; 0 ]">
                            <recordInfo xmlns="http://www.loc.gov/mods/v3">
                                <recordOrigin xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space(//BookCopyright/CopyrightHolderName)"/>
                                    <xsl:if test="//BookCopyright/CopyrightYear">
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of select="normalize-space(//BookCopyright/CopyrightYear)"/>
                                    </xsl:if>
                                </recordOrigin>
                            </recordInfo>
                        </xsl:when>
                    </xsl:choose>
                </relatedItem>
            </xsl:if>

            <!--  ********************************** Traitement de <ArticleRelatedObject> ****************************** -->
            <xsl:if test="//ArticleRelatedObject">
                <relatedItem xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">reviewOf</xsl:attribute>
                    <xsl:if test="//ArticleRelatedObject/@RelatedObjectType[string-length() &gt; 0 ]">
                        <genre xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">
                                <xsl:value-of select="//ArticleRelatedObject/@RelatedObjectType"/>
                            </xsl:attribute>
                        </genre>
                    </xsl:if>
                    <!--<xsl:choose>
                        <xsl:when test="contains(//ArticleRelatedObject/@RelatedObjectType,'ErratumFrom')"><genre xmlns="http://www.loc.gov/mods/v3"><xsl:attribute name="type">Erratum from</xsl:attribute></genre></xsl:when>
                        <xsl:when test="contains(//ArticleRelatedObject/@RelatedObjectType,'ErratumTo')"><genre xmlns="http://www.loc.gov/mods/v3"><xsl:attribute name="type">Erratum to</xsl:attribute></genre></xsl:when>
                        <xsl:when test="contains(//ArticleRelatedObject/@RelatedObjectType,'CommentaryFrom')"><genre xmlns="http://www.loc.gov/mods/v3"><xsl:attribute name="type">Commentary from</xsl:attribute></genre></xsl:when>
                        <xsl:when test="contains(//ArticleRelatedObject/@RelatedObjectType,'Commentaryto')"><genre xmlns="http://www.loc.gov/mods/v3"><xsl:attribute name="type">Commentary to</xsl:attribute></genre></xsl:when>
                        <xsl:otherwise><xsl:value-of select="//ArticleRelatedObject/@RelatedObjectType"/></xsl:otherwise>
                    </xsl:choose>-->
                    <xsl:if test="//ArticleRelatedObject/RelatedObjectDOI[string-length() &gt; 0 ]">
                        <identifier xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">DOI</xsl:attribute>
                            <xsl:value-of select="//ArticleRelatedObject/RelatedObjectDOI"/>
                        </identifier>
                    </xsl:if>
                </relatedItem>
            </xsl:if>
            <!-- *****************************************************************
                relatedItem (relie les erratums aux articles))
                *************************************************************************-->
            <xsl:choose>
                <xsl:when test="//ArticleNote[@Type='Misc'] and //ArticleNote[@Type='Misc']/SimplePara/ExternalRef/RefSource[string-length() &gt; 0 ]">
                    <xsl:for-each select="//ArticleNote[@Type='Misc']">
                        <relatedItem xmlns="http://www.loc.gov/mods/v3">
                            <xsl:attribute name="type">otherVersion</xsl:attribute>
                            <xsl:if test="contains(SimplePara/ExternalRef/RefSource,'doi')">
                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                    <title xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(SimplePara/text())"/>
                                    </title>
                                </titleInfo>
                                <genre xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">corrected-article</xsl:attribute>
                                </genre>
                                <identifier xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:attribute name="type">DOI</xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="contains(SimplePara/ExternalRef/RefSource,'http://dx.doi.org/')">
                                            <xsl:value-of select="normalize-space(substring-after(SimplePara/ExternalRef/RefSource,'http://dx.doi.org/'))"/>
                                        </xsl:when>
                                    </xsl:choose>
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
                <xsl:when test="//ArticleNote[@Type='Misc'] and //ArticleInfo/@ArticleType='Erratum'">
                    <xsl:for-each select="//ArticleNote[@Type='Misc']">
                        <xsl:if test="SimplePara[string-length() &gt; 0 ]">
                            <relatedItem xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">otherVersion</xsl:attribute>
                                <titleInfo xmlns="http://www.loc.gov/mods/v3">
                                    <title xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </title>
                                </titleInfo>
                            </relatedItem>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
            <!-- Niveau BOOK - BookBackmatter - BookFrontmatter - cover -->
            <xsl:choose>
                <xsl:when test="//BookBackmatter | //BookFrontmatter">
                    <note>E-BOOK</note>
                </xsl:when>
                <xsl:when test="//Cover">
                    <note>Cover E-BOOK</note>
                </xsl:when>
            </xsl:choose>
            <!-- ******************************************* identifier niveau article *********************************-->
            <!-- Janvier 2014 - suite réunion J. Ducloy - identifiant utilisé par API web -->
            <xsl:if test="string-length($idistex) &gt; 0 ">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">istex</xsl:attribute>
                    <xsl:value-of select="$idistex"/>
                </identifier>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="//ArticleDOI[string-length() &gt; 0 ] | //ChapterDOI[string-length() &gt; 0 ]">
                    <identifier xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">DOI</xsl:attribute>
                        <xsl:value-of select="//ArticleDOI | //ChapterDOI"/>
                    </identifier>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="//ChapterID[string-length() &gt; 0 ]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">ChapterID</xsl:attribute>
                    <xsl:value-of select="//ChapterID"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//ArticleID[string-length() &gt; 0 ]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">ArticleID</xsl:attribute>
                    <xsl:value-of select="//ArticleID"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//Chapter/@ID[string-length() &gt; 0 ]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">ChapterID</xsl:attribute>
                    <xsl:value-of select="//Chapter/@ID"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//Article/@ID[string-length() &gt; 0 ]">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">ArticleID</xsl:attribute>
                    <xsl:value-of select="//Article/@ID"/>
                </identifier>
            </xsl:if>
            <!-- Identifier niveau MONO sans relatedItem -->
            <xsl:if test="//Book/BookInfo/BookDOI[string-length() &gt; 0 ] and not(//ChapterTitle)">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">DOI</xsl:attribute>
                    <xsl:value-of select="//Book/BookInfo/BookDOI"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//Book/BookInfo/BookPrintISBN[string-length() &gt; 0 ] and not(//ChapterTitle)">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">ISBN</xsl:attribute>
                    <xsl:value-of select="//Book/BookInfo/BookPrintISBN"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//Book/BookInfo/BookElectronicISBN[string-length() &gt; 0 ] and not(//ChapterTitle)">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">eISBN</xsl:attribute>
                    <xsl:value-of select="//Book/BookInfo/BookElectronicISBN"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//Book/BookInfo/BookTitleID[string-length() &gt; 0 ] and not(//ChapterTitle)">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">BookTitleID</xsl:attribute>
                    <xsl:value-of select="//Book/BookInfo/BookTitleID"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//Book/BookInfo/BookID[string-length() &gt; 0 ] and not(//ChapterTitle)">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">BookID</xsl:attribute>
                    <xsl:value-of select="//Book/BookInfo/BookID"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//Book/BookInfo/BookChapterCount[string-length() &gt; 0 ] and not(//ChapterTitle)">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">BookChapterCount</xsl:attribute>
                    <xsl:value-of select="//Book/BookInfo/BookChapterCount"/>
                </identifier>
            </xsl:if>
            <xsl:if test="//PartChapterCount[string-length() &gt; 0 ] and not(//ChapterTitle)">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">PartChapterCount</xsl:attribute>
                    <xsl:value-of select="//PartChapterCount"/>
                </identifier>
            </xsl:if>
            <!-- ****************************************** accessCondition niveau article *******************************-->
            <!-- <xsl:if test="//MetadataGrant">
                 <accessCondition xmlns="http://www.loc.gov/mods/v3">
                     <xsl:attribute name="type">use and reproduction</xsl:attribute>
                     <xsl:attribute name="contentType">MetadataGrant</xsl:attribute>
                     <xsl:value-of select="//MetadataGrant/@Grant"/>
                 </accessCondition>
             </xsl:if>
             <xsl:if test="//AbstractGrant">
                 <accessCondition xmlns="http://www.loc.gov/mods/v3">
                     <xsl:attribute name="type">use and reproduction</xsl:attribute>
                     <xsl:attribute name="contentType">AbstractGrant</xsl:attribute>
                     <xsl:value-of select="//AbstractGrant/@Grant"/>
                 </accessCondition>
             </xsl:if>
             <xsl:if test="//BodyPDFGrant">
                 <accessCondition xmlns="http://www.loc.gov/mods/v3">
                     <xsl:attribute name="type">use and reproduction</xsl:attribute>
                     <xsl:attribute name="contentType">BodyPDFGrant</xsl:attribute>
                     <xsl:value-of select="//BodyPDFGrant/@Grant"/>
                 </accessCondition>
             </xsl:if>
             <xsl:if test="//BodyHTMLGrant">
                 <accessCondition xmlns="http://www.loc.gov/mods/v3">
                     <xsl:attribute name="type">use and reproduction</xsl:attribute>
                     <xsl:attribute name="contentType">BodyHTMLGrant</xsl:attribute>
                     <xsl:value-of select="//BodyHTMLGrant/@Grant"/>
                 </accessCondition>
             </xsl:if>
             <xsl:if test="//BibliographyGrant">
                 <accessCondition xmlns="http://www.loc.gov/mods/v3">
                     <xsl:attribute name="type">use and reproduction</xsl:attribute>
                     <xsl:attribute name="contentType">BibliographyGrant</xsl:attribute>
                     <xsl:value-of select="//BibliographyGrant/@Grant"/>
                 </accessCondition>
             </xsl:if>
             <xsl:if test="//ESMGrant">
                 <accessCondition xmlns="http://www.loc.gov/mods/v3">
                     <xsl:attribute name="type">use and reproduction</xsl:attribute>
                     <xsl:attribute name="contentType">ESMGrant</xsl:attribute>
                     <xsl:value-of select="//ESMGrant/@Grant"/>
                 </accessCondition>
             </xsl:if>-->
            <xsl:if test="contains(//BodyPDFGrant,'OpenAccess')">
                <accessCondition xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">use and reproduction</xsl:attribute>
                    <xsl:attribute name="contentType">BodyPDFGrant</xsl:attribute>
                    <xsl:value-of select="//BodyPDFGrant/@Grant"/>
                </accessCondition>
            </xsl:if>
            <xsl:if test="//ArticleCopyright/CopyrightHolderName[string-length() &gt; 0 ] | //ChapterCopyright/CopyrightHolderName[string-length() &gt; 0 ] | //BookCopyright/CopyrightHolderName[string-length() &gt; 0 ]">
                <accessCondition xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">use and reproduction</xsl:attribute>
                    <xsl:attribute name="contentType">copyright</xsl:attribute>
                    <xsl:value-of select="normalize-space(//ArticleCopyright/CopyrightHolderName| //ChapterCopyright/CopyrightHolderName | //BookCopyright/CopyrightHolderName)"/>
                    <xsl:if test="//ArticleCopyright/CopyrightYear| //ChapterCopyright/CopyrightYear">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="normalize-space(//ArticleCopyright/CopyrightYear | //ChapterCopyright/CopyrightYear)"/>
                    </xsl:if>
                </accessCondition>
            </xsl:if>
            <!-- *************************************** RecordInfo niveau article *******************************************************-->
            <recordInfo xmlns="http://www.loc.gov/mods/v3">
                <recordContentSource xmlns="http://www.loc.gov/mods/v3">
                    <xsl:text>SPRINGER</xsl:text>
                </recordContentSource>
                <xsl:if test="//ArticleCopyright/CopyrightHolderName[string-length() &gt; 0 ] | //ChapterCopyright/CopyrightHolderName[string-length() &gt; 0 ] | //BookCopyright/CopyrightHolderName[string-length() &gt; 0 ]">
                    <xsl:if test="//ArticleCopyright/CopyrightHolderName[string-length() &gt; 0 ] | //ChapterCopyright/CopyrightHolderName[string-length() &gt; 0 ]">
                        <recordOrigin xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of select="normalize-space(//ArticleCopyright/CopyrightHolderName| //ChapterCopyright/CopyrightHolderName)"/>
                            <xsl:if test="//ArticleCopyright/CopyrightYear| //ChapterCopyright/CopyrightYear">
                                <xsl:text>, </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="//ArticleDOI|//ChapterDOI='10.1007/3-540-36415-3_27'">2003</xsl:when>
                                    <xsl:when test="//ArticleDOI|//ChapterDOI='10.1007/3-540-36413-7_14'">2003</xsl:when>
                                    <xsl:when test="//ArticleDOI|//ChapterDOI='10.1007/3-540-36413-7_17'">2003</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(//ArticleCopyright/CopyrightYear | //ChapterCopyright/CopyrightYear)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </recordOrigin>
                    </xsl:if>
                    <!-- niveau BOOK -->
                    <xsl:if test="//BookCopyright/CopyrightHolderName[string-length() &gt; 0 ] and not(//ChapterCopyright/CopyrightHolderName[string-length() &gt; 0 ])">
                        <recordOrigin xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of select="normalize-space(//BookCopyright/CopyrightHolderName)"/>
                            <xsl:if test="//BookCopyright/CopyrightYear">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="normalize-space(//BookCopyright/CopyrightYear)"/>
                            </xsl:if>
                        </recordOrigin>
                    </xsl:if>
                    <xsl:if test="//BodyRef/@FileRef[string-length() &gt; 0 ]">
                        <recordOrigin xmlns="http://www.loc.gov/mods/v3">
                            <xsl:text>SpringerFileRef: </xsl:text>
                            <xsl:value-of select="//BodyRef/@FileRef"/>
                        </recordOrigin>
                    </xsl:if>
                </xsl:if>
            </recordInfo>
        </mods>
    </xsl:template>
    <xsl:template name="Titre">
        <xsl:choose>
            <xsl:when test="//ArticleTitle | //ChapterTitle">
                <xsl:for-each select="//ArticleTitle | //ChapterTitle">
                    <titleInfo xmlns="http://www.loc.gov/mods/v3">

                        <xsl:choose>
                            <xsl:when test="//ArticleTitle[string-length() &gt; 0 ] | //ChapterTitle[string-length() &gt; 0 ]">
                                <xsl:if test="@Language">
                                    <xsl:variable name="codeLang">
                                        <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                    </xsl:variable>
                                    <xsl:attribute name="lang">
                                        <xsl:choose>
                                            <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$codeLang"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:variable name="ttl">
                                    <xsl:apply-templates select="."/>
                                </xsl:variable>
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:value-of select="normalize-space($ttl)"/>
                                </title>
                                <xsl:if test="//ArticleSubTitle[@Language=current()/@Language] [string-length() &gt; 0 ] | //ChapterSubTitle[@Language=current()/@Language] [string-length() &gt; 0 ]">
                                    <subTitle xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:apply-templates select="//ArticleSubTitle[@Language=current()/@Language] | //ChapterSubTitle[@Language=current()/@Language]"/>
                                    </subTitle>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                        <!-- titre brut en cdata suite demande J. Ducloy janvier 2014-->
                    </titleInfo>
                    <titleInfo xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">alternative</xsl:attribute>
                        <xsl:attribute name="contentType">
                            <xsl:text>CDATA</xsl:text>
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="//ArticleTitle[string-length() &gt; 0 ] | //ChapterTitle[string-length() &gt; 0 ]">
                                <xsl:if test="@Language">
                                    <xsl:variable name="codeLang">
                                        <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                    </xsl:variable>
                                    <xsl:attribute name="lang">
                                        <xsl:choose>
                                            <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$codeLang"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                </xsl:if>
                                <title xmlns="http://www.loc.gov/mods/v3">
                                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                    <xsl:value-of select="normalize-space(.)"/>
                                    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                                </title>
                                <xsl:if test="//ArticleSubTitle[@Language=current()/@Language][string-length() &gt; 0 ] | //ChapterSubTitle[@Language=current()/@Language][string-length() &gt; 0 ]">
                                    <subTitle xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                        <xsl:value-of select="//ArticleSubTitle[@Language=current()/@Language] | //ChapterSubTitle[@Language=current()/@Language]"  disable-output-escaping="yes" />
                                        <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                                    </subTitle>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                    </titleInfo>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="AuthorArticleChapter">
        <xsl:for-each select="//ArticleHeader/AuthorGroup/Author | //ChapterHeader/AuthorGroup/Author">
            <name xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">personal</xsl:attribute>
                <xsl:if test="@CorrespondingAffiliationID">
                    <xsl:attribute name="displayLabel">corresp</xsl:attribute>
                </xsl:if>
                <xsl:if test="AuthorName/Prefix">
                    <namePart xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                        <xsl:for-each select="AuthorName/Prefix">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:for-each>
                    </namePart>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="AuthorName/GivenName">
                        <xsl:choose>
                            <xsl:when test="AuthorName/GivenName">
                                <xsl:for-each select="AuthorName/GivenName">
                                    <namePart xmlns="http://www.loc.gov/mods/v3">
                                        <xsl:attribute name="type">given</xsl:attribute>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </namePart>
                                </xsl:for-each>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
                <namePart xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">family</xsl:attribute>
                    <xsl:if test="AuthorName/NativeName">
                        <xsl:attribute name="transliteration">
                            <xsl:value-of select="normalize-space(AuthorName/NativeName)"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:for-each select="AuthorName/Particle">
                        <xsl:value-of select="normalize-space(.)"/>
                        <xsl:text> </xsl:text>
                    </xsl:for-each>
                    <xsl:for-each select="AuthorName/FamilyName">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:for-each>
                    <xsl:if test="AuthorName/Suffix">
                        <xsl:for-each select="AuthorName/Suffix">
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:for-each>
                    </xsl:if>
                </namePart>
                <xsl:if test="AuthorName/Degrees">
                    <namePart xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">termsOfAddress</xsl:attribute>
                        <xsl:for-each select="AuthorName/Degrees">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:for-each>
                    </namePart>
                </xsl:if>
                <xsl:call-template name="Affiliation"/>
                <!-- traitement des roles -->
                <xsl:call-template name="role"/>
                <!-- traitement des biographies -->
                <xsl:if test="Biography/FormalPara[string-length() &gt; 0]">
                    <description xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="normalize-space(Biography/FormalPara)"/>
                    </description>
                </xsl:if>
            </name>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="Affiliation">
        <xsl:call-template name="tokenize"/>
        <xsl:choose>
            <xsl:when test="Contact/Email">
                <xsl:for-each select="Contact/Email">
                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                        <xsl:text>E-mail: </xsl:text>
                        <xsl:value-of select="normalize-space(.)"/>
                    </affiliation>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="@AffiliationIDS" name="tokenize">
        <xsl:param name="text" select="@AffiliationIDS"/>
        <xsl:param name="separator" select="' '"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <xsl:if test="//Affiliation[@ID=$text]">
                    <affiliation xmlns="http://www.loc.gov/mods/v3">
                        <xsl:if test="//Affiliation[@ID=$text]/OrgDivision[string-length() &gt; 0 ]">
                            <xsl:for-each select="//Affiliation[@ID=$text]/OrgDivision">
                                <xsl:value-of select="normalize-space(.)"/>
                                <xsl:if test="//Affiliation[@ID=$text]/OrgName[string-length() &gt; 0 ] | //Affiliation[@ID=$text]/OrgAddress/Street[string-length() &gt; 0 ] | //Affiliation[@ID=$text]/OrgAddress/Postbox[string-length() &gt; 0 ]
                                | //Affiliation[@ID=$text]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$text]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//Affiliation[@ID=$text]/OrgName[string-length() &gt; 0 ]">
                            <xsl:for-each select="//Affiliation[@ID=$text]/OrgName">
                                <xsl:value-of select="normalize-space(.)"/>
                                <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Street[string-length() &gt; 0 ] | //Affiliation[@ID=$text]/OrgAddress/Postbox[string-length() &gt; 0 ]
                                | //Affiliation[@ID=$text]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$text]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Street[string-length() &gt; 0 ]">
                            <xsl:value-of select="normalize-space(//Affiliation[@ID=$text]/OrgAddress/Street)"/>
                            <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Postbox[string-length() &gt; 0 ]
                            | //Affiliation[@ID=$text]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$text]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Postbox[string-length() &gt; 0 ]">
                            <xsl:value-of select="normalize-space(//Affiliation[@ID=$text]/OrgAddress/Postbox)"/>
                            <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$text]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Postcode[string-length() &gt; 0 ]">
                            <xsl:value-of select="normalize-space(//Affiliation[@ID=$text]/OrgAddress/Postcode)"/>
                            <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/City[string-length() &gt; 0 ]">
                            <xsl:value-of select="normalize-space(//Affiliation[@ID=$text]/OrgAddress/City)"/>
                            <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/State[string-length() &gt; 0 ]">
                            <xsl:value-of select="normalize-space(//Affiliation[@ID=$text]/OrgAddress/State)"/>
                            <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="//Affiliation[@ID=$text]/OrgAddress/Country[string-length() &gt; 0 ]">
                            <xsl:value-of select="normalize-space(//Affiliation[@ID=$text]/OrgAddress/Country)"/>
                        </xsl:if>
                    </affiliation>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <affiliation xmlns="http://www.loc.gov/mods/v3">
                    <xsl:variable name="aff">
                        <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                    </xsl:variable>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgDivision[string-length() &gt; 0 ]">
                        <xsl:for-each select="//Affiliation[@ID=$aff]/OrgDivision">
                            <xsl:value-of select="normalize-space(.)"/>
                            <xsl:if test="//Affiliation[@ID=$aff]/OrgName[string-length() &gt; 0 ] | //Affiliation[@ID=$aff]/OrgAddress/Street[string-length() &gt; 0 ] | //Affiliation[@ID=$aff]/OrgAddress/Postbox[string-length() &gt; 0 ]
                                | //Affiliation[@ID=$aff]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$aff]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgName[string-length() &gt; 0 ]">
                        <xsl:for-each select="//Affiliation[@ID=$aff]/OrgName">
                            <xsl:value-of select="normalize-space(.)"/>
                            <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Street[string-length() &gt; 0 ] | //Affiliation[@ID=$aff]/OrgAddress/Postbox[string-length() &gt; 0 ]
                                | //Affiliation[@ID=$aff]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$aff]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Street[string-length() &gt; 0 ]">
                        <xsl:value-of select="normalize-space(//Affiliation[@ID=$aff]/OrgAddress/Street)"/>
                        <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Postbox[string-length() &gt; 0 ]
                            | //Affiliation[@ID=$aff]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$aff]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Postbox[string-length() &gt; 0 ]">
                        <xsl:value-of select="normalize-space(//Affiliation[@ID=$aff]/OrgAddress/Postbox)"/>
                        <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Postcode[string-length() &gt; 0 ] | //Affiliation[@ID=$aff]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Postcode[string-length() &gt; 0 ]">
                        <xsl:value-of select="normalize-space(//Affiliation[@ID=$aff]/OrgAddress/Postcode)"/>
                        <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/City[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/City[string-length() &gt; 0 ]">
                        <xsl:value-of select="normalize-space(//Affiliation[@ID=$aff]/OrgAddress/City)"/>
                        <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/State[string-length() &gt; 0 ]| //Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/State[string-length() &gt; 0 ]">
                        <xsl:value-of select="normalize-space(//Affiliation[@ID=$aff]/OrgAddress/State)"/>
                        <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="//Affiliation[@ID=$aff]/OrgAddress/Country[string-length() &gt; 0 ]">
                        <xsl:value-of select="normalize-space(//Affiliation[@ID=$aff]/OrgAddress/Country)"/>
                    </xsl:if>
                </affiliation>
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- traitement des roles auteur-->
    <xsl:template name="role">
        <!-- traitement des roles -->
        <role xmlns="http://www.loc.gov/mods/v3">
            <roleTerm xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">text</xsl:attribute>
                <xsl:text>author</xsl:text>
            </roleTerm>
        </role>
        <!-- description -->
        <xsl:if test="Role[string-length() &gt; 0]">
            <description xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of select="normalize-space(Role)"/>
            </description>
        </xsl:if>
    </xsl:template>
    <!-- traitement des roles editeur-->
    <xsl:template name="role2">
        <!-- traitement des roles -->
        <role xmlns="http://www.loc.gov/mods/v3">
            <roleTerm xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">text</xsl:attribute>
                <xsl:text>editor</xsl:text>
            </roleTerm>
        </role>
        <!-- description -->
        <xsl:if test="Role[string-length() &gt; 0]">
            <description xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of select="normalize-space(Role)"/>
            </description>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>