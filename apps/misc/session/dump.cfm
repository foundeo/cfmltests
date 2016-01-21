<cfdump var="#session#" label="Session Scope">
<cfdump var="#cookie#" label="Cookie Scope">

<cfset s = getPageContext().getRequest().getSession()>
<cfset sE = s.getAttributeNames()>
<cfloop condition="#se.hasMoreElements()#">
	<cfset name = se.nextElement()>
	<cfoutput><h2>#name#</h2></cfoutput>
	<cfdump var="#s.getAttribute(name)#">
	<hr />
</cfloop>