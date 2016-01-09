<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n3="http://www.w3.org/1999/xhtml" xmlns:n1="urn:hl7-org:v3" xmlns:n2="urn:hl7-org:v3/meta/voc" xmlns:voc="urn:hl7-org:v3/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output method="html" indent="yes" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>



<!-- CDA document -->

<xsl:variable name="tableWidth">50%</xsl:variable>

<xsl:variable name="title">
    <xsl:choose>
         <xsl:when test="/n1:ClinicalDocument/n1:title">
             <xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
         </xsl:when>
             <xsl:otherwise>Clinical Document</xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:template match="/">
<xsl:apply-templates select="n1:ClinicalDocument"/>
</xsl:template>

<xsl:template match="n1:ClinicalDocument">
	<html>
		<head>

			<!-- *** PRINT STYLES *** -->
			<style type="text/css" media="print"> 

				body { overflow: auto !important; }  
				#DocBody { overflow: visible !important; height: auto !important; }  
				div.printOnly { display: block; }  
				span.printOnly { display: inline; } 
				.SectionWrapper { page-break-inside:avoid; }

			</style>

			<!-- *** Curatio STYLES *** -->
			<style type="text/css"> 

				<!-- Browser Reset -->

					<!-- http://meyerweb.com/eric/tools/css/reset/ 
					   v2.0 | 20110126
					   License: none (public domain)
					-->

					html, body, div, span, applet, object, iframe,
					h1, h2, h3, h4, h5, h6, p, blockquote, pre,
					a, abbr, acronym, address, big, cite, code,
					del, dfn, em, img, ins, kbd, q, s, samp,
					small, strike, strong, sub, sup, tt, var,
					b, u, i, center,
					dl, dt, dd, ol, ul, li,
					fieldset, form, label, legend,
					table, caption, tbody, tfoot, thead, tr, th, td,
					article, aside, canvas, details, embed, 
					figure, figcaption, footer, header, hgroup, 
					menu, nav, output, ruby, section, summary,
					time, mark, audio, video {
						margin: 0;
						padding: 0;
						border: 0;
						font-size: 100%;
						font: inherit;
						vertical-align: baseline;
					}
					/* HTML5 display-role reset for older browsers */
					article, aside, details, figcaption, figure, 
					footer, header, hgroup, menu, nav, section {
						display: block;
					}
					body {
						line-height: 1;
					}
					ol, ul {
						list-style: none;
					}
					blockquote, q {
						quotes: none;
					}
					blockquote:before, blockquote:after,
					q:before, q:after {
						content: '';
						content: none;
					}
					table {
						border-collapse: collapse;
						border-spacing: 0;
					}

				<!-- Global -->

				body {
					font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
					font-size: 13px;
				}

				header {
					background: #f1f1f1;
				    position: absolute;
				    left: 0;
				    top: 0;
				    bottom: 0;
				    right: 75%;
				    overflow: scroll;
				    padding: 30px;
				    min-width:200px;
				}

				.content-wrap {
					background: #fff;
				    position: absolute;
				    left: 25%;
				    top: 0;
				    bottom: 0;
				    right: 0;
				    overflow-y: auto;    
				    padding: 30px 50px;
				}

				h1 {
					font-size: 32px;
					color: #4DD865;
					font-weight: normal;
					margin-bottom: 10px;
					padding:0;
				}

				h2 {
					font-size: 21px;
					color: #4DD865;
					font-weight: normal;
					margin-bottom: 20px;
					padding:0;
				}

				p {
					margin: 10px 0;
					line-height: 16px;
				}

				ul { 
					margin: 10px 0;
				}

				ul li {
					padding: 3px 0;
				}

				.bold {
					font-weight: bold;
				}

				.item {
					font-weight:bold;
					font-size: 15px;
				}

				.item-note {
					color: #808080;
					font-weight:normal;
					font-style: italic;
				}

				.item-label {
					text-transform: uppercase;
					color: #808080;
					font-size: 11px;
				}

				.item-date {
					color: #55c9dc;
				}

				.section {
					padding-bottom: 20px;
					border-bottom: 1px solid #e0e0e0;
					margin-bottom: 20px;
				}

				<!-- Patient Demographics -->

				.patient-description {
					font-size: 15px;
					font-style: italic;
					line-height: 18px;
					margin:20px 0 20px 0;
				}

				.patient-description p {
					margin:10px 0 5px 0;
				}

				.allergies li {
					font-size: 13px;
				}

			</style>

			<title>
				<xsl:value-of select="$title"/>
			</title>
		</head>
		<body>            
			<header>

				<!--
				Item structure template
				<ul>
					<li class="item-label"></li>
					<li class="item"></li>
					<li class="item-note>"></li>
				</ul>
				-->
				<div class="section">
					<h1>
						<xsl:call-template name="getName">
							<xsl:with-param name="name" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name"/>
						</xsl:call-template>
					</h1>
					<p class="item">
						<xsl:call-template name="formatDate">
							<xsl:with-param name="date" 
							select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
						</xsl:call-template><span class="item-note"> (DOB)</span>
					<br/>
					<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id/@extension"/><span class="item-note"> (MRN)</span></p>
					<p class="patient-description">
						<span class="bold"><xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given"/></span>
						 is a 
						 <span class="bold">(Marital Status) (Race) <xsl:variable name="sex" 
								select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code"/>
								<xsl:choose>
									<xsl:when test="$sex='M'">Male</xsl:when>
									<xsl:when test="$sex='F'">Female</xsl:when>
								</xsl:choose></span>
						 who observes 
						 <span class="bold">(Religion)</span>
						  and speaks 
						  <span class="bold">(language)</span>.
					</p>

					<ul>
						<li class="item-label">Address</li>
						<li class="item">(17 Daws Road<br />Portland, OR 97006)</li>
					</ul>

					<ul>
						<li class="item-label">Telephone</li>
						<li class="item">(415.555.1229)</li>
					</ul>
				</div>
				

				<!-- SAVED FOR FUTURE PLACEMENT -->

					<!-- <tr>
						<td width='10%'><b><xsl:text>Consultant: </xsl:text></b></td>
						<td width='40%'>
							<xsl:choose>
								<xsl:when test="/n1:ClinicalDocument/n1:responsibleParty/n1:assignedEntity/n1:assignedPerson/n1:name">
									<xsl:call-template name="getName">
									<xsl:with-param name="name" 
									select="/n1:ClinicalDocument/n1:responsibleParty/n1:assignedEntity/n1:assignedPerson/n1:name"/>
									</xsl:call-template>      
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="getName">
									<xsl:with-param name="name" 
									select="/n1:ClinicalDocument/n1:legalAuthenticator/n1:assignedEntity/n1:assignedPerson/n1:name"/>
									</xsl:call-template>  
								</xsl:otherwise>
							</xsl:choose> </td>
						<td width='25%' align='right'><b><xsl:text>Created On: </xsl:text></b></td>
						<td width='25%'><xsl:call-template name="formatDate">
							<xsl:with-param name="date" 
							select="/n1:ClinicalDocument/n1:effectiveTime/@value"/>
							</xsl:call-template>
						</td>
					</tr> -->
				
				<!-- <xsl:apply-templates select="n1:component/n1:structuredBody/n1:allergies"/> -->

				<div class="section allergies">
					<h2><xsl:value-of select="n1:component/n1:structuredBody/n1:allergies/n1:section/n1:title" /></h2>
					
					<xsl:for-each select="n1:component/n1:structuredBody/n1:allergies/n1:section/n1:entry">
						<ul>
							<li class="item"><xsl:value-of select="n1:observation/n1:entryRelationship/n1:observation/n1:code/@displayName" /></li>
							<li class="item-note"><xsl:value-of select="n1:observation/n1:code/@displayName" /></li>
						</ul>
					</xsl:for-each>
				</div>
			

			</header>

			<div class="content-wrap">
				
				<div class="section">
					<h2><xsl:value-of select="n1:component/n1:structuredBody/n1:meds/n1:section/n1:title" /></h2>

					<xsl:for-each select="n1:component/n1:structuredBody/n1:meds/n1:section/n1:entry">
					<ul>
						<li class="item-date">(March 28, 2012)</li>
						<li class="item"><!-- <xsl:value-of select="." /> -->
							<xsl:value-of select="n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/@displayName" /> / <xsl:value-of select="n1:substanceAdministration/n1:doseQuantity/@value" /><xsl:value-of select="n1:substanceAdministration/n1:doseQuantity/@unit" /></li>
						<li class="item-note">(Instructions)</li>
					</ul>
					</xsl:for-each>
				</div>

				<xsl:apply-templates select="n1:component/n1:structuredBody"/>

				<xsl:call-template name="bottomline"/>
			</div>
		</body>
	</html>
