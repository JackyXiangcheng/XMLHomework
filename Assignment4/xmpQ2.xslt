<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<results>
			<xsl:apply-templates select="//author"/>
		</results>
	</xsl:template>
	<xsl:template match="author">
		<result>
			<xsl:apply-templates select="../title"/>
			<xsl:copy-of select="."/>
		</result>
	</xsl:template>
	<xsl:template match="title">
		<xsl:copy-of select="."/>
	</xsl:template>
</xsl:stylesheet>
