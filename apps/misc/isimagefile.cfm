BEGIN
<cfset img = ImageRead("http://www.petefreitag.com/images/default-user.png")>
IMAGE READ
<cfif IsImagefile(img)>
	Is Image
<cfelse>
	Is Not image
</cfif>
END