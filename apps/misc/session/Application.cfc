<cfcomponent>
	<cfset this.name = "cfml_test_session">
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement=false>
	
	<cffunction name="onSessionStart">
		<cfset session.startTime = now()>
		<cfset local.oldSession = getPageContext().getRequest().getSession().getAttribute("jeeSessionRotateOldSession")>
		<cfif NOT IsNull(local.oldSession) AND NOT structIsEmpty(local.oldSession)>			
			<cfloop list="#StructKeyList(local.oldSession)#" index="local.key">
				<cfif NOT StructKeyExists(session, local.key)>
					<cfset session[local.key] = local.oldSession[local.key]>
				</cfif>
			</cfloop>	
			<cfset getPageContext().getRequest().getSession().removeAttribute("jeeSessionRotateOldSession")>
		</cfif>
	</cffunction>
	
</cfcomponent>