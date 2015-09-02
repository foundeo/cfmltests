component extends="tests.Base" {

	function run(testResults, testBox) {
		cfHttp = new util.cfhttp();
		describe("CFHTTP SNI Tests Bug ##3598342", function() {
			var sniHosts = ["mallory.sni.velox.ch", "dave.sni.velox.ch", "alice.sni.velox.ch"];
			for (var s in sniHosts) {
				result = cfHttp.run({url="https://#s#/",method="GET"});
				
				it("#s# response should say: sent the following TLS server name indication extension", function() {
					expect(result.fileContent).toInclude("sent the following TLS server name indication extension");
				});

			}
			
			result = cfHttp.run({url="https://app.icontact.com/", method="GET", throwonerror=false});
			it("Should connect to app.icontact.com", function() {
				expect(result.statuscode).toInclude("403");
			});

			
		});

	}
}
