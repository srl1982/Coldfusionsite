<!--- Get user instruments to generate drop-down menu --->
<cfset userInstruments = application.userService.getInstruments() />

<!--- form processing starts --->
<cfif structKeyExists(form,"fld_createUserSubmit")>
    <cfdump var="#form#">
    <cfset aErrorMessages = application.userService.validateUser(form.fld_userFirstName,form.fld_userLastName, form.fld_userEmail, form.fld_userPassword, form.fld_userPassword)/>
    <cfif arrayIsEmpty(aErrorMessages)>
        <cfset application.userService.addUser(
            form.fld_userFirstName,
            form.fld_userLastName, 
            form.fld_userEmail, 
            form.fld_userPassword, 
            form.fld_userRole,
        form.fld_userInstrument,form.fld_userComment, 1,1)/>
        <cflocation url="users.cfm?add=true" >
    </cfif>
</cfif>
<!--- form processing ends --->

<cf_admin title="title goes here">
    <div id="pageBody">
        <h1>Create a new user</h1>
        <cfform id="frm_editUser" preservedata="true">
			<fieldset>
				<legend>Add a user</legend>
				<!---Output error messages if any--->
				<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
					<cfoutput>
					<cfloop array="#variables.aErrorMessages#" index="message">
						<p class="errorMessage">#message#</p>
					</cfloop>
					</cfoutput>
				</cfif>
				<dl>
					<!---Display form fields--->
					<dt><label>First Name</label></dt>
					<dd><cfinput name="fld_userFirstName" id="fld_userFirstName" required="true" message="Please provide a valid first name" validateAt="onSubmit" /></dd>
					<dt><label>Last Name</label></dt>
					<dd><cfinput name="fld_userLastName" id="fld_userLastName" required="true" message="Please, provide a valid last name" validateAt="onSubmit" /></dd>
					<dt><label>E-mail Address</label></dt>
					<dd><cfinput name="fld_userEmail" id="fld_userEmail" required="true" validate="email" message="Please, provide a valid e-mail Address" validateAt="onSubmit" /></dd>
					<dt><label>Password</label></dt>
					<dd><cfinput type="password" name="fld_userPassword" id="fld_userPassword" required="true" message="Please, provide a password" validateAt="onSubmit" /></dd>
					<dt>Role</dt>
					<dd>
						<label><cfinput type="radio" name="fld_userRole" id="fld_userRoleAdmin" value="2" />Administrator</label>&nbsp;<label>
                            <cfinput type="radio" name="fld_userRole" id="fld_userRoleUser" value="1" checked="true" />User</label>
					</dd>
					<dt><label>Instrument</label></dt>
					<dd>
						<cfselect name="fld_userInstrument" id="fld_userInstrument" query="variables.userInstruments" value="fld_instrumentID" display="fld_instrumentName" queryposition="below" required="true" >
							<option value="0">Please choose the user instrument</option>
						</cfselect>
					</dd>
					<dt><label>Comment</label></dt>
					<dd><cftextarea name="fld_userComment" id="fld_userComment" richtext="true" ></cftextarea></dd>
				</dl>
				<input type="submit" name="fld_createUserSubmit" id="fld_createUserSubmit" value="Edit User" />
			</fieldset>
		</cfform>
    </div>
</cf_admin>