<cfset urgentTasks = false>

<cfset usersToApprove = application.userService.getUsersToApprove()>

<cfset commentsToApprove = application.commentsService.getUnapprovedComments()>


<cf_admin>
    <div id="pageBody">
        <h1>Welcome to the site Administration</h1>
        <cfif commentsToApprove.recordCount NEQ 0>
            <cfset urgentTasks = true>
            <cfoutput><h2>There are #commentsToApprove.recordCount# comments to approve!</h2></cfoutput>
        </cfif>
        <cfif usersToApprove.recordCount NEQ 0>
            <cfset urgentTasks = true>
            <cfoutput><h2>There are #usersToApprove.recordCount# users to approve!</h2></cfoutput>
        </cfif>
        <cfif NOT urgentTasks>
            <cfoutput><p>There are no urgent tasks</p></cfoutput>
        </cfif>
    </div>
</cf_admin>