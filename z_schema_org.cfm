<cfoutput>
		<script type="application/ld+json">
		{
		"@context": "http://schema.org",
		"@type": "#qsite.schema_org#",
		"image": "#qsite.site_image#",
		<!--- "@id": "#Replace(Replace(qsite.homepage_adresse, "www.", ""), "http://", "")#", --->
		"@id": "#canonical#",
		"name": "#qsite.firma#",
		"address": {
		    "@type": "PostalAddress",
		    "streetAddress": "#charnews(qsite.strasse)#",
		    "addressLocality": "#charnews(qsite.ort)#",
		    "addressRegion": "#charnews(qsite.region10)#",
			"postalCode": "#qsite.plz#"<cfif trim(qsite.country) eq "" or qsite.country eq "Germany">,
			"addressCountry": "DE"</cfif>
			}<cfif ListLen(qsite.geokoordinaten) eq 2>,
	  		"geo": {
	  	  	"@type": "GeoCoordinates",
	   	 	"latitude": #ListFirst(qsite.geokoordinaten)#,
	   	 	"longitude": #ListLast(qsite.geokoordinaten)#</cfif>
	  		},
	  		"url": "#qsite.homepage_adresse#"<cfif trim(qsite.telefon) neq "">,
	  		"telephone": "+49#RemoveChars(Replace(qsite.telefon, ' ', '', 'ALL'), 1, 1)#"</cfif>
		}
		</script>
		</cfoutput>