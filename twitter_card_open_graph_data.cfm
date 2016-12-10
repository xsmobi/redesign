<cfset twitter_user = qsite.twitter>
<cfset twitter_image = qsite.site_image>
<cfset twitter_title = meta_title>
<cfset twitter_description = description>
<cfset twitter_image = qsite.site_image>
<cfset og_url = canonical>
<cfif len(twitter_user) and isValid("URL", twitter_image) and len(twitter_title) gt 18 and len(twitter_description) gt 80>
	<cfset is_twitter = "Yes"><cfelse><cfset is_twitter = "No">
</cfif>
