<cfset baseURL = "http://" & cgi.server_name>
<cfif (cgi.server_port IS NOT 80)>
	<cfset baseURL = baseURL & ":" & cgi.server_port>
</cfif>
<cfset baseURL = baseURL & getDirectoryFromPath(cgi.script_name)>
<cfinvoke webservice="#baseURL#remote.cfc?wsdl" method="greet" returnvariable="msg">
<cfoutput>#msg#</cfoutput>