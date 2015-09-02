component extends="testbox.system.BaseSpec" {
	//just a base class incase we want to add anything global

	function isACF() {
		return server.coldfusion.productname contains "ColdFusion";
	}

	function isCF10() {
		return isACF() && ListFirst(server.coldfusion.productversion) == 10;
	}

	function isCF11() {
		return isACF() && ListFirst(server.coldfusion.productversion) == 11;
	}

	function isCF11OrGreater() {
		return isACF() && ListFirst(server.coldfusion.productversion) >= 11;
	}

	function appRequest(uri) {
		var cfHttp = new util.cfhttp();
		var baseURL = "http://" & cgi.server_name;
		if (cgi.server_port IS NOT 80) {
			baseURL = baseURL & ":" & cgi.server_port;
		}
		baseURL = baseURL & getDirectoryFromPath(cgi.script_name) & "apps/";
		local.result = cfHttp.run({url=baseURL & arguments.uri});
		return local.result.fileContent;
	}
}