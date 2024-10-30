<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post" enctype="multipart/form-data" action="RecieveFile.cfm">
        <label for="file">File</label>
        <input id="file" name="file" type="file" />
        <input type="submit" value="upload"><button>Upload</button>
    </form>
    <form enctype="multipart/form-data" method="post" action="RecieveFile.cfm">
        <input type="file" name="fileUpload">
        <input type="submit" value="Upload File">
    </form>
</body>
</html>
</cfoutput>
