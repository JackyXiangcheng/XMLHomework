<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/">
		<book>
			<xsl:apply-templates select="/book/section"/>
		</book>
	</xsl:template>
	<xsl:template match="section">
		<section>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates select="./title"/>
			<xsl:if test="./section">
				<xsl:apply-templates select="./section"/>
			</xsl:if>
		</section>
	</xsl:template>
	<xsl:template match="title">
		<title>
			<xsl:copy-of select="text()"/>
		</title>
	</xsl:template>
</xsl:stylesheet>
