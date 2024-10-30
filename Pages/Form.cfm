<cfoutput>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <cfdump var="#form#">
<!-- Form 1 -->
 <form action="Form2.cfm" method="post" enctype="multipart/form-data">
    <label for="firstName">First Name:</label><br>
    <input type="text" name="firstName"><br>
    <label for="lasttName" id="lastName" name="lName">Last Name:</label><br>
    <input type="text" name="lastName"><br><br>
    <label for="sex">Sex:</label><br>
    <input type="radio" name="sex" value="M"><label for="sex">Male</label><br>
    <input type="radio" name="sex" value="F"><label for="sex">Female</label><br>
    <input type="submit" value="submit">
 </form>

</body>
</html>
</cfoutput>