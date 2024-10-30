<cfif NOT structKeyExists(url,'newsID')>
    <cflocation url="news.cfm" >
</cfif>
<!--- Start of processing script --->
<cfif structKeyExists(form,'fld_updateNewsSubmit')>
    <cfset aErrorMessages = application.newsService.validateNewsForm(form.fld_newsTitle,form.fld_newsCreationDate,form.fld_newsContent)>
    <cfif arrayIsEmpty(aErrorMessages)>
        <cfset application.newsService.updateNews(form.fld_newsTitle,form.fld_newsCreationDate,form.fld_newsContent,form.fld_newsID)>
        <cflocation url="news.cfm?update=true"/>
    </cfif>
</cfif>
<!--- End of processing script --->
<!--- Get current news data --->
<cfset newsToUpdate = application.newsService.getNewsByID(url.newsID) />

<cfset today = dateFormat(now(),"yyyy-MM-d")>
<cf_admin title="HD Street band - News administration">
    <div id="pageBody">
        <h1>Update a news</h1>
        <!---Output error messages if server side validation fails--->
		<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
			<cfoutput>
				<cfloop array="#variables.aErrorMessages#" index="message">
					<p class="errorMessage">#message#</p>
				</cfloop>
			</cfoutput>
		</cfif>
		<!---Display news form--->
		<cfform id="frm_editNews" preservedata="true">
             <cfoutput >
			<fieldset>
				<legend>Update a news</legend>
				<dl>
					<dt><label for="fld_newsTitle">News Title</label></dt>
					<dd><cfinput name="fld_newsTitle" id="fld_newsTitle" required="true" message="Please enter a valid news title" validateAt="onSubmit" value="#newsToUpdate.Fld_newsTitle#"/></dd>
					<dt><label for="fld_newsCreationDate">Publish Date (leave empty for immediate publication)</label></dt>
					<!---Create a date field--->
					<dd><input type="date" name="fld_newsCreationDate" id="fld_newsCreationDate"  value="#dateFormat(newsToUpdate.FLD_NEWSCREATIONDATE,"yyyy-mm-d")#"/></dd>
					<dt><label for="fld_newsContent">Content</label></dt>
					<dd><cftextarea name="fld_newsContent" id="fld_newsContent" required="true" message="Please enter a valid news content" value="#newsToUpdate.fld_newsContent#" validateAt="onSubmit" richtext="true" height="500" ></cftextarea></dd>
				</dl>
                    <cfinput name="fld_newsID" type="hidden" value="#newsToUpdate.FLD_NEWSID#" >
				<input type="submit" name="fld_updateNewsSubmit" id="fld_updateNewsSubmit" value="Update News" />
			</fieldset>
              </cfoutput>
		</cfform>

    </div>
</cf_admin>