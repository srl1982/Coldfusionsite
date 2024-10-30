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
    <cfparam name="form.fileUpload" default="">

    <cfif len(trim(form.fileUpload))>
    <cffile action="upload"
        fileField="fileUpload"
        destination="C:\FileUploads">
    <p>Thankyou, your file has been uploaded.</p>
    </cfif>

</body>
</html>
</cfoutput>