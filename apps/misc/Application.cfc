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
</cfcomponent>