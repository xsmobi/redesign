<cfcomponent name="entries" output="false">
<cfheader name="Access-Control-Allow-Origin" value="*" />
	<cffunction name="getFront" output="false" access="remote" returntype="query">
		<cfparam name="asite" type="string" default= "">
		<cfparam name="apage" type="string" default= "">
		<cfparam name="apost" type="numeric" default= "0">
		<cfif trim(apost) neq "" and isnumeric(apost) and apost neq 0>
			<cfset is_post = "Yes">
		<cfelse>
			<cfset is_post = "No">		
		</cfif>
		<cfinclude template="markdown.cfm">
		<cfset maxrows = 300>
		<cfset REQUEST.dataSource = "eritter">
		<cfquery datasource="eritter" name="qentries0" cachedwithin=#CreateTimeSpan(0,0,0,20)# maxrows="60">
			SELECT <!--- 'test' AS firmax, ---> akt.kennummer AS aktkn, firma, slogan, homepage_adresse, telefon,  plz, ort, aktuell_titel, aktuell_text, aktuell_bild_url, aktuell_url_anker, aktuell_url, akt.aenddat AS aenddat, akt.erstdat AS erstdat, aktuell_ablaufdatum, order_by, website_page, sort
			
			, IF (LENGTH(site_banner) < 10 , '', CONCAT(
			
			IF (LOCATE('fw__', site_banner) = 0 , '<div class="container">', '<div class="container-fluid p-x-0">')
			,
			
			'<img src="', site_banner, '" class="img-fluid center-block m-t-0"></div>'
			
			)) AS banner
			, IF (LENGTH(articles_header) < 2 , '', CONCAT('<div class="row m-t-1"><div class="col-lg-12"><h2>', articles_header, '</h2></div></div>')) AS articles_header
			, IF (LENGTH(articles_header_2) < 2 , '', CONCAT('<div class="row m-t-1"><div class="col-lg-12"><p class="lead">', articles_header_2, '</p></div></div>')) AS articles_header_2
			, CONCAT(
				IF(LENGTH(aktuell_bild_url) > 10,
					CONCAT('
					<div class="row m-t-2" id="post, CONVERT(akt.kennummer, char) ,">
						<div class="col-lg-12">
							<h3 class="m-t-3">', aktuell_titel, '</h3>
						</div>
					</div>
					<!--- aktuell_utitel --->
					'
								,
				IF(LENGTH(aktuell_utitel) > 10,
					CONCAT('				
						<div class="row m-t-1">
							<div class="col-lg-12"><p class="lead">', aktuell_utitel, '</p></div>
						</div>'
					)
					, 
					''
				),
					'
					<!--- aktuell_utitel --->
					<div class="row">
						<div class="col-lg-9">
							', IF (LENGTH(aktuell_text_html) < 10 , REPLACE(REPLACE(aktuell_text, '\n*', '<br />&##9632;'), '\n', '<br />'), aktuell_text_html), '
						</div>
						<div class="col-lg-3">
							<img src="', aktuell_bild_url, '" class="img-fluid img-rounded m-b-1">
						</div>			
					</div>') 
				,
					CONCAT('
					<div class="row" id="a',  CONVERT(akt.kennummer, char) , '">
						<div class="col-lg-12">
							<h3 class="m-t-3">'
							, aktuell_titel, '</h3>
							<!--- utitel --->
							',
							
							IF(LENGTH(aktuell_utitel) > 10,
								CONCAT('				
								<div class="row m-t-1"><div class="col-lg-12"><p class="lead">', aktuell_utitel, '</p></div></div>'
								)
							, 
								''
							),
							<!--- /utitel --->

							IF (LENGTH(aktuell_text_html) < 10 , REPLACE(REPLACE(aktuell_text, '\n*', '<br />&##9632;'), '\n', '<br />'), aktuell_text_html), '
						</div>		
					</div>')
				) 
			,
				IF(LENGTH(aktuell_text_more_html) > 10,
					CONCAT('
						<div class="row m-b-1">
							<!--- <div class="col-lg-12 text-lg-center"><span data-toggle="collapse" data-target="##more', CONVERT(akt.kennummer, char), '" aria-expanded="false">more', CONVERT(akt.kennummer, char), '</span></div> --->
							<div class="col-lg-12 text-lg-center"><button class="btn btn-block btn-sm btn-info-outline" data-toggle="collapse" data-target="##more', CONVERT(akt.kennummer, char), '" aria-expanded="false">Toggle more / less</button></div>
						</div>					
					
						<div class="row m-b-1 collapse" id="more', CONVERT(akt.kennummer, char), '">
							<div class="col-lg-12">', aktuell_text_more_html, '</div>
						</div>'
					)
					, 
					''
					
				)
			,
				IF(LENGTH(aktuell_bild_url_1000) > 10,
					CONCAT('
						<div class="row m-t-1 m-b-1">
							<div class="col-lg-12"><img src="', aktuell_bild_url_1000, '" class="img-fluid img-rounded center-block"></div>
						</div>'
					)
					, 
					''
				)
			,
				IF(LENGTH(aktuell_bild_url_1000_caption_html) > 10,
					CONCAT('
						<div class="row m-b-1">
							<div class="col-lg-12"><figcaption class="figure-caption text-lg-center">', aktuell_bild_url_1000_caption_html, '</figcaption></div>
						</div>'
					)
					, 
					''
				)
			,			
				IF(LENGTH(aktuell_bild_url_1000_2) > 10,
					CONCAT('
						<div class="row m-b-1">
							<div class="col-lg-12"><img src="', aktuell_bild_url_1000_2, '" class="img-fluid img-rounded center-block"></div>
						</div>'
					)
					, 
					''
				)
			,	
				IF(LENGTH(aktuell_bild_url_1000_2_caption_html) > 10,
					CONCAT('
						<div class="row m-b-1">
							<div class="col-lg-12"><figcaption class="figure-caption text-lg-center">', aktuell_bild_url_1000_2_caption_html, '</figcaption></div>
						</div>'
					)
					, 
					''
				)
			,	
				IF(LENGTH(aktuell_bild_url_1000_3) > 10,
					CONCAT('
						<div class="row m-b-1">
							<div class="col-lg-12"><img src="', aktuell_bild_url_1000_3, '" class="img-fluid img-rounded center-block"></div>
						</div>'
					)
					, 
					''
				)
			,	
				IF(LENGTH(aktuell_bild_url_1000_3_caption_html) > 10,
					CONCAT('
						<div class="row m-b-1">
							<div class="col-lg-12"><figcaption class="figure-caption text-lg-center">', aktuell_bild_url_1000_3_caption_html, '</figcaption></div>
						</div>'
					)
					, 
					''
				)
			,					
						
			IF(LENGTH(aktuell_embd_url) > 10,
				CONCAT('<div class="row m-b-1"><div class="col-lg-12"><div class="embed-responsive embed-responsive-4by3"><iframe class="embed-responsive-item" src="', aktuell_embd_url, '"></iframe></div></div></div>')
				, 
				''
			)
			,
			IF(LENGTH(aktuell_url_anker) > 10,
					CONCAT('
						<div class="row">
							<div class="col-lg-12 m-b-1"><a href="', aktuell_url, '" class="btn btn-block btn-sm btn-primary-outline" target="_blank" rel="nofollow">', aktuell_url_anker, '</a></div>
						</div>'
					)
					, 
					''
			)		
			)	
			AS post,
			
			
			
			CONCAT('
						<!--- <div class="row">
							<div class="col-lg-12 m-b-1"> ---><a href="http://www.deutschlandurlaub.mobi/hotel-pension-fewo/', site, '.html" class="btn btn-block btn-sm btn-primary-outline" target="_blank" rel="nofollow">Ganzes Profil auf deutschlandurlaub.mobi</a><!--- </div>
						</div> --->'
					)
			AS profil_button,

			<cfif trim(apage) neq "">
				page_name, page_h1, page_h2, page_text,
			</cfif>
			
			CONCAT(
			
			IF(LENGTH(site_images) > 10,
				CONCAT('<div class="container"><div class="row m-b-1"><div class="col-lg-12"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="http://redesign.mobi/photo-gallery-sp/index2.cfm?site=', site, '"></iframe></div></div></div></div>')
				, 
				''
			),
			
			
			IF(LENGTH(site_titel) > 10,
				CONCAT('<div class="container"><div class="row m-t-2"><div class="col-lg-12"><h3>', site_titel, '</h3></div></div></div>')
				, 
				''
			),
			IF(LENGTH(site_kurztext) > 10,
				CONCAT('<div class="container"><div class="row"><div class="col-lg-12"><p class="lead">', site_kurztext, '</p></div></div></div>')
				, 
				''
			),
			IF(LENGTH(site_langtext) > 10,
				CONCAT('<div class="container"><div class="row"><div class="col-lg-12">', REPLACE(REPLACE(site_langtext, '\n*', '<br />&##9632;'), '\n', '<br />'), '</div></div></div>')
				, 
				''
			),	
			
			IF(LENGTH(site_image) > 10,
				CONCAT('<div class="container"><div class="row"><div class="col-lg-12 m-t-2"><img src="', site_image, '" alt="" class="img-fluid img-rounded center-block"></div></div></div>')
				, 
				''
			),	
			
			
			IF(LENGTH(site_embd_url) > 10,
				CONCAT('<div class="container"><div class="row m-b-1 m-t-1"><div class="col-lg-12"><div class="embed-responsive embed-responsive-4by3"><iframe class="embed-responsive-item" src="', site_embd_url, '"></iframe></div></div></div></div>')
				, 
				''
			),
			
			IF(LENGTH(site_embd_url_2) > 10,
				CONCAT('<div class="container"><div class="row m-b-1"><div class="col-lg-12"><div class="embed-responsive embed-responsive-4by3"><iframe class="embed-responsive-item" src="', site_embd_url_2, '"></iframe></div></div></div></div>')
				, 
				''
			),
			
			'
			<div class="container-fluid"><div class="row">
					<div class="col-lg-12 bg-inverse text-lg-center m-t-2"><p class="p-t-1">',
						firma, IF (LENGTH(firma) < 3 , '', '\, '), strasse, IF (LENGTH(strasse) < 3 , '', '\, '), plz, ' ', ort, IF (LENGTH(telefon) < 3 , '', ' &nbsp;&nbsp;&nbsp;<i class="fa fa-phone" aria-hidden="true"></i> '), telefon, ' &nbsp;&nbsp;&nbsp;<i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:', email, '">', email, '</a> &nbsp;&nbsp;&nbsp;', IF (LENGTH(homepage_adresse) < 16 , '', '<i class="fa fa-home" aria-hidden="true"></i>'), ' <a href="', homepage_adresse, '">', REPLACE(homepage_adresse, "http://", ""), '</a><!---  ---> &nbsp;&nbsp;&nbsp; <a target="_blank" rel="nofollow" href="https://www.google.com/maps/embed/v1/place?key=AIzaSyDAdIZARbDMt49n_45WP1JS8uKUsmuieX0&q=', map_address, '&zoom=14">', IF (LENGTH(map_address) < 32 , '', '<i class="fa fa-map-marker" aria-hidden="true"></i>'), '</a>
					</p></div>
				</div></div>')
			AS address,
			
			CONCAT(
			'<div class="row">
					<div class="col-lg-12 text-lg-center m-t-1"><p>',
						<!--- firma,IF (LENGTH(firma) < 3 , '', '\, '),   --->strasse, IF (LENGTH(strasse) < 3 , '', '\, '), plz, ' ', ort, '<br />', IF (LENGTH(telefon) < 3 , '', ' &nbsp;&nbsp;&nbsp;<i class="fa fa-phone" aria-hidden="true"></i> '), telefon, ' &nbsp;&nbsp;&nbsp;<i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:', email, '">', email, '</a> &nbsp;&nbsp;&nbsp;', IF (LENGTH(homepage_adresse) < 16 , '', '<br /><i class="fa fa-home" aria-hidden="true"></i>'), ' <a href="', homepage_adresse, '">', REPLACE(homepage_adresse, "http://", ""), '</a><!---  ---> &nbsp;&nbsp;&nbsp; <a target="_blank" rel="nofollow" href="https://www.google.com/maps/embed/v1/place?key=AIzaSyDAdIZARbDMt49n_45WP1JS8uKUsmuieX0&q=', map_address, '&zoom=14">', IF (LENGTH(map_address) < 32 , '', '<i class="fa fa-map-marker" aria-hidden="true"></i>'), '</a>
					</p></div>
				</div>'
			) AS address2
			
			FROM admin a, mobi_aktuell akt <cfif trim(apage) neq "">, cms_pages cp</cfif>
			WHERE a.kennummer = akt.p2kennummer AND site = '#asite#' <cfif trim(apage) neq "">AND a.kennummer = cp.p2kennummer AND akt.website_page = cp.label</cfif>
			AND aktuell_ablaufdatum >= #now()#
			<cfif is_post>
				AND akt.kennummer = #apost#
			</cfif>
			
			<!--- ORDER BY  akt.aenddat DESC --->
		</cfquery>
		<!--- <cfif qentries0.order_by eq "sort">
			<cfset orderby = "sort">
		<cfelseif qentries0.order_by eq "created">
			<cfset orderby = "akt.erstdat DESC">
		<cfelse>
			<cfset orderby = "akt.aenddat DESC">		
		</cfif> --->
		<cfset postlist = '<nav class="nav">'>
		<cfset postlist = "">
		<cfloop query="qentries0">
			<cfset postlist = ListAppend(postlist, '<a class="nav-link" href="http://www.redesign.mobi/cards?site=#asite#&post=#aktkn#">#aktuell_titel#</a>', " ")>
		</cfloop>
		<!--- <cfset postlist = ListAppend(postlist, '</nav>')> --->
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