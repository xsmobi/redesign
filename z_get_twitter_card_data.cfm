<cfset twitter_image = qsite.site_image>
<cfif is_post>
	<!--- Twitter Card Title --->
	<cfset meta_title = qpost.meta_title>
	<cfset twitter_title = qpost.meta_title>
	<!--- Twitter Card Description --->
	<cfif trim(qpost.aktuell_utitel) neq "">
		<cfset twitter_description = qpost.aktuell_utitel>
	<cfelse>
		<cfset twitter_description = left(ReplaceNOCase(qpost.aktuell_text, chr(10), "", "ALL"), 200)>
	</cfif>
	<!--- Twitter Card Image --->
	<cfset bildliste = "">
	<cfloop list="aktuell_bild_url,aktuell_bild_url_1000,aktuell_bild_url_1000_2,aktuell_bild_url_1000_3" index="bildx">
		<cfif trim(evaluate("qpost.#bildx#")) neq "">
			<cfset bildliste = ListAppend(bildliste, bildx)>
		</cfif>
	</cfloop>
	<cfif ListLen(bildliste)>
		<cfset twitter_image = evaluate("qpost.#ListGetAt(bildliste, randrange(1,listlen(bildliste)))#")><cfelse><cfset twitter_image = "">
	</cfif>
	<cfset canonical = "http://www.redesign.mobi/cards/?site=#url.site#&post=#url.post#">
	<cfset og_url = canonical>
<cfelse>
	<cfset twitter_title = meta_title>
	<cfset twitter_description = description>
	<cfset twitter_image = qsite.site_image>
	<cfset og_url = canonical>
</cfif>
<cfif len(twitter_title) gt 18 and len(twitter_description) gt 80 and isValid("URL", twitter_image)>
	<cfset is_twitter = "Yes"><cfelse><cfset is_twitter = "No">
</cfif>