<!--* Copyright Epic Systems Corporation 2010-2014. All rights reserved.-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:its="http://www.w3.org/2005/11/its"  xmlns:epicdoc="urn:epicsystems-com:Community.2006-04.Services"  xmlns:cldoc="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc"  exclude-result-prefixes="epicdoc cldoc sdtc">    <xsl:param name="context" />

    <xsl:variable name="lucyMyCh" select="boolean(cldoc:ClinicalDocument/cldoc:templateId/@root='1.2.840.114350.1.72.1.77896771')" />
    <xsl:variable name="isPublicStr">
        <xsl:choose>
            <xsl:when test="true()">1</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="isPublic" select="$isPublicStr=1" />
    <xsl:variable name="Unknown" xml:id="langUnknown">Unknown
    </xsl:variable>
    <xsl:variable name="AgeYO" xml:id="langYO">y.o.
    </xsl:variable>
    <xsl:variable name="AgeMO" xml:id="langMO">m.o.
    </xsl:variable>
    <xsl:variable name="AgeWO" xml:id="langWO">w.o.
    </xsl:variable>
    <xsl:variable name="AgeDO" xml:id="langDO">d.o.
    </xsl:variable>
    <xsl:variable name="DemogTitle" xml:id="langPatientDemog">Patient Demographics
    </xsl:variable>
    <xsl:variable name="MetadataTitle" xml:id="langDocInfoTitle">Document Information
    </xsl:variable>
    <xsl:variable name="TextTitle" xml:id="langMessageTextTitle">Message Text
    </xsl:variable>
    <xsl:variable name="AboutMeTitle" xml:id="langAboutMeTitle">About Me
    </xsl:variable>
    <xsl:variable name="PCPLabel" xml:id="langPCP">Primary Care Provider
    </xsl:variable>
    <xsl:variable name="ImgMailingAlt" xml:id="langAltMailing">Mailing address
    </xsl:variable>
    <xsl:variable name="ImgPhoneAlt" xml:id="langAltPhone">Telephone
    </xsl:variable>
    <xsl:variable name="ImgUSBAlt" xml:id="langAltUSB">Carry Lucy on your thumb drive
    </xsl:variable>
    <xsl:variable name="ListSep" xml:id="langListSep">,
    </xsl:variable>   <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ
    </xsl:variable>
    <xsl:output method="html" doctype-system="about:legacy-compat"/>
    <xsl:template match="cldoc:ClinicalDocument">
        <xsl:variable name="docBuilder">
            <xsl:choose>
                <xsl:when test="cldoc:templateId/@root='1.2.840.114350.1.72.1.51693'">Epic</xsl:when>
                <xsl:when test="cldoc:templateId/@root='1.2.840.114350.1.72.1.1221325'">Lucy</xsl:when>
                <xsl:when test="cldoc:templateId/@root">Other</xsl:when>
                <xsl:otherwise>Epic</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
