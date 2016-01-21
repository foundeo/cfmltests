
<cfset base = ExpandPath("./")>
<cfdirectory action="create" directory="#base#test-create-dir">
<cfdirectory action="list" directory="#base#" name="dir">
<cfdump var="#dir#">
<cfdirectory action="delete" directory="#base#test-create-dir">

