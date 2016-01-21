<cfparam name="url.t" default="1000">
Sleeping for <cfoutput>#url.t#</cfoutput>ms.<cfflush>
<cfloop from="1" to="#url.t/100#" index="i">
	.<cfflush><cfset sleep(100)>
</cfloop>

<hr />Done.