<html lang="en">
    <head>
        
        <!--<link href="css/ccr.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">-->

        <xsl:if test="$context='VB' or $context='ECL' or $isPublic"> <meta http-equiv="X-UA-Compatible" content="IE=edge"/> </xsl:if>
        <title>
            <xsl:value-of select="cldoc:title" /> -
            <xsl:value-of select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:name[1]/cldoc:family" />,
            <xsl:value-of select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:name[1]/cldoc:given" />
        </title>
        
        <style type="text/css" media="print">
            body { overflow: auto !important; }
            #DocBody { overflow: visible !important; height: auto !important; }
            div.printOnly { display: block; }
            span.printOnly { display: inline; } 
            .SectionWrapper { page-break-inside:avoid; }
        </style>
    
        <style type="text/css">

            <!--GLOBAL STYLES -->
            
            body {
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 13px;
            }

            #DocumentHeaderSection {
                background: #f8f8f8;
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                right: 75%;
                overflow: scroll;
            }

            #DocBody {
                background: #fff;
                position: absolute;
                left: 25%;
                top: 0;
                bottom: 0;
                right: 0;
                overflow-y: auto;
            }

            #document {
                margin:0;
            }

            .SectionWrapper {
                padding:20px;
                border-bottom:1px solid #ccc;
            }

            .label {
                color: #b3b3b3;
                font-size: 12px;
                text-transform: uppercase;
                font-weight: normal;
            }

            .item-note {
                color:#b3b3b3;
                font-weight: normal;
            }

            .innerHead {
                color:#0000ff;
            }

            .innerHead #HeaderText {
                
            }

            .strong {
                font-weight:bold;
            }

            ul {
                margin:0;
                padding:0;
            }

            ul li {
                list-style:none;
            }

            <!-- PATIENT DEMOGRAPHICS -->

            .ptDetails {
                font-style:italic ;
                font-size: 16px;
            }

            .ptName {
                color:green;
                font-weight:normal;
            }

            #langBorn {
                font-weight:bold;
            }

            #patientDemog .ContentText {
                font-weight:bold;
            }

            .list-content {
                margin-bottom: 10px;
            }




        </style>
        <xsl:if test="not($lucyMyCh)"> <xsl:if test="$docBuilder!='Epic'">  <style type="text/css"> .h_ { background-color: #CCC; border-width: 3px; }  .head, .body_ {   border-width: 3px; } </style> </xsl:if>
        </xsl:if>
    </head>

<body id="document">
    <div id="SectionLinks" role="complementary">
        <div id="DocumentHeaderSection" class="SectionWrapper">
            <div class="head" id="Head0">
                <xsl:choose>
                    <xsl:when test="$lucyMyCh">
                        <div id="AsOfLucy"> <xsl:choose> <xsl:when test="$context='Haiku'"> <img alt="LucyLogo" src="LucyLogo.png" />   </xsl:when> <xsl:otherwise>  <img alt="LucyLogo" src="data:image/png;base64,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" /> </xsl:otherwise> </xsl:choose> <span id="langAsOfLucy">Personal Health Summary, as of <xsl:call-template name="Date"> <xsl:with-param name="date" select="cldoc:effectiveTime/@value"/> <xsl:with-param name="includeTime" select="boolean(true)"/> </xsl:call-template> </span>
                        </div>
                    
                        <xsl:if test="$isPublic"> <div class="clear"></div>
                        <div class="textAlignCenter"> <img src="../../HTML/IMAGES/org.png" class="logo" alt="Personal Health Summary Logo"></img> </div>
                        </xsl:if>
                        <div class="patientName"> <xsl:apply-templates select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient"/>
                            <div class="clear"></div>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                            <span id="HeaderText"> <!--<xsl:value-of select="cldoc:title" /> <xsl:text> - </xsl:text> --><xsl:apply-templates select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient"> <!--<xsl:with-param name="documentDate" select="cldoc:effectiveTime/@value"/>--> </xsl:apply-templates>
                            </span>
                            <!--<span id="AsOfEpic">
                                <span id="langAsOfEpic">As of
                                    <xsl:call-template name="Date"> <xsl:with-param name="date" select="cldoc:effectiveTime/@value" /> </xsl:call-template>
                                </span> <xsl:text>&#160;</xsl:text>
                            </span>-->
                            <xsl:if test="not($lucyMyCh)"> <xsl:call-template name="PatientDemographicsSection"/> </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <xsl:variable name="Address"> <xsl:value-of select="cldoc:recordTarget/cldoc:patientRole/cldoc:addr" /> </xsl:variable>
            <xsl:variable name="ContactInfo"> <xsl:value-of select="cldoc:recordTarget/cldoc:patientRole/cldoc:telecom/@value" /> </xsl:variable>
            <xsl:if test="boolean($lucyMyCh) and ($Address!='' or $ContactInfo!='')">
                <div class="headerBody">
                    <div class="ContentTable">
                        <div>
                            <div class="LucyIcon" >
                                <xsl:variable name="addrSrc">
                                    <xsl:choose>
                                        <xsl:when test="$context='Haiku'">LucyAddress.png</xsl:when>
                                        <xsl:otherwise>data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAACWklEQVR42u2YzUtUURiHx5zZ6GLUteLChRC2mtnEEBQDyoTLWg61k7Cmz10ERR+biGaRSPgPuLGMjBa1Hlq4aRFE2SIoKqSgDzJt9Pac+AkXufd6r+PMGeq88DB3znnfc557vPccNZVy4cKFCxf/XVSr1Rw8hHnYa1PE20pATgdcg1V4Di/hJ5y3KX0Kivr0tvT3wTOow03dQIeuTdsj6LIhXdB1wS/N9Qi8he9wNKD2iPpewIB1aT7H4Ct8gnxEfV45kXlNl4Yy/IJXMBhjjEHlfjM3a0u6ruc4m2CcrGrMzZZbKX1D3+9BegdjpeE+/IYTTZeG67ABU2G5xWKxE4ZEZ8SY07AOF5op/ViTXA6RzcBFWAZPLKstEzLuVY15pVnS5sd5MmJ1532yT8Xm9wdhq86YZ2ENbu2m8IykJyMeiQnJLcCwVj2j6wX1TUTMcUwv553dEL6rLWo0Kg+hRYnlAvpy6lvcZq5xHULTjUp/gf3b5SG0Ah+gN6CvV30rMeY7YOZsVHokTh5Cn2ED+gP6+mHd5MScc19LTkyE5vQInINuX3sXnFHfXFv9Dq3ndlVyh33tebWZvnyq3QKpMqzBLKTVVpH08bb8iwWxPfBD+3NGbZckXWgXyVF47TtANjltbkA5pYD+JVNrQ/gQ1CXxHmo69SZhwJfXJ/Hb8ES5nmoPtlp6ybdb9CSo61HN3xVvtbQXdpjEqDWHzUczhg3pWgP1NSedQPodZHdQm1WtZ+tFrCQRl3DF1otYCtjy4uDf8ko29uox34on4Y2pdf/1dOHChYt/M/4ADMAoATZGC+wAAAAASUVORK5CYII=
                                        </xsl:otherwise>
                                            
                                    </xsl:choose>
                                </xsl:variable>

                            <img alt="{$ImgMailingAlt}" src="{$addrSrc}" />
                            </div>
                            <div class="LucyDemographics">
                                <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:addr">
                                    <xsl:call-template name="Address">
                                        <xsl:with-param name="address" select="." />
                                        <xsl:with-param name="numAddresses" select="count(cldoc:recordTarget/cldoc:patientRole/cldoc:addr)" />
                                    </xsl:call-template>
                                </xsl:for-each>
                            </div>
                            <div class="LucyIcon" >
                                <xsl:variable name="phoneSrc">
                                    <xsl:choose>
                                        <xsl:when test="$context='Haiku'">LucyPhone.png</xsl:when>
                                        <xsl:otherwise>data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAADbElEQVR42u2Yy2tTQRTGozWkhiLYQFIRhDQokoLUtaaQ+KCpNK7rQhLBlWtb0dpF0q0S9A9IcVHBnabdmC50J7RSxUdbBR/gY5G48IWNrcZv4LsyDDfJfbYKd+BHuPfOOee7k5k7Z47P5zWvec1rm9aKxWIYZEEJzIMqqJMq75XYp2ezxSZAGayBhkQNPCM15dk6bRIbLbYXzEhCVsAkyIA+EAIBEuI98azAvpqd8NG7EYJHwGcGrYC0EGbCvps2FfoQvk65KXhCGqVRELHhK0Ifmr8JNwRfpPNHIAm6HPDZRV+L9D3u9JQQTp+Ag8Cv9kmlUufAfZA06dtPn48ZY8QJwVHwhQ6PqIIhcj9/86AB3oOdFoSnGEPEitoVrX0lxtQpAXEHQB0cA9vBKwovWpwqY9pXxY7gw3Qyp7foIK5EkcsgAIZ5LV6k1+LinGPMhFXRd+hgSO85hL2mSMEF3pvh9bTFmGnGvG11axY73Ytm32EI+yaJ/g72gCjn9TTotBA3xA1IxA6bNc7yjSeb9YGoD5Lov6OL3y0211GBsbNmDUs0zLQQ/UARfd6hT2yGsafMGs7TsK+F6OuK6NMOiY4z9rxZQ5FSfmqVV0DkkCL6qkOiQ8wOa2YNV8Fz0NlCtB9UJdFiAW5zQHSAaW3drGGdhoFW/cRGoox2bjNF10iojegYWJNEvwVBm6K7OT1rVhdivF1fiLypjHbeoYW4YNZwqt0nTxK9TxntHyDepG/QzU+etrkUjPSHmGvKaL8EPUqfS1y4MYObS86s6Ai30hUjxykI2QHeKcI/givapiPyE96/12zXVLbxiJW5VeYbpw2O9nHwWxGucZKZ4BKvz7ZJmMp2SgTaATZiUHihiWiRawfBUV6LvKVD59+t2EpNlUPAqJFzofjbwY0mwvPsc4sZYlA5BGgH3VknahzacSupdz7UEd6hszAFq2Av2A0OKcetpHTcsl8LEXUJ6STeb0Q4xZ8ADyXRb0Ba53zYL53InauBwNllOl00W0KA0DBHeGubEoIrtQ+1WBO24SvserFGmSpfGeguGBS5gsm8YpC2DfpyrywmBY4pBchl7mIZ5g1qAVLcGwZ5sCTZzQpfG109HeAGtK5T6n1K1FLvL9oM/AtF9RyTrAWmlT9JlffEszNgl89rXvPa/9/+AF5jxHXCL+GrAAAAAElFTkSuQmCC</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <img alt="{$ImgPhoneAlt}" src="{$phoneSrc}" />
                            </div>
                            <div class="LucyDemographics">
                                <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:telecom"> <xsl:call-template name="Telecom"/> </xsl:for-each>
                            </div>
                        </div>
                    </div>
                </div>
            </xsl:if>
        </div>
    </div>
    <div id="DocBody" role="main">
        <div id="InnerDocBody">
            <!--<xsl:if test="not($lucyMyCh)"> <xsl:call-template name="PatientDemographicsSection"/> </xsl:if>-->
            <xsl:if test="cldoc:component/cldoc:structuredBody">  <xsl:apply-templates select="cldoc:component/cldoc:structuredBody"/> </xsl:if>
            <xsl:if test="cldoc:component/cldoc:nonXMLBody/cldoc:text/@mediaType='text/plain'">  <xsl:call-template name="nonXMLTextSection" /> </xsl:if>
            <xsl:if test="not($lucyMyCh)"> <xsl:call-template name="DocumentMetadataSection" /> </xsl:if>
        </div>
    </div>
    <xsl:if test="$lucyMyCh and $isPublic">
        <div class="clear"> <br /><br /><br /> </div>
        <div id="foot" role="complementary">
            <img alt="{$ImgUSBAlt}" src="data:image/png;base64,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" />
            <div id="langLucyUSB">If you take your Lucy record on a thumb drive to a different doctor, he or she might be able to use his computer to read the file electronically. Your downloaded, machine-readable Personal Health Summary document is in a format called "CDA." If your doctor has a computer that understands CDA, your information is a folder on your thumb drive called <b>MachineReadable_XDMFormat</b>. You might need to enter a password before your doctor can use this file.
            </div>
        </div>
        <div class="clear"></div>
        <div id="copyright" role="contentinfo"> <span id="langCopyright">Copyright</span> <xsl:text> &#169;</xsl:text>  <xsl:call-template name="Year"> <xsl:with-param name="date" select="cldoc:effectiveTime/@value" /> </xsl:call-template>  Epic</div>
    </xsl:if>
</body>
</html>
</xsl:template>

<!--<xsl:template name="PatientDemographicsSection">
    <xsl:variable name="address">
        <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:addr">
            <xsl:call-template name="Address">
                <xsl:with-param name="address" select="." />
                <xsl:with-param name="numAddresses" select="count(cldoc:recordTarget/cldoc:patientRole/cldoc:addr)" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="telecom">
        <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:telecom">
            <xsl:call-template name="Telecom"/>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="language">
        <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:languageCommunication">
            <xsl:element name="div">
                <xsl:if test="cldoc:proficiencyLevelCode/@code='E'">
                    <xsl:attribute name="title">Proficiency level: Excellent</xsl:attribute>
                </xsl:if>
                <xsl:if test="cldoc:proficiencyLevelCode/@code='F'">
                    <xsl:attribute name="title">Proficiency level: Fair</xsl:attribute>
                </xsl:if>
                <xsl:if test="cldoc:proficiencyLevelCode/@code='G'">
                    <xsl:attribute name="title">Proficiency level: Good</xsl:attribute>
                </xsl:if>
                <xsl:if test="cldoc:proficiencyLevelCode/@code='P'">
                    <xsl:attribute name="title">Proficiency level: Poor</xsl:attribute>
                </xsl:if>
                <xsl:call-template name="Language">
                    <xsl:with-param name="language" select="." />
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:variable>
    
    <div id="patientDemog" class="SectionWrapper">
        <div class="h_ h_E"> <div class="innerHead"><xsl:value-of select="$DemogTitle"/></div> </div>
        <div class="body_ body_E">
            <div class="ContentText">
                <table class="ContentTable" summary="Patient demographics">
                    <tr class="ColumnHeaderRow" id="colsPatientDemog">
                        <th style="width: 25%" scope="col">Patient Address</th>
                        <th style="width: 25%" scope="col">Communication</th>
                        <th style="width: 25%" scope="col">Language</th>
                        <th style="width: 25%" scope="col">Race / Ethnicity</th>
                    </tr>
                    <tr>
                        <td class="loseTheHang">
                            <p>
                            <xsl:choose>
                                <xsl:when test="$address!=''"><xsl:copy-of select="$address"/></xsl:when>
                                <xsl:otherwise><xsl:value-of select="$Unknown"/></xsl:otherwise>
                            </xsl:choose>
                            </p>
                        </td>
                        <td class="loseTheHang">
                            <xsl:choose>
                                <xsl:when test="$telecom!=''"><xsl:copy-of select="$telecom"/></xsl:when>
                                <xsl:otherwise><xsl:value-of select="$Unknown"/></xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="$language!=''"><xsl:copy-of select="$language"/></xsl:when>
                                <xsl:otherwise><xsl:value-of select="$Unknown"/></xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:call-template name="Race" /><xsl:text> / </xsl:text> <xsl:call-template name="Ethnicity" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</xsl:template>-->
<xsl:template name="PatientDemographicsSection">
    <xsl:variable name="address">
        <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:addr">
            <xsl:call-template name="Address">
                <xsl:with-param name="address" select="." />
                <xsl:with-param name="numAddresses" select="count(cldoc:recordTarget/cldoc:patientRole/cldoc:addr)" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="telecom">
        <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:telecom">
            <xsl:call-template name="Telecom"/>
        </xsl:for-each>
    </xsl:variable>
    
    <div id="patientDemog">
        <div class="h_ h_E"> <div class="innerHead"><!--<xsl:value-of select="$DemogTitle"/>--></div> </div>
        <div class="body_ body_E">
            <div class="ContentText">
                <ul>
                    <li class="label">Address</li>
                    <li class="list-content">
                        <xsl:choose>
                            <xsl:when test="$address!=''"><xsl:copy-of select="$address"/></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$Unknown"/></xsl:otherwise>
                        </xsl:choose>
                    </li>
                    <li class="label">Contact</li>
                    <li class="list-content">
                        <xsl:choose>
                            <xsl:when test="$telecom!=''"><xsl:copy-of select="$telecom"/></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$Unknown"/></xsl:otherwise>
                        </xsl:choose>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</xsl:template>

<xsl:template name="Race">
    <xsl:param name="raceDivider"> <xsl:value-of select="$ListSep"/> </xsl:param>
    <xsl:call-template name="DisplayCode"> <xsl:with-param name="code" select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:raceCode" /> </xsl:call-template>
    <xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/sdtc:raceCode"> <xsl:copy-of select="$raceDivider"/> <xsl:call-template name="DisplayCode"> <xsl:with-param name="code" select="."/> </xsl:call-template>
    </xsl:for-each>
</xsl:template>

<xsl:template name="Ethnicity">  <xsl:call-template name="DisplayCode"> <xsl:with-param name="code" select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:ethnicGroupCode" /> </xsl:call-template>
</xsl:template>

<xsl:template name="DocumentMetadataSection">
    <div id="documentMetadata" class="SectionWrapper">
        <div class="h_ h_E">
            <div class="innerHead"> <xsl:value-of select="$MetadataTitle"/> 
        </div>
    </div>
    <div class="body_ body_E"><xsl:apply-templates select="cldoc:documentationOf/cldoc:serviceEvent" mode="direct"/>   <xsl:apply-templates select="cldoc:custodian" mode="direct"/>   <xsl:apply-templates select="cldoc:componentOf/cldoc:encompassingEncounter" mode="direct" />  </div>
    </div>
</xsl:template>

<xsl:template name="nonXMLTextSection">
    <div id="nonXMLText" class="SectionWrapper">
        <div class="h_ h_E">
            <div class="innerHead"> <xsl:value-of select="$TextTitle"/> </div>
        </div>
    <div class="body_ body_E">
        <div class="ContentText monospace LeftPad">
            <xsl:element name="pre">
                <xsl:if test="cldoc:component/cldoc:nonXMLBody/cldoc:text/@representation='B64'">
                    <xsl:attribute name="ID">B64DATA</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="cldoc:component/cldoc:nonXMLBody/cldoc:text" />
            </xsl:element>
        </div>
    </div>
    </div>
</xsl:template>

<xsl:template name="Custodian" match="cldoc:custodian" mode="direct">
    <div class="ContentTable">
        <div class="ContentTR">
            <div class="Block" style="width:100%">
                <div class="thIsh" id="langCustodianOrg">Custodian Organization</div>
                <div class="tdIsh">
                    <xsl:call-template name="Org"> <xsl:with-param name="org" select="cldoc:assignedCustodian/cldoc:representedCustodianOrganization"/> </xsl:call-template>
                </div>
            </div>
        </div>
    </div>
</xsl:template>

<xsl:template name="ServiceEvent" match="cldoc:documentationOf/cldoc:serviceEvent" mode="direct">
    <xsl:variable name="BeginDate">
        <xsl:call-template name="Date">
            <xsl:with-param name="date" select="cldoc:effectiveTime/cldoc:low/@value"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="EndDate">
        <xsl:call-template name="Date"> <xsl:with-param name="date" select="cldoc:effectiveTime/cldoc:high/@value"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="PCP"        select="cldoc:performer[cldoc:functionCode/@code='PP' or cldoc:functionCode/@code='PCP'][cldoc:assignedEntity/cldoc:assignedPerson/cldoc:name/text() or cldoc:assignedEntity/cldoc:assignedPerson/cldoc:name/cldoc:given/text()]"/>
    <xsl:variable name="otherProvs" select="cldoc:performer[not(cldoc:functionCode/@code='PP' or cldoc:functionCode/@code='PCP')]"/>
        <xsl:if test="$BeginDate!='' or $EndDate!='' or count(cldoc:performer)>0">
            <div class="ContentTable">
                <div class="ContentTR">
                    <xsl:choose>
                        <xsl:when test="$PCP and $otherProvs">
                            <div class="Block">
                                <div class="thIsh">
                                    <xsl:value-of select="$PCPLabel"/>
                                </div>
                                <div class="tdIsh">
                                    <xsl:for-each select="$PCP">
                                        <xsl:call-template name="Performer">
                                            <xsl:with-param name="includeDates" select="true()"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </div>
                            </div>
                            <div class="Block" style="width:50%;">
                                <div class="thIsh" id="langOtherServiceProviders">Other Service Providers</div>
                                <xsl:for-each select="$otherProvs">
                                    <div class="ChildBlock">
                                        <div class="tdIsh">
                                            <xsl:call-template name="Performer"> <xsl:with-param name="includeFunction" select="true()"/> </xsl:call-template>
                                        </div>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:when>
                        <xsl:when test="$PCP">
                            <div class="Block" style="width:25%;">
                                <div class="thIsh">
                                    <xsl:value-of select="$PCPLabel"/>
                                </div>
                                <div class="tdIsh">
                                <xsl:for-each select="$PCP">
                                    <xsl:call-template name="Performer">
                                        <xsl:with-param name="includeDates" select="true()"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                </div>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <div class="Block" style="width:75%">
                                <div class="thIsh" id="langServiceProviders">Service Providers
                                </div>
                                <xsl:for-each select="$otherProvs">
                                    <div class="ChildBlock">
                                        <div class="tdIsh">
                                            <xsl:call-template name="Performer"> <xsl:with-param name="includeFunction" select="true"/> </xsl:call-template>
                                        </div>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>
                    <div class="Block">
                        <div class="thIsh" id="langCoverageDates">Document Coverage Dates</div>
                        <div class="tdIsh">
                            <xsl:value-of select="$BeginDate"/>
                            <xsl:if test="$BeginDate!='' and $EndDate!=''"> - </xsl:if>
                            <xsl:value-of select="$EndDate"/>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:if>
</xsl:template>

<xsl:template name="EncompassingEncounter" match="cldoc:componentOf/cldoc:encompassingEncounter" mode="direct">
    <xsl:variable name="StartDate">
        <xsl:call-template name="Date">
            <xsl:with-param name="date" select="cldoc:effectiveTime/cldoc:low/@value" />
            <xsl:with-param name="includeTime" select="$lucyMyCh" />
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="EndDate">
        <xsl:call-template name="Date">
            <xsl:with-param name="date" select="cldoc:effectiveTime/cldoc:high/@value"/>
            <xsl:with-param name="includeTime" select="$lucyMyCh" />
        </xsl:call-template>
    </xsl:variable>
    <div class="ContentTable">
        <div class="ContentTR">
            <div class="Block" style="width:75%">
                <div class="thIsh" id="langEncounterProviders">Encounter Providers</div>
                <xsl:for-each select="cldoc:encounterParticipant[not(cldoc:assignedEntity=preceding-sibling::cldoc:encounterParticipant/cldoc:assignedEntity)]">
                    <div class="ChildBlock">
                        <div class="tdIsh">
                            <xsl:call-template name="Performer">
                                <xsl:with-param name="includeTypeCode" select="true()"/> </xsl:call-template>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
            <div class="Block">
                <div class="thIsh" id="langEncounterDates">Encounter Date</div>
                <div class="tdIsh">
                    <xsl:value-of select="$StartDate"/>
                    <xsl:if test="$StartDate!='' and $EndDate!=''"> -
                    </xsl:if> <xsl:value-of select="$EndDate"/>
                </div>
            </div>
        </div>
    </div>
</xsl:template>

<xsl:template name="Patient" match="cldoc:recordTarget/cldoc:patientRole/cldoc:patient">
    <xsl:param name="documentDate"/>
    <h1 class="ptName">
        <xsl:call-template name="Name">
            <xsl:with-param name="name" select="cldoc:name[1]"/>
            <!--<xsl:with-param name="lastFirst" select="not($lucyMyCh)"/>-->
        </xsl:call-template>
    </h1>
    <span class="ptDOB">
        <xsl:if test="boolean($lucyMyCh) or $isPublic">
            <xsl:variable name="birthDate">
                <xsl:call-template name="Date">
                    <xsl:with-param name="date" select="cldoc:birthTime/@value" />
                </xsl:call-template>
            </xsl:variable>
            <span id="langBorn"><xsl:value-of select="$birthDate"/></span><span class="item-note"> (DOB)</span>
        </xsl:if>
    </span>
    <p class="ptDetails">
        <span class="strong">
            <xsl:call-template name="Name">
                <xsl:with-param name="name" select="cldoc:name[1]/cldoc:given"/>
            </xsl:call-template>
        </span>
        is <span class="strong">(a married)</span> <span class="strong"> (Asian)
        <xsl:call-template name="AdministrativeGenderCode"> <xsl:with-param name="gender_code" select="cldoc:administrativeGenderCode" /> </xsl:call-template></span>
        who observes <span class="strong">(Christianity)</span> and speaks <span class="strong">(English)</span>.
    </p>
</xsl:template>

<xsl:template match="cldoc:component/cldoc:structuredBody">
    <xsl:for-each select="cldoc:component">
        <xsl:choose>
            <xsl:when test="$lucyMyCh and cldoc:section/cldoc:code/@code='X-CE-PFD'">
                <xsl:call-template name="Notification">
                    <xsl:with-param name="notification" select="cldoc:section" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="cldoc:section">
                    
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
</xsl:template>

<xsl:template name="hasText">
    <xsl:choose>
        <xsl:when test="normalize-space(cldoc:text/.)">1</xsl:when>
        <xsl:when test="cldoc:text/child::*">1</xsl:when>
    </xsl:choose>
    <xsl:for-each select="cldoc:component/cldoc:section"> <xsl:call-template name="hasText" /> </xsl:for-each>
</xsl:template>

<xsl:template name="sectionTitle">
    <xsl:choose>
        <xsl:when test="normalize-space(cldoc:title/.)">
            <xsl:value-of select="normalize-space(cldoc:title/.)"/>
        </xsl:when>
        <xsl:when test="cldoc:code/@displayName">
            <xsl:value-of select="cldoc:code/@displayName"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise> </xsl:choose>
</xsl:template>

<xsl:template match="cldoc:section">
    <xsl:param name="position"/>
    <xsl:param name="sectionLinksOnly"/>
    <xsl:param name="sectionID"/>
    <xsl:param name="titlePrefix"/>
    <xsl:variable name="hasText">
        <xsl:call-template name="hasText" />
    </xsl:variable>
    <xsl:variable name="title"> <xsl:call-template name="sectionTitle" />
    </xsl:variable>
    <xsl:choose>
        <xsl:when test="$hasText=''">  </xsl:when>
        <xsl:otherwise>
            <xsl:choose>
                <xsl:when test="$sectionLinksOnly=1">
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="colorName">
                        <xsl:call-template name="ChooseSectionColor">
                            <xsl:with-param name="code">
                                <xsl:value-of select="cldoc:code/@code"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:element name="div">
                        <xsl:attribute name="class">SectionWrapper</xsl:attribute>
                        <xsl:element name="div">
                            <xsl:attribute name="class">
                                <xsl:text>h_ h_</xsl:text>
                                <xsl:value-of select="$colorName"/>
                            </xsl:attribute>
                            <xsl:if test="cldoc:text/@ID">
                                <xsl:attribute name="id"> <xsl:value-of select="cldoc:text/@ID"/> </xsl:attribute>
                            </xsl:if>
                            <div class="innerHead">
                                <xsl:value-of select="$titlePrefix"/>
                                <xsl:value-of select="$title" />
                                <xsl:if test="cldoc:text/cldoc:footnote">
                                    <xsl:element name="span">
                                        <xsl:attribute name="class">unbold</xsl:attribute>
                                        <xsl:if test="cldoc:text/cldoc:footnote/@ID">
                                            <xsl:attribute name="id"> <xsl:value-of select="cldoc:text/cldoc:footnote/@ID"/> </xsl:attribute>
                                        </xsl:if>
                                        <xsl:text> - </xsl:text>
                                        <xsl:value-of select="cldoc:text/cldoc:footnote" />
                                    </xsl:element>
                                </xsl:if>
                            </div>
                        </xsl:element>
                        <xsl:element name="div">
                            <xsl:attribute name="class">
                                <xsl:text>body_ body_</xsl:text>
                                <xsl:value-of select="$colorName"/>
                            </xsl:attribute>
                            <div class="ContentText">
                                <xsl:apply-templates select="cldoc:text">
                                    <xsl:with-param name="title">
                                        <xsl:value-of select="$title" />
                                    </xsl:with-param>
                                    <xsl:with-param name="id">
                                        <xsl:value-of select="$sectionID" />
                                    </xsl:with-param> </xsl:apply-templates>
                                <xsl:if test="cldoc:component">
                                    <xsl:variable name="parentTitle">
                                        <xsl:value-of select="$title"/>
                                        <xsl:text> - </xsl:text>
                                    </xsl:variable>
                                    <xsl:for-each select="cldoc:component">
                                        <xsl:apply-templates select="cldoc:section">
                                            <xsl:with-param name="titlePrefix">
                                                <xsl:if test="$titlePrefix">
                                                    <xsl:value-of select="$titlePrefix" />
                                                </xsl:if>
                                                <xsl:value-of select="$parentTitle" />
                                            </xsl:with-param>
                                        </xsl:apply-templates>
                                    </xsl:for-each>
                                </xsl:if>
                            </div>
                        </xsl:element>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="cldoc:text">
    <xsl:param name="title" />
    <xsl:param name="id" />
    <xsl:element name="div">
        <xsl:attribute name="class">
            <xsl:text>ContentText</xsl:text>
            <xsl:choose>
                <xsl:when test="cldoc:content" />
                <xsl:when test="cldoc:paragraph" />
                <xsl:when test="cldoc:list" />
                <xsl:when test="cldoc:table" />
                <xsl:otherwise> <xsl:text> LeftPad</xsl:text> </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:apply-templates select="cldoc:caption" mode="direct">
            <xsl:with-param name="padLeft" select="true()"/>
        </xsl:apply-templates>
        <xsl:apply-templates>
            <xsl:with-param name="title">
                <xsl:value-of select="$title" />
            </xsl:with-param>
            <xsl:with-param name="id">
                <xsl:value-of select="$id" />
            </xsl:with-param>
        </xsl:apply-templates>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:footnote" />

<xsl:template match="cldoc:list">
    <xsl:param name="title" />
    <xsl:param name="id" />
    <xsl:param name="addlItemData" />
    <xsl:variable name="embeded" select="not(parent::cldoc:text)"/>
    <xsl:apply-templates select="cldoc:caption" mode="direct">
        <xsl:with-param name="padLeft" select="true()"/>
    </xsl:apply-templates>
    <xsl:choose>
        <xsl:when test="$lucyMyCh">
            <xsl:element name="ul">
                <xsl:if test="@ID">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@ID"/>
                    </xsl:attribute> </xsl:if>
                <xsl:if test="$addlItemData">
                    <xsl:attribute name="class">LeftPad</xsl:attribute>
                </xsl:if>
                <xsl:for-each select="cldoc:item">
                <xsl:element name="li">
                    <xsl:choose>
                        <xsl:when test="$addlItemData">
                            <xsl:attribute name="class">observationItemSubItem</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">observationItem</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="cldoc:caption">
                        <span class="CaptionText"><xsl:value-of select="cldoc:caption"/></span>
                    </xsl:if>
                    <xsl:apply-templates>
                        <xsl:with-param name="addlItemData"><xsl:value-of select="boolean('true')"/></xsl:with-param>
                    </xsl:apply-templates>
                </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:when>
        <xsl:when test="$embeded">
            <xsl:for-each select="cldoc:item">
                <xsl:element name="div">
                    <xsl:call-template name="AddStyleCodeClass" />
                    <xsl:if test="../@listType='ordered'"><xsl:value-of select="position()"/>. </xsl:if>
                    <xsl:if test="../@listType='unordered'">&#8226; </xsl:if>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
            <xsl:element name="div">
                <xsl:call-template name="AddStyleCodeClass" />
                <xsl:if test="@ID">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@ID"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:for-each select="cldoc:item">
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>ListDataRow LeftPad </xsl:text>
                            <xsl:call-template name="StyleCodeClass">
                                <xsl:with-param name="styleCode" select="@styleCode" />
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:if test="@ID"> <a name="{@ID}" id="{@ID}"/> </xsl:if>
                        <xsl:if test="../@listType='ordered'"><xsl:value-of select="position()"/>.</xsl:if>
                        <xsl:if test="../@listType='unordered'">&#8226; </xsl:if>
                        <xsl:if test="cldoc:caption">
                            <xsl:if test="cldoc:caption/following-sibling::cldoc:table and cldoc:caption/../preceding-sibling::*"><br/><br/></xsl:if>
                            <xsl:apply-templates select="cldoc:caption" mode="direct" />
                        </xsl:if>
                        <xsl:apply-templates>
                            <xsl:with-param name="title"><xsl:value-of select="$title" /></xsl:with-param>
                            <xsl:with-param name="captioncol">
                                <xsl:if test="cldoc:caption/following-sibling::cldoc:table">
                                    <xsl:value-of select="cldoc:caption"/>
                                </xsl:if>
                            </xsl:with-param>
                        </xsl:apply-templates>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="cldoc:table">
    <xsl:param name="title" />
    <xsl:param name="id" />
    <xsl:param name="captioncol" />
    <xsl:apply-templates select="cldoc:caption" mode="direct">
        <xsl:with-param name="padLeft" select="true()" />
    </xsl:apply-templates>
    <xsl:variable name="embeded" select="ancestor::cldoc:table" />
    <xsl:element name="table">
        <xsl:attribute name="class">
            <xsl:text>ContentTable </xsl:text>
            <xsl:if test="$embeded">lightBorder
            </xsl:if>
            <xsl:call-template name="StyleCodeClass">
                <xsl:with-param name="styleCode" select="@styleCode" />
            </xsl:call-template>
        </xsl:attribute>
        <xsl:attribute name="summary">
            <xsl:value-of select="$title"/>
            <xsl:if test="$captioncol">
                <xsl:text> - </xsl:text> <xsl:value-of select="$captioncol"/>
            </xsl:if>
            <xsl:if test="cldoc:caption and not(cldoc:caption=$captioncol)">
                <xsl:text> - </xsl:text> <xsl:value-of select="cldoc:caption"/>
            </xsl:if> </xsl:attribute>
            <xsl:if test="@ID">
                <xsl:attribute name="id">
                    <xsl:value-of select="@ID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates>
                <xsl:with-param name="caption4thead">
                    <xsl:choose>
                        <xsl:when test="$captioncol">
                            <xsl:value-of select="$captioncol"/>
                        </xsl:when>
                        <xsl:when test="cldoc:caption">
                            <xsl:value-of select="cldoc:caption"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:with-param>
            </xsl:apply-templates>
    </xsl:element>
    <xsl:choose>
        <xsl:when test="following-sibling::cldoc:table"> <br/> </xsl:when>
    </xsl:choose>
</xsl:template>

<xsl:template match="cldoc:colgroup">
    <xsl:element name="colgroup">
        <xsl:call-template name="AddStyleCodeClass" />
        <xsl:if test="@ID">
            <xsl:attribute name="id">
                <xsl:value-of select="@ID"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates select="cldoc:col"/>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:col">
    <xsl:element name="col">
        <xsl:if test="@width">
            <xsl:attribute name="style">width:
                <xsl:value-of select="@width"/>
            </xsl:attribute> </xsl:if>
        <xsl:if test="@span">
            <xsl:attribute name="span">
                <xsl:value-of select="@span"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:call-template name="AddStyleCodeClass" />
        <xsl:if test="@ID">
            <xsl:attribute name="id">
                <xsl:value-of select="@ID"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:thead">
    <xsl:param name="caption4thead" />
    <xsl:element name="thead">
        <xsl:call-template name="AddStyleCodeClass" />
            <xsl:if test="@ID"> <xsl:attribute name="id"> <xsl:value-of select="@ID"/> </xsl:attribute>
            </xsl:if>
            <xsl:if test="$caption4thead!=''">
                <xsl:element name="tr">
                    <xsl:attribute name="class">SRonly</xsl:attribute>
                    <xsl:element name="th">
                        <xsl:attribute name="class">CaptionText</xsl:attribute>
                        <xsl:attribute name="colspan"><xsl:value-of select="count(child::cldoc:tr/child::cldoc:th)"/></xsl:attribute>
                        <xsl:attribute name="scope">colgroup</xsl:attribute>
                        <xsl:value-of select="$caption4thead"/>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
        <xsl:apply-templates select="cldoc:tr"/>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:tbody">
    <xsl:element name="tbody">
        <xsl:call-template name="AddStyleCodeClass" />
        <xsl:if test="@ID">
            <xsl:attribute name="id">
            <xsl:value-of select="@ID"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates select="cldoc:tr"/>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:tfoot">
    <xsl:element name="tfoot">
        <xsl:call-template name="AddStyleCodeClass" />
        <xsl:if test="@ID">
            <xsl:attribute name="id">
                <xsl:value-of select="@ID"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates select="cldoc:tr"/>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:tr">
    <xsl:element name="tr">
        <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="contains(@styleCode,'altRow')">alt </xsl:when>
                <xsl:when test="contains(@styleCode,'normRow')"/>
                <xsl:when test="(position() mod 2 = 0)">alt </xsl:when>
            </xsl:choose>
            <xsl:if test="contains(@styleCode,'historical')">historical </xsl:if>
            <xsl:if test="@styleCode"> <xsl:variable name="styleCodeClass"> <xsl:call-template name="StyleCodeClass"> <xsl:with-param name="styleCode" select="@styleCode" /> </xsl:call-template> </xsl:variable> <xsl:if test="$styleCodeClass"> <xsl:value-of select="$styleCodeClass"/> <xsl:text> </xsl:text> </xsl:if> </xsl:if>
            <xsl:choose>
                <xsl:when test="parent::cldoc:thead">ColumnHeaderRow</xsl:when>
                <xsl:when test="parent::cldoc:tfoot">ColumnFooterRow</xsl:when>
                <xsl:when test="contains(following-sibling::cldoc:tr/@styleCode,'MergeUp')"/>
                <xsl:when test="following-sibling::*">ColumnDataRow</xsl:when>
            </xsl:choose>
        </xsl:attribute> <xsl:if test="@ID"> <xsl:attribute name="id"> <xsl:value-of select="@ID"/> </xsl:attribute> </xsl:if>  <xsl:apply-templates/>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:th">
    <xsl:variable name="positionIndex" select="position()"/>
    <xsl:element name="th">
        <xsl:attribute name="scope">col</xsl:attribute>
        <xsl:if test="name(../..)='tbody'"><xsl:attribute name="class">cellHeader</xsl:attribute></xsl:if>
        <xsl:if test="@colspan"><xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute></xsl:if>
        <xsl:if test="@rowspan"><xsl:attribute name="rowspan"><xsl:value-of select="@rowspan"/></xsl:attribute></xsl:if>
        <xsl:if test="@align"><xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute></xsl:if>
        <xsl:call-template name="AddStyleCodeClass" />
        <xsl:if test="@ID"> <xsl:attribute name="id"> <xsl:value-of select="@ID"/> </xsl:attribute> </xsl:if>
        <xsl:apply-templates/>  <xsl:call-template name="nbs" />
    </xsl:element>
</xsl:template>

<xsl:template name="nbs">
    <xsl:choose>
        <xsl:when test="normalize-space(.)" />
        <xsl:when test="count(child::*)=count(child::cldoc:content)">
            <xsl:choose> <xsl:when test="normalize-space(child::cldoc:content/.)" />   <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:when test="count(child::*)>0" />
        <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="cldoc:td">
    <xsl:variable name="positionIndex" select="position()"/>
    <xsl:element name="td">
        <xsl:if test="@colspan">
            <xsl:attribute name="colspan">
                <xsl:value-of select="@colspan"/>
            </xsl:attribute></xsl:if>
        <xsl:if test="@rowspan">
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@rowspan"/>
            </xsl:attribute></xsl:if>
        <xsl:if test="@align">
            <xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
        </xsl:if>  <xsl:call-template name="AddStyleCodeClass" />
        <xsl:if test="@ID"> <xsl:attribute name="id"> <xsl:value-of select="@ID"/> </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates select="cldoc:caption" mode="direct"> <xsl:with-param name="padLeft" select="true()" />
        </xsl:apply-templates>
        <xsl:apply-templates/>
        <xsl:call-template name="nbs" />
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:content">
    <xsl:variable name="underText" select="parent::cldoc:text" />
    <xsl:variable name="href">  </xsl:variable>
    <xsl:if test="translate(@styleCode,$ucletters,$lcletters)='xhr'"><hr /></xsl:if>
    <xsl:variable name="contentElementWrapper"> <xsl:choose> <xsl:when test="$href!=''">a</xsl:when> <xsl:otherwise>span</xsl:otherwise> </xsl:choose> </xsl:variable>
    <xsl:element name="{$contentElementWrapper}">
        <xsl:attribute name="class">
            <xsl:if test="$underText">LeftPad inlineBlock </xsl:if>
            <xsl:if test="@emphasis='bold'">bold </xsl:if>
            <xsl:if test="@emphasis='underline'">underline </xsl:if>
            <xsl:if test="@emphasis='italics'">italics </xsl:if>
            <xsl:if test="@emphasis='yes'">italics </xsl:if>
            <xsl:if test="@revised='delete'">dn </xsl:if>
            <xsl:if test="@styleCode">
                <xsl:call-template name="StyleCodeClass">
                    <xsl:with-param name="styleCode" select="@styleCode" />
                </xsl:call-template>
            </xsl:if>
        </xsl:attribute>
        <xsl:if test="@ID">
            <xsl:attribute name="id"> <xsl:value-of select="@ID"/> </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:br"> <br/> </xsl:template>

<xsl:template match="cldoc:paragraph">
    <xsl:param name="addlItemData" />
    <xsl:variable name="underText" select="parent::cldoc:text" />
    <xsl:apply-templates select="cldoc:caption" mode="direct">
        <xsl:with-param name="padLeft" select="$underText" />
    </xsl:apply-templates>
    <xsl:element name="div">
        <xsl:if test="$addlItemData or $underText"> <xsl:attribute name="class">LeftPad</xsl:attribute> </xsl:if>
        <xsl:if test="@ID">
            <xsl:attribute name="id"><xsl:value-of select="@ID"/> </xsl:attribute>
        </xsl:if>
        <xsl:element name="div"> <xsl:call-template name="AddStyleCodeClass" /> <xsl:apply-templates/>&#160; </xsl:element>
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:sub">
    <sub><xsl:apply-templates/></sub>
</xsl:template>

<xsl:template match="cldoc:sup">
    <sup><xsl:apply-templates/></sup>
</xsl:template>

<xsl:template match="cldoc:caption" mode="direct">
    <xsl:param name="padLeft" />
    <xsl:element name="div">
        <xsl:attribute name="class">
            <xsl:text>CaptionText </xsl:text>
            <xsl:if test="$padLeft"><xsl:text>LeftPad </xsl:text></xsl:if>"
            <xsl:call-template name="StyleCodeClass"> <xsl:with-param name="styleCode" select="@styleCode" /> </xsl:call-template>
        </xsl:attribute>
        <xsl:if test="@ID"> <xsl:attribute name="id"> <xsl:value-of select="@ID"/> </xsl:attribute> </xsl:if>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="cldoc:caption" />

<xsl:template match="cldoc:link">
    <xsl:if test="cldoc:linkHtml">
        <xsl:element name="a">
            <xsl:if test="cldoc:linkHtml/@href"> <xsl:attribute name="href"><xsl:value-of select="cldoc:linkHtml/@href"/></xsl:attribute> </xsl:if>
            <xsl:if test="cldoc:linkHtml/@name"> <xsl:attribute name="name"><xsl:value-of select="cldoc:linkHtml/@name"/></xsl:attribute> </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:if>
</xsl:template>

<xsl:template name="AddStyleCodeClass">
    <xsl:if test="@styleCode">
        <xsl:variable name="styleCode">
            <xsl:call-template name="StyleCodeClass"> <xsl:with-param name="styleCode" select="@styleCode" /> </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$styleCode!=''">
            <xsl:attribute name="class"> <xsl:value-of select='$styleCode'/> </xsl:attribute>
        </xsl:if> </xsl:if>
</xsl:template>

<xsl:template name="StyleCodeClass">
    <xsl:param name="styleCode" />
    <xsl:variable name="styleCodeLC" select="translate($styleCode,$ucletters,$lcletters)"/>
    <xsl:choose>
        <xsl:when test="contains($styleCode,' ')">
            <xsl:variable name="normalizedStyleCodeClasses">
                <xsl:call-template name="StyleCodeClass"> <xsl:with-param name="styleCode" select="substring-before($styleCode,' ')" /> </xsl:call-template>
                <xsl:text> </xsl:text>
                <xsl:call-template name="StyleCodeClass"> <xsl:with-param name="styleCode" select="substring-after($styleCode,' ')" /> </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalizedStyleCodeClasses)"/>
        </xsl:when>
        <xsl:when test="substring($styleCode,1,1)='x'">
            <xsl:call-template name="StyleCodeClass"> <xsl:with-param name="styleCode" select="substring($styleCode,2)"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test="contains($styleCodeLC,'bold')">bold </xsl:if>
            <xsl:if test="contains($styleCodeLC,'underline')">underline </xsl:if>
            <xsl:if test="contains($styleCodeLC,'italics')">italics </xsl:if>
            <xsl:choose>
                <xsl:when test="$styleCodeLC='pre' or $styleCodeLC='monospace' or $styleCodeLC='mono'">monospace</xsl:when>
                <xsl:when test="$styleCodeLC='flagdata' or $styleCodeLC='alert' or $styleCodeLC='abnormal'">FlagData</xsl:when>
                <xsl:when test="$styleCodeLC='secondarytext'">secondaryText</xsl:when>
                <xsl:when test="$styleCodeLC='cellheader' or $styleCodeLC='label'">cellHeader</xsl:when>
                <xsl:when test="$styleCodeLC='header'">bold</xsl:when>
                <xsl:when test="$styleCodeLC='allindent' or $styleCodeLC='indent'">allIndent</xsl:when>
                <xsl:when test="$styleCodeLC='noindent'">loseTheHang</xsl:when>
                <xsl:when test="$styleCodeLC='center'">textAlignCenter</xsl:when>
                <xsl:when test="$styleCodeLC='right'">textAlignRight</xsl:when>
                <xsl:when test="$styleCodeLC='dn' or $styleCodeLC='hidden'">dn</xsl:when>
                <xsl:when test="$styleCodeLC='blue'">blue</xsl:when>
                <xsl:when test="$styleCodeLC='highlight'">highlight</xsl:when>
                <xsl:when test="$styleCodeLC='strikeout'">strikeout</xsl:when>
                <xsl:when test="$styleCodeLC='emphasis'">emphasis</xsl:when>
            </xsl:choose>
        </xsl:otherwise> </xsl:choose>
