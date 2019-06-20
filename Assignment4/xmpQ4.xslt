<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:variable name="author_array" select="//author"/>	
	<xsl:variable name="last_name" select="distinct-values($author_array/last/string())"/>
	<xsl:variable name="author_name_array" select="distinct-values($author_array/string())"/>
	<xsl:template match="/">
		<results>
			<xsl:for-each select="$author_name_array">
				<xsl:sort select="."/>
				<xsl:variable name="index" select="index-of($author_name_array,.)"/>
				<result>
					<author>
						<last>
							<xsl:value-of select="$last_name[$index]"/>
						</last>
						<first>
							<xsl:value-of select="substring-after(.,$last_name[$index])"/>
						</first>
					</author>
					<xsl:call-template name="print_title">
						<xsl:with-param name="author_name" select="."/>
					</xsl:call-template>
				</result>
			</xsl:for-each>
		</results>
	</xsl:template>
	<xsl:template name="print_title">
		<xsl:param name="author_name" as="xs:string"/>
		<xsl:for-each select="document('bib.xml')//book">
			<xsl:if test="author/string()=$author_name">
				<xsl:copy-of select="title"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
