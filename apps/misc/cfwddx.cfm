<cfset foo = {moo="goo", boo="zoo"}>
<cfwddx action="cfml2js" input="#foo#" output="js" toplevelvariable="foo"></cfwddx>
<cfoutput>#js#</cfoutput>