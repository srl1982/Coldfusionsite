<cf_front>
  <div id="pageBody">
    <div id="homeContent">
      <!--- Display the latest news in the main area--->
      <cfset latestNews = application.newsService.getLatestNews(1)>
  		<cfoutput>
        <h1>#latestNews.FLD_NEWSTITLE#</h1>
        <p class="metadata">Published on #dateFormat(latestNews.FLD_NEWSCREATIONDATE, 'mmm dd yyyy')# by #latestNews.FLD_USERFIRSTNAME# #latestNews.FLD_USERLASTNAME#</p>
        <p>#latestNews.FLD_NEWSCONTENT#</p>
      </cfoutput>
  </div>
    <div id="homeSideBar">
      <div class="pod">
        <h1 id="nextEventsTitle">Next Events</h1>
        <cfset next3Events = application.eventsService.getCurrentEvents(3)>
        <ul>
          <cfoutput query="next3Events">
            <li><a href="agenda.cfm?eventID=#fld_eventID#"><strong>#dateFormat(fld_eventDateTime,"mmm-dd")#</strong> - #fld_eventLocation#</a></li>
          </cfoutput>
        </ul>
      </div>
      <div class="pod">
        <h1 id="latestNewsTitle">latest News</h1>
        <cfset sideNews = application.newsService.getLatestNews(4)>
        <ul>
          <cfoutput query="sideNews" startrow="2">
            <li><a href="news.cfm?newsID=#fld_newsID#"><strong>#dateFormat(fld_NewsCreationDate,"mmm-dd")#</strong> - #left(fld_newsTitle,20)#...</a></li>
          </cfoutput>
        </ul>
      </div>
    </div>
  </div>
</cf_front>
