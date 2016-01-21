
<h2>GetHttpRequestData()</h2>
<cfdump var="#GetHttpRequestData()#" label="gethttprequestdata()">

<h2>URL Scope</h2>
<cfdump var="#url#">

<h2>Form Scope</h2>
<cfdump var="#form#">

<h2>HttpRequest</h2>
<cfset pageContext = GetPageContext()>
<cfset httpReq = pageContext.getRequest()>
<cfoutput>
<strong>isRequestedSessionIdFromURL</strong> = #httpReq.isRequestedSessionIdFromURL()#<br />
</cfoutput>
<h3>HttpRequest Parameters</h3>
<cfdump var="#httpReq.getParameterMap()#">
<h3>HttpRequest Attributes</h3>
<cfset atrib = httpReq.getAttributeNames()>
<cfloop condition="#atrib.hasMoreElements()#">
	<cfset name = atrib.nextElement()>
	<strong><cfoutput>#name#</cfoutput></strong> = <cfdump var="#httpReq.getAttribute(name)#">
	<hr />
</cfloop>

<h2>Server Scope</h2>
<cfdump var="#server#">
<h2>CGI Scope</h2>
<cfdump var="#cgi#">


<h2>Java System Properties</h2>
<cfset system = CreateObject("java", "java.lang.System")>
<!--- properties is a java.util.Properties object --->
<cfset properties = system.getProperties()>
<!--- propNames is a java.util.Enumeration --->
<cfset propNames = properties.propertyNames()>
<cfoutput>
<cfloop condition="propNames.hasMoreElements()">
<cfset propName = propNames.nextElement()>
<strong>#propName#</strong> = #system.getProperty(propName)#<br />
</cfloop>
</cfoutput>






