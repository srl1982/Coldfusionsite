<cfif NOT structKeyExists(url,"commentID")>
    <cflocation url="comments.cfm" >
</cfif>
<cfset commentToEdit = application.commentsService.getCommentByID(url.commentID)/>

<cfif structKeyExists(form,"fld_commentUpdateSubmit")>
    <cfset aErrorMessages = application.commentsService.validateComment(form.fld_commentAuthor,form.fld_commentContent,"testCode","testCode")/>
    <cfif arrayIsEmpty(aErrorMessages)>
        <cfset application.commentsService.updateComment(form.fld_commentAuthor,form.fld_commentContent,0,form.fld_commentID)/>
        <cflocation url="comments.cfm?update=true"/>
    </cfif>
</cfif>

<cf_admin title="HD street band - Comments administration">
    <div id="pageBody">
        <h1>Update a comment</h1>
        <cfform id="frm_commentEdit" preservedata="true" >
			<fieldset>
				<legend>Edit your comment</legend>
				<!---disply error messages if any--->
					<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
						<cfoutput>
						<cfloop array="#variables.aErrorMessages#" index="message">
							<p class=errorMessage>#message#</p>
						</cfloop>
						</cfoutput>
					</cfif>
				<dl>
					<!---display form fields--->
					<dt><label for="fld_commentAuthor">Your Name</label></dt>
					<dd><cfinput name="fld_commentAuthor" id="fld_commentAuthor"  value="#commentToEdit.fld_commentAuthor#" required="true" message="Please enter your name or nickname in the form" validateAt="onSubmit" /></dd>
					<dt><label for="fld_commentContent">Your Comment</label></dt>
					<dd>
						<cftextarea name="fld_commentContent" id="fld_commentContent"  value="#commentToEdit.fld_commentContent#" richtext="true" toolbar="Basic" required="true" message="Please enter your comment in the appropriate field" validateAt="onSubmit" ></cftextarea>
					</dd>
				</dl>
                <cfinput name="fld_commentID" type="hidden" value="#commentToEdit.fld_commentID#">
				<input type="submit" name="fld_commentUpdateSubmit" id="fld_commentUpdateSubmit" value="Update and approve comment" />
			</fieldset>
		</cfform>
    </div>
</cf_admin>