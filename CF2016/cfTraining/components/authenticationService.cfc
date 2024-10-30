<cfcomponent output="false">
    <!--- Validate User to return any errors --->
    <cffunction name="validateUser" access="public" returntype="array" output="false">
        <cfargument name="userEmail" type="string" required="true">
        <cfargument name="userPassword" type="string" required="true">

        <cfset var aErrorMessages = arrayNew(1)>

        <!--- validate email --->
        <cfif NOT isValid("email",arguments.userEmail)>
            <cfset arrayAppend(aErrorMessages,"Please provide a valid email address")>
        </cfif>
        <!--- Validate password --->
        <cfif arguments.userPassword EQ ''>
            <cfset arrayAppend(aErrorMessages,"Please provide a valid password")>
        </cfif>
        <cfreturn aErrorMessages>
    </cffunction>

    <!--- Login user method --->
    <cffunction name="doLogin" access="public" returntype="boolean" output="false">
        <cfargument name="userEmail" type="string" required="true">
        <cfargument name="userPassword" type="string" required="true">

        <!--- Create the isUserLogged in variable --->
        <cfset var isUserLoggedIn = false>
        <!--- Get the user data from the database --->
        <cfquery name="rsLoginUser">
            SELECT t.FLD_USERFIRSTNAME, t.FLD_USERLASTNAME,t.FLD_USERID, t.FLD_USEREMAIL,t.FLD_USERPASSWORD, r.FLD_ROLENAME
            FROM tbl_users t
            INNER JOIN TBL_ROLES r on t.FLD_USERROLE = r.FLD_ROLEID
            WHERE t.FLD_USEREMAIL = <cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar"> and t.fld_userpassword = <cfqueryparam value="#arguments.userPassword#" cfsqltype="cf_sql_varchar"> and FLD_USERISACTIVE = 1
        </cfquery>
        <!--- Check if the query returns one and only one user --->
        <cfif rsLoginUser.recordCount EQ 1>
            <!--- Log the user in --->
            <cflogin>
                <cfloginuser name="#rsLoginUser.FLD_USERFIRSTNAME# #rsLoginUser.FLD_USERLASTNAME#" password="#rsLoginUser.fld_userpassword#" roles="#rsLoginUser.FLD_ROLENAME#">
            </cflogin>
            <!--- Save user data in the session scope --->
            <cfset session.stLoggedInUser = {'userFirstName' = rsLoginUser.FLD_USERFIRSTNAME, 'userLastName' = rsLoginUser.FLD_USERLASTNAME, 'userID' = rsLoginUser.FLD_USERID}>
            <!--- Change the isUserloggedIn Variable to true --->
            <cfset var isUserLoggedIn = true>
        </cfif>
        <!--- Return the isUserLoggedIn variable --->
        <cfreturn isUserLoggedIn>
    </cffunction>

    <!--- log out user --->
    <cffunction name="doLogOut" access="public" returntype="void" output="false">
        <!--- delete the user data from the session scope --->
            <cfset structDelete(session, 'stLoggedInUser')>
        <!--- log the user out --->
            <cflogout/>
    </cffunction>
</cfcomponent>