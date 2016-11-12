<cffunction name="charnews">
	<cfargument name="txt" type="string" required="Yes">
		<cfset txtc = Replace(txt, "�", "&auml;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&ouml;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&uuml;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&Auml;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&Ouml;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&Uuml;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&szlig;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&agrave;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&acirc;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&eacute;", "ALL")>		
		<cfset txtc = Replace(txtc, "�", "&egrave;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&ecirc;", "ALL")>	
		<cfset txtc = Replace(txtc, "�", "&ccedil;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&oelig;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&Agrave;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&Eacute;", "ALL")>		
		<cfset txtc = Replace(txtc, "�", "&Egrave;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&Ecirc;", "ALL")>	
		<cfset txtc = Replace(txtc, "�", "&Ccedil;", "ALL")>
		<cfset txtc = Replace(txtc, "ooe", "&oelig;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&ocirc;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&ucirc;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&icirc;", "ALL")>
		<cfset txtc = Replace(txtc, "`", "'", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&sup2;", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&deg;", "ALL")>
		<!--- <cfset txtc = Replace(txtc, "�", "-", "ALL")>
		<cfset txtc = Replace(txtc, "�", "-", "ALL")>
		<cfset txtc = Replace(txtc, "�", "&euro;", "ALL")> --->
	<cfreturn txtc>
</cffunction>

<cffunction name="quot">
	<cfargument name="txt" type="string" required="Yes">
	<cfset txtc = Replace(txt, "&quot;", chr(34), "ALL")>
	<cfreturn txtc>
</cffunction>