</xsl:template>

<xsl:template name="Name">
    <xsl:param name="name"/>
    <xsl:param name="lastFirst"/>
    <xsl:choose>
        <xsl:when test="$name/cldoc:family">
            <xsl:if test="$lastFirst"> <xsl:value-of select="$name/cldoc:family"/> <xsl:text>, </xsl:text> </xsl:if>
            <xsl:if test="$name/cldoc:prefix"> <xsl:value-of select="$name/cldoc:prefix"/> <xsl:text> </xsl:text> </xsl:if>
            <xsl:for-each select="$name/cldoc:given"> <xsl:value-of select="."/>  <xsl:if test="position()!=last() or not($lastFirst)"> <xsl:text> </xsl:text> </xsl:if> </xsl:for-each>
            <xsl:if test="not($lastFirst)"> <xsl:value-of select="$name/cldoc:family"/> </xsl:if>
            <xsl:if test="$name/cldoc:suffix"> <xsl:text>, </xsl:text> <xsl:value-of select="$name/cldoc:suffix"/> </xsl:if>
        </xsl:when>
        <xsl:otherwise> <xsl:value-of select="$name"/> </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="Performer">
    <xsl:param name="performer" select="."/>
    <xsl:param name="includeFunction" select="false()" />
    <xsl:param name="includeDates" select="false()"/>
    <xsl:param name="includeTypeCode" select="false()"/>
    <div>
        <xsl:if test="$performer/cldoc:assignedEntity/cldoc:assignedPerson/cldoc:name">
            <span class="bold">
                <xsl:call-template name="Name">
                    <xsl:with-param name="name" select="$performer/cldoc:assignedEntity/cldoc:assignedPerson/cldoc:name[1]" />
                </xsl:call-template>
            </span>
            <xsl:variable name="PerformerKind">
                <xsl:if test="$includeTypeCode">
                    <xsl:call-template name="ParticipantType">
                        <xsl:with-param name="typeCode" select="$performer/@typeCode"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="$includeFunction">
                    <xsl:call-template name="DisplayCode">
                        <xsl:with-param name="code" select="$performer/cldoc:functionCode"/>
                        <xsl:with-param name="noNull" select="true()"/>
                        <xsl:with-param name="elseDisplay">
                            <xsl:call-template name="PerformerRole">
                                <xsl:with-param name="code" select="$performer/cldoc:functionCode/@code"/>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:variable>
        <xsl:if test="$PerformerKind!=''">
            <xsl:text> (</xsl:text> <xsl:value-of select="$PerformerKind"/> <xsl:text>)</xsl:text>
        </xsl:if>
        <xsl:if test="$includeDates"> <xsl:text> </xsl:text> <xsl:call-template name="DateRange"> <xsl:with-param name="fromDate" select="$performer/cldoc:time/cldoc:low/@value"/> <xsl:with-param name="toDate" select="$performer/cldoc:time/cldoc:high/@value"/> </xsl:call-template>
        </xsl:if>
        <br/>
        <xsl:for-each select="$performer/cldoc:assignedEntity/cldoc:telecom"> <xsl:call-template name="Telecom"/></xsl:for-each>
        <xsl:for-each select="$performer/cldoc:assignedEntity/cldoc:addr"> <xsl:call-template name="Address"/> </xsl:for-each>
        </xsl:if>
    </div>
    <xsl:if test="$performer/cldoc:assignedEntity/cldoc:representedOrganization">
        <div> <xsl:call-template name="Org"> <xsl:with-param name="org" select="$performer/cldoc:assignedEntity/cldoc:representedOrganization"/> </xsl:call-template> </div>
    </xsl:if>

