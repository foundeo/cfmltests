<cfsetting requesttimeout="150">
<h1>CFML Tests <small><a href="https://github.com/foundeo/cfmltests">Github</a></small></h1>
<p>
	<strong>Test Environment</strong>: 
	<cfif server.coldfusion.productname contains "ColdFusion">
		<cfoutput>Adobe ColdFusion #server.coldfusion.productversion#</cfoutput>
	<cfelseif structKeyExists(server, "lucee")>
		<cfoutput>Lucee #server.lucee.version#</cfoutput>
	<cfelseif structKeyExists(server, "railo")>
		<cfoutput>Railo #server.railo.version#</cfoutput>
	<cfelse>
		<cfoutput>#server.coldfusion.productname#</cfoutput>
	</cfif>
	on
	<cfoutput>#server.os.name# #server.os.version#</cfoutput>
	<cfset system = createObject("java", "java.lang.System")>
	running
	<cfoutput>Java #system.getProperty("java.version")#</cfoutput>
</p>

<cfset r = new testbox.system.TestBox( directory="tests" ) >
<cfoutput>#r.run()#</cfoutput>

<cfoutput>
<a href="run.cfm?ts=#GetTickCount()#">ReRun</a>
</cfoutput>