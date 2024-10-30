<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.imageWrapper {
	padding: 10px;
	width: 200px;
	background-color: #CCC;
	border: 2px solid #000;
}
.imageWrapper p {
	font-size: .8em;
	font-style: italic;
}
</style>
</head>

<body>
<h1>Hello dear visitor, today is <cf_today></h1>
<p>Here is a first image with a legend</p>
<!---First Picture--->
<cf_pictWrapper legend="This band in concert"> 
  <img src="bandPlaying.jpg" width="200" height="133" alt="Band Playing" />
</cf_pictWrapper>
<!---End first Picture--->
<p>And here is a second image with anoter legend</p>
<!---Second Picture--->
<div class="imageWrapper">
  <img src="tonyAndMatt.jpg" width="200" height="133" alt="Tony And Matt" />
  <p>Tony congratulates Matt after Matt's stunning saxophone solo!</p>
</div>
<!---End second Picture--->
</body>
</html>
