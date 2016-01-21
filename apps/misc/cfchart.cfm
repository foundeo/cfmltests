<cfchart format="html" title="Sales Report">
	<cfchartseries type="pie">
		<cfchartdata item="2012" value="#RandRange(300000,900000)#">
		<cfchartdata item="2013" value="#RandRange(300000,900000)#">
		<cfchartdata item="2014" value="#RandRange(300000,900000)#">
		<cfchartdata item="2015" value="#RandRange(300000,900000)#">
	</cfchartseries>
</cfchart>
