	<cfquery datasource="eritter" name="qsite">
		SELECT 
		IF (LENGTH(
		CONCAT(firma, IF (LENGTH(firma) > 0, '\, ', ''), plz, ' ', ort, IF (LENGTH(ort) > 0, '\, ', ''), euland) 
		) > 3,
		CONCAT(firma, IF (LENGTH(firma) > 0, '\, ', ''), plz, ' ', ort, IF (LENGTH(ort) > 0, '\, ', ''), euland)
		, '#ucase(replace(url.site, "-", " ", "ALL"))#')
		AS title, <!--- placeholder for metatitle --->
	
		description, meta_title, canonical_url, site_css, site_css_text, javascript_files, twitter, site_image, website_language,	<!--- <head></head> --->
		
		site_images	<!--- for slider div --->
		
		<!--- FROM admin WHERE site = '#url.site#' --->
		FROM admin a, mobi_aktuell akt
		WHERE a.kennummer = akt.p2kennummer AND site = '#url.site#' AND aktuell_ablaufdatum >= #now()#
	</cfquery>
	
	<!--- <cfoutput>#qsite.recordcount#</cfoutput><cfabort> --->
	
	

	<cfinclude template="special_characters.cfm">
	<cfif trim(qsite.meta_title) neq ""><cfset meta_title = charnews(qsite.meta_title)><cfelse><cfset meta_title = charnews(qsite.title)></cfif>
	<cfif trim(qsite.description) neq ""><cfset description = charnews(qsite.description)><cfelse><cfset description = ""></cfif>
	<cfif trim(qsite.canonical_url) neq ""><cfset canonical = qsite.canonical_url><cfelse><cfset canonical = "http://cms.redesign.mobi/#url.site#.html"></cfif>
	<cfif FindNoCase("instantsearch", qsite.javascript_files)><cfset is_algolia = "Yes"><cfelse><cfset is_algolia = "No"></cfif>
	<cfif ListLen(qsite.site_images, chr(10)) gt 1><cfset is_slick_slider = "Yes"><cfelse><cfset is_slick_slider = "No"></cfif>
	<cfif trim(qsite.site_css) neq "">
		<cfsavecontent variable="stylesheets"><cfoutput>
			<cfloop list="#qsite.site_css#" index="stylesheet" delimiters="#chr(10)#"><link rel="stylesheet" href="#stylesheet#">
			</cfloop>
		
		</cfoutput></cfsavecontent>
	</cfif>
