#!/usr/bin/python
# -*- coding: utf-8 -*-

# This file to correct some erroneous metadata in the articles
# Or to add the content that Oxford didn't deliver



# to correct some errors from cambridge in metadata
cambridge_correct_start_year={
    "cha" : 1976,
    "hia" : 1974,
    "ipm" : 1989,
    "irq" : 1934,
    "jfp" : 1991,
    "jse" : 1977,
    "qre" : 1994,
    "rms" : 1967,
    "acl" : 2013,
    "dem" : 2015,
    "jom" : 2008,
    "jpa" : 2015,
    "mag" : 2015,
    "nsy" : 2006,
    "pab" : 2015,
    "tam" : 2009

}

cambridge_correct_start_volume={
    "cha" : 1,
    "jse" : 1,
    "qre" : 1,
    "rms" : 1,
    "acl" : 8,
    "dem" : 81,
    "jom" : 24,
    "jpa" : 89,
    "mag" : 99,
    "nsy" : 36,
    "pab" : 38,
    "tam" : 66
}

cambridge_correct_end_year={
    "ice" : 2015,
    "pop" : 1914,
    "qgc" : 1990
}

cambridge_correct_end_volume={
    "ice" : 36,
    "pop" : 10
}





#oxford delivered the metadata for these articles but they are not part of the contract
oxford_journals_to_skip=[
    "fpa",
    "ips",
    "isp",
    "isq",
    "isr",
    "ofid"
]

# to correct missing metadata from oxford
oxford_correct_start_year={
    'abbs' : 2015,
    'adaptation' : 2015,
    'afrafj' : 1901,
    'aje' : 1921,
    'alhist' : 1989,
    'analys' : 1933,
    'annbot' : 1887,
    'annhyg' : 1958,
    'annonc' : 1990,
    'aesa' : 1908,
    'aepp' : 1988,
    'applij' : 1980,
    'acn' : 1986,
    'bioscience' : 1951,
    'brainj' : 1878,
    'femsle' : 1977,
    'femsre' : 1985,
    'foresj' : 1927,
    'formod' : 1965,
    'gji' : 1958,
    'icb' : 1961,
    'jee' : 1908,
    'jmammal' : 1919,
    'dsh' : 1986,
    'mspecies' : 1969,
    'mnras' : 1827,
    'mtp' : 1982,
    'notesj' : 1849,
    'nar' : 1974,
    'nutritionreviews' : 1942,
    'femspd' : 1988,
    'raps' : 1986,
    'sysbio' : 1952,
    'trstmh' : 1907,
    'ywes' : 1919,
}

oxford_correct_start_volume={
    'abbs' : 47,
    'acn' : 1,
    'adaptation' : 8,
    'aepp' : 1,
    'aesa' : 1,
    'aje' : 1,
    'alhist' : 1,
    'analys' : 1,
    'annbot' : 1,
    'annhyg' : 1,
    'annonc' : 1,
    'applij' : 1,
    'bioscience' : 1,
    'brainj' : 1,
    'dsh' : 1,
    'femsle' : 1,
    'femspd' : 1,
    'femsre' : 1,
    'foresj' : 1,
    'formod' : 1,
    'gji' : 1,
    'icb' : 1,
    'jee' : 1,
    'jmammal' : 1,
    'mnras' : 1,
    'mspecies' : 1,
    'mtp' : 1,
    'nar' : 1,
    'notesj' : 1,
    'nutritionreviews' : 1,
    'raps' : 1,
    'sysbio' : 1,
    'trstmh' : 1,
    'ywes' : 1,
    'hiwork' : 1,
    'imrn' : 1,

}

oxford_correct_end_volume={
    'abbs' : 47,
    'acn' : 30,
    'adaptation' : 8,
    'aepp' : 28,
    'aesa' : 108,
    'aje' : 95,
    'alhist' : 27,
    'analys' : 83,
    'annbot' : 129,
    'annhyg' : 58,
    'annonc' : 26,
    'applij' : 36,
    'bioscience' : 65,
    'brainj' : 138,
    'dsh' : 30,
    'femsle' : 39,
    'femspd' : 28,
    'femsre' : 31,
    'foresj' : 89,
    'formod' : 51,
    'gji' : 58,
    'icb' : 55,
    'jee' : 108,
    'jmammal' : 97,
    'mnras' : 189,
    'mspecies' : 47,
    'mtp' : 34,
    'nar' : 42,
    'notesj' : 167,
    'nutritionreviews' : 74,
    'raps' : 30,
    'sysbio' : 64,
    'trstmh' : 109,
    'ywes' : 97,
    'hiwork' : 40,
    'imrn' : 25,
}




oxford_missing_journals=[]

#Arbitration Law Reports and Review	2044-8651	2044-9887 -> no more available. It is on Portico.


oxford_missing_journals.append({
    "title" :"Tree Physiology",
    "pissn" :"0829-318X",
    "eissn" :"1758-4469",
    "publisher" :"Oxford University Press",
    "min_year" :"2015",
    "max_year" :"2015",
    "min_volume" :"35",
    "max_volume" :"35",
    "title_id" : "treephys",
})

oxford_missing_journals.append({
    "title" :"Briefings in Bioinformatics",
    "pissn" :"1467-5463",
    "eissn" :"1477-4054",
    "publisher" :"Oxford University Press",
    "min_year" :"2015",
    "max_year" :"2015",
    "min_volume" :"16",
    "max_volume" :"16",
    "title_id" : "bib",
})

oxford_missing_journals.append({
    "title" :"Journal of the International Commission on Radiation Units and Measurements (ICRU)",
    "pissn" :"1473-6691",
    "eissn" :"1742-3422",
    "publisher" :"Oxford University Press",
    "min_year" :"2015",
    "max_year" :"2015",
    "min_volume" :"13",
    "max_volume" :"13",
    "title_id" : "jicru",
})






# for oxford, to link to a journal, you need a special key, the linking cannot be done with the journal-id
# the dictonary below gives the url key for a given journal id. This is taken from an excel list on Oxford Website
# below are only the case where the url key is different from the journal id
# http://www.oxfordjournals.org/en/help/tech-info/linking.html
oxford_urlkey={
    "asjour" : "asj",
    "afrafj" : "afraf",
    "ahrrev" : "ahr",
    "alecon" : "aler",
    "alhist" : "alh",
    "analys" : "analysis",
    "annbot" : "aob",
    "amtest" : "amt",
    "biosci" : "bioscience",
    "biosts" : "biostatistics",
    "bjaint" : "bja",
    "bjarev" : "bjaed",
    "brainj" : "brain",
    "phisci" : "bjps",
    "aesthj" : "bjaesthetics",
    "crimin" : "bjc",
    "social" : "bjsw",
    "brimed" : "bmb",
    "cameco" : "cje",
    "camquj" : "camqtly",
    "cs" : "cs",
    "cjilaw" : "chinesejil",
    "computer_journal" : "comjnl",
    "conpec" : "cpe",
    "czoolo" : "cz",
    "databa" : "database",
    "litlin" : "dsh",
    "dnares" : "dnaresearch",
    "earlyj" : "em",
    "enghis" : "ehr",
    "entsoc" : "es",
    "eepige" : "eep",
    "humsup" : "eshremonographs",
    "escrit" : "eic",
    "ehjsupp" : "eurheartjsupp",
    "ehjqcc" : "ehjqcco",
    "seujhf" : "eurjhfsupp",
    "ejilaw" : "ejil",
    "eortho" : "ejo",
    "eursoj" : "esr",
    "famprj" : "fampra",
    "foresj" : "forestry",
    "formod" : "fmls",
    "french" : "fh",
    "frestu" : "fs",
    "frebul" : "fsb",
    "gjiarc" : "gsmnras",
    "geront" : "gerontologist",
    "geronj" : "geron",
    "global" : "globalsummitry",
    "hswork" : "hsw",
    "healed" : "her",
    "hiwork" : "hwj",
    "holgen" : "hgs",
    "icsidr" : "icsidreview",
    "imanum" : "imajna",
    "indcor" : "icc",
    "indlaw" : "ilj",
    "innovait" : "rcgp-innovait",
    "ijclaw" : "icon",
    "inttec" : "ijlit",
    "lexico" : "ijl",
    "intpor" : "ijpor",
    "reflaw" : "ijrl",
    "irasia" : "irap",
    "combul" : "itnow",
    "jrlstu" : "jrls",
    "jncmon" : "jncimono",
    "jafeco" : "jae",
    "japres" : "japr",
    "jbchem" : "jb",
    "jconsl" : "jcsl",
    "eccojcc" : "ecco-jcc",
    "eccojs" : "ecco-jccs",
    "cybers" : "cybersecurity",
    "deafed" : "jdsde",
    "design" : "jdh",
    "jnlecg" : "joeg",
    "envlaw" : "jel",
    "exbotj" : "jxb",
    "jfinec" : "jfec",
    "jhuman" : "jhrp",
    "jis" : "jinsectscience",
    "jicjus" : "jicj",
    "jielaw" : "jiel",
    "islamj" : "jis",
    "jlbios" : "jlb",
    "jleorg" : "jleo",
    "jmvmyc" : "jmvm",
    "jmedent" : "jme",
    "jmther" : "jmt",
    "petroj" : "petrology",
    "jporga" : "jpo",
    "jopart" : "jpart",
    "pubmed" : "jpubhealth",
    "refuge" : "jrs",
    "semant" : "jos",
    "semitj" : "jss",
    "jaarel" : "jaar",
    "hiscol" : "jhc",
    "jalsci" : "jhmas",
    "theolj" : "jts",
    "geron" : "biomedgerontology",
    "gerona" : "biomedgerontology",
    "geronb" : "psychsocgerontology",
    "jahist" : "jah",
    "juecol" : "jue",
    "lawprj" : "lpr",
    "lbaeck" : "leobaeck",
    "libraj" : "library",
    "igpl" : "jigpal",
    "mmycol" : "mmy",
    "modjud" : "mj",
    "molbev" : "mbe",
    "mmmcts" : "mmcts",
    "musicj" : "ml",
    "mtspec" : "mts",
    "musict" : "musictherapy",
    "mtpers" : "mtp",
    "musqtl" : "mq",
    "neuonc" : "neuro-oncology",
    "noprac" : "nop",
    "nconsc" : "nc",
    "nictob" : "ntr",
    "notesj" : "nq",
    "narsym" : "nass",
    "ofidis" : "ofid",
    "operaq" : "oq",
    "oxartj" : "oaj",
    "oxjlsj" : "ojls",
    "omcrep" : "omcr",
    "ecopol" : "oxrep",
    "parlij" : "pa",
    "philoq" : "pq",
    "polana" : "pan",
    "pscien" : "ps",
    "ptpsupp" : "ptps",
    "proeng" : "peds",
    "pparep" : "ppar",
    "pasjap" : "pasj",
    "pubjof" : "publius",
    "qjmedj" : "qjmed",
    "qmathj" : "qjmath",
    "qjmamj" : "qjmam",
    "refqtl" : "rsq",
    "regbio" : "rb",
    "revesj" : "res",
    "revfin" : "rfs",
    "brheum" : "rheumatology",
    "sabour" : "sabouraudia",
    "schbul" : "schizophreniabulletin",
    "sochis" : "shm",
    "socpol" : "sp",
    "ssjapj" : "ssjj",
    "sworkj" : "sw",
    "soceco" : "ser",
    "stalaw" : "slr",
    "tlmsoc" : "tlms",
    "tweceb" : "tcbh",
    "vevolu" : "ve",
}


