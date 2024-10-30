<cfquery  name="rsPage">
  select FLD_PAGETITLE, FLD_PAGECONTENT
  from TBL_PAGES
  Where FLD_PAGEID = 6
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <cfoutput>
        #rsPage.FLD_PAGETITLE#
        #rsPage.FLD_PAGECONTENT#
    </cfoutput>
</body>
</html>