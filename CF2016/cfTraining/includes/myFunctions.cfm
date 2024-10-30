<cffunction name="getPageContent" returntype="query">
    <cfargument name="pageID" type="numeric" required="true">
    <cfset var rsPage = "">
    <cfquery  name="rsPage">
        select FLD_PAGETITLE, FLD_PAGECONTENT
        from TBL_PAGES
        Where FLD_PAGEID = #arguments.pageID# and FLD_PageIsActive = 1
      </cfquery>
      <cfreturn rsPage/>
</cffunction>