<cfquery  name="rsUsers">
    select *
    from tbl_users
    where fld_userID = 18
</cfquery>

<cfdump var="#rsUsers#"> 