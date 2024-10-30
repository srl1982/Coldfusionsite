<cf_admin title="HD-Street Band - Pages Administration">
    <!--- Get all pages from the database --->
    <cfset local.allPages = application.pageService.getAllPages()>

    <div  id="pageBody">
        <h1>Pages administration</h1>
        <cfif structKeyExists(url, 'update')>
            <p class="feedback">Page has been updated!</p>
        </cfif>
        <!--- Output all the news in a table --->
        <table>
            <tr>
                <th>Title</th>
                <th>Modified Date</th>
                <th>Last Modified by</th>
                <th>&nbsp;</th>
            </tr>
            <cfoutput>
                <cfloop query="local.allPages">
                    <tr>
                        <td>#fld_pagetitle#</td>
                        <td>#dateFormat(FLD_PAGEMODIFICATIONDATE,"mm/dd/yyyy")#</td>
                        <td>#fld_modifierfirstname# #fld_modifierlastname#</td>
                        <td><a href="pageEdit.cfm?pageId=#FLD_PAGEID#">Update this page</a></td>
                    </tr>
                </cfloop>
            </cfoutput>
        </table>
    </div>
</cf_admin>