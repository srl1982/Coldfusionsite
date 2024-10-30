<cf_admin title="HD Street band - News administration">
	<cfset today = dateFormat(now(),"yyyy-MM-d")>
    <!--- Start processing script --->
    <cfif structKeyExists(form, 'fld_addNewsSubmit')>
        <cfif form.fld_newsCreationDate EQ ''>
            <cfset form.fld_newsCreationDate = now() />
        </cfif>
        <cfset aErrorMessages = application.newsService.validateNewsForm(form.fld_newsTitle,form.fld_newsCreationDate,form.FLD_NEWSCONTENT)>

		<cfif arrayIsEmpty(aErrorMessages)>
			<cfset application.newsService.addNews(form.fld_newsTitle,form.fld_newsCreationDate,form.FLD_NEWSCONTENT)>
			<cflocation url="news.cfm?add=true"/>
		</cfif>
    </cfif>
    <!--- End processing script --->
    <div id="pageBody" style="max-width: inherit;">
        <h1>Add a news <cfoutput>#today#</cfoutput></h1>
        <div>
        <!---Output error messages if server side validation fails--->
		<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
			<cfoutput>
				<cfloop array="#variables.aErrorMessages#" index="message">
					<p class="errorMessage">#message#</p>
				</cfloop>
			</cfoutput>
		</cfif>
		<!---Display news form--->
		<cfform id="frm_addNews" preservedata="true">
			<fieldset>
				<legend>Add a news</legend>
				<dl>
					<dt><label for="fld_newsTitle">News Title</label></dt>
					<dd><cfinput name="fld_newsTitle" id="fld_newsTitle" required="true" message="Please enter a valid news title" validateAt="onSubmit" /></dd>
					<dt><label for="fld_newsCreationDate">Publish Date (leave empty for immediate publication)</label></dt>
					<!---Create a date field--->
                    <dd>
					<cfoutput>
                     <input type="date" name="fld_newsCreationDate" id="fld_newsCreationDate"  value="#today#"/>
					 </cfoutput>
                    </dd>
					<dt><label for="fld_newsContent">Content</label></dt>
					<dd><cftextarea name="fld_newsContent" id="fld_newsContent" required="true" message="Please enter a valid news content" validateAt="onSubmit" richtext="true" height="500" ></cftextarea></dd>
				</dl>
				<input type="submit" name="fld_addNewsSubmit" id="fld_addNewsSubmit" value="Add News" />
			</fieldset>
		</cfform>
        </div>
    </div>
</cf_admin>