</xsl:template>
    
<!-- Get a Name  -->
<xsl:template name="getName">
    <xsl:param name="name"/>
    <xsl:choose>
         <xsl:when test="$name/n1:family">
              <xsl:value-of select="$name/n1:given"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$name/n1:family"/>
              <xsl:if test="$name/n1:suffix">
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="$name/n1:suffix"/>
              </xsl:if>
          </xsl:when>
          <xsl:otherwise>
               <xsl:value-of select="$name"/>
          </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--  Format Date 
    
      outputs a date in Month Day, Year form
      e.g., 19991207  ==> December 07, 1999
-->
<xsl:template name="formatDate">
        <xsl:param name="date"/>
        <xsl:variable name="month" select="substring ($date, 5, 2)"/>
        <xsl:choose>
                <xsl:when test="$month='01'">
                        <xsl:text>January </xsl:text>
                </xsl:when>
                <xsl:when test="$month='02'">
                        <xsl:text>February </xsl:text>
                </xsl:when>
                <xsl:when test="$month='03'">
                        <xsl:text>March </xsl:text>
                </xsl:when>
                <xsl:when test="$month='04'">
                        <xsl:text>April </xsl:text>
                </xsl:when>
                <xsl:when test="$month='05'">
                        <xsl:text>May </xsl:text>
                </xsl:when>
                <xsl:when test="$month='06'">
                        <xsl:text>June </xsl:text>
                </xsl:when>
                <xsl:when test="$month='07'">
                        <xsl:text>July </xsl:text>
                </xsl:when>
                <xsl:when test="$month='08'">
                        <xsl:text>August </xsl:text>
                </xsl:when>
                <xsl:when test="$month='09'">
                        <xsl:text>September </xsl:text>
                </xsl:when>
                <xsl:when test="$month='10'">
                        <xsl:text>October </xsl:text>
                </xsl:when>
                <xsl:when test="$month='11'">
                        <xsl:text>November </xsl:text>
                </xsl:when>
                <xsl:when test="$month='12'">
                        <xsl:text>December </xsl:text>
                </xsl:when>
        </xsl:choose>
        <xsl:choose>
                <xsl:when test='substring ($date, 7, 1)="0"'>
                        <xsl:value-of select="substring ($date, 8, 1)"/>
                        <xsl:text>, </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                        <xsl:value-of select="substring ($date, 7, 2)"/>
                        <xsl:text>, </xsl:text>
                </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="substring ($date, 1, 4)"/>
