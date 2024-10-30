<!---Get page content for fld_pageID = 2--->
<!---Get page content--->
<!--- <cfset pageService = createObject("component",'cf2016.cfTraining.components.pageService')/>
 --->
<cfset rsPage = application.pageService.getPageByID(2)>

<cf_front title="HD Street band - History">
  <div id="pageBody">
  <cfoutput>
  <h1>#rsPage.FLD_PAGETITLE#</h1>
  #rspage.FLD_PAGECONTENT#
  </cfoutput>
</div>
</cf_front>
