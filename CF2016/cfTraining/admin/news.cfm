<!--- Delete the news if url.delete is present --->
<cfif structKeyExists(url,'delete')>
    <cfset application.newsService.deleteNews(url.delete)>
</cfif>
<!--- Retreive allnews from the database --->
<cfset allNews = application.newsService.getLatestNews() />

<cf_admin title="HD Street band - News administration">
<script>
    function confirmDelete(newsId){
        if(window.confirm("Are you sure you want to delete this news?")){
            window.location.href = "/cf2016/cftraining/admin/news.cfm?delete=" + newsId;
        }
        else{
             null;
        }
    }
</script>
    <div id="pageBody">
        <h1>News Administration</h1>
        <cfif structKeyExists(url,'add')>
            <p class="feedback">The news has been successfully created!</p>
        <cfelseif structKeyExists(url,'update')>
            <p class="feedback">The news has been successfully updated!</p>
        </cfif>
        <p><a href="newsAdd.cfm">[Add a news]</a></p>
      <!--- Output all news --->
        <table>
            <tr>
                <th>Title</th>
                <th>Published date</th>
                <th>Author</th>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
            </tr>
            <cfoutput query="allNews" >
                    <tr>
                        <td>#fld_newstitle#</td>
                        <td>#dateFormat(fld_NewsCreationDate,"mmm/dd/yyyy")#</td>
                        <td>#fld_userFirstName# #fld_userLastName#</td>
                        <td><a href="newsEdit.cfm?newsID=#fld_newsID#">Edit this news</a></td>
                        <td><a href="javascript:confirmDelete(#fld_newsID#);">Delete this news</a></td>
                    </tr>
            </cfoutput>
        </table>
    </div>
</cf_admin>