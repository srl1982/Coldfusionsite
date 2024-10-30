<!---Get page content--->
<!--- <cfset pageService = createObject("component",'cf2016.cfTraining.components.pageService')/> --->

<cfset rsPage = application.pageService.getPageByID(1)>

<cf_front title="HD Street band - Director">

  <div id="pageBody">
  <cfoutput>
  <h1>#rspage.FLD_PAGETITLE#</h1>
  #rsPage.FLD_PAGECONTENT#
  </cfoutput>
  </div>
</cf_front>