</xsl:template>

<xsl:template name="Org"> <xsl:param name="org"/>  <span class="bold"> <xsl:call-template name="Name"> <xsl:with-param name="name" select="$org/cldoc:name" /> </xsl:call-template> </span> <br/> <xsl:for-each select="$org/cldoc:telecom"> <xsl:call-template name="Telecom"/> </xsl:for-each> <xsl:call-template name="Address"> <xsl:with-param name="address" select="$org/cldoc:addr" /> <xsl:with-param name="numAddresses">1</xsl:with-param> </xsl:call-template>
</xsl:template>

<xsl:template name="DisplayCode"> <xsl:param name="code"/>  <xsl:param name="elseDisplay"/>  <xsl:param name="noNull" select="false()"/>  <xsl:choose>  <xsl:when test="$code/@nullFlavor and not($noNull) and not ($code/@nullFlavor='OTH')"> <xsl:call-template name="NullFlavor"> <xsl:with-param name="nullFlavor" select="$code/@nullFlavor"/> </xsl:call-template> </xsl:when>  <xsl:when test="normalize-space($code/cldoc:originalText/text())"> <xsl:value-of select="$code/cldoc:originalText/text()" /> </xsl:when>  <xsl:when test="$code/@displayName"> <xsl:value-of select="$code/@displayName"/> </xsl:when> <xsl:when test="$elseDisplay"> <xsl:value-of select="$elseDisplay"/> </xsl:when>  <xsl:when test="$noNull"/> <xsl:otherwise><xsl:value-of select="$Unknown"/></xsl:otherwise> </xsl:choose> </xsl:template>

