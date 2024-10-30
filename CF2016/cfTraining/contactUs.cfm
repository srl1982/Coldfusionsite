<!---Get page content for fld_pageID = 6--->
<cfset pageService = createObject("component", "cf2016.cfTraining.components.pageService")/>

<cfset rsPage = pageService.getPageByID(6)>
<cf_front title="Contact Us">
  <div id="pageBody">
  <!---Erase from here--->
<cfoutput>
  <h1>#rsPage.FLD_PAGETITLE#</h1>
  #rsPage.FLD_PAGECONTENT#
</cfoutput>
</div>

</cf_front>