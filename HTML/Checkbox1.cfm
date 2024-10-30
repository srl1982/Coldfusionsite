<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .inputText{
            display: inline;
        }
        input {
            text-align: center;
            margin:0;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <h1>Client Request Information</h1>
    <form method="post"  action="Checkbox.cfm" enctype="multipart/form-data">
        <input type="checkbox" id="allowContact" name="allowContact"><p class="inputText">I agree to allow contact by the office
            and anyone who wishes to receive any information.
        </p>
        <br>
        <input type="submit">
    </form>

</body>
</html>