<cffunction name="md">
	<cfargument name="txt" type="string" required="Yes">
		<!--- Links --->
		<cfset lnklist = "">
		<cfloop list="#txt#" delimiters="[" index="lnk">
			<cfif FindNoCase("]",lnk) and lnk neq ListFirst(lnk, "]")>
				<cfset lnkitem = Left(lnk,FindNoCase("]",lnk) - 1)>
				<cfif ListLen(lnkitem, " ") ge 2>
					<cfset lnkurl = ListFirst(lnkitem, " ")>
					<cfset linkanchor = RemoveChars(lnkitem, 1, Len(lnkurl) + 1)>
					<cfset lnkhtml = '<a href="#lnkurl#" target="_blank" rel="nofollow">#linkanchor#</a>'>
					<cfset txt = ReplaceNoCase(txt, lnkitem, lnkhtml)>
				</cfif>
			</cfif>
		</cfloop>
		<cfset txt = ReplaceNoCase(ReplaceNoCase(txt, "[", "", "ALL"), "]", "", "ALL")>
		<!--- bold, italic --->
		<!--- <cfset b1 = "<strong>">
		<cfset b2 = "</strong>">
		<cfset mdstringlist = "">
		<cfloop list="#txt#" delimiters=" *" index="mdstring">
			<cfif FindNoCase("* ",mdstring) and mdstring neq ListFirst(mdstring, "* ")>
				<cfset mdstringitem = Left(mdstring,FindNoCase("* ",mdstring) - 1)>
				<cfif Left(mdstringitem, 1) neq " " and Right(mdstringitem, 1) neq " ">
					<cfset txt = ReplaceNoCase(txt, mdstringitem, b1 & mdstringitem & b2)>
				</cfif>
			</cfif>
		</cfloop> --->
	<cfreturn txt>
</cffunction>
