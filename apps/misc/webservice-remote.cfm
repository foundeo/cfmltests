<cftry>
<cfinvoke webservice="http://soaptest.parasoft.com/calculator.wsdl" method="add" returnvariable="answer">
    <cfinvokeargument name="x" value="2">
    <cfinvokeargument name="y" value="3">
</cfinvoke>
<cfoutput>#answer#</cfoutput>
<cfcatch><cfdump var="#cfcatch#"></cfcatch>
</cftry>