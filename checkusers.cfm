

<cfquery  name="rsUsers" datasource="hdstreet">
    select *
    from tbl_users
    where FLD_USERISACTIVE = 0
</cfquery>

<!--- <cfdump var="#rsUsers#">  --->

<cfquery  name="qryUpdateUser" datasource="hdstreet">
    UPDATE TBL_USERS
    SET
    fld_userEmail = 'sauledezma'
    where fld_userID = 18
</cfquery>