<cfset s = StructNew()>
<cfset s.lower = "a">
<cfset s.UPPER = "b">
<cfset s.mixedCase = "c">
<cfcontent reset="true" type="application/json"><cfoutput>#SerializeJSON(s)#</cfoutput>