<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library xmlns:ucomponents.cms="urn:ucomponents.cms" xmlns:ucomponents.dates="urn:ucomponents.dates" xmlns:ucomponents.email="urn:ucomponents.email" xmlns:ucomponents.enums="urn:ucomponents.enums" xmlns:ucomponents.io="urn:ucomponents.io" xmlns:ucomponents.media="urn:ucomponents.media" xmlns:ucomponents.members="urn:ucomponents.members" xmlns:ucomponents.nodes="urn:ucomponents.nodes" xmlns:ucomponents.random="urn:ucomponents.random" xmlns:ucomponents.request="urn:ucomponents.request" xmlns:ucomponents.search="urn:ucomponents.search" xmlns:ucomponents.strings="urn:ucomponents.strings" xmlns:ucomponents.urls="urn:ucomponents.urls" xmlns:ucomponents.xml="urn:ucomponents.xml" xmlns:Examine="urn:Examine" "
	exclude-result-prefixes="msxml umbraco.library ucomponents.cms ucomponents.dates ucomponents.email ucomponents.enums ucomponents.io ucomponents.media ucomponents.members ucomponents.nodes ucomponents.random ucomponents.request ucomponents.search ucomponents.strings ucomponents.urls ucomponents.xml Examine ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:variable name="colorTop" select="string('#CCC')"/>
<xsl:variable name="color1" select="string('#EEE')"/>
<xsl:variable name="color2" select="string('#DDD')"/>

<xsl:template match="/">

<!-- The fun starts here -->
<table border="0" cellspacing="0" cellpadding="5">
<tr style="background-color: {$colorTop}">
	<td><b>Name</b></td>
	<td><b>Create Date</b></td>
	<td><b>Custom Property</b></td>
</tr>
<xsl:for-each select="$currentPage/* [@isDoc and string(umbracoNaviHide) != '1']">
<tr>
<xsl:choose>
<xsl:when test="position() mod 2 = 0">
	<xsl:attribute name="style">background-color: <xsl:value-of select="$color1"/></xsl:attribute>
</xsl:when>
<xsl:otherwise>
	<xsl:attribute name="style">background-color: <xsl:value-of select="$color2"/></xsl:attribute>
</xsl:otherwise>
</xsl:choose>
	<td><a href="{umbraco.library:NiceUrl(@id)}">
			<xsl:value-of select="@nodeName"/>
		</a>
	</td>
	<td>
		<xsl:value-of select="umbraco.library:LongDate(@createDate)"/>
	</td>
	<td>
		<xsl:value-of select="myAlias"/>
	</td>
</tr>
</xsl:for-each>
</table>

</xsl:template>

</xsl:stylesheet>