<xsl:template name="Language"> <xsl:call-template name="DisplayCode"> <xsl:with-param name="code" select="cldoc:languageCode"/> <xsl:with-param name="elseDisplay"> <xsl:call-template name="LanguageConv"> <xsl:with-param name="language" select="cldoc:languageCode/@code"/> </xsl:call-template> </xsl:with-param> </xsl:call-template>   <xsl:if test="cldoc:modeCode/@code"> <xsl:text> - </xsl:text> <xsl:variable name="mode" select="cldoc:modeCode/@code"/> <xsl:choose> <xsl:when test="$mode='ESP' or $mode='RSP'">Spoken</xsl:when> <xsl:when test="$mode='EWR' or $mode='RWR'">Written</xsl:when> <xsl:when test="$mode='ESGN' or $mode='RSGN'">Signed</xsl:when> </xsl:choose> </xsl:if>   <xsl:if test="cldoc:preferenceInd/@value='true' and cldoc:languageCode/@code"> <xsl:text> </xsl:text> <xsl:text xml:id="langPreferred">(Preferred)</xsl:text> </xsl:if> </xsl:template>

<xsl:template name="LanguageConv"> <xsl:param name="language"/> <xsl:variable name="code"> <xsl:choose> <xsl:when test="contains($language,'-')"> <xsl:value-of select="translate(substring-before($language,'-'),$ucletters,$lcletters)"/> </xsl:when> <xsl:otherwise> <xsl:value-of select="translate($language,$ucletters,$lcletters)"/> </xsl:otherwise> </xsl:choose> </xsl:variable> <xsl:choose xml:id="vocabLanguages">  <xsl:when test="$code='eng' or $code='en'">English</xsl:when> <xsl:when test="$code='spa' or $code='sp' or $code='span'">Spanish</xsl:when> <xsl:when test="$code='fre' or $code='fra' or $code='fr'">French</xsl:when> <xsl:when test="$code='chi' or $code='zho' or $code='zh'">Chinese</xsl:when> <xsl:when test="$code='dut' or $code='nld' or $code='nl'">Dutch</xsl:when> <xsl:when test="$code='ger' or $code='deu' or $code='de'">German</xsl:when> <xsl:when test="$code='rus'">Russian</xsl:when>  <xsl:when test="$code='haw'">Hawaiian</xsl:when> <xsl:when test="$code='ilo'">Iloko</xsl:when> <xsl:when test="$code='kor' or $code='ko'">Korean</xsl:when> <xsl:when test="$code='smo' or $code='sm'">Samoan</xsl:when> <xsl:when test="$code='tgl' or $code='tl'">Tagalog</xsl:when> <xsl:when test="$code='vie' or $code='vi'">Vietnamese</xsl:when> <xsl:when test="$code='fij' or $code='fj'">Fijian</xsl:when> <xsl:when test="$code='mah' or $code='mh'">Marshallese</xsl:when> <xsl:when test="$code='mao' or $code='mri' or $code='mi'">Maori</xsl:when> <xsl:when test="$code='tah' or $code='ty'">Tahitian</xsl:when> <xsl:when test="$code='tog' or $code='ton' or $code='to'">Tonga</xsl:when> <xsl:when test="$code='cmn'">Mandarin Chinese</xsl:when> <xsl:when test="$code='ara' or $code='ar'">Arabic</xsl:when> <xsl:when test="$code='jpn' or $code='ja'">Japanese</xsl:when> <xsl:otherwise> <xsl:value-of select="$code"/> </xsl:otherwise> </xsl:choose> </xsl:template>