#the springer id of the journals which are part of the contract
springer_included_journals=[
    "10288", #4OR
    "12249", #AAPS PharmSciTech
    "261", #Abdominal Radiology (Prior to Volume 41 (2016) published as “Abdominal Imaging”)
    "12188", #Abhandlungen aus dem Mathematischen Seminar der Universität Hamburg
    "40596", #Academic Psychiatry
    "12129", #Academic Questions
    "769", #Accreditation and Quality Assurance
    "11441", #Acoustical Physics
    "12136", #Acta Analytica
    "10440", #Acta Applicandae Mathematicae
    "10441", #Acta Biotheoretica
    "592", #Acta Diabetologica
    "10211", #acta ethologica
    "11440", #Acta Geotechnica
    "236", #Acta Informatica
    "11511", #Acta Mathematica
    "10474", #Acta Mathematica Hungarica
    "10114", #Acta Mathematica Sinica, English Series
    "10255", #Acta Mathematicae Applicatae Sinica, English Series
    "707", #Acta Mechanica
    "10409", #Acta Mechanica Sinica
    "701", #Acta Neurochirurgica
    "401", #Acta Neuropathologica
    "13131", #Acta Oceanologica Sinica
    "12658", #Acta physica Academiae Scientiarum Hungaricae
    "12242", #Acta Physica Hungarica
    "12656", #Acta Physica Hungarica A Heavy Ion Physics
    "11738", #Acta Physiologiae Plantarum
    "12402", #ADHD Attention Deficit and Hyperactivity Disorders
    "10488", #Administration and Policy in Mental Health and Mental Health Services Research
    "10450", #Adsorption
    "376", #Advances Atmospheric Sciences
    "10451", #Advances Contraception
    "6", #Advances in Applied Clifford Algebras
    "10444", #Advances in Computational Mathematics
    "10459", #Advances in Health Sciences Education
    "12325", #Advances in Therapy
    "10", #Aequationes mathematicae
    "10453", #Aerobiologia
    "266", #Aesthetic Plastic Surgery
    "10437", #African Archaeological Review
    "13370", #Afrika Matematika
    "11357", #AGE
    "12126", #Ageing International
    "40520", #Aging Clinical and Experimental Research
    "10460", #Agriculture and Human Values
    "10457", #Agroforestry Systems
    "13593", #Agronomy for Sustainable Development
    "146", #AI & SOCIETY
    "10461", #AIDS and Behavior
    "11869", #Air Quality, Atmosphere & Health
    "10469", #Algebra and Logic
    "12", #Algebra universalis
    "10468", #Algebras and Representation Theory
    "453", #Algorithmica
    "15007", #Allergo Journal
    "10182", #Allgemeines Statistisches Archiv
    "35", #Alpine Botany (= Botanica helvetica)
    "13280", #AMBIO
    "12103", #American Journal Criminal Justice
    "12364", #American Journal Digestive Diseases
    "10465", #American Journal of Dance Therapy
    "12230", #American Journal of Potato Research
    "726", #Amino Acids
    "10470", #Analog Integrated Circuits and Signal Processing
    "10476", #Analysis Mathematica
    "216", #Analytical and Bioanalytical Chemistry (former Fresenius' Journal of Analytical Chemistry)
    "12565", #Anatomical Science International
    "10456", #Angiogenesis
    "10071", #Animal Cognition
    "12377", #Annalen Philosophie
    "12375", #Annalen Philosophie philosophischen Kritik
    "23", #Annales Henri Poincaré
    "11565", #Annali dell'Universita di Ferrara
    "10231", #Annali di Matematica Pura ed Applicata
    "40768", #Annali Matematica Pura ed Applicata 1858-1865
    "40769", #Annali Matematica Pura ed Applicata 1867-1897
    "40770", #Annali Matematica Pura ed Applicata 1898-1922
    "12160", #Annals of Behavioral Medicine
    "10439", #Annals of Biomedical Engineering
    "26", #Annals of Combinatorics
    "11881", #Annals of Dyslexia
    "10436", #Annals of Finance
    "13595", #Annals of Forest Science
    "10455", #Annals of Global Analysis and Geometry
    "277", #Annals of Hematology
    "10472", #Annals of Mathematics and Artificial Intelligence
    "12149", #Annals of Nuclear Medicine
    "10479", #Annals of Operations Research
    "10434", #Annals of Surgical Oncology
    "12243", #annals of telecommunications - annales des télécommunications
    "10463", #Annals of the Institute of Statistical Mathematics
    "10480", #Annals Software Engineering
    "10482", #Antonie van Leeuwenhoek
    "13592", #Apidologie
    "10495", #Apoptosis
    "200", #Applicable Algebra in Engineering, Communication and Computing
    "10492", #Applications of Mathematics
    "12010", #Applied Biochemistry and Biotechnology
    "10485", #Applied Categorical Structures
    "10443", #Applied Composite Materials
    "13355", #Applied Entomology and Zoology
    "10489", #Applied Intelligence
    "723", #Applied Magnetic Resonance
    "245", #Applied Mathematics & Optimization
    "10483", #Applied Mathematics and Mechanics
    "253", #Applied Microbiology and Biotechnology
    "339", #Applied Physics A
    "340", #Applied Physics B
    "10484", #Applied Psychophysiology and Biofeedback
    "11482", #Applied Research in Quality of Life
    "12380", #Applied Scientific Research
    "12061", #Applied Spatial Analysis and Policy
    "10499", #Aquaculture International
    "10452", #Aquatic Ecology
    "10498", #Aquatic Geochemistry
    "27", #Aquatic Sciences (= Aquatic Science)
    "13", #Archiv der Mathematik
    "12361", #Archiv Mikroskopische Anatomie
    "10502", #Archival Science
    "407", #Archive for History of Exact Sciences
    "153", #Archive for Mathematical Logic
    "205", #Archive for Rational Mechanics and Analysis
    "419", #Archive of Applied Mechanics
    "11831", #Archives Computational Methods Engineering
    "10505", #Archives Museum Informatics
    "403", #Archives of Dermatological Research
    "244", #Archives of Environmental Contamination and Toxicology
    "404", #Archives of Gynecology and Obstetrics
    "203", #Archives of Microbiology
    "402", #Archives of Orthopaedic and Trauma Surgery
    "11657", #Archives of Osteoporosis
    "10508", #Archives of Sexual Behavior
    "204", #Archives of Toxicology
    "705", #Archives of Virology
    "737", #Archives of Women's Mental Health
    "12272", #Archives Pharmacal Research
    "5", #Archivum Immunologiae et Therapiae Experimentalis
    "10503", #Argumentation
    "11512", #Arkiv för Matematik
    "11829", #Arthropod-Plant Interactions
    "142", #Arthroskopie
    "10506", #Artificial Intelligence and Law
    "10462", #Artificial Intelligence Review
    "10015", #Artificial Life and Robotics
    "10308", #Asia Europe Journal
    "10490", #Asia Pacific Journal of Management
    "11417", #Asian Journal of Criminology
    "10690", #Asia-Pacific Financial Markets
    "13143", #Asia-Pacific Journal of Atmospheric Sciences
    "10182", #AStA Advances in Statistical Analysis
    "11443", #Astronomy Letters
    "11444", #Astronomy Reports
    "10511", #Astrophysics
    "10509", #Astrophysics and Space Science
    "11293", #Atlantic Economic Journal
    "10512", #Atomic Energy
    "13414", #Attention, Perception, & Psychophysics
    "13246", #Australasian Physical & Engineering Sciences in Medicine
    "13313", #Australasian Plant Pathology
    "10515", #Automated Software Engineering
    "10458", #Autonomous Agents and Multi-Agent Systems
    "10514", #Autonomous Robots
    "10516", #Axiomathes
    "395", #Basic Research in Cardiology
    "10519", #Behavior Genetics
    "13428", #Behavior Research Methods
    "265", #Behavioral Ecology and Sociobiology
    "13366", #Beiträge zur Algebra und Geometrie / Contributions to Algebra and Geometry
    "11609", #Berliner Journal für Soziologie
    "11654", #Best Practice Onkologie
    "501", #BHM Berg- und Hüttenmännische Monatshefte
    "10528", #Biochemical Genetics
    "10541", #Biochemistry (Moscow)
    "13206", #BioChip Journal
    "10526", #BioControl
    "10532", #Biodegradation
    "10531", #Biodiversity and Conservation
    "12155", #BioEnergy Research
    "10533", #Biogeochemistry
    "10522", #Biogerontology
    "10535", #Biologia Plantarum
    "422", #Biological Cybernetics
    "10530", #Biological Invasions
    "13752", #Biological Theory
    "12011", #Biological Trace Element Research
    "10539", #Biology & Philosophy
    "374", #Biology and Fertility of Soils
    "10237", #Biomechanics and Modeling in Mechanobiology
    "10527", #Biomedical Engineering
    "10544", #Biomedical Microdevices
    "10534", #BioMetals
    "12104", #Biomolecular NMR Assignments
    "12551", #Biophysical Reviews
    "11439", #Biophysics
    "449", #Bioprocess and Biosystems Engineering
    "12268", #BIOspektrum
    "12257", #Biotechnology Bioprocess Engineering
    "10529", #Biotechnology Letters
    "10542", #Biotechnology Techniques
    "10537", #Biotherapy
    "10543", #BIT Numerical Mathematics
    "11857", #Blätter DGVFM
    "35", #Botanica helvetica (s. Alpine Botany)
    "10546", #Boundary-Layer Meteorology
    "11068", #Brain Cell Biology
    "11682", #Brain Imaging and Behavior
    "429", #Brain Structure and Function (=Anatomy and Embryology)
    "10548", #Brain Topography
    "10014", #Brain Tumor Pathology
    "12282", #Breast Cancer
    "10549", #Breast Cancer Research and Treatment
    "12228", #Brittonia
    "12273", #Building Simulation
    "12366", #Bulletin General Relativity Gravitation
    "12357", #Bulletin Géodésique 1922-1943
    "40771", #Bulletin Géodésique 1946-1975
    "12034", #Bulletin Materials Science
    "10518", #Bulletin of Earthquake Engineering
    "10064", #Bulletin of Engineering Geology and the Environment
    "128", #Bulletin of Environmental Contamination and Toxicology
    "10517", #Bulletin of Experimental Biology and Medicine
    "11538", #Bulletin of Mathematical Biology
    "574", #Bulletin of the Brazilian Mathematical Society
    "445", #Bulletin of Volcanology
    "12362", #Bulletin Volcanologique
    "103", #Bundesgesundheitsblatt - Gesundheitsforschung - Gesundheitsschutz
    "12599", #Business & Information Systems Engineering
    "223", #Calcified Tissue International
    "10092", #Calcolo
    "526", #Calculus of Variations and Partial Differential Equations
    "12630", #Canadian Journal of Anesthesia/Journal canadien d'anesthésie
    "10555", #Cancer and Metastasis Reviews
    "10552", #Cancer Causes & Control
    "280", #Cancer Chemotherapy and Pharmacology
    "262", #Cancer Immunology, Immunotherapy
    "12307", #Cancer Microenvironment
    "13146", #Carbonates and Evaporites
    "270", #CardioVascular and Interventional Radiology
    "10557", #Cardiovascular Drugs and Therapy
    "13239", #Cardiovascular Engineering and Technology
    "12928", #Cardiovascular Intervention and Therapeutics
    "12012", #Cardiovascular Toxicology
    "10562", #Catalysis Letters
    "10563", #Catalysis Surveys from Asia
    "12567", #CEAS Space Journal
    "10569", #Celestial Mechanics and Dynamical Astronomy
    "10561", #Cell and Tissue Banking
    "11821", #Cell and Tissue Biology
    "441", #Cell and Tissue Research
    "12013", #Cell Biochemistry and Biophysics
    "10565", #Cell Biology and Toxicology
    "12192", #Cell Stress and Chaperones
    "12195", #Cellular and Molecular Bioengineering
    "18", #Cellular and Molecular Life Sciences
    "10571", #Cellular and Molecular Neurobiology
    "10570", #Cellulose
    "10100", #Central European Journal of Operations Research
    "10556", #Chemical and Petroleum Engineering
    "10553", #Chemistry and Technology of Fuels and Oils
    "10593", #Chemistry of Heterocyclic Compounds
    "10600", #Chemistry of Natural Compounds
    "12279", #Chemists' Section Cotton Oil Press
    "49", #Chemoecology
    "12078", #Chemosensory Perception
    "12395", #Chesapeake Science
    "10566", #Child & Youth Care Forum
    "10560", #Child and Adolescent Social Work Journal
    "10578", #Child Psychiatry & Human Development
    "10583", #Children's Literature in Education
    "381", #Child's Nervous System
    "12689", #China-EU Law Journal
    "11401", #Chinese Annals of Mathematics, Series B
    "11769", #Chinese Geographical Science
    "11631", #Chinese Journal Geochemistry
    "11655", #Chinese Journal Integrative Medicine
    "343", #Chinese Journal of Oceanology and Limnology
    "10118", #Chinese Journal of Polymer Science
    "10337", #Chromatographia
    "412", #Chromosoma
    "10577", #Chromosome Research
    "11584", #Cimento
    "34", #Circuits, Systems, and Signal Processing
    "10098", #Clean Technologies and Environmental Policy (see Clean Products and Processes)
    "382", #Climate Dynamics
    "10584", #Climatic Change
    "10585", #Clinical & Experimental Metastasis
    "10238", #Clinical and Experimental Medicine
    "10157", #Clinical and Experimental Nephrology
    "12094", #Clinical and Translational Oncology
    "10286", #Clinical Autonomic Research
    "10567", #Clinical Child and Family  Psychology Review
    "12328", #Clinical Journal of Gastroenterology
    "62", #Clinical Neuroradiology (former Klinische Neuroradiologie)
    "784", #Clinical Oral Investigations
    "11999", #Clinical Orthopaedics and Related Research®
    "392", #Clinical Research in Cardiology (see Zeitschrift für Kardiologie)
    "12016", #Clinical Reviews Allergy Immunology
    "10067", #Clinical Rheumatology
    "10615", #Clinical Social Work Journal
    "10586", #Cluster Computing
    "11298", #CME
    "12559", #Cognitive Computation
    "11571", #Cognitive Neurodynamics
    "10339", #Cognitive Processing
    "10608", #Cognitive Therapy and Research
    "13415", #Cognitive, Affective, & Behavioral Neuroscience
    "396", #Colloid and Polymer Science
    "10595", #Colloid Journal
    "53", #Coloproctology
    "493", #Combinatorica
    "10573", #Combustion, Explosion and Shock Waves
    "220", #Communications in Mathematical Physics
    "10597", #Community Mental Health Journal
    "580", #Comparative Clinical Pathology
    "10588", #Computational and Mathematical Organization Theory
    "37", #computational complexity
    "10614", #Computational Economics
    "10596", #Computational Geosciences
    "10287", #Computational Management Science
    "11470", #Computational Mathematics and Mathematical Physics
    "10598", #Computational Mathematics and Modeling
    "466", #Computational Mechanics
    "10589", #Computational Optimization and Applications
    "180", #Computational Statistics
    "450", #Computer Science - Research and Development (= Informatik - Forschung und Entwicklung)
    "10606", #Computer Supported Cooperative Work (CSCW)
    "607", #Computing
    "791", #Computing and Visualization in Science
    "10592", #Conservation Genetics
    "12686", #Conservation Genetics Resources
    "10602", #Constitutional Political Economy
    "10601", #Constraints
    "365", #Constructive Approximation
    "10591", #Contemporary Family Therapy
    "11562", #Contemporary Islam
    "12397", #Contemporary Jewry
    "40688", #Contemporary School Psychology
    "11007", #Continental Philosophy Review
    "161", #Continuum Mechanics and Thermodynamics
    "410", #Contributions to Mineralogy and Petrology
    "12176", #Controlling & Management Review (= Controlling & Management)
    "338", #Coral Reefs
    "10611", #Crime, Law and Social Change
    "11572", #Criminal Law and Philosophy
    "10609", #Criminal Law Forum
    "10612", #Critical Criminology
    "11445", #Crystallography Reports
    "11422", #Cultural Studies of Science Education
    "11013", #Culture, Medicine, and Psychiatry
    "11892", #Current Diabetes Reports
    "294", #Current Genetics
    "11904", #Current HIV/AIDS Reports
    "11908", #Current Infectious Disease Reports
    "284", #Current Microbiology
    "11910", #Current Neurology and Neuroscience Reports
    "12391", #Current Psychological Reviews
    "12144", #Current Psychology
    "11940", #Current Treatment Options in Neurology
    "11864", #Current Treatment Options in Oncology
    "10559", #Cybernetics and Systems Analysis
    "10616", #Cytotechnology
    "10582", #Czechoslovak Journal Physics
    "10587", #Czechoslovak Mathematical Journal
    "13594", #Dairy Science & Technology
    "11712", #Dao
    "10618", #Data Mining and Knowledge Discovery
    "13222", #Datenbank-Spektrum
    "11623", #Datenschutz und Datensicherheit - DuD
    "10645", #De Economist
    "10203", #Decisions in Economics and Finance
    "13524", #Demography
    "101", #Der Anaesthesist
    "104", #Der Chirurg
    "11428", #Der Diabetologe
    "11377", #Der Gastroenterologe
    "129", #Der Gynäkologe
    "105", #Der Hautarzt
    "108", #Der Internist
    "13279", #der junge zahnarzt
    "11560", #Der Nephrologe
    "115", #Der Nervenarzt
    "761", #Der Onkologe
    "347", #Der Ophthalmologe
    "132", #Der Orthopäde
    "292", #Der Pathologe
    "10405", #Der Pneumologe
    "117", #Der Radiologe
    "482", #Der Schmerz
    "113", #Der Unfallchirurg
    "120", #Der Urologe (A)
    "10617", #Design Automation for Embedded Systems
    "10623", #Designs, Codes and Cryptography
    "427", #Development Genes and Evolution
    "125", #Diabetologia
    "10624", #Dialectical Anthropology
    "10620", #Digestive Diseases and Sciences
    "454", #Discrete & Computational Geometry
    "10626", #Discrete Event Dynamic Systems
    "10619", #Distributed and Parallel Databases
    "446", #Distributed Computing
    "10633", #Documenta Ophthalmologica
    "10631", #Doklady Chemistry
    "11471", #Doklady Earth Sciences
    "11472", #Doklady Mathematics
    "11446", #Doklady Physics
    "13346", #Drug Delivery and Translational Research
    "12629", #Dublin Journal Medical Chemical Science
    "12627", #Dublin Journal Medical Science 1836-1845
    "40772", #Dublin Journal Medical Science 1872-1920
    "40773", #Dublin Journal Medical Science 1920-1922
    "12628", #Dublin Quarterly Journal Medical Science
    "10638", #Dynamics Control
    "455", #Dysphagia
    "502", #e & i Elektrotechnik und Informationstechnik
    "10643", #Early Childhood Education Journal
    "11038", #Earth, Moon, and Planets
    "12140", #East Asia
    "15", #Eclogae Geologicae Helvetiae
    "10393", #EcoHealth
    "11284", #Ecological Research
    "12231", #Economic Botany
    "10160", #Economic Bulletin
    "10644", #Economic Change and Restructuring
    "199", #Economic Theory
    "10101", #Economics of Governance
    "10021", #Ecosystems
    "10646", #Ecotoxicology
    "10639", #Education and Information Technologies
    "11092", #Educational Assessment Evaluation Accountability
    "10648", #Educational Psychology Review
    "10671", #Educational Research for Policy and Practice
    "10649", #Educational Studies in Mathematics
    "11423", #Educational Technology Research and Development
    "202", #Electrical Engineering
    "10660", #Electronic Commerce Research
    "12525", #Electronic Markets
    "10140", #Emergency Radiology
    "10663", #Empirica
    "181", #Empirical Economics
    "10664", #Empirical Software Engineering
    "10672", #Employee Responsibilities and Rights Journal
    "12020", #Endocrine
    "12022", #Endocrine Pathology
    "12053", #Energy Efficiency
    "13295", #e-Neuroforum
    "13295", #e-Neuroforum
    "366", #Engineering with Computers
    "11474", #Entomological Review
    "10651", #Environmental and Ecological Statistics
    "10640", #Environmental and Resource Economics
    "10641", #Environmental Biology of Fishes
    "10311", #Environmental Chemistry Letters
    "12665", #Environmental Earth Sciences
    "10018", #Environmental Economics and Policy Studies
    "10652", #Environmental Fluid Mechanics
    "10653", #Environmental Geochemistry and Health
    "254", #Environmental Geology
    "12199", #Environmental Health and Preventive Medicine
    "267", #Environmental Management
    "10666", #Environmental Modeling & Assessment
    "10661", #Environmental Monitoring and Assessment
    "11356", #Environmental Science and Pollution Research
    "10669", #Environments Systems and Decisions
    "12027", #ERA Forum
    "10670", #Erkenntnis
    "10341", #Erwerbs-Obstbau
    "10388", #Esophagus
    "12237", #Estuaries Coasts
    "10677", #Ethical Theory and Moral Practice
    "10676", #Ethics and Information Technology
    "481", #Ethik in der Medizin
    "10681", #Euphytica
    "11475", #Eurasian Soil Science
    "13385", #European Actuarial Journal
    "405", #European Archives of Oto-Rhino-Laryngology
    "406", #European Archives of Psychiatry and Clinical Neuroscience
    "249", #European Biophysics Journal
    "40804", #European Business Organization Law Review
    "787", #European Child & Adolescent Psychiatry
    "12365", #European Demographic Information Bulletin
    "217", #European Food Research and Technology
    "13194", #European Journal for Philosophy of Science
    "10433", #European Journal of Ageing
    "421", #European Journal of Applied Physiology
    "10096", #European Journal of Clinical Microbiology & Infectious Diseases
    "228", #European Journal of Clinical Pharmacology
    "13318", #European Journal of Drug Metabolism and Pharmacokinetics
    "10654", #European Journal of Epidemiology
    "10342", #European Journal of Forest Research
    "10657", #European Journal of Law and Economics
    "259", #European Journal of Nuclear Medicine and Molecular Imaging
    "394", #European Journal of Nutrition
    "590", #European Journal of Orthopaedic Surgery & Traumatology
    "431", #European Journal of Pediatrics
    "10658", #European Journal of Plant Pathology
    "238", #European Journal of Plastic Surgery
    "10680", #European Journal of Population / Revue européenne de Démographie
    "10212", #European Journal of Psychology of Education
    "68", #European Journal of Trauma and Emergency Surgery
    "10344", #European Journal of Wildlife Research
    "107", #European Journal of Wood and Wood Products (= Holz als Roh- und Werkstoff)
    "10610", #European Journal on Criminal Policy and Research
    "330", #European Radiology
    "586", #European Spine Journal
    "10353", #European Surgery
    "12065", #Evolutionary  Intelligence
    "11692", #Evolutionary Biology
    "10682", #Evolutionary Ecology
    "10493", #Experimental and Applied Acarology
    "10686", #Experimental Astronomy
    "221", #Experimental Brain Research
    "10683", #Experimental Economics
    "11340", #Experimental Mechanics
    "348", #Experiments in Fluids
    "10687", #Extremes
    "792", #Extremophiles
    "10347", #Facies
    "10689", #Familial Cancer
    "10691", #Feminist Legal Studies
    "601", #Few-Body Systems
    "12221", #Fibers and Polymers
    "10692", #Fibre Chemistry
    "780", #Finance and Stochastics
    "11408", #Financial Markets and Portfolio Management
    "10694", #Fire Technology
    "10695", #Fish Physiology and Biochemistry
    "10696", #Flexible Services and Manufacturing Journal
    "10494", #Flow, Turbulence and Combustion
    "10697", #Fluid Dynamics
    "12224", #Folia Geobotanica
    "12223", #Folia Microbiologica
    "12161", #Food Analytical Methods
    "11947", #Food and Bioprocess Technology
    "12560", #Food and Environmental Virology
    "11483", #Food Biophysics
    "12393", #Food Engineering Reviews
    "10068", #Food Science and Biotechnology
    "12571", #Food Security
    "12024", #Forensic Science, Medicine, and Pathology
    "11419", #Forensic Toxicology
    "11757", #Forensische Psychiatrie, Psychologie, Kriminologie
    "165", #Formal Aspects of Computing
    "10703", #Formal Methods in System Design
    "10010", #Forschung im Ingenieurwesen
    "12277", #Fortschrittsberichte über Kolloide Polymere
    "451", #Forum der Psychoanalyse
    "10698", #Foundations of Chemistry
    "10208", #Foundations of Computational Mathematics
    "10701", #Foundations of Physics
    "10699", #Foundations of Science
    "10702", #Foundations Physics Letters
    "11709", #Frontiers of Architecture and Civil Engineering in China
    "11515", #Frontiers of Biology in China (= Frontiers in Biology)
    "11705", #Frontiers of Chemical Engineering in China
    "11704", #Frontiers of Computer Science in China
    "11707", #Frontiers of Earth Science in China
    "11708", #Frontiers of Energy and Power Engineering in China
    "11783", #Frontiers of Environmental Science & Engineering in China
    "11706", #Frontiers of Materials Science
    "11464", #Frontiers of Mathematics in China
    "11465", #Frontiers of Mechanical Engineering in China
    "11684", #Frontiers of Medicine (= Frontiers of Medicine in China)
    "12200", #Frontiers of Optoelectronics in China
    "11467", #Frontiers of Physics in China
    "10142", #Functional & Integrative Genomics
    "10688", #Functional Analysis and Its Applications
    "13225", #Fungal Diversity
    "10700", #Fuzzy Optimization and Decision Making
    "10120", #Gastric Cancer
    "772", #Gefässchirurgie
    "12147", #Gender Issues
    "10714", #General Relativity and Gravitation
    "11748", #General Thoracic and Cardiovascular Surgery
    "10710", #Genetic Programming and Evolvable Machines
    "10722", #Genetic Resources and Crop Evolution
    "10709", #Genetica
    "11476", #Geochemistry International
    "12371", #Geoheritage
    "10707", #GeoInformatica
    "10708", #GeoJournal
    "11477", #Geology of Ore Deposits
    "11478", #Geomagnetism and Aeronomy
    "367", #Geo-Marine Letters
    "10711", #Geometriae Dedicata
    "39", #Geometric and Functional Analysis
    "11290", #Georgian Mathematical Journal
    "10706", #Geotechnical and Geological Engineering
    "11479", #Geotectonics
    "10715", #Geriatric Nephrology Urology
    "10343", #Gesunde Pflanzen
    "10717", #Glass and Ceramics
    "10720", #Glass Physics and Chemistry
    "10719", #Glycoconjugate Journal
    "40752", #Glycosylation Disease
    "10291", #GPS Solutions
    "417", #Graefe's Archive for Clinical and Experimental Ophthalmology
    "10035", #Granular Matter
    "373", #Graphs and Combinatorics
    "10726", #Group Decision and Negotiation
    "767", #Grundwasser
    "11612", #Gruppe – Interaktion – Organisation | Zeitschrift für Angewandte Organisationspsychologie (Prior to Volume 47 (2016) published as Gruppendynamik und Organisationsberatung)
    "10304", #Gynäkologische Endokrinologie
    "10397", #Gynecological Surgery
    "15012", #hautnah dermatologie
    "10728", #Health Care Analysis
    "10729", #Health Care Management Science
    "10742", #Health Services and Outcomes Research Methodology
    "380", #Heart and Vessels
    "10741", #Heart Failure Reviews
    "231", #Heat and Mass Transfer
    "10730", #HEC Forum
    "58", #Heilberufe
    "13126", #Hellenic Journal of Surgery
    "11480", #Herald of the Russian Academy of Sciences
    "10029", #Hernia
    "59", #Herz
    "399", #Herzschrittmachertherapie + Elektrophysiologie
    "10733", #High Energy Chemistry
    "10740", #High Temperature
    "10734", #Higher Education
    "418", #Histochemistry and Cell Biology
    "40702", #HMD Praxis der Wirtschaftsinformatik
    "106", #HNO
    "60", #HNO Nachrichten
    "11420", #HSS Journal
    "13577", #Human Cell
    "10745", #Human Ecology
    "439", #Human Genetics
    "12110", #Human Nature
    "10747", #Human Physiology
    "12142", #Human Rights Review
    "10746", #Human Studies
    "12659", #Hungarica Acta Physica
    "10743", #Husserl Studies
    "10750", #Hydrobiologia
    "10040", #Hydrogeology Journal
    "10751", #Hyperfine Interactions
    "10228", #Ichthyological Research
    "13093", #Iconographia mycologica
    "251", #Immunogenetics
    "12026", #Immunologic Research
    "11626", #In Vitro Cellular & Developmental Biology - Animal
    "11627", #In Vitro Cellular & Developmental Biology - Plant
    "12291", #Indian Journal Clinical Biochemistry
    "12288", #Indian Journal of Hematology and Blood Transfusion
    "12088", #Indian Journal of Microbiology
    "12070", #Indian Journal of Otolaryngology and Head & Neck Surgery
    "12098", #Indian Journal of Pediatrics
    "13226", #Indian Journal of Pure and Applied Mathematics
    "12262", #Indian Journal of Surgery
    "12055", #Indian Journal of Thoracic and Cardiovascular Surgery
    "15010", #Infection
    "10753", #Inflammation
    "11", #Inflammation Research
    "10787", #InflammoPharmacology
    "15034", #Info Diabetologie
    "15004", #InFo Onkologie
    "450", #Informatik - Forschung und Entwicklung (s. Computer Science - Research and Development)
    "287", #Informatik-Spektrum
    "10791", #Information Retrieval
    "10257", #Information Systems and e-Business Management
    "10796", #Information Systems Frontiers
    "10799", #Information Technology and Management
    "12212", #Inland Water Biology
    "11334", #Innovations in Systems and Software Engineering
    "10755", #Innovative Higher Education
    "10789", #Inorganic Materials
    "40", #Insectes Sociaux
    "11251", #Instructional Science
    "10786", #Instruments and Experimental Techniques
    "20", #Integral Equations and Operator Theory
    "10794", #Integrated Pest Management Reviews
    "12124", #Integrative Psychological and Behavioral Science
    "11370", #Intelligent Service Robotics
    "134", #Intensive Care Medicine
    "10780", #Interchange
    "10272", #Intereconomics
    "10793", #Interface Science
    "11739", #Internal and Emergency Medicine
    "11294", #International Advances in Economic Research
    "10778", #International Applied Mechanics
    "420", #International Archives of Occupational and Environmental Health
    "10368", #International Economics and Economic Policy
    "11365", #International Entrepreneurship and Management Journal
    "547", #International Journal Angiology
    "12529", #International Journal Behavioral Medicine
    "599", #International Journal Clinical Laboratory Research
    "12521", #International journal clinical monitoring computing
    "11096", #International Journal Clinical Pharmacy
    "10775", #International Journal for Educational and Vocational Guidance
    "12127", #International Journal for Ion Mobility Spectrometry
    "11153", #International Journal for Philosophy of Religion
    "10447", #International Journal for the Advancement of Counselling
    "11196", #International Journal for the Semiotics of Law - Revue internationale de Sémiotique juridique
    "170", #International Journal of Advanced Manufacturing Technology
    "11633", #International Journal of Automation and Computing
    "484", #International Journal of Biometeorology
    "10147", #International Journal of Clinical Oncology
    "384", #International Journal of Colorectal Disease
    "11548", #International Journal of Computer Assisted Radiology and Surgery
    "11263", #International Journal of Computer Vision
    "11412", #International Journal of Computer-Supported Collaborative Learning
    "13158", #International Journal of Early Childhood
    "531", #International Journal of Earth Sciences
    "10704", #International Journal of Fracture
    "182", #International Journal of Game Theory
    "10754", #International Journal of Health Economics and Management (= from 2001 to 2014 published as International Journal of Health Care Finance and Economics 1389-6563 1573-6962)
    "11407", #International Journal of Hindu Studies
    "10761", #International Journal of Historical Archaeology
    "10207", #International Journal of Information Security
    "13177", #International Journal of Intelligent Transportation Systems Research
    "414", #International Journal of Legal Medicine
    "12289", #International Journal of Material Forming
    "10999", #International Journal of Mechanics and Materials in Design
    "11469", #International Journal of Mental Health and Addiction
    "12613", #International Journal of Minerals, Metallurgy, and Materials
    "10766", #International Journal of Parallel Programming
    "10989", #International Journal of Peptide Research and Therapeutics
    "12588", #International Journal of Plastics Technology
    "10767", #International Journal of Politics, Culture, and Society
    "12541", #International Journal of Precision Engineering and Manufacturing
    "10764", #International Journal of Primatology
    "38", #International Journal of Public Health
    "10763", #International Journal of Science and Mathematics Education
    "12003", #International Journal of Self-Propagating High-Temperature Synthesis
    "12369", #International Journal of Social Robotics
    "10772", #International Journal of Speech Technology
    "10798", #International Journal of Technology and Design Education
    "12138", #International Journal of the Classical Tradition
    "10773", #International Journal of Theoretical Physics
    "10765", #International Journal of Thermophysics
    "10776", #International Journal of Wireless Information Networks
    "799", #International Journal on Digital Libraries
    "10032", #International Journal on Document Analysis and Recognition (IJDAR)
    "12008", #International Journal on Interactive Design and Manufacturing (IJIDeM)
    "10009", #International Journal on Software Tools for Technology Transfer
    "10769", #International Journal Rehabilitation Health
    "10770", #International Journal Salt Lake Research
    "10771", #International Journal Stress Management
    "10774", #International Journal Value-Based Management
    "10792", #International Ophthalmology
    "264", #International Orthopaedics
    "12232", #International Review of Economics
    "11159", #International Review of Education
    "10797", #International Tax and Public Finance
    "192", #International Urogynecology Journal
    "11255", #International Urology and Nephrology
    "222", #Inventiones mathematicae
    "10158", #Invertebrate Neuroscience
    "10637", #Investigational New Drugs
    "11581", #Ionics
    "40774", #Irish Journal Medical Science 1922-1925
    "40775", #Irish Journal Medical Science 1926-1967
    "40776", #Irish Journal Medical Science 1968-1970
    "11845", #Irish Journal of Medical Science
    "10795", #Irrigation Drainage Systems
    "271", #Irrigation Science
    "11856", #Israel Journal of Mathematics
    "11485", #Izvestiya, Atmospheric and Oceanic Physics
    "11486", #Izvestiya, Physics of the Solid Earth
    "13291", #Jahresbericht der Deutschen Mathematiker-Vereinigung
    "13160", #Japan Journal of Industrial and Applied Mathematics
    "11537", #Japanese Journal of Mathematics
    "10384", #Japanese Journal of Ophthalmology
    "11604", #Japanese Journal of Radiology (=Radiation Medicine)
    "10162", #JARO - Journal of the Association for Research in Otolaryngology
    "775", #JBIC Journal of Biological Inorganic Chemistry
    "11448", #JETP Letters (=Journal of Experimental and Theoretical Physics Letters)
    "10835", #Jewish History
    "11837", #JOM
    "12111", #Journal African American Studies
    "12190", #Journal Applied Mathematics Computing
    "12387", #Journal Applied Metalworking
    "10813", #Journal Aquatic Ecosystem Stress Recovery
    "11373", #Journal Biomedical Science
    "11771", #Journal Central South University
    "10821", #Journal Child Adolescent Group Therapy
    "12528", #Journal Computing Higher Education
    "11854", #Journal d'Analyse Mathématique
    "13270", #Journal Elementary Science Education
    "10838", #Journal for General Philosophy of Science
    "11676", #Journal Forestry Research
    "13138", #Journal für Mathematik-Didaktik
    "3", #Journal für Verbraucherschutz und Lebensmittelsicherheit
    "136", #Journal Heat Treating
    "11596", #Journal Huazhong University Science Technology [Medical Sciences]
    "11416", #Journal in Computer Virology
    "12524", #Journal Indian Society Remote Sensing
    "12384", #Journal instructional development
    "12386", #Journal Materials Energy Systems
    "135", #Journal Materials Engineering
    "10855", #Journal Materials Science Letters
    "499", #Journal Materials Shaping Technology
    "12206", #Journal Mechanical Science Technology
    "722", #Journal Neural Transmission Parkinson's Disease Dementia Section
    "10802", #Journal of Abnormal Child Psychology
    "10805", #Journal of Academic Ethics
    "10804", #Journal of Adult Development
    "10806", #Journal of Agricultural and Environmental Ethics
    "13253", #Journal of Agricultural, Biological, and Environmental Statistics
    "10801", #Journal of Algebraic Combinatorics
    "10809", #Journal of Analytical Chemistry
    "540", #Journal of Anesthesia
    "10800", #Journal of Applied Electrochemistry
    "10808", #Journal of Applied Mechanics and Technical Physics
    "10811", #Journal of Applied Phycology
    "10812", #Journal of Applied Spectroscopy
    "10816", #Journal of Archaeological Method and Theory
    "10814", #Journal of Archaeological Research
    "10047", #Journal of Artificial Organs
    "10815", #Journal of Assisted Reproduction and Genetics
    "12036", #Journal of Astrophysics and Astronomy
    "10874", #Journal of Atmospheric Chemistry
    "10803", #Journal of Autism and Developmental Disorders
    "10817", #Journal of Automated Reasoning
    "10864", #Journal of Behavioral Education
    "10865", #Journal of Behavioral Medicine
    "10818", #Journal of Bioeconomics
    "10863", #Journal of Bioenergetics and Biomembranes
    "10867", #Journal of Biological Physics
    "10858", #Journal of Biomolecular NMR
    "12038", #Journal of Biosciences
    "774", #Journal of Bone and Mineral Metabolism
    "10869", #Journal of Business and Psychology
    "11573", #Journal of Business Economics (= former Zeitschrift für Betriebswirtschaft)
    "10551", #Journal of Business Ethics
    "13187", #Journal of Cancer Education
    "432", #Journal of Cancer Research and Clinical Oncology
    "10870", #Journal of Chemical Crystallography
    "10886", #Journal of Chemical Ecology
    "12039", #Journal of Chemical Sciences
    "40653", #Journal of Child & Adolescent Trauma
    "10826", #Journal of Child and Family Studies
    "357", #Journal of Classification
    "10875", #Journal of Clinical Immunology
    "10877", #Journal of Clinical Monitoring and Computing
    "10880", #Journal of Clinical Psychology in Medical Settings
    "10876", #Journal of Cluster Science
    "11852", #Journal of Coastal Conservation
    "10878", #Journal of Combinatorial Optimization
    "11487", #Journal of Communications Technology and Electronics
    "10900", #Journal of Community Health
    "359", #Journal of Comparative Physiology A
    "360", #Journal of Comparative Physiology B
    "10825", #Journal of Computational Electronics
    "10827", #Journal of Computational Neuroscience
    "11488", #Journal of Computer and Systems Sciences International
    "11390", #Journal of Computer Science and Technology
    "10822", #Journal of Computer-Aided Molecular Design
    "10603", #Journal of Consumer Policy
    "11957", #Journal of Contemporary Mathematical Analysis
    "10879", #Journal of Contemporary Psychotherapy
    "10823", #Journal of Cross-Cultural Gerontology
    "145", #Journal of Cryptology
    "10824", #Journal of Cultural Economics
    "10882", #Journal of Developmental and Physical Disabilities
    "10278", #Journal of Digital Imaging
    "10883", #Journal of Dynamical and Control Systems
    "10884", #Journal of Dynamics and Differential Equations
    "12040", #Journal of Earth System Science (formerly: Proceedings - Earth and Planetary Sciences)
    "10831", #Journal of East Asian Linguistics
    "10887", #Journal of Economic Growth
    "11403", #Journal of Economic Interaction and Coordination
    "712", #Journal of Economics
    "10833", #Journal of Educational Change
    "10659", #Journal of Elasticity
    "10832", #Journal of Electroceramics
    "11664", #Journal of Electronic Materials
    "10836", #Journal of Electronic Testing
    "40618", #Journal of Endocrinological Investigation
    "10665", #Journal of Engineering Mathematics
    "10891", #Journal of Engineering Physics and Thermophysics
    "10164", #Journal of Ethology
    "28", #Journal of Evolution Equations
    "191", #Journal of Evolutionary Economics
    "11447", #Journal of Experimental and Theoretical Physics
    "11448", #Journal of Experimental and Theoretical Physics Letters (s. JETP Letters)
    "11292", #Journal of Experimental Criminology
    "10834", #Journal of Family and Economic Issues
    "10896", #Journal of Family Violence
    "10693", #Journal of Financial Services Research
    "10895", #Journal of Fluorescence
    "11694", #Journal of Food Measurement and Characterization
    "13197", #Journal of Food Science and Technology
    "10310", #Journal of Forest Research
    "41", #Journal of Fourier Analysis and Applications
    "10894", #Journal of Fusion Energy
    "10899", #Journal of Gambling Studies
    "535", #Journal of Gastroenterology
    "12029", #Journal of Gastrointestinal Cancer
    "11605", #Journal of Gastrointestinal Surgery
    "11606", #Journal of General Internal Medicine
    "10327", #Journal of General Plant Pathology
    "10897", #Journal of Genetic Counseling
    "12041", #Journal of Genetics
    "190", #Journal of Geodesy
    "10109", #Journal of Geographical Systems
    "12220", #Journal of Geometric Analysis
    "22", #Journal of Geometry
    "10898", #Journal of Global Optimization
    "10723", #Journal of Grid Computing
    "10902", #Journal of Happiness Studies
    "12308", #Journal of Hematopathology
    "10732", #Journal of Heuristics
    "10901", #Journal of Housing and the Built Environment
    "11489", #Journal of Ichthyology
    "10903", #Journal of Immigrant and Minority Health
    "10847", #Journal of Inclusion Phenomena and Macrocyclic Chemistry (= Journal of Inclusion Phenomena)
    "10781", #Journal of Indian Philosophy
    "10295", #Journal of Industrial Microbiology & Biotechnology
    "10762", #Journal of Infrared, Millimeter, and Terahertz Waves
    "10545", #Journal of Inherited Metabolic Disease
    "10904", #Journal of Inorganic and Organometallic Polymers and Materials
    "10905", #Journal of Insect Behavior
    "10841", #Journal of Insect Conservation
    "10846", #Journal of Intelligent & Robotic Systems
    "10844", #Journal of Intelligent Information Systems
    "10845", #Journal of Intelligent Manufacturing
    "10843", #Journal of International Entrepreneurship
    "12134", #Journal of International Migration and Integration
    "10840", #Journal of Interventional Cardiac Electrophysiology
    "12122", #Journal of Labor Research
    "10849", #Journal of Logic, Language and Information
    "10909", #Journal of Low Temperature Physics
    "10914", #Journal of Mammalian Evolution
    "10911", #Journal of Mammary Gland Biology and Neoplasia
    "10997", #Journal of Management & Governance
    "187", #Journal of Management Control (former: Zeitschrift für Planung & Unternehmenssteuerung)
    "773", #Journal of Marine Science and Technology
    "11457", #Journal of Maritime Archaeology
    "10163", #Journal of Material Cycles and Waste Management
    "11665", #Journal of Materials Engineering and Performance
    "10853", #Journal of Materials Science
    "10854", #Journal of Materials Science: Materials in Electronics
    "10856", #Journal of Materials Science: Materials in Medicine
    "285", #Journal of Mathematical Biology
    "10910", #Journal of Mathematical Chemistry
    "21", #Journal of Mathematical Fluid Mechanics
    "10851", #Journal of Mathematical Imaging and Vision
    "10958", #Journal of Mathematical Sciences
    "10857", #Journal of Mathematics Teacher Education
    "10912", #Journal of Medical Humanities
    "10916", #Journal of Medical Systems
    "13181", #Journal of Medical Toxicology
    "10396", #Journal of Medical Ultrasonics
    "12275", #Journal of Microbiology
    "10913", #Journal of Mining Science
    "239", #Journal of Molecular Evolution
    "10735", #Journal of Molecular Histology
    "109", #Journal of Molecular Medicine
    "894", #Journal of Molecular Modeling
    "12031", #Journal of Molecular Neuroscience
    "10974", #Journal of Muscle Research and Cell Motility
    "11051", #Journal of Nanoparticle Research
    "11418", #Journal of Natural Medicines
    "10922", #Journal of Network and Systems Management
    "702", #Journal of Neural Transmission
    "11481", #Journal of Neuroimmune Pharmacology
    "415", #Journal of Neurology
    "11060", #Journal of Neuro-Oncology
    "13365", #Journal of NeuroVirology
    "10921", #Journal of Nondestructive Evaluation
    "332", #Journal of Nonlinear Science
    "10919", #Journal of Nonverbal Behavior
    "12350", #Journal of Nuclear Cardiology
    "10926", #Journal of Occupational Rehabilitation
    "10872", #Journal of Oceanography
    "12596", #Journal of Optics
    "10957", #Journal of Optimization Theory and Applications
    "10336", #Journal of Ornithology
    "56", #Journal of Orofacial Orthopedics / Fortschritte der Kieferorthopädie
    "10933", #Journal of Paleolimnology
    "10340", #Journal of Pest Science
    "12247", #Journal of Pharmaceutical Innovation
    "10928", #Journal of Pharmacokinetics and Pharmacodynamics
    "11669", #Journal of Phase Equilibria and Diffusion
    "10992", #Journal of Philosophical Logic
    "13105", #Journal of Physiology and Biochemistry
    "12374", #Journal of Plant Biology
    "344", #Journal of Plant Growth Regulation
    "10265", #Journal of Plant Research
    "10965", #Journal of Polymer Research
    "10924", #Journal of Polymers and the Environment
    "148", #Journal of Population Economics
    "10934", #Journal of Porous Materials
    "11123", #Journal of Productivity Analysis
    "10936", #Journal of Psycholinguistic Research
    "10862", #Journal of Psychopathology and Behavioral Assessment
    "10389", #Journal of Public Health
    "10940", #Journal of Quantitative Criminology
    "10967", #Journal of Radioanalytical and Nuclear Chemistry
    "10942", #Journal of Rational-Emotive & Cognitive-Behavior Therapy
    "11554", #Journal of Real-Time Image Processing
    "11149", #Journal of Regulatory Economics
    "10943", #Journal of Religion and Health
    "11166", #Journal of Risk and Uncertainty
    "10946", #Journal of Russian Laser Research
    "10951", #Journal of Scheduling
    "10956", #Journal of Science Education and Technology
    "10972", #Journal of Science Teacher Education
    "10915", #Journal of Scientific Computing
    "10950", #Journal of Seismology
    "12927", #Journal of Service Science Research
    "11265", #Journal of Signal Processing Systems
    "11368", #Journal of Soils and Sediments
    "10971", #Journal of Sol-Gel Science and Technology
    "10008", #Journal of Solid State Electrochemistry
    "10953", #Journal of Solution Chemistry
    "10955", #Journal of Statistical Physics
    "10969", #Journal of Structural and Functional Genomics
    "10947", #Journal of Structural Chemistry
    "10948", #Journal of Superconductivity and Novel Magnetism (= Journal of Superconductivity)
    "11743", #Journal of Surfactants and Detergents
    "11424", #Journal of Systems Science and Complexity
    "11518", #Journal of Systems Science and Systems Engineering
    "11747", #Journal of the Academy of Marketing Science
    "11746", #Journal of the American Oil Chemists' Society
    "13361", #Journal of The American Society for Mass Spectrometry
    "12594", #Journal of the Geological Society of India
    "10739", #Journal of the History of Biology
    "10959", #Journal of Theoretical Probability
    "10973", #Journal of Thermal Analysis and Calorimetry
    "11630", #Journal of Thermal Science
    "11666", #Journal of Thermal Spray Technology
    "11239", #Journal of Thrombosis and Thrombolysis
    "11524", #Journal of Urban Health
    "12650", #Journal of Visualization
    "11711", #Journal of Volcanology and Seismology
    "10086", #Journal of Wood Science
    "10963", #Journal of World Prehistory
    "10964", #Journal of Youth and Adolescence
    "11582", #Journal of Zhejiang University - Science A
    "11585", #Journal of Zhejiang University - Science B
    "12193", #Journal on Multimodal User Interfaces
    "11896", #Journal Police Criminal Psychology
    "12546", #Journal Population Research
    "10952", #Journal Systems Integration
    "12225", #Kew Bulletin
    "13218", #KI - Künstliche Intelligenz
    "10975", #Kinetics and Catalysis
    "167", #Knee Surgery, Sports Traumatology, Arthroscopy
    "10115", #Knowledge and Information Systems
    "11814", #Korean Journal of Chemical Engineering
    "11577", #KZfSS Kölner Zeitschrift für Soziologie und Sozialpsychologie
    "11547", #La Radiologia Medica
    "11355", #Landscape and Ecological Engineering
    "10980", #Landscape Ecology
    "10346", #Landslides
    "423", #Langenbeck's Archives of Surgery
    "10993", #Language Policy
    "10579", #Language Resources and Evaluation
    "10103", #Lasers in Medical Science
    "10978", #Law and Critique
    "10982", #Law and Philosophy
    "13420", #Learning & Behavior
    "10984", #Learning Environments Research
    "11545", #Lettere al Nuovo Cimento 1969-1970
    "40767", #Lettere al Nuovo Cimento 1971-1985
    "11005", #Letters in Mathematical Physics
    "10985", #Lifetime Data Analysis
    "10201", #Limnology
    "10988", #Linguistics and Philosophy
    "11745", #Lipids
    "10986", #Lithuanian Mathematical Journal
    "10991", #Liverpool Law Review
    "408", #Lung
    "10994", #Machine Learning
    "10590", #Machine Translation
    "138", #Machine Vision and Applications
    "10334", #Magnetic Resonance Materials in Physics, Biology and Medicine
    "13364", #Mammal Research (previous 2015: Acta theriologica, 0001-7051, 2190-3743)
    "335", #Mammalian Genome
    "11575", #Management International Review
    "11301", #Management Review Quarterly (= previously until 2014 Journal für Betriebswirtschaft)
    "337", #Manuelle Medizin
    "229", #Manuscripta Mathematica
    "227", #Marine Biology
    "10126", #Marine Biotechnology
    "11001", #Marine Geophysical Research
    "11002", #Marketing Letters
    "11527", #Materials and Structures
    "11003", #Materials Science
    "10995", #Maternal and Child Health Journal
    "11004", #Mathematical Geosciences
    "186", #Mathematical Methods of Operations Research
    "11006", #Mathematical Notes
    "10107", #Mathematical Programming
    "12532", #Mathematical Programming Computation
    "11579", #Mathematics and Financial Economics
    "13394", #Mathematics Education Research Journal
    "208", #Mathematische Annalen
    "591", #Mathematische Semesterberichte
    "209", #Mathematische Zeitschrift
    "498", #MCSS Mathematics of Control, Signals and Systems
    "11018", #Measurement Techniques
    "11012", #Meccanica
    "11029", #Mechanics of Composite Materials
    "11043", #Mechanics of Time-Dependent Materials
    "11517", #Medical & Biological Engineering & Computing
    "430", #Medical Microbiology and Immunology
    "795", #Medical Molecular Morphology
    "12032", #Medical Oncology
    "44", #Medicinal Chemistry Research
    "11019", #Medicine, Health Care and Philosophy
    "9", #Mediterranean Journal of Mathematics
    "11825", #medizinische genetik
    "63", #Medizinische Klinik - Intensivmedizin und Notfallmedizin (= Medizinische Klinik)
    "63", #Medizinische Klinik (s. Medizinische Klinik - Intensivmedizin und Notfallmedizi)
    "350", #Medizinrecht (=MedR - Medizinrecht)
    "13421", #Memory & Cognition
    "11011", #Metabolic Brain Disease
    "11306", #Metabolomics
    "11409", #Metacognition and Learning
    "11041", #Metal Science and Heat Treatment
    "11661", #Metallurgical and Materials Transactions A
    "11663", #Metallurgical and Materials Transactions B
    "11015", #Metallurgist
    "12540", #Metals Materials International
    "11016", #Metascience
    "703", #Meteorology and Atmospheric Physics
    "11009", #Methodology and Computing in Applied Probability
    "11022", #Methods Cell Science
    "184", #Metrika
    "248", #Microbial Ecology
    "11021", #Microbiology
    "604", #Microchimica Acta
    "10404", #Microfluidics and Nanofluidics
    "542", #Microsystem Technologies
    "12363", #Mikrochemie
    "32", #Milan Journal of Mathematics
    "11299", #Mind & Society
    "12671", #Mindfulness
    "11023", #Minds and Machines
    "10230", #Mine Water and the Environment
    "126", #Mineralium Deposita
    "710", #Mineralogy and Petrology
    "11024", #Minerva
    "11027", #Mitigation and Adaptation Strategies for Global Change
    "15006", #MMW - Fortschritte der Medizin
    "11036", #Mobile Networks and Applications
    "11039", #MOCT-MOST Economic Policy Transitional Economies
    "11010", #Molecular and Cellular Biochemistry
    "11033", #Molecular Biology Reports
    "12033", #Molecular Biotechnology
    "11032", #Molecular Breeding
    "12373", #Molecular chemical neuropathology
    "11030", #Molecular Diversity
    "11037", #Molecular Engineering
    "438", #Molecular Genetics and Genomics
    "11307", #Molecular Imaging and Biology
    "12035", #Molecular Neurobiology
    "40592", #Monash Bioethics Review
    "706", #Monatshefte für Chemie - Chemical Monthly
    "605", #Monatshefte für Mathematik
    "112", #Monatsschrift Kinderheilkunde
    "11525", #Morphology
    "11031", #Motivation and Emotion
    "11044", #Multibody System Dynamics
    "11045", #Multidimensional Systems and Signal Processing
    "530", #Multimedia Systems
    "11042", #Multimedia Tools and Applications
    "10006", #Mund-, Kiefer- und Gesichtschirurgie (s. Oral and Maxillofacial Surgery)
    "12306", #MUSCULOSKELETAL SURGERY
    "11557", #Mycological Progress
    "11046", #Mycopathologia
    "572", #Mycorrhiza
    "12550", #Mycotoxin Research
    "12274", #Nano Research
    "11569", #NanoEthics
    "10357", #Natur und Recht
    "11047", #Natural Computing
    "11069", #Natural Hazards
    "11049", #Natural Language & Linguistic Theory
    "11050", #Natural Language Semantics
    "11053", #Natural Resources Research
    "210", #Naunyn-Schmiedeberg's Archives of Pharmacology
    "11059", #Neohelicon
    "11061", #Neophilologus
    "40802", #Netherlands International Law Review
    "11066", #NETNOMICS: Economic Research and Electronic Networking
    "11067", #Networks and Spatial Economics
    "521", #Neural Computing and Applications
    "11063", #Neural Processing Letters
    "11064", #Neurochemical Research
    "12028", #Neurocritical Care
    "10048", #Neurogenetics
    "12021", #Neuroinformatics
    "10072", #Neurological Sciences
    "12017", #NeuroMolecular Medicine
    "11062", #Neurophysiology
    "11065", #Neuropsychology Review
    "234", #Neuroradiology
    "11055", #Neuroscience and Behavioral  Physiology
    "10143", #Neurosurgical Review
    "11056", #New Forests
    "354", #New Generation Computing
    "4", #Nexus Network Journal
    "30", #Nonlinear Differential Equations and Applications NoDEA
    "11071", #Nonlinear Dynamics
    "10049", #Notfall +  Rettungsmedizin
    "48", #NTM Zeitschrift für Geschichte der Wissenschaften, Technik und Medizin
    "11075", #Numerical Algorithms
    "211", #Numerische Mathematik
    "11583", #Nuovo Cimento 1855-1868
    "40754", #Nuovo Cimento 1869-1876
    "40755", #Nuovo Cimento 1877-1894
    "40756", #Nuovo Cimento 1895-1900
    "40757", #Nuovo Cimento 1901-1910
    "40758", #Nuovo Cimento 1911-1923
    "40760", #Nuovo Cimento 1924-1042
    "40761", #Nuovo Cimento 1943-1954
    "40762", #Nuovo Cimento 1955-1965
    "11539", #Nuovo Cimento A 1965-1970
    "40763", #Nuovo Cimento A 1971-1996
    "11542", #Nuovo Cimento B 1965-1970
    "40764", #Nuovo Cimento B 1971-1996
    "11543", #Nuovo Cimento C
    "11544", #Nuovo Cimento D
    "10705", #Nutrient Cycling in Agroecosystems
    "11678", #Obere Extremität
    "11695", #Obesity Surgery
    "10236", #Ocean Dynamics
    "11491", #Oceanology
    "10266", #Odontology
    "442", #Oecologia
    "11079", #Open Economies Review
    "64", #Operative Orthopädie und Traumatologie
    "11082", #Optical and Quantum Electronics
    "10043", #Optical Review
    "11449", #Optics and Spectroscopy
    "11081", #Optimization and Engineering
    "11801", #Optoelectronics Letters
    "291", #OR Spectrum
    "10006", #Oral and Maxillofacial Surgery (=Mund-, Kiefer- und Gesichtschirurgie)
    "11282", #Oral Radiology
    "11083", #Order
    "11613", #Organisationsberatung, Supervision, Coaching
    "13127", #Organisms Diversity & Evolution
    "11084", #Origins of Life and Evolution of Biospheres
    "65", #Orthopedics Traumatology
    "198", #Osteoporosis International
    "506", #Österreichische Wasser- und Abfallwirtschaft
    "11614", #Österreichische Zeitschrift für Soziologie
    "11085", #Oxidation of Metals
    "10333", #Paddy and Water Environment
    "12549", #Palaeobiodiversity and Palaeoenvironments
    "12542", #Paläontologische Zeitschrift
    "11492", #Paleontological Journal
    "436", #Parasitology Research
    "11089", #Pastoral Psychology
    "10044", #Pattern Analysis and Applications
    "11493", #Pattern Recognition and Image Analysis
    "246", #Pediatric Cardiology
    "467", #Pediatric Nephrology
    "247", #Pediatric Radiology
    "383", #Pediatric Surgery International
    "10998", #Periodica Mathematica Hungarica
    "779", #Personal and Ubiquitous Computing
    "11494", #Petroleum Chemistry
    "11495", #Petrology
    "424", #Pflügers Archiv - European Journal of Physiology
    "11094", #Pharmaceutical Chemistry Journal
    "11095", #Pharmaceutical Research
    "11097", #Phenomenology and the Cognitive Sciences
    "11406", #Philosophia
    "11098", #Philosophical Studies
    "13347", #Philosophy & Technology
    "11107", #Photonic Network Communications
    "11120", #Photosynthesis Research
    "11099", #Photosynthetica
    "11110", #Physical Oceanography
    "269", #Physics and Chemistry of Minerals
    "16", #Physics in Perspective
    "11450", #Physics of Atomic Nuclei
    "11451", #Physics of the Solid State
    "12298", #Physiology and Molecular Biology of Plants
    "11101", #Phytochemistry Reviews
    "12600", #Phytoparasitica
    "11102", #Pituitary
    "11104", #Plant and Soil
    "299", #Plant Cell Reports
    "11240", #Plant Cell, Tissue and Organ Culture (PCTOC)
    "11258", #Plant Ecology
    "11130", #Plant Foods for Human Nutrition
    "10725", #Plant Growth Regulation
    "11103", #Plant Molecular Biology
    "11105", #Plant Molecular Biology Reporter
    "497", #Plant Reproduction (früher: Sexual Plant Reproduction)
    "606", #Plant Systematics and Evolution
    "425", #Planta
    "11090", #Plasma Chemistry and Plasma Processing
    "11452", #Plasma Physics Reports
    "11088", #Plasmas Polymers
    "11468", #Plasmonics
    "300", #Polar Biology
    "11077", #Policy Sciences
    "11109", #Political Behavior
    "289", #Polymer Bulletin
    "11529", #Polymer Science, Series A - D
    "11111", #Population and Environment
    "10144", #Population Ecology
    "11113", #Population Research and Policy Review
    "10258", #Portuguese Economic Journal
    "11117", #Positivity
    "11540", #Potato Research
    "11118", #Potential Analysis
    "11106", #Powder Metallurgy and Metal Ceramics
    "10749", #Power Technology and Engineering
    "12043", #Pramana - Journal of Physics
    "11553", #Prävention und Gesundheitsförderung
    "11119", #Precision Agriculture
    "11121", #Prevention Science
    "10329", #Primates
    "440", #Probability Theory and Related Fields
    "12602", #Probiotics and Antimicrobial Proteins
    "735", #ProCare
    "12044", #Proceedings - Mathematical Sciences (= Proc. In the Indian Academy of Sciences - Math. Sciences)
    "13271", #Proceedings Animal Sciences
    "11501", #Proceedings of the Steklov Institute of Mathematics
    "12388", #Proceedings Plant Sciences
    "11125", #PROSPECTS
    "709", #Protoplasma
    "11126", #Psychiatric Quarterly
    "426", #Psychological Research
    "11336", #Psychometrika
    "13423", #Psychonomic Bulletin & Review
    "213", #Psychopharmacology
    "278", #Psychotherapeut
    "11127", #Public Choice
    "11115", #Public Organization Review
    "10240", #Publications mathématiques de l'IHÉS
    "12109", #Publishing Research Quarterly
    "11616", #Publizistik
    "24", #Pure and Applied Geophysics
    "11302", #Purinergic Signalling
    "11129", #QME Quantitative Marketing and Economics
    "11133", #Qualitative Sociology
    "11135", #Quality & Quantity
    "11136", #Quality of Life Research
    "11128", #Quantum Information Processing
    "11134", #Queueing Systems
    "411", #Radiation and Environmental Biophysics
    "11604", #Radiation Medicine (s. Japanese Journal of Radiology)
    "11137", #Radiochemistry
    "11141", #Radiophysics and Quantum Electronics
    "13147", #Raumforschung und Raumordnung
    "11144", #Reaction Kinetics, Mechanisms and Catalysis
    "11145", #Reading and Writing
    "11241", #Real-Time Systems
    "194", #Rechtsmedizin
    "11148", #Refractories and Industrial Ceramics
    "10113", #Regional Environmental Change
    "11819", #Regular and Chaotic Dynamics
    "12215", #Rendiconti del Circolo Matematico di Palermo
    "40777", #Rendiconti del Circolo Matematico Palermo 1884-1940
    "12210", #Rendiconti Lincei
    "12522", #Reproductive Medicine and Biology
    "766", #Requirements Engineering
    "11158", #Res Publica
    "433", #Research Experimental Medicine
    "163", #Research in Engineering Design
    "11162", #Research in Higher Education
    "11165", #Research in Science Education
    "11164", #Research on Chemical Intermediates
    "12045", #Resonance
    "25", #Results in Mathematics
    "12114", #Review Black Political Economy
    "11142", #Review of Accounting Studies
    "11147", #Review of Derivatives Research
    "10058", #Review of Economic Design
    "11150", #Review of Economics of the Household
    "11151", #Review of Industrial Organization
    "11846", #Review of Managerial Science
    "13164", #Review of Philosophy and Psychology
    "11156", #Review of Quantitative Finance and Accounting
    "10037", #Review of Regional Research (=Jahrbuch für Regionalwissenschaft)
    "10037", #Review of Regional Research (s. Jahrbuch für Regionalwissenschaft)
    "13644", #Review of Religious Research
    "10290", #Review of World Economics
    "11154", #Reviews in Endocrine & Metabolic Disorders
    "11157", #Reviews in Environmental Science and Bio/Technology
    "11160", #Reviews in Fish Biology and Fisheries
    "13163", #Revista Matemática Complutense
    "397", #Rheologica Acta
    "296", #Rheumatology International
    "11587", #Ricerche di Matematica
    "11546", #Rivista del Nuovo Cimento 1969-1970
    "40765", #Rivista del Nuovo Cimento 1971-1977
    "40766", #Rivista del Nuovo Cimento 1978-1999
    "603", #Rock Mechanics and Rock Engineering
    "11172", #Russian Chemical Bulletin
    "11167", #Russian Journal of Applied Chemistry
    "11175", #Russian Journal of Electrochemistry
    "11176", #Russian Journal of General Chemistry
    "11502", #Russian Journal of Inorganic Chemistry
    "11503", #Russian Journal of Mathematical Physics
    "11181", #Russian Journal of Nondestructive Testing
    "11178", #Russian Journal of Organic Chemistry
    "11504", #Russian Journal of Physical Chemistry A
    "11185", #Russian Linguistics
    "11982", #Russian Mathematics
    "11505", #Russian Metallurgy (Metally)
    "11983", #Russian Meteorology and Hydrology
    "11182", #Russian Physics Journal
    "12046", #Sadhana
    "13572", #Sankhya (Series A und B - combined subscription mit Refs. 13171 und 13571)
    "11191", #Science & Education
    "11948", #Science and Engineering Ethics
    "11430", #Science China Earth Sciences
    "11425", #Science China Mathematics
    "10820", #Scientific Modeling Simulation SMNS
    "11192", #Scientometrics
    "29", #Selecta Mathematica
    "11453", #Semiconductors
    "233", #Semigroup Forum
    "281", #Seminars in Immunopathology
    "11220", #Sensing and Imaging: An International Journal (= Subsurface Sensing Technologies and Applications)
    "11228", #Set-Valued and Variational Analysis
    "11199", #Sex Roles
    "11195", #Sexuality and Disability
    "193", #Shock Waves
    "11202", #Siberian Mathematical Journal
    "12633", #Silicon
    "256", #Skeletal Radiology
    "11325", #Sleep and Breathing
    "11187", #Small Business Economics
    "355", #Social Choice and Welfare
    "11205", #Social Indicators Research
    "11211", #Social Justice Research
    "127", #Social Psychiatry and Psychiatric Epidemiology
    "11218", #Social Psychology of Education
    "12115", #Society
    "500", #Soft Computing
    "10270", #Software and Systems Modeling
    "11219", #Software Quality Journal
    "11204", #Soil Mechanics and Foundation  Engineering
    "11207", #Solar Physics
    "11188", #Somatic Cell Molecular Genetics
    "11818", #Somnologie - Schlafforschung und Schlafmedizin
    "11841", #Sophia
    "12054", #Sozial Extra
    "12592", #Soziale Passagen
    "11214", #Space Science Reviews
    "717", #Spektrum der Augenheilkunde
    "11332", #Sport Sciences for Health
    "12662", #Sportwissenschaft
    "548", #Standort
    "11203", #Statistical Inference for Stochastic Processes
    "10260", #Statistical Methods and Applications
    "362", #Statistical Papers
    "11222", #Statistics and Computing
    "12561", #Statistics in Biosciences
    "12015", #Stem Cell Reviews and Reports
    "477", #Stochastic Environmental Research and Risk Assessment
    "66", #Strahlentherapie und Onkologie
    "11506", #Stratigraphy and Geological Correlation
    "11223", #Strength of Materials
    "158", #Structural and Multidisciplinary Optimization
    "11224", #Structural Chemistry
    "11200", #Studia Geophysica et Geodaetica
    "11225", #Studia Logica
    "12116", #Studies in Comparative International Development
    "11212", #Studies in East European Thought
    "11217", #Studies in Philosophy and Education
    "11507", #Studies on Russian Economic Development
    "11220", #Subsurface Sensing Technologies and Applications (s. Sensing and Imaging: An International Journal)
    "520", #Supportive Care in Cancer
    "595", #Surgery Today
    "276", #Surgical and Radiologic Anatomy
    "464", #Surgical Endoscopy
    "10712", #Surveys in Geophysics
    "11625", #Sustainability Science
    "15", #Swiss Journal of Geosciences
    "13358", #Swiss Journal of Palaeontology
    "13199", #Symbiosis
    "11229", #Synthese
    "11230", #Systematic Parasitology
    "11213", #Systemic Practice and Action Research
    "11523", #Targeted Oncology
    "11454", #Technical Physics
    "11455", #Technical Physics Letters
    "10151", #Techniques in Coloproctology
    "10758", #Technology, Knowledge and Learning
    "11528", #TechTrends
    "11235", #Telecommunication Systems
    "11233", #Tertiary Education Management
    "11749", #TEST
    "12248", #The AAPS Journal
    "12108", #The American Sociologist
    "168", #The Annals of Regional Science
    "159", #The Astronomy and Astrophysics Review
    "13384", #The Australian Educational Researcher
    "12229", #The Botanical Review
    "12311", #The Cerebellum
    "10198", #The European Journal of Health Economics
    "10050", #The European Physical Journal A
    "10051", #The European Physical Journal B
    "10053", #The European Physical Journal D
    "10189", #The European Physical Journal E
    "13129", #The European Physical Journal H
    "13360", #The European Physical Journal Plus
    "11734", #The European Physical Journal Special Topics
    "10554", #The International Journal of Cardiovascular Imaging
    "11367", #The International Journal of Life Cycle Assessment
    "11414", #The Journal of Behavioral Health Services & Research
    "10828", #The Journal of Comparative Germanic Linguistics
    "10888", #The Journal of Economic Inequality
    "10892", #The Journal of Ethics
    "232", #The Journal of Membrane Biology
    "12603", #The journal of nutrition, health & aging
    "12576", #The Journal of Physiological Sciences
    "10935", #The Journal of Primary Prevention
    "11146", #The Journal of Real Estate Finance and Economics
    "11227", #The Journal of Supercomputing
    "10961", #The Journal of Technology Transfer
    "40295", #The Journal of the Astronautical Sciences
    "10790", #The Journal of Value Inquiry
    "283", #The Mathematical Intelligencer
    "13237", #The Nucleus
    "11508", #The Physics of Metals and Metallography
    "10930", #The Protein Journal
    "11139", #The Ramanujan Journal
    "11138", #The Review of Austrian Economics
    "11558", #The Review of International Organizations
    "114", #The Science of Nature (bis 2015: Die Naturwissenschaften, 0028-1042, 1432-1904)
    "11256", #The Urban Review
    "371", #The Visual Computer
    "778", #The VLDB Journal
    "704", #Theoretical and Applied Climatology
    "122", #Theoretical and Applied Genetics
    "162", #Theoretical and Computational Fluid Dynamics
    "11237", #Theoretical and Experimental Chemistry
    "11232", #Theoretical and Mathematical Physics
    "214", #Theoretical Chemistry Accounts
    "12080", #Theoretical Ecology
    "11236", #Theoretical Foundations of Chemical Engineering
    "11017", #Theoretical Medicine and Bioethics
    "11238", #Theory and Decision
    "11186", #Theory and Society
    "12064", #Theory in Biosciences
    "224", #Theory of Computing Systems
    "11509", #Thermal Engineering
    "11510", #Thermophysics and Aeromechanics
    "11750", #TOP
    "11244", #Topics in Catalysis
    "11245", #Topoi
    "12535", #Trabajos estadística
    "12536", #Trabajos estadística investigación operativa
    "12537", #Trabajos investigación operativa
    "12666", #Transactions of the Indian Institute of Metals
    "12680", #Transactions Royal Academy Medicine Ireland
    "31", #Transformation Groups
    "11248", #Transgenic Research
    "11243", #Transition Metal Chemistry
    "12975", #Translational Stroke Research
    "11242", #Transport in Porous Media
    "11116", #Transportation
    "10039", #Trauma und Berufskrankheit
    "11295", #Tree Genetics & Genomes
    "468", #Trees
    "12117", #Trends in Organized Crime
    "11249", #Tribology Letters
    "11250", #Tropical Animal Health and Production
    "12042", #Tropical Plant Biology
    "11253", #Ukrainian Mathematical Journal
    "10209", #Universal Access in the Information Society
    "11252", #Urban Ecosystems
    "12132", #Urban Forum
    "240", #Urolithiasis (früher: Urological Research)
    "290", #Urologic Radiology
    "11257", #User Modeling and User-Adapted Interaction
    "550", #uwf UmweltWirtschaftsForum
    "334", #Vegetation History and Archaeobotany
    "11988", #Vestnik St. Petersburg University: Mathematics
    "11259", #Veterinary Research Communications
    "428", #Virchows Archiv
    "443", #Virchows Archiv B Cell Pathology
    "10055", #Virtual Reality
    "11262", #Virus Genes
    "12186", #Vocations and Learning
    "11266", #VOLUNTAS: International Journal of Voluntary and Nonprofit Organizations
    "12403", #Water Quality, Exposure and Health
    "11268", #Water Resources
    "11269", #Water Resources Management
    "11270", #Water, Air, & Soil Pollution
    "40194", #Welding in the World
    "13157", #Wetlands
    "11273", #Wetlands Ecology and Management
    "508", #Wiener klinische Wochenschrift
    "11812", #Wiener klinische Wochenschrift Education
    "10354", #Wiener Medizinische Wochenschrift
    "11276", #Wireless Networks
    "11277", #Wireless Personal Communications
    "10273", #Wirtschaftsdienst
    "226", #Wood Science and Technology
    "11274", #World Journal of Microbiology and Biotechnology
    "12519", #World Journal of Pediatrics
    "268", #World Journal of Surgery
    "345", #World Journal of Urology
    "11280", #World Wide Web
    "11859", #Wuhan University Journal Natural Sciences
    "11858", #ZDM (= Zentralblatt für Didaktik der Mathematik)
    "12383", #Zeitschrift experimentelle Pathologie
    "33", #Zeitschrift für angewandte Mathematik und Physik
    "12297", #Zeitschrift für die gesamte Versicherungswissenschaft
    "12398", #Zeitschrift für Energiewirtschaft
    "10309", #Zeitschrift für Epileptologie
    "11618", #Zeitschrift für Erziehungswissenschaft
    "391", #Zeitschrift für Gerontologie und Geriatrie
    "393", #Zeitschrift für Rheumatologie
    "12286", #Zeitschrift für Vergleichende Politikwissenschaft
    "12359", #Zeitschrift gesamte Neurologie Psychiatrie
    "12379", #Zeitschrift Kristallographie Mineralogie Petrographie
    "218", #Zeitschrift Physik A Hadrons nuclei
    "257", #Zeitschrift Physik B Condensed Matter
    "288", #Zeitschrift Physik C Particles Fields
    "460", #Zeitschrift Physik D Atoms Molecules Clusters
    "40664", #Zentralblatt für Arbeitsmedizin, Arbeitsschutz und Ergonomie
    "435", #Zoomorphology
]