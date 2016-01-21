<cfset session.r = CreateUUID()>
<cfdump var="#session#">
<cfset s = getPageContext().getRequest().getSession()>
<cfset sE = s.getAttributeNames()>
<cfloop condition="#se.hasMoreElements()#">
	<cfset name = se.nextElement()>
	<cfoutput>#name#<br /></cfoutput>
	<cfdump var="#s.getAttribute(name)#">
	<hr />
</cfloop>
<cfset session.r = CreateUUID()>
<cfset sE = s.getAttributeNames()>
<cfloop condition="#se.hasMoreElements()#">
	<cfset name = se.nextElement()>
	<cfoutput>#name#<br /></cfoutput>
	<cfdump var="#s.getAttribute(name)#">
	<hr />
</cfloop>
<cfset newSessionID = jeeSessionRotate()>
<cfoutput>#newSessionID#</cfoutput>


<cffunction name="jeeSessionRotate" output="false" returntype="string">
	<cfset var sessionScope = Duplicate(session)>
	<cfset var req = getPageContext().getRequest()>
	<cfset StructDelete(sessionScope, "sessionid")>
	<cfset StructDelete(sessionScope, "urltoken")>
	<!--- invalidate old session --->
	<cfset req.getSession().invalidate()>
	<!--- create a new JEE session --->
	<cfset local.newSession = req.getSession(true)>
	<!--- copy the old session scope into a temp key in the new session, handled in onSessionStart --->
	<cfif NOT StructIsEmpty(sessionScope)>
		<cfset local.newSession.setAttribute("jeeSessionRotateOldSession", sessionScope)>	
	</cfif>
	<cfreturn local.newSession.getId()>
</cffunction>