<xsl:template name="Role"> <xsl:param name="roleCode"/> <xsl:choose xml:id="vocabHL7SupportRole"> <xsl:when test="$roleCode='PRS'">Personal Relationship</xsl:when> <xsl:when test="$roleCode='NOK'">Next of Kin</xsl:when> <xsl:when test="$roleCode='CAREGIVER'">Caregiver</xsl:when> <xsl:when test="$roleCode='AGNT'">Agent</xsl:when> <xsl:when test="$roleCode='GUAR'">Guarantor</xsl:when> <xsl:when test="$roleCode='ECON'">Emergency Contact</xsl:when> <xsl:when test="$roleCode='PROV'">Provider</xsl:when> <xsl:when test="$roleCode='EXCEST'">Estate Executor</xsl:when> <xsl:when test="$roleCode='GUADLTM'">Guardian Ad Litem</xsl:when> <xsl:when test="$roleCode='GUARD'">Guardian</xsl:when> <xsl:when test="$roleCode='POWATT'">Power of Attorney</xsl:when> <xsl:when test="$roleCode='DPOWATT'">Durable Power of Attorney</xsl:when> <xsl:when test="$roleCode='HPOWATT'">Healthcare Power of Attorney</xsl:when> <xsl:when test="$roleCode='SPOWATT'">Special Power of Attorney</xsl:when> <xsl:otherwise>Other</xsl:otherwise> </xsl:choose> </xsl:template>

