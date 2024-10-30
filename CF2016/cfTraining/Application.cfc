<cfcomponent output="false">
    <cfset this.name = "hdStreetWebsite"/>
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.datasource = 'hdStreet'>
    <cfset this.customTagPaths = expandPath('/CF2016/cfTraining/customTags')>
    <cfset this.sessionManagement = true/>
    <cfset this.sessionTimeTimeout = createTimespan(0,0,30,0)>
       
    <!--- OnApplicationStart() method --->
    <cffunction name="onApplicationStart" returntype="boolean">
        <cfset application.pageService = createObject("component", "cf2016.cftraining.components.pageService")>
        <cfset application.eventsService = createObject("component", "cf2016.cftraining.components.eventService")>
        <cfset application.newsService = createObject("component", "cf2016.cftraining.components.newsService")>
        <cfset application.userService = createObject("component", "cf2016.cftraining.components.userService")>
        <cfset application.commentsService = createObject("component", "cf2016.cftraining.components.commentsService")>
        <cfset application.authenticationService = createObject("component", "cf2016.cftraining.components.authenticationService")>
        <cfset application.utils= createObject("component", "cf2016.cftraining.components.utils")>
        <cfreturn true>
    </cffunction>

    <!--- OnRequestStart() method --->
    <cffunction name="onRequestStart" returntype="boolean">
        <cfargument name="targetPage" type="string" required="true">
        <!--- handle some special URL parameters --->
        <cfif isDefined('url.restartApp')>
            <cfset this.onApplicationStart()/>
        </cfif>
        <cfif listfind(arguments.targetPage,"admin","/") AND (NOT isUserLoggedIn() OR NOT isUserInRole("Administrator"))>
            <!--- Set to root level --->
            <cflocation url="/CF2016/cfTraining/index.cfm?noaccess">
        </cfif>
        <cfreturn true/>
    </cffunction>
</cfcomponent>