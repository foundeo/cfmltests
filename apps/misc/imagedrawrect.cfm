<!--- This example shows how to draw a rectangle. ---> 
<!--- Use the ImageNew function to create a ColdFusion image that is 150 pixels wide and 200 pixels high. ---> 
Start
<cfset myImage=ImageNew("",150,200)> 
Hello?
<!--- Set the drawing color for the image to yellow. ---> 
<cfset ImageSetDrawingColor(myImage,"yellow")> 
<!--- Turn on antialiasing to improve image quality. ---> 
<cfset ImageSetAntialiasing(myImage,"on")> 
<!--- Draw a filled yellow rectangle on the image. ---> 
<cfset ImageDrawRect(myImage,25,45,100,20,"yes")> 
<!--- Display the image in a browser. ---> 
<cfset imageWrite(myImage, ExpandPath("./test.png"))>
<img src="test.png">