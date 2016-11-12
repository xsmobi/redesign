<!--- <cfif FileExists("D:\home\redesign.mobi\wwwroot\cms\#url.site#\index.html")>
		<cflocation url="http://cms.redesign.mobi/#url.site#">
	</cfif> --->
	<cfquery datasource="eritter" name="qsite">
		SELECT CONCAT(firma, '\, ', plz, ' ', ort, '\, ', region10, '\, ',  buland) AS title, description, meta_title, site_titel, canonical_url, site_css, site_css_text, schema_org, firma, site_image, homepage_adresse, strasse, plz, ort, region10, country, telefon, geokoordinaten, javascript_files FROM admin
		WHERE site = '#url.site#'
	</cfquery>
	<cfif not qsite.recordcount><cfoutput>No Site</cfoutput><cfabort></cfif>
	<cfif trim(qsite.canonical_url) neq "">
		<cfset canonical = qsite.canonical_url>
	<cfelseif len(qsite.region10) ge 4>
		<cfset canonical = "http://www.deutschlandurlaub.mobi/hotel-pension-fewo/#url.site#.html">
	<cfelseif FileExists("D:\home\redesign.mobi\wwwroot\cms\#url.site#\index.html")>
		<cfset canonical = "http://cms.redesign.mobi/#url.site#/">
	<cfelse>
		<cfset canonical = "http://www.redesign.mobi/cards/?site=#url.site#">
	</cfif>
	<cfif FindNoCase("instantsearch", qsite.javascript_files)>
		<cfset is_algolia = "Yes"><cfelse><cfset is_algolia = "No">
	</cfif>
	<cfinclude template="zz_zeichen2.cfm">
	<cfif trim(qsite.meta_title) neq "">
		<cfset meta_title = charnews(qsite.meta_title)>
	<cfelse>
		<cfset meta_title = charnews(qsite.title)>
	</cfif>
	<cfif trim(qsite.description) neq "">
		<cfset description = charnews(qsite.description)><cfelse><cfset description = "">
	</cfif>
	<cfif isdefined("url.widget")>
		<cfset is_widget = "Yes"><cfelse><cfset is_widget = "No">
	</cfif>
	<cfquery name="qpages" datasource="eritter">SELECT label, page_name, page_h1, page_h2 FROM admin, cms_pages WHERE admin.kennummer = cms_pages.p2kennummer AND site = '#url.site#' ORDER BY cms_pages.page_sort, cms_pages.label</cfquery>
	<cfquery name="qmoments" datasource="eritter">SELECT m.kennummer AS mkn, titel, url0, kurztext FROM admin a, mobi_links m WHERE a.kennummer = m.p2kennummer AND site = '#url.site#' AND LOCATE('twitter.com/', url0) > 0 ORDER BY sort</cfquery>
	<!--- <cfquery name="qgoogletrends" dbtype="query">SELECT aktuell</cfquery> --->
	<cfset is_post = "No">
	<cfif isdefined("url.post") and trim(url.post) neq "">
		<cfquery name="qpost" datasource="eritter" maxrows="1">
			SELECT 
			REPLACE(aktuell_titel, '&', '+') AS meta_title,
			REPLACE(aktuell_utitel, '&', '+') AS aktuell_utitel, 
			REPLACE(aktuell_text, '&', '+') AS aktuell_text,
			aktuell_bild_url, aktuell_bild_url_1000, aktuell_bild_url_1000_2, aktuell_bild_url_1000_3
			FROM mobi_aktuell 
			WHERE CONVERT(kennummer, char) = '#url.post#'
		</cfquery>
		<!--- <cfoutput>#qpost.recordcount# #qpost.aktuell_text#</cfoutput><cfabort> --->
		<cfif qpost.recordcount>
			<cfset is_post = "Yes">
		</cfif>
	</cfif>