<form action="cffile-upload.cfm" method="post" enctype="multipart/form-data">
	<label>Photo: </label>
	<input type="file" name="photo" />
	
	<input type="hidden" name="hidden_field" value="hidden_value" />

	<input type="submit" value="Upload">
</form>
<cfif IsDefined("form.photo")>
	<cfdump var="#form#">
</cfif>
