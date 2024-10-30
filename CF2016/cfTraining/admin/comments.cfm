<!--- Approve comment --->
<cfif structKeyExists(url,"approve")>
    <cfset application.commentsService.approveComment(url.approve)/>
</cfif>
<!--- Delete comment --->
<cfif structKeyExists(url,"delete")>
    <cfset application.commentsService.deleteComment(url.delete)/>
</cfif>
<!--- Get list of comments to approve --->
<cfset commentsToApprove = application.commentsService.getUnapprovedComments()>

<!--- Get the list of approved comments --->
<cfset approvedComments = application.commentsService.getAllComments()/>

<cf_admin title="HD street band - Comments administration">
    <script>
        function confirmDelete(commmentId){
            if(window.confirm("Are you sure you want to delete this comment?")){
                window.location.href="/cf2016/cftraining/admin/comments.cfm?delete=" + commmentId;
            }
            else{
                null;
                }

        }
    </script>
    <div id="pageBody">
        <h1>Comments Administration</h1>
        <cfif structKeyExists(url,"update")>
            <p class="feedback">The comment been modified!</p>
        <cfelseif structKeyExists(url,"approve")>
            <p class="feedback">The comment has been approved!</p>
        </cfif>
        <cfif structKeyExists(url,"approve")>
            <p class="feedBack">Comment has been approved!</p>
        </cfif>
        
        <h2>Comments awaiting approval</h2>
        <cfif commentsToApprove.recordCount eq 0>
            <p>No comments to approve.</p>
        <cfelse>
            <p>Comments to approve:</p>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Author</th>
                    <th>Comment</th>
                    <th>News</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
            <cfoutput query="commentsToApprove" >
                <tr>
                    <td>#dateFormat(FLD_COMMENTDATE,"mmm-dd-yyyy")#</td>
                    <td>#fld_commentAuthor#</td>
                    <td>#fld_commentContent#</td>
                    <td><a href="../news.cfm?newsID=#fld_newsID#" target="_blank">#fld_newsTitle#</a></td>
                    <td><a href="comments.cfm?approve=#fld_commentID#">Approve(#fld_commentID#)</a></td>
                    <td><a href="commentEdit.cfm?commentID=#fld_commentID#">Modify</a></td>
                    <td><a href="javascript:confirmDelete(#fld_commentID#)">Reject</a></td>
                </tr>
            </cfoutput>
            </table>
        </cfif>
        <h2>List of approved comments</h2>
        <table>
            <cfoutput query="approvedComments" group="fld_newsTitle">
                <tr>
                    <th colspan="5">#FLD_NEWSTITLE#</th>
                </tr>
                <cfoutput >
                    <tr>
                        <td>#dateFormat(FLD_COMMENTDATE, "mmm-dd-yyyy")#</td>
                        <td>#fld_commentAuthor#</td>
                        <td>#fld_commentContent#</td>
                        <td><a href="commentEdit.cfm?commentID=#fld_commentID#">Modify</a></td>
                        <td><a href="javascript:confirmDelete(#fld_commentID#)">Reject</a></td>
                    </tr>
                </cfoutput>
            </cfoutput>
        </table>
    </div>
</cf_admin>