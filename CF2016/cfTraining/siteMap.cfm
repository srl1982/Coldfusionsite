<!---Get page content for fld_pageID = 5--->
<!--- <cfset pageService = createObject("component",'cf2016.cfTraining.components.pageService')/> --->

<cfset rsPage = application.pageService.getPageByID(5)>
<cf_front title="HD Street band - Site Map">
  <div id="pageBody">
  <!---Erase from here--->
<h1>Site Map</h1>
    <ul>
      <li><a href="index.cfm">Home page</a></li>
      <li><a href="agenda.cfm">Agenda</a></li>
      <li>The Band
        <ul>
          <li><a href="director.cfm">The Director</a></li>
          <li><a href="musicians.cfm">Pictures</a></li>
          <li><a href="history.cfm">The band history</a></li>
        </ul>
      </li>
      <li><a href="wePlayForYou.cfm">We play for you</a></li>
      <li><a href="comePlayWithUs.cfm">Come play with us</a></li>
      <li><a href="news.cfm">News</a></li>
      <li><a href="contactUs.cfm">Contact us</a></li>
    </ul>
    <!---To here--->
</div>
</cf_front>