<xsl:template name="ParticipantType"> <xsl:param name="typeCode"/> <xsl:choose xml:id="vocabHL7ParticipantType"> <xsl:when test="$typeCode=''"/> <xsl:when test="$typeCode='ADM'">Admitting</xsl:when> <xsl:when test="$typeCode='ATND'">Attending</xsl:when> <xsl:when test="$typeCode='CON'">Consulting</xsl:when> <xsl:when test="$typeCode='DIS'">Discharge</xsl:when> <xsl:when test="$typeCode='REF'">Referring</xsl:when> <xsl:otherwise><xsl:value-of select="$typeCode"/></xsl:otherwise> </xsl:choose> </xsl:template>

<xsl:template name="PerformerRole"> <xsl:param name="code"/>  <xsl:choose> <xsl:when test="$code='AD' or $code='ADMPHYS'"><xsl:call-template name="ParticipantType"><xsl:with-param name="typeCode">ADM</xsl:with-param></xsl:call-template></xsl:when> <xsl:when test="$code='AT' or $code='ATTPHYS'"><xsl:call-template name="ParticipantType"><xsl:with-param name="typeCode">ATND</xsl:with-param></xsl:call-template></xsl:when> <xsl:when test="$code='CP'"><xsl:call-template name="ParticipantType"><xsl:with-param name="typeCode">CON</xsl:with-param></xsl:call-template></xsl:when> <xsl:when test="$code='DISPHYS'"><xsl:call-template name="ParticipantType"><xsl:with-param name="typeCode">DIS</xsl:with-param></xsl:call-template></xsl:when> <xsl:when test="$code='RP'"><xsl:call-template name="ParticipantType"><xsl:with-param name="typeCode">REF</xsl:with-param></xsl:call-template></xsl:when> </xsl:choose> <xsl:choose xml:id="vocabHL7PerformerRole"> <xsl:when test="$code='RNDPHYS'">Rounding</xsl:when> <xsl:when test="$code='FHCP'">Family Health Care Professional</xsl:when> <xsl:when test="$code='RT'">Referred-to</xsl:when> <xsl:when test="$code='ANEST' or $code='ANRS'">Anesthesia</xsl:when> <xsl:when test="$code='FASST' or $code='PRISURG' or $code='SASST'">Surgery</xsl:when> <xsl:when test="$code='MDWF'">Midwife</xsl:when> <xsl:when test="$code='SNRS' or $code='NASST'">Nurse</xsl:when> </xsl:choose> </xsl:template>

<xsl:template name="NullFlavor">
    <xsl:param name="nullFlavor"/>
    <xsl:choose xml:id="vocabHL7NullFlavors">
        <xsl:when test="$nullFlavor='NI'">No information</xsl:when>
        <xsl:when test="$nullFlavor='NA'">Not applicable</xsl:when>
        <xsl:when test="$nullFlavor='NAV' or $nullFlavor='MSK'">Not Available</xsl:when>
        <xsl:when test="$nullFlavor='NASK'">Not asked</xsl:when>
        <xsl:otherwise><xsl:value-of select="$Unknown"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="AdministrativeGenderCode"> <xsl:param name="gender_code" /> <xsl:choose>  <xsl:when test="$gender_code/@code='M'"><xsl:text xml:id="langMale">Male</xsl:text></xsl:when> <xsl:when test="$gender_code/@code='F'"><xsl:text xml:id="langFemale">Female</xsl:text></xsl:when> <xsl:otherwise> <xsl:text>Gender: </xsl:text> <xsl:call-template name="DisplayCode"> <xsl:with-param name="code" select="$gender_code"/> </xsl:call-template> </xsl:otherwise> </xsl:choose> </xsl:template>

<xsl:template name="Year"> <xsl:param name="date" /> <xsl:value-of select="substring ($date, 1, 4)" /> </xsl:template>

<xsl:template name="DateRange"> <xsl:param name="fromDate"/> <xsl:param name="toDate"/>  <xsl:variable name="fromDateString"> <xsl:call-template name="Date"> <xsl:with-param name="date" select="$fromDate"/> </xsl:call-template> </xsl:variable> <xsl:variable name="toDateString"> <xsl:call-template name="Date"> <xsl:with-param name="date" select="$toDate"/> </xsl:call-template> </xsl:variable>  <xsl:choose> <xsl:when test="$fromDateString!='' and $toDateString!=''"> <xsl:text>(</xsl:text> <xsl:copy-of select="$fromDateString"/> <xsl:text> - </xsl:text> <xsl:copy-of select="$toDateString"/> <xsl:text>)</xsl:text> </xsl:when> <xsl:when test="$fromDateString!=''"> <xsl:text>(</xsl:text> <span id="langDateToNow"><xsl:copy-of select="$fromDateString"/> - Present</span> <xsl:text>)</xsl:text> </xsl:when> <xsl:when test="$toDateString!=''"> <xsl:text>(</xsl:text> <span id="langDateUntil">Until <xsl:copy-of select="$toDateString" /></span> <xsl:text>)</xsl:text> </xsl:when> </xsl:choose> </xsl:template>

<xsl:template name="Date">
    <xsl:param name="date" />
    <xsl:param name="includeTime" />
    <xsl:variable name="dateFormat">MDY</xsl:variable>
    <xsl:choose>
        <xsl:when test="$date">
            <xsl:variable name="year" select="substring ($date, 1, 4)" />
            <xsl:variable name="month" select="substring ($date, 5, 2)" />
            <xsl:variable name="day" select="substring ($date, 7, 2)" />
            <xsl:variable name="hour" select="substring ($date, 9, 2)"/>
            <xsl:variable name="min" select="substring ($date, 11, 2)"/>
            <xsl:variable name="sec" select="substring ($date, 13, 2)"/>
            <xsl:variable name="zone" select="substring ($date, 15, 5)"/>
            <xsl:if test="$dateFormat='DMY'">
                <xsl:value-of select="$day" />
            </xsl:if>
            <xsl:choose xml:id="vocabMonths">
                <xsl:when test="$month=01">Jan. </xsl:when>
                <xsl:when test="$month=02">Feb. </xsl:when>
                <xsl:when test="$month=03">Mar. </xsl:when>
                <xsl:when test="$month=04">Apr. </xsl:when>
                <xsl:when test="$month=05">May. </xsl:when>
                <xsl:when test="$month=06">Jun. </xsl:when>
                <xsl:when test="$month=07">Jul. </xsl:when>
                <xsl:when test="$month=08">Aug. </xsl:when>
                <xsl:when test="$month=09">Sep. </xsl:when>
                <xsl:when test="$month=10">Oct. </xsl:when>
                <xsl:when test="$month=11">Nov. </xsl:when>
                <xsl:when test="$month=12">Dec. </xsl:when>
            </xsl:choose>
            <xsl:if test="$dateFormat='MDY'">
                <xsl:value-of select="$day" /> <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="$year" />
                <xsl:if test="$hour != '' and $min != '' and boolean($includeTime)"> <xsl:text> </xsl:text>
                <xsl:choose>
                    <xsl:when test="$hour > 12"><xsl:value-of select="$hour - 12" /></xsl:when>
                    <xsl:when test="$hour &lt;= 12 and $hour > 0"><xsl:value-of select="$hour"/></xsl:when>
                    <xsl:when test="$hour = 00">12</xsl:when>
                </xsl:choose>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="$min"/> <xsl:text> </xsl:text> <xsl:choose> <xsl:when test="$hour > 12" xml:id="langPM">p.m.</xsl:when> <xsl:when test="$hour &lt;= 12" xml:id="langAM">a.m.</xsl:when> </xsl:choose>                <xsl:if test="$zone != ''"> <xsl:text> (</xsl:text> <xsl:value-of select="$zone"/> <xsl:text>)</xsl:text></xsl:if>
                </xsl:if>
                </xsl:when>
    </xsl:choose>
