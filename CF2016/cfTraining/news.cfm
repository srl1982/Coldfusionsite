<!---Get news years--->
<cf_front title="HD Street band - news">

  <!--- <cfset newsService = createObject("component", "cf2016.cfTraining.components.newsService")/> --->
  <div id="pageBody">
    <div id="calendarContent">
      <!---Output all news if no url scope newsID not present in URL--->
      <cfif isDefined('url.newsID')>
          <!--- Output a single news --->
          <cfset rsSingleNews = application.newsService.getNewsByID(url.newsID)/>
<!---             <cfdump var="#rsSingleNews#"> --->
            <cfoutput>
                <h1>#rsSingleNews.FLD_NEWSTITLE#</h1>
                <p class="metadata">Published on #dateFormat(rsSingleNews.FLD_NEWSCREATIONDATE,"mmmm dd yyyy")#
                  by #rsSingleNews.FLD_USERFIRSTNAME# #rsSingleNews.FLD_USERLASTNAME#
                </p>
                #rsSingleNews.FLD_NEWSCONTENT#
            </cfoutput>
            <!--- include Commenting system --->
            <cfinclude template="includes/commentForm.cfm">
      <cfelseif isDefined('url.year')>
        <cfset rsNewsOfYear = application.newsService.getNewsForYear(url.year)/>
        <!--- <cfdump var="#rsNewsOfYear#"> --->
        <h1> News</h1>
        <table>
      <!---Output  news in a table--->
            <cfoutput query="rsNewsOfYear">
              <tr>
                <td>#dateFormat( FLD_NEWSCREATIONDATE,"mmmm dd yyyy")#</td>
                <td>#FLD_NEWSTITLE#</td>
                <td><a href="news.cfm?newsID=#FLD_NEWSID#">Read More</a></td>
              </tr>
            </cfoutput>

        </table>
      <cfelse>
        <cfset rsAllNews = application.newsService.getLatestNews()/>
<!---Get all news--->
      <h1> News</h1>
      <table>
    <!---Output  news in a table--->
          <cfoutput query="rsAllNews">
            <tr>
              <td>#dateFormat( FLD_NEWSCREATIONDATE,"mmmm dd yyyy")#</td>
              <td>#FLD_NEWSTITLE#</td>
              <td><a href="news.cfm?newsID=#FLD_NEWSID#">Read More</a></td>
            </tr>
          </cfoutput>
      </table>
   </cfif>
    </div>
    <div id="calendarSideBar">

<h1>News archive</h1>
      <cfset rsNewsYears = application.newsService.getNewsYears()>
      <ul>
        <cfoutput query="rsNewsYears" group="fld_newsYear">
            <li><a href="news.cfm?year=#fld_newsYear#">#fld_newsYear#</a></li>
        </cfoutput>
      </ul>
      <p class="alignRight">&nbsp;</p>
</div>
  </div>
</cf_front>
