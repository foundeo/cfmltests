component extends="tests.Base" {
		
		function run(testResults, testBox) {
		
			describe("Case Expectations", function() {
				
				it("Should have lower case f key when created using implicit struct notation.", function() {
					var x = {"f"="test"};
					expect(SerializeJSON(x)).toBe("{""f"":""test""}");
				});

				
				it("Should have lower case f key when created using bracket notation.", function() {
					var x = StructNew();
					x["f"] = "test";
					expect(SerializeJSON(x)).toBe("{""f"":""test""}");
				});

				
				it("Should have upper case f key when created using dot notation. Note: this.serialization.preserveCaseForStructKey=false", function() {
					var x = StructNew();
					x.f = "test";
					expect(SerializeJSON(x)).toBe("{""F"":""test""}");
				});
				
			});

			describe("Boolean Expectations", function() {
				
				it("When set to false should be false literal in json", function() {
					var x = {"f"=false};
					expect(SerializeJSON(x)).toBe("{""f"":false}");
				});

				
				it("When set to true should be true literal in json", function() {
					var x = {"f"=true};
					expect(SerializeJSON(x)).toBe("{""f"":true}");
				});

				it("Should not convert Yes to true", function() {
					var x = {"f"="Yes"};
					expect(SerializeJSON(x)).toBe("{""f"":""Yes""}");
				});

				it("Should not convert No to false", function() {
					var x = {"f"="No"};
					expect(SerializeJSON(x)).toBe("{""f"":""No""}");
				});
				
			});

			describe("Integer Expectations", function() {
				
				it("When set to 1 literal it should be 1 literal in json", function() {
					var x = {"f"=1};
					expect(SerializeJSON(x)).toBe("{""f"":1}");
				});

				
				it("When set casting a number using JavaCast it should be treated as an int not a float.", function() {
					var x = {"f"=JavaCast("int", 4.1)};
					expect(SerializeJSON(x)).toBe("{""f"":4}");
				});
				
			});



	}


}