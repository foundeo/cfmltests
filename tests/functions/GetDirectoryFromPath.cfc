component extends="tests.Base" {
		
		function run(testResults, testBox) {
		
			describe("GetDirectoryFromPath Tests", function() {
				
				it("Should end with a trailing slash", function() {
					expect(GetDirectoryFromPath(getCurrentTemplatePath())).toMatch(".+[/\\]$");
					expect(GetDirectoryFromPath(getTempDirectory())).toMatch(".+[/\\]$");
				});

				
			});

	}


}