</xsl:template>



<!-- StructuredBody -->
<xsl:template match="n1:component/n1:structuredBody">
		<xsl:apply-templates select="n1:component/n1:section"/>
</xsl:template>

<!-- Component/Section -->    
<xsl:template match="n1:component/n1:section">
	<div class="section">
		<xsl:apply-templates select="n1:title"/>
		<xsl:apply-templates select="n1:text"/>				
		<xsl:apply-templates select="n1:component/n1:section"/>
    </div>
     

</xsl:template>

<!--   Title  -->
<xsl:template match="n1:title">
	<h2><xsl:value-of select="."></xsl:value-of></h2>
</xsl:template>

<!--   Text   -->
<xsl:template match="n1:text">	
	<xsl:apply-templates />	
</xsl:template>

<!--   paragraph  -->
<xsl:template match="n1:paragraph">
	<xsl:apply-templates/>
	<br/>
</xsl:template>

<!--     Content w/ deleted text is hidden -->
<xsl:template match="n1:content[@revised='delete']"/>

<!--   content  -->
<xsl:template match="n1:content">
	<xsl:apply-templates/>
</xsl:template>


<!--   list  -->
<xsl:template match="n1:list">
    <xsl:if test="n1:caption">
        <span style="font-weight:bold; ">
        <xsl:apply-templates select="n1:caption"/>
        </span>
    </xsl:if>
    <ul>
	    <xsl:for-each select="n1:item">
		<li class="item">
	        <xsl:apply-templates />
		</li>
	    </xsl:for-each>
    </ul>	
