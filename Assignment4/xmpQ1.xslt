<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<bib>
			<xsl:apply-templates select="//book[@year>1991 and publisher=&quot;Addison-Wesley&quot;]"/>
		</bib>
	</xsl:template>
	<xsl:template match="book">
		<book>
			<xsl:copy-of select="@year"/>
			<xsl:apply-templates select="./title"/>
		</book>
	</xsl:template>
	<xsl:template match="title">
		<xsl:copy-of select="."/>
	</xsl:template>	
</xsl:stylesheet>
