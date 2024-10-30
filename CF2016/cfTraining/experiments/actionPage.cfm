<!--- 
    <cfif not isDefined("fld_conditions")>
        <cfset form.fld_conditions = 'NO'>
    </cfif>
Same as below
--->
<!--- If the user selected the confirm box --->
<cfparam name="form.fld_conditions" default="NO">
<!--- If the user selected the interests check boxes --->
<cfparam name="form.fld_interests" default="none">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!--- Get puts variables in query string --->
    <cfdump var='#url#'>
    <!--- Post Puts variables in the request body--->
    <cfdump var="#form#">

</body>
</html>