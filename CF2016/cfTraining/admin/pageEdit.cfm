<!--- confirm pageID is passed--->
<cfif NOT structKeyExists(url, 'pageID')>
    <cflocation url="pages.cfm">
</cfif>

<!--- Begin form processing --->
<cfif structKeyExists(form,'fld_editPageSubmit')>
    <cfset local.aErrorMessage = application.pageService.validatePageForm(form.fld_pageTitle,form.fld_pageContent)>
    <cfif arrayIsEmpty(local.aErrorMessage)>
        <cfset application.pageService.updatePage(form.FLD_PAGETITLE,form.FLD_PAGECONTENT,form.fld_pageID)/>
        <cflocation url="pages.cfm?update=true" >
    </cfif>
</cfif>
<!--- End form processing --->

<!--- Get current Page data--->
<cfset pageToUpdate = application.pageService.getPageByID(#url.pageId#)>
<cf_admin title="HD-Street Band - Pages Administration">
    <div  id="pageBody">
        <h1>Edit a page administration</h1>
        <cfform id="frm_editPage" preservedata="true" >
            <!--- Display pages form --->
                <fieldset>
                    <legend>Edit a page</legend>
                    <!--- output error messages if messages array not empty --->
                    <cfif isDefined('variables.aErrorMessage') AND NOT arrayIsEmpty(variables.aErrorMessages)>
                        <cfoutput>
                        <cfloop array="#variables.aErrorMessages#" index="message">
                            <p class="errorMessage">#message#</p>
                        </cfloop> 
                        </cfoutput>
                    </cfif>
                    <dl>
                        <dt><label for="fld_pageTitle">Page Title</label></dt>
                        <dd><cfinput name="fld_pageTitle" id="fld_pageTitle" required="true" value="#pageToUpdate.fld_pageTitle#" message="Please enter a valid page title" validateAt="onSubmit" /></dd>
                        <dt><label for="fld_pageContent">Page Content</label></dt>
                        <dd><cftextarea name="fld_pageContent" id="fld_pageContent" required="true" value="#pageToUpdate.fld_pageContent#" message="Please enter a valid page content" validateAt="onSubmit" richtext="true" height="500" ></cftextarea></dd>
                    </dl>
                    <!---Create hidden form field to store page ID--->
                    <cfinput name="fld_pageID"  type="hidden" value="#url.pageID#">
                    <input type="submit" name="fld_editPageSubmit" id="fld_editPageSubmit" value="Update Page" />
                </fieldset>
            </cfform>
    </div>
</cf_admin>