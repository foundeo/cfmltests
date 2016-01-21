<cfcomponent>
	<cfset this.name = "cfml_test1">
	<cfset this.sessionManagement = true>
	<cfset this.loginStorage = "cookie">
	<cffunction name="onSessionStart">
		<cfset session.isAdmin = false>
	</cffunction>
	<cffunction name="onApplicationStart">
		<cfset getPageContext().getRequest().getServletContext().log("onApplicationStart")>
	</cffunction>

	<cffunction name="onError" output="true">
		<cfargument name="exception">
		<cfargument name="eventName">
		<cfoutput><h1>Application.cfc::onError</h1></cfoutput>
		<cfdump var="#arguments#">
	</cffunction>
</cfcomponent>