<!--- <cfset userService = createObject("component", "cf2016.cfTraining.components.userService")> --->

<!--- Form processing script --->
<cfif structKeyExists(form,'fld_newUserSubmit')>
	<cfset form.fld_userPassword = generateSecretKey("AES")>
	<cfset form.fld_userRole = 1>
	<cfset form.fld_userApproved = 0>
	<cfset form.fld_userIsActive = 0>
	<!--- Server side data validation --->
	<cfset aErrorMessages = Arraynew(1)>
	<cfset aErrorMessages = application.userService.validateUser(form.fld_userFirstName, form.fld_userLastName, form.fld_userEmail, form.fld_userPassword,
	form.fld_userPassword)/>
	<cfif arrayIsEmpty(aErrorMessages)>
		<cfset application.userService.addUser(form.fld_userFirstName,form.fld_userLastName,form.fld_userEmail,form.fld_userPassword,form.fld_userRole,
								   form.fld_userInstrument, form.fld_userComment, form.fld_userApproved, form.fld_userIsActive)>
	</cfif>
	<cfquery name="users">
		            Select FLD_USERID, FLD_USERFIRSTNAME, fld_userLastName, FLD_USEREMAIL,
            fld_userPassword, fld_userComment, fld_userInstrument
            FROM tbl_users
	</cfquery>
</cfif>

<!---Get page content for fld_pageID = 4--->
<!---Get page content--->
<cfset pageService = createObject("component",'cf2016.cfTraining.components.pageService')/>

<cfset rsPage = application.pageService.getPageByID(4)>

<cfset rsInstrumentsList = application.userService.getInstruments()>
<!--- <cfdump var="#qryInstruments#"> --->
<cf_front title = "HD Street band - Compe Play with us">
  <div id="pageBody">
  	<div id="calendarContent">
    <cfoutput>
          <h2>#rspage.FLD_PAGETITLE#</h2>
          #rspage.FLD_PAGECONTENT#
    </cfoutput>

<cfoutput>

</cfoutput>
	</div>
	<div id="calendarSideBar">
		<h2>Complete the form below to join our band</h2>
		<cfif isDefined("aErrorMessages") AND NOT arrayIsEmpty(aErrorMessages)>
			<cfoutput>
				<cfloop array="#aErrorMessages#" index="message">
					<p class="errorMessage">#message#</p>
				</cfloop>
			</cfoutput>
		</cfif>
		<cfform id="frm_newUser"><!--- No action makes it self submitting and POST by default --->
				<fieldset>
					<legend>Join our band</legend>
					<dl>
						<dt><label>First Name</label></dt>
						<dd><cfinput type="text" name="fld_userFirstName" id="fld_userFirstName" <!--- required="true"
							message="Please enter a first name" --->/></dd>
						<dt><label>Last Name</label></dt>
						<dd><cfinput type="text" name="fld_userLastName" id="fld_userLastName" <!--- required="true"
							message="Please enter a last name" --->/></dd>
						<dt><label>E-mail Address</label></dt>
						<dd><cfinput  type="text" name="fld_userEmail" id="fld_userEmail" <!--- required="true" validate="email" 
							message="Please enter a valid eMail address" --->/></dd>
						<dt><label>Instrument</label></dt>
						<dd>
							<cfselect name="fld_userInstrument" id="fld_userInstrument" 
							query="rsInstrumentsList" value="FLD_INSTRUMENTID" display="FLD_INSTRUMENTNAME"
							queryposition="below">
								<option value="0">Please choose your instrument</option>
							</cfselect>
						</dd>
						<dt><label>Comment</label></dt>
						<dd><textarea name="fld_userComment" id="fld_userComment"></textarea></dd>
					</dl>
					<input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Join the band" />
				</fieldset>
			</cfform>
	</div>
	</div>
 </div>
</cf_front>