</xsl:template>

    <xsl:template name="ChooseSectionColor">
        <xsl:param name="code"/>
            <xsl:choose>
                <xsl:when test="$code='X-DOCCMT'">E</xsl:when>
                <xsl:when test="$code='10155-0'">R</xsl:when>
                <xsl:when test="$code='48765-2'">R</xsl:when>
                <xsl:when test="$code='11450-4'">O</xsl:when>
                <xsl:when test="$code='11348-0'">O</xsl:when>
                <xsl:when test="$code='10160-0'">B</xsl:when>
                <xsl:when test="$code='18610-6'">B</xsl:when>
                <xsl:when test="$code='29549-3'">B</xsl:when>
                <xsl:when test="$code='42346-7'">B</xsl:when>
                <xsl:when test="$code='10183-2'">B</xsl:when>
                <xsl:when test="$code='11369-6'">B</xsl:when>
                <xsl:when test="$code='59774-0'">B</xsl:when>
                <xsl:when test="$code='57072-1'">B</xsl:when>
                <xsl:when test="$code='X-HADX'">O</xsl:when>
                <xsl:when test="$code='46241-6'">O</xsl:when>
                <xsl:when test="$code='X-VDX'">O</xsl:when>
                <xsl:when test="$code='11535-2'">O</xsl:when>
                <xsl:when test="$code='10218-6'">O</xsl:when>
                <xsl:when test="$code='59769-0'">O</xsl:when>
                <xsl:when test="$code='10219-4'">O</xsl:when>
                <xsl:when test="$code='29299-5'">O</xsl:when>
                <xsl:when test="$code='46239-0'">O</xsl:when>
                <xsl:when test="$code='10154-3'">O</xsl:when>
                <xsl:when test="$code='8716-3'">C</xsl:when>
                <xsl:when test="$code='X-RFR'">C</xsl:when>
                <xsl:when test="$code='10164-2'">C</xsl:when>
                <xsl:when test="$code='8648-8'">C</xsl:when>
                <xsl:when test="$code='X-DD'">C</xsl:when>
                <xsl:when test="$code='18776-5'">C</xsl:when>
                <xsl:when test="$code='30954-2'">G</xsl:when>
                <xsl:when test="$code='26436-6'">G</xsl:when>
                <xsl:when test="contains(',18717-9,18718-7,18719-5,18720-3,18721-1,18722-9,18723-7,18724-5,18725-2,18727-8,18728-6,18729-4,18767-4,18768-2,18769-0,26435-8,26346-6,26437-4,26438-2',concat(',',$code,','))">G</xsl:when>
                <xsl:when test="$code='121070'">G</xsl:when>
                <xsl:when test="$code='10157-6'">C</xsl:when>
                <xsl:when test="$code='29762-2'">C</xsl:when>
                <xsl:when test="$code='10167-5'">C</xsl:when>
                <xsl:when test="$code='X-HE'">C</xsl:when>
                <xsl:when test="$code='X-FV'">C</xsl:when>
                <xsl:otherwise>C</xsl:otherwise>
            </xsl:choose>
    </xsl:template>

    <xsl:template name="Address">
        <xsl:param name="address" select="."/>
        <xsl:variable name="addressHTML">
            <xsl:for-each select="$address/cldoc:streetAddressLine"><xsl:if test="not(@nullFlavor)"> <xsl:value-of select="." /> <br/> </xsl:if> </xsl:for-each>
            <xsl:value-of select="$address/cldoc:city" />
            <xsl:if test="$address/cldoc:city and not($address/cldoc:city/@nullFlavor)">
                <xsl:if test="$address/cldoc:state or $address/cldoc:postalCode"> <xsl:text>,</xsl:text> </xsl:if>
            </xsl:if>
            <xsl:if test="$address/cldoc:state and not($address/cldoc:state/@nullFlavor)"> <xsl:text> </xsl:text> <xsl:value-of select="$address/cldoc:state" /> </xsl:if>
            <xsl:if test="$address/cldoc:postalCode and not($address/cldoc:postalCode/@nullFlavor)"> <xsl:text> </xsl:text> <xsl:value-of select="$address/cldoc:postalCode" /></xsl:if>
        </xsl:variable>
        <xsl:if test="normalize-space($addressHTML)"> <xsl:copy-of select="$addressHTML"/> <br/> </xsl:if>
    </xsl:template>

    <xsl:template name="Notification">
        <xsl:param name="notification"/>
        <div class="notificationTitle"> <xsl:value-of select="$notification/cldoc:title"/> </div>
        <div class="notificationBody"> <xsl:value-of select="$notification/cldoc:text" /> </div>
    </xsl:template>

    <xsl:template name="Telecom">
        <xsl:param name="telecom" select="."/>
        <xsl:variable name="fax" xml:id="langFax">Fax</xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($telecom/@value,'tel:+1-')">
                <xsl:value-of select="substring-before($telecom/@value,'tel:+1-')"/> <xsl:value-of select="substring-after($telecom/@value,'tel:+1-')"/> </xsl:when>
            <xsl:when test="contains($telecom/@value,'tel:+1')">
                <xsl:value-of select="substring-before($telecom/@value,'tel:+1')"/> <xsl:value-of select="substring-after($telecom/@value,'tel:+1')"/> </xsl:when>
            <xsl:when test="contains($telecom/@value,'tel:')">
                <xsl:value-of select="substring-before($telecom/@value,'tel:')"/> <xsl:value-of select="substring-after($telecom/@value,'tel:')"/>
            </xsl:when>
            <xsl:when test="contains($telecom/@value,'fax:+1-')">
                <xsl:value-of select="substring-before($telecom/@value,'fax:+1-')"/> <xsl:value-of select="substring-after($telecom/@value,'fax:+1-')"/> (<xsl:value-of select="$fax"/>)
            </xsl:when>
            <xsl:when test="contains($telecom/@value,'fax:+1')">
                <xsl:value-of select="substring-before($telecom/@value,'fax:+1')"/> <xsl:value-of select="substring-after($telecom/@value,'fax:+1')"/> (<xsl:value-of select="$fax"/>)
            </xsl:when>
            <xsl:when test="contains($telecom/@value,'fax:')">
                <xsl:value-of select="substring-before($telecom/@value,'fax:')"/> <xsl:value-of select="substring-after($telecom/@value,'fax:')"/> (<xsl:value-of select="$fax"/>)
            </xsl:when>
            <xsl:when test="contains($telecom/@value,'mailto://')">
                <xsl:value-of select="substring-before($telecom/@value,'mailto://')"/> <xsl:value-of select="substring-after($telecom/@value,'mailto://')"/>
            </xsl:when>
            <xsl:when test="contains($telecom/@value,'mailto:')">
                <xsl:value-of select="substring-before($telecom/@value,'mailto:')"/>
                <xsl:value-of select="substring-after($telecom/@value,'mailto:')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$telecom/@value" />
            </xsl:otherwise>
        </xsl:choose>
         <xsl:if test="$telecom/@value and $telecom/@use and not($telecom/@nullFlavor)">
            <span class="item-note">
                <xsl:text> (</xsl:text> <xsl:call-template name="Use"> <xsl:with-param name="use" select="$telecom/@use"/> </xsl:call-template> <xsl:text>)</xsl:text>
            </span>
        </xsl:if>   <xsl:if test="$telecom/@value"><br/></xsl:if>
    </xsl:template>
    
    <xsl:template name="Use">
        <xsl:param name="use"/>
        <xsl:choose xml:id="vocabHL7PhoneType">
            <xsl:when test="contains($use,' ')">
                <xsl:call-template name="Use"> <xsl:with-param name="use" select="substring-before($use,' ')"/> </xsl:call-template>
                <xsl:value-of select="$ListSep"/>
                <xsl:call-template name="Use"> <xsl:with-param name="use" select="substring-after($use,' ')"/> </xsl:call-template>
            </xsl:when>
            <xsl:when test="$use = 'H' or $use = 'HP'">Home</xsl:when>
            <xsl:when test="$use = 'WP'">Work</xsl:when>
            <xsl:when test="$use = 'MC'">Mobile</xsl:when>
            <xsl:when test="$use = 'AS'">Answering Service</xsl:when>
            <xsl:when test="$use = 'EC'">Emergency Contact</xsl:when>
            <xsl:when test="$use = 'PG'">Pager</xsl:when>
            <xsl:when test="$use = 'HV'">Vacation</xsl:when>
            <xsl:when test="$use = 'DIR'">Direct</xsl:when>
            <xsl:when test="$use = 'PUB'">Public</xsl:when>
            <xsl:when test="$use = 'BAD'">Invalid</xsl:when>
            <xsl:when test="$use = 'TMP'">Temporary</xsl:when>
            <xsl:otherwise> <xsl:value-of select="$use" /> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet> 