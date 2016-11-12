<cffunction name="charnews">
	<cfargument name="txt" type="string" required="Yes">
		<cfset txtc = Replace(txt, "ä", "&auml;", "ALL")>
		<cfset txtc = Replace(txtc, "ö", "&ouml;", "ALL")>
		<cfset txtc = Replace(txtc, "ü", "&uuml;", "ALL")>
		<cfset txtc = Replace(txtc, "Ä", "&Auml;", "ALL")>
		<cfset txtc = Replace(txtc, "Ö", "&Ouml;", "ALL")>
		<cfset txtc = Replace(txtc, "Ü", "&Uuml;", "ALL")>
		<cfset txtc = Replace(txtc, "ß", "&szlig;", "ALL")>
		<cfset txtc = Replace(txtc, "à", "&agrave;", "ALL")>
		<cfset txtc = Replace(txtc, "â", "&acirc;", "ALL")>
		<cfset txtc = Replace(txtc, "é", "&eacute;", "ALL")>		
		<cfset txtc = Replace(txtc, "è", "&egrave;", "ALL")>
		<cfset txtc = Replace(txtc, "ê", "&ecirc;", "ALL")>	
		<cfset txtc = Replace(txtc, "ç", "&ccedil;", "ALL")>
		<cfset txtc = Replace(txtc, "œ", "&oelig;", "ALL")>
		<cfset txtc = Replace(txtc, "À", "&Agrave;", "ALL")>
		<cfset txtc = Replace(txtc, "É", "&Eacute;", "ALL")>		
		<cfset txtc = Replace(txtc, "È", "&Egrave;", "ALL")>
		<cfset txtc = Replace(txtc, "Ê", "&Ecirc;", "ALL")>	
		<cfset txtc = Replace(txtc, "Ç", "&Ccedil;", "ALL")>
		<cfset txtc = Replace(txtc, "ooe", "&oelig;", "ALL")>
		<cfset txtc = Replace(txtc, "ô", "&ocirc;", "ALL")>
		<cfset txtc = Replace(txtc, "û", "&ucirc;", "ALL")>
		<cfset txtc = Replace(txtc, "î", "&icirc;", "ALL")>
		<cfset txtc = Replace(txtc, "`", "'", "ALL")>
		<cfset txtc = Replace(txtc, "²", "&sup2;", "ALL")>
		<cfset txtc = Replace(txtc, "°", "&deg;", "ALL")>
		<!--- <cfset txtc = Replace(txtc, "—", "-", "ALL")>
		<cfset txtc = Replace(txtc, "–", "-", "ALL")>
		<cfset txtc = Replace(txtc, "€", "&euro;", "ALL")> --->
	<cfreturn txtc>
</cffunction>

<cffunction name="quot">
	<cfargument name="txt" type="string" required="Yes">
	<cfset txtc = Replace(txt, "&quot;", chr(34), "ALL")>
	<cfreturn txtc>
</cffunction>

