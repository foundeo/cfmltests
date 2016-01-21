<cfcontent type="application/pdf">
<cfheader name="Content-Disposition" value="attachment;filename=example.pdf">
<cfdocument format="pdf">
	<h1>Hello ColdFusion</h1>
	<p>This is <strong>PDF</strong> example document.</p>
	<p>Genereated at: <cfoutput>#TimeFormat(Now())# on #DateFormat(Now())#</cfoutput></p>
</cfdocument>