</xsl:template>

<xsl:template match="n1:list[@listType='ordered']">
    <xsl:if test="n1:caption">
        <span style="font-weight:bold; ">
        <xsl:apply-templates select="n1:caption"/>
        </span>
    </xsl:if>
   <ol>
    <xsl:for-each select="n1:item">
	<li>
          <xsl:apply-templates />
	</li>
     </xsl:for-each>
    </ol>	
</xsl:template>
	

<!--   caption  -->
<xsl:template match="n1:caption">  
	<xsl:apply-templates/>
	<xsl:text>: </xsl:text>
</xsl:template>
	
	<!--      Tables   -->
	<xsl:template match="n1:table/@*|n1:thead/@*|n1:tfoot/@*|n1:tbody/@*|n1:colgroup/@*|n1:col/@*|n1:tr/@*|n1:th/@*|n1:td/@*">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="n1:table">
		<table>	
			<xsl:apply-templates/>
		</table>	
	</xsl:template>
	
	<xsl:template match="n1:thead">
		<thead>	
			<xsl:apply-templates/>
		</thead>	
	</xsl:template>

	<xsl:template match="n1:tfoot">
		<tfoot>	
			<xsl:apply-templates/>
		</tfoot>	
	</xsl:template>

	<xsl:template match="n1:tbody">
		<tbody>	
			<xsl:apply-templates/>
		</tbody>	
	</xsl:template>

	<xsl:template match="n1:colgroup">
		<colgroup>	
			<xsl:apply-templates/>
		</colgroup>	
	</xsl:template>

	<xsl:template match="n1:col">
		<col>	
			<xsl:apply-templates/>
		</col>	
	</xsl:template>

	<xsl:template match="n1:tr">
		<tr>	
			<xsl:apply-templates/>
		</tr>	
	</xsl:template>

	<xsl:template match="n1:th">
		<th>	
			<xsl:apply-templates/>
		</th>	
	</xsl:template>

	<xsl:template match="n1:td">
		<td>	
			<xsl:apply-templates/>
		</td>	
	</xsl:template>

	<xsl:template match="n1:table/n1:caption">
		<span style="font-weight:bold; ">	
			<xsl:apply-templates/>
		</span>	
	</xsl:template>

