component extends="tests.Base" {

	function run(testResults, testBox) {
		cfHttp = new util.cfhttp();
		describe("CFHTTP SNI Tests Bug ##3598342", function() {
			var sniHosts = ["mallory.sni.velox.ch", "dave.sni.velox.ch", "alice.sni.velox.ch"];
			for (var s in sniHosts) {
				
				it("#s# response should say: sent the following TLS server name indication extension", function() {
					var result = cfHttp.run({url="https://#s#/",method="GET"});
					expect(result.fileContent).toInclude("sent the following TLS server name indication extension");
				});

			}
			
			
			it("Should connect to app.icontact.com", function() {
				var result = cfHttp.run({url="https://app.icontact.com/", method="GET", throwonerror=false});
				expect(result.statuscode).toInclude("403");
			});

			it("Should connect to https://maps.googleapis.com/robots.txt", function() {
				var result = cfHttp.run({url="https://maps.googleapis.com/robots.txt"});
				expect(result.fileContent).toInclude("Disallow:");
			});

			
		});

		describe("CFHTTP Should Support Various HTTP Methods", function() {
			it("Should support PATCH method Bug ##3043855 fixed CF11u3", function() {
				var result = cfHttp.run({url="http://httpbin.org/patch", method="PATCH", throwonerror=true});
				expect(result.statuscode).toInclude("200");
			});
		});

	}
}
