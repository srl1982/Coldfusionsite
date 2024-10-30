<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!---Step 1 - Create a structure using the structNew() function--->
	<cfset stUser = structNew()>
	<cfset stUser.firstName = "Saul">
	<cfset stUser.lastName = "Ledezma">
	<cfset stUser.Age = 42>
	<p>Dumping the explicit Structure</p>
	<cfdump var="#stUser#" label="explict struture">
	<!---Step 2 - Create the same structure using implicit notation--->
	<cfset stUserImplicit  = {firstName="Saul",lastName="Ledezma",age=42}>
	<p>Dumping the implicit structure</p>
	<cfdump var="#stUserImplicit#" label="implicit structure">
	<!---Step 3 - use structDelete() --->
	<cfset structDelete(stUser,"age")>
	<p>Dumping stUser after the deletion of the 'age' key'</p>
	<cfdump var=#stUser# label="after deletion">
	<!---Step 4 - use structClear() --->
	<cfset structClear(stUser)>
	<p>Dumping stUser after using structClear()</p>
	<cfdump var="#stUser#" label="after structclear()">
	<!---Step 5 - use structCount()--->
	<p>stUserImplicit holds <cfoutput>#structCount(stUserImplicit)#</cfoutput> elements</p>
</body>
</html>