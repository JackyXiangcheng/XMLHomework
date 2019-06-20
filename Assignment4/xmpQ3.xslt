<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/">
		<results>
			<xsl:for-each select="//book">
				<result>
					<xsl:copy-of select="title"></xsl:copy-of>
				<xsl:for-each select="author">
					<xsl:copy-of select="."></xsl:copy-of>
				</xsl:for-each>
				</result>
			</xsl:for-each>
		</results>
	</xsl:template>

</xsl:stylesheet>
