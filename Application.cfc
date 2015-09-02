component {
	this.name = "cfmltests";

	//mappings
	this.projectRoot = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings["/testbox"] = this.projectRoot & "testbox"; 
	this.mappings["/tests"] = this.projectRoot & "tests"; 
	this.mappings["/util"] = this.projectRoot & "tests"; 

	/*
		The following application settings that may change test results
		if you want to test these settings create a sub folder in apps dir
		with your own Application.cfc and test by hitting the url.
	*/
	this.secureJSONPrefix = "";
	this.secureJSON = false;
	this.serialization.preserveCaseForStructKey = false;

}