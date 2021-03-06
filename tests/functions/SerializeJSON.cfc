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

				it("Should not convert No to false when serializing a CFC Bug ##3845642 and ##3952968", function() {
					var bean = new apps.serializejson.bean();
					bean.title = "Doctor";
					bean.surname = "No";
					expect(SerializeJSON(bean)).toBe("{""SURNAME"":""No"",""TITLE"":""Doctor""}");
				});

				it("Should not convert Yes to true when serializing a CFC Bug ##3845642 and ##3952968", function() {
					var bean = new apps.serializejson.bean();
					bean.title = "Doctor";
					bean.surname = "Yes";
					expect(SerializeJSON(bean)).toBe("{""SURNAME"":""Yes"",""TITLE"":""Doctor""}");
				});

				it("Should not convert Yes to true", function() {
					var x = {"f"="Yes"};
					expect(SerializeJSON(x)).toBe("{""f"":""Yes""}");
				});

				it("Should not convert No to false", function() {
					var x = {"f"="No"};
					expect(SerializeJSON(x)).toBe("{""f"":""No""}");
				});

				//this is a trick that some people are using to get around auto boolean conversion bugs
				it("Should keep No if we prefix with Chr(2)", function() {
					var x = {"f"=Chr(2)&"No"};
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

			describe("Bug Expectations", function() {
				it("Should allow U+ in a string, bug ## 3941059", function() {
					var input= "xU+a600x";
					expect(SerializeJSON(input)).toBe("xU+a600x");
				});


			});

			if (isCF11OrGreater()) {
				describe("CF11+ Expectations", function() {
					it("Should preserver key case when this.serialization.preserveCaseForStructKey=true on CF11+", function() {
						var result = appRequest("serializejson/test.cfm");
						expect(result).toBe("{""mixedCase"":""c"",""lower"":""a"",""UPPER"":""b""}");
					});
				});
			}


	}


}