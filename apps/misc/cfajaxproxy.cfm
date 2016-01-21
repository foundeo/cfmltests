<!doctype html>
<html>
<head></head>
<body onload="bodyLoad()">

<h1>Should output <em>bodyLoad(); Hello There</em></h1> 
<cfajaxproxy cfc="remote" jsclassname="remoteCFC">
<script>
function bodyLoad() {
	document.writeln("bodyLoad();");
	var cfc = new remoteCFC();
	document.writeln(cfc.greet());
}
</script>

</body></html>