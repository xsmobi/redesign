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
	<cfreturn txt>
</cffunction>
