<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">





    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="collection">
            <xsl:for-each select="/collection/record">
                <xsl:element name="journal">
                    <xsl:attribute name="issn"><xsl:value-of select="datafield[@tag='022']/subfield[@code='a']"></xsl:value-of></xsl:attribute>
                    <xsl:variable name="subcategory" select="datafield[@tag='650']/subfield[@code='x']"></xsl:variable>
                    <xsl:variable name="category" select="datafield[@tag='650']/subfield[@code='a']"></xsl:variable>

                    <xsl:variable name="cdu">
                        <xsl:choose>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Allergy'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Alternative Medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Anatomy'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Andrology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Anesthesiology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Cardiology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Cerebrovascular Diseases  &amp; Stroke'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Clinical Medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Dentistry'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Dermatology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Diabetes and Hypertension'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Diagnostics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Diseases'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Ear, Nose &amp; Throat'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Embryology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Emergency Medicine and Critical Care'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Endocrinology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Family Medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Forensic Science'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Gastroenterology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='General and Others'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Genetics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Geriatrics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Hematology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Hepatology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Histology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='HIV &amp; AIDS'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Immunology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Legal Medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Medical Education, Training &amp; Research'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Medical Informatics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Medical Specialties'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Medicinal Chemistry'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Metabolism'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Morphology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Neurology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Nuclear Medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Nursing'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Nutrition and Dietetics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Obstetrics and Gynecology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Oncology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Ophthalmology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Orthopaedics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Pathology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Pediatrics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Pharmacy and Pharmacology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Physiology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Physiotherapy'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Preventive Medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Psychiatry &amp; Psychology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Public health'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Radiology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Reproduction &amp; Reproductive Medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Rheumatology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Sports medicine'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Surgery'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Therapeutics'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Toxicology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Tuberculosis'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Urology and Nephrology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Venereology'">61</xsl:when>
                            <xsl:when test="$category='Health Sciences' and $subcategory='Veterinary Science'">61</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Architecture, Fine and Decorative Arts'">72</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Current Events &amp; News'">7</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Education &amp; Careers'">7</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Fashion &amp; Entertainment'">7</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='General and Others'">7</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='History'">93/94</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Language &amp; Linguistics'">81</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Literature'">82</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Performing Arts, Travel and Leisure'">7</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Philosophy'">1</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Religion'">2</xsl:when>
                            <xsl:when test="$category='Arts and Humanities' and $subcategory='Society and Culture'">3</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Aerospace and Aeronautics'">52</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Agricultural Engineering'">63</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Architecture'">72</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Automobile and Transportation'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Biomedical Engineering'">60</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Biotechnology'">60</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Chemical Engineering'">54</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Civil Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Control Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Cryotechnology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Dairy Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Electrical Engineering'">621.3</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Electronics'">621.3</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Energy Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Environmental Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Ergonomics'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Fire Fighting and Safety Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Fluid Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Food Science and Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Fuel Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='General and Others'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Industrial Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Instrumentation'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Marine Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Mechanical Engineering'">621.01</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Metrology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Mining Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Nuclear Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Petroleum Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Pharmaceutical Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Polymer Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Printing Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Production Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Quality Engineering'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Satellites, Space Probes &amp; Technology'">6</xsl:when>
                            <xsl:when test="$category='Engineering' and $subcategory='Textile Engineering'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Biomaterials'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Ceramics'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Coatings and Films'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Composites'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Corrosion'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Extractive Metallurgy'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='General and Others'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Melting, Coating, Powder Metallurgy'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Metals, Minerals, Ores &amp; Alloys'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Nanomaterials'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Packaging Materials &amp; Technology'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Physical Metallurgy'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Rubber Technology'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Super Conductors'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Textile materials'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Treatment &amp; Finishing'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Wood, Paper &amp; Cellulosics'">6</xsl:when>
                            <xsl:when test="$category='Material Science and Metallurgy' and $subcategory='Working, Forming, Machining &amp; Joining'">6</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Atmospheric Science'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Biodiversity'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Biomass Energy &amp; Biofuels'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Conservation'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Desert Ecology &amp; Desertification'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Ecosystems &amp; Ecology'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Ecotoxicology'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Energy Conservation &amp; Alternate Energy Sources'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Environmental Engineering'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Environmental laws'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Environmental Planning &amp; Studies'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='General and Others'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Global Warming'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Hazardous Substance Handling, Management &amp; Disposal'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Natural Disasters &amp; Industrial Accidents'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Occupational Hazards &amp; Health'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Pollution (Air, Noise, Soil and Water) &amp; Control'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Radioactivity &amp; nuclear fallout'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Sustainable Development'">55/56</xsl:when>
                            <xsl:when test="$category='Environmental Sciences' and $subcategory='Waste management and Recycling'">55/56</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Agricultural Biotechnology'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Agricultural Engineering'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Agro Business, Economics and Policies'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Agronomy'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Animal Husbandry, Livestock Management &amp; Poultry Sciences'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Animal Nutrition,  Feed, Feed Additives &amp; Manufacture'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Apiculture'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Crops, Crop Production and Protection'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Dairy Technology'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Dryland Farming'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Fisheries and Aquaculture'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Food Science and Technology'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Forestry'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='General and Others'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Horticulture and Plant Culture (including Arboriculture)'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Organic Farming, Rural Development, Sustainable Agriculture'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Pests,  Pest Control &amp; Integrated Pest Management'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Plant Breeding'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Plant Pathology'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Post Harvesting Operations and Storage'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Seed Technology &amp; Propagation'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Soil Chemistry, Microbiology, Fertility &amp; Fertilizers'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Veterinary Science'">63</xsl:when>
                            <xsl:when test="$category='Agriculture Sciences' and $subcategory='Water and Water Resources'">63</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Cartography'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Energy Minerals'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Engineering Geology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Environmental Geology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Extraterrestrial Geology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='General and Others'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Geochemistry'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Geographic Information Systems &amp; Remote Sensing'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Geography'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Geology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Geophysics'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Hydrology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Marine Geology and Oceanography'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Meteorology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Mineralogy'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Paleontology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Petrology'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Stratigraphy'">55/56</xsl:when>
                            <xsl:when test="$category='Earth Sciences' and $subcategory='Tectonics, Seismology &amp; Volcanology'">55/56</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Analytical Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Applied Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Biochemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Chemical Engineering'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Clinical Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Crystallography'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Electrochemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Environmental Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='General and Others'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Inorganic Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Kinetics'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Medicinal Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Nuclear Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Organic Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Petroleum'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Pharmaceutical Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Physical Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Polymers and Plastics'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Radiation Chemistry'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Synthesis'">54</xsl:when>
                            <xsl:when test="$category='Chemistry' and $subcategory='Toxicology'">54</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Artificial Intelligence'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Automation'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Computational Biosciences'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Computer Aided Design &amp; Production Control'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Computer Architecture, Languages and Compilers'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Computer Science (Hardware &amp; Networks)'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Computer Security Confidentiality'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Cybernetics'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Data Storage and Data Mining'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Database Design &amp; Management'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Embedded Systems'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='General and Others'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Graphics'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Healthcare Database &amp; Medical Informatics'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Information Extraction, Retrieval and Filtering'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Information Science and Systems'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Insurance Financial Systems'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Internet'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Mobile Computing'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Modelling &amp; Simulation'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Multimedia'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Neural Networks'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Robotics'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Software Engineering'">004</xsl:when>
                            <xsl:when test="$category='Information Technology' and $subcategory='Web Development'">004</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Algebra'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Algebraic Geometry'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Algorithms'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Applied Mathematics'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Arithmetic'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Calculus'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Combinatorics'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Complex Analysis'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Differential Geometry'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Game Theory'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='General and Others'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Geometry'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Graph Theory'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Group theory'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Logic'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Mathematical Analysis &amp; Logic'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Mathematical Physics'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Number Theory'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Numerical Analysis'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Probability'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Set Theory'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Statistics'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Stochastic Computation'">51</xsl:when>
                            <xsl:when test="$category='Mathematical Sciences' and $subcategory='Topology'">51</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Anthropology'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Archeology'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Behavioral Science (Psychology) and Counselling'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Communities and Urban Planning'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Community Based Awareness and Relief Service'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Demographic Studies'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Developmental Issues &amp; Socioeconomic Studies'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Disability Studies &amp; Assistance'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Foreign Policy, Defense and Internal Security'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Gender Studies'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='General and Others'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Journalism, Mass Communication, Media &amp; Publishing'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Museums &amp; Heritage Organizations'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Political Science'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Public Policy &amp; Administration'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Regional and International Studies'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Rehabilitation'">3</xsl:when>
                            <xsl:when test="$category='Social Sciences' and $subcategory='Sociology'">3</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Andrology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Animal Physiology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Biochemistry'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Bioinformatics'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Biology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Biophysics'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Biotechnology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Botany'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Computational Biosciences'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Cytology, Cell Biology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Entomology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Ethology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Evolutionary Studies'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='General and Others'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Genetics'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Genomics'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Immunology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Limnology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Metabolism'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Micro and Molecular Biology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Mineralogy'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Morphology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Ornithology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Palaeontology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Taxonomy &amp; Systematics'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Toxicology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Virology'">57/59</xsl:when>
                            <xsl:when test="$category='Life Sciences' and $subcategory='Zoology'">57/59</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Accounting and Auditing'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Actuarial Science, Insurance and Risk Management'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Business Management'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='E-Commerce'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Economics'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Finance'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='General and Others'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Insurance and Investment'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='International Business &amp; Transnational Corporations'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Marketing and Sales'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Material &amp; Supply Chain Management'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Multimodal Transport &amp; Logistics'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Operations Research'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Organizational change and Development'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Organizational Communication, Business Writing'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Organizational Psychology'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Personnel Management &amp; Training'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Projects and Consultancies'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Public Relations'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Quality Management'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Stocks and Shares'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Strategic Management &amp; Business Policy'">33</xsl:when>
                            <xsl:when test="$category='Business, Economy and Management' and $subcategory='Trade and Commerce'">33</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Arbitration, Education &amp; Training'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Banking Law'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Constitution and Judicial System'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Corporate laws'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Crime, Criminology and Law Enforcement'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Domicile and Immigration Laws'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Environmental Law &amp; Policy'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Foreign Trade &amp; Commercial Transactions'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='General and Others'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Industrial Relations Law'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Insurance Law'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Intellectual Property'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Investment Laws'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Policies'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Regional and International Law'">34</xsl:when>
                            <xsl:when test="$category='Law' and $subcategory='Taxation Laws'">34</xsl:when>
                            <xsl:when test="$category='Telecommunications Technology' and $subcategory='Cables &amp; Optical Fibres'">6</xsl:when>
                            <xsl:when test="$category='Telecommunications Technology' and $subcategory='Communication Networks &amp; Technology'">6</xsl:when>
                            <xsl:when test="$category='Telecommunications Technology' and $subcategory='Digital Signal Processing'">6</xsl:when>
                            <xsl:when test="$category='Telecommunications Technology' and $subcategory='General and Others'">6</xsl:when>
                            <xsl:when test="$category='Telecommunications Technology' and $subcategory='Image Processing &amp; Television Technology'">6</xsl:when>
                            <xsl:when test="$category='Telecommunications Technology' and $subcategory='Telemedicine'">6</xsl:when>
                            <xsl:when test="$category='Telecommunications Technology' and $subcategory='Wireless Communications'">6</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Abstracting and Indexing'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Acquisition'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Archives &amp;  Preservation'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Cataloging'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Classification'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Digital Libraries'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='General and Others'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Information Sources, Services and Retrieval'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Librarianship and Libraries'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Library Automation'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Library Management'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Library Networks'">02</xsl:when>
                            <xsl:when test="$category='Library and Information Sciences' and $subcategory='Serials Control'">02</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Acoustics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Applied Physics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Astronomy'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Astrophysics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Atmospheric Physics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Condensed Matter Physics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Cryogenics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Energy'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='General and Others'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Magnetism'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Mechanics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Nuclear Physics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Optics &amp; Opto Electronics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Particle Physics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Plasma Physics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Radiation'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Relativity'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Solid State Physics'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Thermodynamics and Heat Transfer'">53</xsl:when>
                            <xsl:when test="$category='Physics' and $subcategory='Ultrasonic'">53</xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:if test="string-length($cdu)&gt;0">
                        <xsl:element name="cdu"><xsl:value-of select="$cdu"></xsl:value-of></xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>









</xsl:stylesheet>