<!--   RenderMultiMedia 

         this currently only handles GIF's and JPEG's.  It could, however,
	 be extended by including other image MIME types in the predicate
	 and/or by generating <object> or <applet> tag with the correct
	 params depending on the media type  @ID  =$imageRef     referencedObject
 -->
    <xsl:template match="n1:renderMultiMedia">
	<xsl:variable name="imageRef" select="@referencedObject"/>
        <xsl:choose>
             <xsl:when test="//n1:regionOfInterest[@ID=$imageRef]">
             <!-- Here is where the Region of Interest image referencing goes -->
                  <xsl:if test='//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value[@mediaType="image/gif" or @mediaType="image/jpeg"]'>
			<br clear='all'/>
		       <xsl:element name='img'>
			    <xsl:attribute name='src'>graphics/
				<xsl:value-of select='//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value/n1:reference/@value'/>
			    </xsl:attribute>
		       </xsl:element>
	          </xsl:if>
             </xsl:when>
             <xsl:otherwise>
             <!-- Here is where the direct MultiMedia image referencing goes -->
                  <xsl:if test='//n1:observationMedia[@ID=$imageRef]/n1:value[@mediaType="image/gif" or @mediaType="image/jpeg"]'>
			<br clear='all'/>
		       <xsl:element name='img'>
			    <xsl:attribute name='src'>graphics/
				<xsl:value-of select='//n1:observationMedia[@ID=$imageRef]/n1:value/n1:reference/@value'/>
			    </xsl:attribute>
		       </xsl:element>
	          </xsl:if>              
             </xsl:otherwise>
        </xsl:choose>	
     </xsl:template>

<!-- 	Stylecode processing   
	  Supports Bold, Underline and Italics display

-->

	<xsl:template match="//n1:*[@styleCode]">

	<xsl:if test="@styleCode='Bold'">
	     <xsl:element name='b'>				
	          <xsl:apply-templates/>
	     </xsl:element>	
	</xsl:if> 

	<xsl:if test="@styleCode='Italics'">
	     <xsl:element name='i'>				
	          <xsl:apply-templates/>
	     </xsl:element>	
	</xsl:if>

	<xsl:if test="@styleCode='Underline'">
	     <xsl:element name='u'>				
	          <xsl:apply-templates/>
	     </xsl:element>	
	</xsl:if>

	   <xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Italics') and not (contains(@styleCode, 'Underline'))">
	     <xsl:element name='b'>
		<xsl:element name='i'>				
	          <xsl:apply-templates/>
		</xsl:element>
	     </xsl:element>	
	   </xsl:if>

	   <xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Italics'))">
	     <xsl:element name='b'>
		<xsl:element name='u'>				
	          <xsl:apply-templates/>
		</xsl:element>
	     </xsl:element>	
	   </xsl:if>

	   <xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Bold'))">
	     <xsl:element name='i'>
		<xsl:element name='u'>				
	          <xsl:apply-templates/>
		</xsl:element>
	     </xsl:element>	
	   </xsl:if>

	   <xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and contains(@styleCode, 'Bold')">
	     	<xsl:element name='b'>
		<xsl:element name='i'>
		<xsl:element name='u'>				
	            <xsl:apply-templates/>
		</xsl:element>
		</xsl:element>
	     	</xsl:element>	
	   </xsl:if>

	</xsl:template>

<!-- 	Superscript or Subscript   -->
	<xsl:template match="n1:sup">
	     <xsl:element name='sup'>				
	          <xsl:apply-templates/>
	     </xsl:element>	
	</xsl:template>
	<xsl:template match="n1:sub">
	     <xsl:element name='sub'>				
	          <xsl:apply-templates/>
	     </xsl:element>	
	</xsl:template>

	<!--  Bottomline  -->
    <xsl:template name="bottomline">
    <b><xsl:text>Signed by: </xsl:text></b>
	<xsl:call-template name="getName">
           <xsl:with-param name="name" 
                select="/n1:ClinicalDocument/n1:legalAuthenticator/n1:assignedEntity/n1:assignedPerson/n1:name"/>
        </xsl:call-template>
        <xsl:text> on </xsl:text>
	       <xsl:call-template name="formatDate">
   	           <xsl:with-param name="date" 
 	               select="//n1:ClinicalDocument/n1:legalAuthenticator/n1:time/@value"/>
        </xsl:call-template>
      </xsl:template>

</xsl:stylesheet>
