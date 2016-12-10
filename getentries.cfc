<cfcomponent name="entries" output="false">
<cfheader name="Access-Control-Allow-Origin" value="*" />
	<cffunction name="getFront" output="false" access="remote" returntype="query">
		<cfparam name="asite" type="string" default= "">
		<cfparam name="apage" type="string" default= "">
		<cfparam name="apost" type="numeric" default= "0">
		<cfif trim(apost) neq "" and isnumeric(apost) and apost neq 0>
			<cfset is_post = "Yes"><cfelse><cfset is_post = "No">		
		</cfif>
		<cfparam name="apreview" type="string" default= "">
		<cfif apreview eq 1>
			<cfset is_preview = "Yes">
			<cfsavecontent variable="preview_hint">
			<div class="container-fluid">
				<p class="pt-1"><i class="fa fa-pencil fa-2x" aria-hidden="true"></i> <strong>use your browser's back button to continue editing</strong></p>
			</div>
			</cfsavecontent>
		<cfelse>
			<cfset is_preview = "No">		
		</cfif>
		
		<cfinclude template="markdown.cfm">
		<cfset maxrows = 300>
		<!--- <cfset REQUEST.dataSource = "eritter"> --->
		<cfquery datasource="eritter" name="qadmin" cachedwithin=#CreateTimeSpan(0,0,0,20)# maxrows="1">
			SELECT kennummer, site_images, LENGTH(site_images) AS site_images_length, site_css_text, LENGTH(site_css_text) AS site_css_text_length
			FROM admin
			WHERE site = '#asite#'
		</cfquery>
		<cfquery dbtype="query" name="qstyles" cachedwithin=#CreateTimeSpan(0,0,0,20)# maxrows="1">
			SELECT *
			FROM qadmin WHERE site_css_text_length > 1
		</cfquery>
		<cfquery dbtype="query" name="qslider" cachedwithin=#CreateTimeSpan(0,0,0,20)# maxrows="1">
			SELECT *
			FROM qadmin WHERE site_images_length > 1
		</cfquery>
		<cfset is_slick_slider = "No">
		<cfif ListLen(qslider.site_images, chr(10)) gt 1>
			<cfset is_slick_slider = "Yes">
			<cfset slick_slider = ''>
			<cfloop list="#qslider.site_images#" index="img" delimiters="#chr(10)#">
				<cfset img0 = ListFirst(img, "|")>
				<cfset imgh = "">
				<cfset imgp = "">
				<cfif ListLen(img, "|") eq 2 or ListLen(img, "|") eq 3>
					<cfset imgh = '<h3>#ListGetAt(img, 2, "|")#</h3>'>
				</cfif>
				<cfif ListLen(img, "|") eq 3>
					<cfset imgp = '<p>#ListLast(img, "|")#</p>'>
				</cfif>
				<cfset slick_slider = slick_slider & '<div class="col-xs-12"><img src="#img0#" class="img-fluid rounded mx-auto d-block">#imgh##imgp#</div>'>
			</cfloop>
		</cfif>
		<!--- <cfquery datasource="eritter" name="qcheckpages" cachedwithin=#CreateTimeSpan(0,0,0,20)# maxrows="60">
			SELECT label, page_name, page_h1, page_h2, page_text,
			CONCAT('<li class="nav-item"><a class="nav-link pcl" href="##" id="load_', label, '" title="', page_h1, '">', page_name, '</a></li>')
			AS nav_items
			FROM cms_pages WHERE p2kennummer = #qadmin.kennummer#
			ORDER BY page_sort
		</cfquery> --->
		<cfquery datasource="eritter" name="qcheckpages" cachedwithin=#CreateTimeSpan(0,0,0,20)# maxrows="60">
			SELECT label, page_name, page_h1, page_h2, page_text,
			CONCAT('<li class="nav-item"><a class="nav-link pcl" href="##" id="load_', label, '" title="', page_h1, '">', page_name, '</a></li>')
			AS nav_items
			FROM admin a, cms_pages p, mobi_aktuell akt 
			WHERE a.kennummer = p.p2kennummer AND a.kennummer = akt.p2kennummer AND a.kennummer = #qadmin.kennummer# 
			AND aktuell_ablaufdatum >= #now()#
			AND LENGTH(website_page) > 1
			GROUP BY label ORDER BY page_sort 
		</cfquery>
		
		<cfif qcheckpages.recordcount>
			<cfset navi = "">
			<cfloop query="qcheckpages">
				<cfset navi = navi & nav_items>
			</cfloop>
		</cfif>
		<cfquery datasource="eritter" name="qentries0" cachedwithin=#CreateTimeSpan(0,0,0,20)# maxrows="60">
			SELECT akt.kennummer AS aktkn, firma, site_header, slogan, homepage_adresse, telefon,  plz, ort, aktuell_titel, aktuell_text, aktuell_bild_url, aktuell_url_anker, aktuell_url, akt.aenddat AS aenddat, akt.erstdat AS erstdat, aktuell_ablaufdatum, order_by, website_page, site_css, sort
			
			, '#qstyles.site_css_text#' AS site_css_text
			
			, IF (LENGTH(site_banner) < 10 , '', 	CONCAT(IF (LOCATE('fw__', site_banner) = 0 AND LOCATE('fs__', site_banner) = 0, '<div class="container">', '<div class="container-fluid px-0">'),'<img src="', site_banner, '" class="img-fluid mx-auto d-block mt-0"></div>')) AS banner
			
			, IF(LENGTH(site_header) > 10, 			CONCAT('<div class="row mt-1">	<div class="col-xs-12"><h1 class="display-1 text-xs-center">', site_header, '</h1></div></div>'),CONCAT('<div class="row mt-1">	<div class="col-xs-12"><h1 class="display-3 text-xs-center">', site_titel, '</h1></div></div>')) AS site_header
			
			, IF(LENGTH(site_titel) > 10, 			CONCAT('<div class="row mt-1">	<div class="col-xs-12"><h1 class="display-3 text-xs-center">', site_titel, '</h1></div></div>'),'') AS site_title
			
			, IF(LENGTH(slogan) > 10, 				CONCAT('<div class="row mt-1">		<div class="col-xs-12"><h2 class="text-xs-center"><!--- <blockquote class="lead text-xs-center"> --->', slogan, '<!--- </blockquote> ---></h2></div></div>'),'') AS slogan
			
			, CONCAT(
				CONCAT('
				
				<div class="row mt-2"><div class="col-xs-12" id="wrapper',  CONVERT(akt.kennummer, char) , '">
				
				
				
				<div class="row" id="a',  CONVERT(akt.kennummer, char) , '">
				
				
				<div class="col-xs-12" id="c',        CONVERT(akt.kennummer, char)            ,'"><div class="row"><!--- article --->
				
				
				<!--- <a href="##top" class="btn btn-block btn-sm btn-outline-secondary mb-1"><i class="fa fa-caret-up fa-2x" aria-hidden="true"></i></a> --->
				
				
				<div class="col-xs-12"><h2>', aktuell_titel, '</h2>', 
				IF(LENGTH(aktuell_utitel) > 10, CONCAT('<div class="row"><div class="col-xs-12"><h5>', aktuell_utitel, '</h5></div></div>'), ''), 
				IF (LENGTH(aktuell_text_html) < 10 , REPLACE(REPLACE(aktuell_text, '\n*', '<br />&##9632;'), '\n', '<br />'), aktuell_text_html), '</div></div>')
				<!--- Komma ab hier vorne --->
				, IF(LENGTH(aktuell_bild_url_1000) > 10, 				CONCAT('<div class="row mt-1">		<div class="col-xs-12">		<img src="', aktuell_bild_url_1000, '" class="img-fluid rounded mx-auto d-block"></div></div>'),'')
				, IF(LENGTH(aktuell_bild_url_1000_caption_html) > 10,	CONCAT('<div class="row mb-1 mb-1">	<div class="col-xs-12">		<figcaption class="figure-caption font-weight-bold text-xs-center">', aktuell_bild_url_1000_caption_html, '</figcaption></div></div>'),'')
				, IF(LENGTH(aktuell_bild_url_1000_2) > 10,				CONCAT('<div class="row mb-1">		<div class="col-xs-12">		<img src="', aktuell_bild_url_1000_2, '" class="img-fluid rounded mx-auto d-block"></div></div>'), '')
				, IF(LENGTH(aktuell_bild_url_1000_2_caption_html) > 10,	CONCAT('<div class="row m1-1 mb-1">	<div class="col-xs-12">		<figcaption class="figure-caption font-weight-bold text-xs-center">', aktuell_bild_url_1000_2_caption_html, '</figcaption></div></div>'), '')
				, IF(LENGTH(aktuell_bild_url_1000_3) > 10,				CONCAT('<div class="row mb-1">		<div class="col-xs-12">		<img src="', aktuell_bild_url_1000_3, '" class="img-fluid rounded mx-auto d-block"></div></div>'),'')
				, IF(LENGTH(aktuell_bild_url_1000_3_caption_html) > 10,	CONCAT('<div class="row mb-1 mb-1">	<div class="col-xs-12">		<figcaption class="figure-caption font-weight-bold text-xs-center">', aktuell_bild_url_1000_3_caption_html, '</figcaption></div></div>'),'')
				
				, IF(LENGTH(aktuell_embd_url) > 10,						CONCAT('<div class="row mt-1 mb-1">	<div class="col-xs-12">		<div class="embed-responsive embed-responsive-4by3"><iframe class="embed-responsive-item" src="', aktuell_embd_url, '"></iframe></div></div></div>'), '')
				, IF(LENGTH(aktuell_url_anker) > 10,					CONCAT('<div class="row mt-1 mb-1">			<div class="col-xs-12"><a href="', aktuell_url, '" class="btn btn-block btn-sm btn-outline-primary" target="_blank" rel="nofollow">', aktuell_url_anker, '</a></div></div>'),'')		
				
				, '</div></div></div></div>'<!--- article --->
				
				)	
			AS post,
				
			<cfif trim(apage) neq "">page_name, page_h1, page_h2, page_text,</cfif>
			
			<cfif is_slick_slider>'#slick_slider#' AS slick_slider,</cfif>
			
			<cfif is_preview>'#preview_hint#' AS preview_hint,</cfif>
			
			CONCAT( 
			
			<!--- IF(LENGTH(site_images) > 10, CONCAT('<div class="container"><div class="row mb-1"><div class="col-lg-12"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="http://redesign.mobi/photo-gallery-sp/index2.cfm?site=', site, '"></iframe></div></div></div></div>'),''), --->

			IF(LENGTH(site_titel) > 10,			CONCAT('<div class="container"><div class="row mt-2"><div class="col-lg-12"><h3>', site_titel, '</h3></div></div></div>'),''),
			IF(LENGTH(site_kurztext) > 10,		CONCAT('<div class="container"><div class="row"><div class="col-lg-12"><p class="lead">', site_kurztext, '</p></div></div></div>'), ''),
			IF(LENGTH(site_langtext) > 10,		CONCAT('<div class="container"><div class="row"><div class="col-lg-12">', REPLACE(REPLACE(site_langtext, '\n*', '<br />&##9632;'), '\n', '<br />'), '</div></div></div>'),''),	
			IF(LENGTH(site_image) > 10, 		CONCAT('<div class="container"><div class="row"><div class="col-lg-12 mt-2" id="site_image"><img src="', site_image, '" alt="" class="img-fluid rounded mx-auto d-block"></div></div></div>'),''),	
					
<!--- 			IF(LENGTH(site_embd_url) > 10, 		CONCAT('<div class="container"><div class="row mt-1"><div class="col-lg-12"><div class="embed-responsive embed-responsive-4by3"><iframe class="embed-responsive-item" src="', site_embd_url, '"></iframe></div></div></div></div>'),''),
			IF(LENGTH(site_embd_url_2) > 10, 	CONCAT('<div class="container"><div class="row mt-1"><div class="col-lg-12"><div class="embed-responsive embed-responsive-4by3"><iframe class="embed-responsive-item" src="', site_embd_url_2, '"></iframe></div></div></div></div>'),''), --->
			'<div class="container-fluid"><div class="row"><div class="col-xs-12 bg-faded text-xs-center mt-2"><p class="pt-1">',firma, IF (LENGTH(firma) < 3 , '', '\, '), strasse, IF (LENGTH(strasse) < 3 , '', '\, '), plz, ' ', ort, IF (LENGTH(telefon) < 3 , '', ' &nbsp;&nbsp;&nbsp;<i class="fa fa-phone" aria-hidden="true"></i> '), telefon, ' &nbsp;&nbsp;&nbsp;<i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:', email, '">', email, '</a> &nbsp;&nbsp;&nbsp;', IF (LENGTH(homepage_adresse) < 16 , '', '<i class="fa fa-home" aria-hidden="true"></i>'), ' <a href="', homepage_adresse, '">', REPLACE(homepage_adresse, "http://", ""), '</a><!---  ---> &nbsp;&nbsp;&nbsp; <a target="_blank" rel="nofollow" href="https://www.google.com/maps/embed/v1/place?key=AIzaSyDAdIZARbDMt49n_45WP1JS8uKUsmuieX0&q=', map_address, '&zoom=14">', IF (LENGTH(map_address) < 32 , '', '<i class="fa fa-map-marker" aria-hidden="true"></i>'), '</a></p></div></div></div>'
			)
			AS address,
			
			CONCAT('<div class="row"><div class="col-lg-12 text-xs-center mt-1"><p>', strasse, IF (LENGTH(strasse) < 3 , '', '\, '), plz, ' ', ort, '<br />', IF (LENGTH(telefon) < 3 , '', ' &nbsp;&nbsp;&nbsp;<i class="fa fa-phone" aria-hidden="true"></i> '), telefon, ' &nbsp;&nbsp;&nbsp;<i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:', email, '">', email, '</a> &nbsp;&nbsp;&nbsp;', IF (LENGTH(homepage_adresse) < 16 , '', '<br /><i class="fa fa-home" aria-hidden="true"></i>'), ' <a href="', homepage_adresse, '">', REPLACE(homepage_adresse, "http://", ""), '</a><!---  ---> &nbsp;&nbsp;&nbsp; <a target="_blank" rel="nofollow" href="https://www.google.com/maps/embed/v1/place?key=AIzaSyDAdIZARbDMt49n_45WP1JS8uKUsmuieX0&q=', map_address, '&zoom=14">', IF (LENGTH(map_address) < 32 , '', '<i class="fa fa-map-marker" aria-hidden="true"></i>'), '</a></p></div></div>'
			)
			AS address2
					
			<cfif qcheckpages.recordcount>
				, '#navi#' AS navitems
				, CONCAT('<div class="row mt-2">	<div class="col-xs-12"><h2 class="display-4 text-xs-center">', page_h1, '</h2></div></div>') AS page_h1
				, CONCAT('<div class="row mt-1">	<div class="col-xs-12 bg-faded"><h2 class="text-xs-center">', page_h2, '</h2></div></div>') AS page_h2
			</cfif>
			
			FROM admin a, mobi_aktuell akt <cfif qcheckpages.recordcount>, cms_pages cp</cfif>
			WHERE a.kennummer = akt.p2kennummer AND site = '#asite#' <cfif qcheckpages.recordcount>AND a.kennummer = cp.p2kennummer AND akt.website_page = cp.label</cfif>
			AND aktuell_ablaufdatum >= #now()#
			<cfif is_post>
				AND akt.kennummer = #apost#
			</cfif>
		</cfquery>
		<cfset postlist = "">
		<cfloop query="qentries0">
			<cfset postlist = ListAppend(postlist, '<a class="card-link" href="http://www.redesign.mobi/cards?site=#asite#&post=#aktkn#" title="#aktuell_titel#">#left(aktuell_titel, 24)# ...</a>', " ")>
		</cfloop>
		<cfquery name="qentries" dbtype="query">
			SELECT *, '#postlist#' AS postlist FROM qentries0
			<cfif trim(apage) neq "">
				WHERE
					website_page LIKE '%#apage#%'
					<!--- website_page = '#apage#' --->
			</cfif>
			<cfif qentries0.order_by eq "sort">
				ORDER BY sort
			<cfelseif qentries0.order_by eq "created">
				ORDER BY erstdat DESC
			<cfelse>
				ORDER BY aenddat DESC		
			</cfif>
		</cfquery>
	<cfreturn qentries />
	</cffunction>
</cfcomponent>
