<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Coldfusion site!!!!</h1>
    <cfdump var="#server#" label="server">
    <cfdump var="#cgi#" label="CGI">
    <cfdump var="#form#" label="form">
    <cfset domain = cgi.server_name>
    <h2>Domain:#domain#</h2>
    <cfset dsn = "">

    <cfset dsn = ListFirst(cgi.server_name, ".")>

    <h1>DSN:#dsn#</h1>
    <form action="/Pages/TestForm.cfm" method="post">
        <label for="fname">First name:</label><br>
        <input type="text" id="fname" name="fname" value="John"><br>
        <label for="lname">Last name:</label><br>
        <input type="text" id="lname" name="lname" value="Doe"><br><br>
        <input type="submit" value="Submit">
      </form> 
      
      <p>If you click the "Submit" button, the form-data will be sent to a page called "/action_page.php".</p>
</body>
</html>
</cfoutput>