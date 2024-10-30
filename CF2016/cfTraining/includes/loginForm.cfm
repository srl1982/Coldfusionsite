<!--- Handle the outout --->
<cfif structKeyExists(url,"logout")>
    <cfset createObject("component", "cf2016.cftraining.components.authenticationService").doLogOut()>
</cfif>
<!--- Form processing begins here --->
<cfif structKeyExists(form, 'fld_submitLogin')>
    <!--- create an instance of the authentication service --->
    <cfset authenticationService = application.authenticationService>
    <!--- server side data validation --->
    <cfset aErrorMessages = authenticationService.validateUser(form.fld_userEmail,form.fld_userPassword)>
    <cfif arrayIsEmpty(aErrorMessages)>
        <!--- Proceed to the login procedure --->
        <cfset isUserLoggedIn = authenticationService.doLogin(form.fld_userEmail,form.fld_userPassword)>
    </cfif>
</cfif>
<!--- Form processing ends here --->
<cfform id="frmConnexion" preservedata="true">
	<fieldset>
    <legend>Login</legend>
    <cfif structKeyExists(url,'noaccess')>
        <p class="errorMessage">Please log-in to have access to this page.</p>
    </cfif>
    <!--- Display errors --->
    <cfif structKeyExists(variables, "aErrorMessages") AND NOT arrayIsEmpty(aErrorMessages)>
        <cfoutput>
            <cfloop array="#aErrorMessages#" item="message">
                <p class="errorMessage">#messag#</p>
            </cfloop>
        </cfoutput>
    </cfif>
    <!--- User not found --->
    <cfif structKeyExists(variables,"isUserLoggedIn") AND isUserLoggedIn EQ false>
        <p class="errorMessage">User not found.  Please try again!</p>
    </cfif>
    <cfif structKeyExists(session,'stLoggedInUser')>
            <!--- Display a welcome message --->
            <p><cfoutput>Welcome #session.stloggedinuser.userFirstName# #session.stloggedinuser.userLastName#!</cfoutput></p>
            <p><a href="/cfTraining/profile.cfm">My Profile</a>&nbsp;&nbsp;<a href="/cf2016/cfTraining/index.cfm?logout">Logout</a></p>
            <cfif isUserInRole('Administrator')>
                <p><a href="/cf2016/cfTraining/admin/main.cfm">Site Administration</a></p>
            </cfif>
    <cfelse>
		<dl>
        	<dt><label for="fld_userEmail">E-mail address</label></dt>
            <dd><cfinput type="text" name="fld_userEmail" id="fld_userEmail" required="true" validate="email" validateAt="onSubmit" message="Please enter a valid e-mail Address" /></dd>
    		<dt><label for="fld_userPassword">Password</label></dt>
            <dd><cfinput type="password" name="fld_userPassword" id="fld_userPassword" required="true"  validateAt="onSubmit" message="Please provide a password" /></dd>
        </dl>
        <cfinput type="submit" name="fld_submitLogin" id="fld_submitLogin" value="Login" />
    </cfif>

    </fieldset>
</cfform>
