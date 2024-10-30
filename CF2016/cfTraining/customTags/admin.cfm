<cfparam name="attributes.title" default="HD street band - Site Administration">
<cfif thistag.executionMode EQ 'start'>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title><cfoutput>#attributes.title#</cfoutput></title>
<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="/cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfTraining/images/mainTitle.png" width="398" height="158" alt="HD Street Concert Band" /><span>HD Street Concert Band</span></p>
<ul>
       	<li><a href="siteMap.cfm">Site Map</a></li>
        <li><a href="contactUs.cfm">Contact us</a></li>
    </ul>
    <!---Include login form here--->
    <cfinclude template="../includes/loginForm.cfm">
  </div>
  <div id="menu">
    <ul>
      <li><a href="/cf2016/cfTraining/admin/main.cfm">Main</a></li>
      <li><a href="/cf2016/cfTraining/admin/users.cfm">Users</a></li>
      <li><a href="/cf2016/cfTraining/admin/news.cfm">News</a></li>
      <li><a href="/cf2016/cfTraining/admin/comments.cfm">Comments</a></li>
      <li><a href="/cf2016/cfTraining/admin/events.cfm">Events</a></li>
      <li><a href="/cf2016/cfTraining/admin/pages.cfm">Pages</a></li>
      <li><a href="/cf2016/cfTraining/index.cfm">Public Site</a></li>
    </ul>
  </div>
  <!---end of header--->
<cfelse>
    <!---begin of footer--->
    <div id="footer">
        <p>&copy; Copyright 2011 - HD Street Concert Band</p>
        </div>
    </div>
    </body>
    </html>
</cfif>