<cfcomponent output="false">
    <cffunction name="addComment" access="public" returntype="void" output="false">
        <cfargument name="commentAuthor" type="string" required="true">
        <cfargument name="commentContent" type="string" required="true">
        <cfargument name="newsID" type="numeric" required="true">

        <cfquery>
            INSERT INTO TBL_COMMENTS
            (FLD_COMMENTAUTHOR, FLD_COMMENTCONTENT, FLD_COMMENTNEWS, FLD_COMMENTDATE, FLD_COMMENTISAPPROVED)
            VALUES
            (<cfqueryparam value="#arguments.commentAuthor#" cfsqltype="cf_sql_varchar" />, <cfqueryparam value="#arguments.commentContent#" cfsqltype="cf_sql_longvarchar" />, <cfqueryparam value="#arguments.newsID#" cfsqltype="cf_sql_integer" />, #now()#, 0)
        </cfquery>
    </cffunction>
    
    <cffunction name="getCommentsForNews" access="public" returntype="query" output="false">
        <cfargument name="newsID" type="numeric" required="true">
        <cfquery name="local.rs_commentsForNews">
            SELECT TBL_COMMENTS.FLD_COMMENTDATE, TBL_COMMENTS.FLD_COMMENTAUTHOR, TBL_COMMENTS.FLD_COMMENTID, TBL_COMMENTS.FLD_COMMENTISAPPROVED, TBL_COMMENTS.FLD_COMMENTCONTENT, TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSID
            FROM TBL_COMMENTS INNER JOIN TBL_NEWS ON TBL_COMMENTS.FLD_COMMENTNEWS = TBL_NEWS.FLD_NEWSID
            WHERE TBL_COMMENTS.FLD_COMMENTNEWS = <cfqueryparam value="#arguments.newsID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        <cfreturn local.rs_commentsForNews />
    </cffunction>

    <cffunction name="validateComment" access="public" returntype="array" output="false">
        <cfargument name="commentAuthor" type="string" required="true">
        <cfargument name="commentContent" type="string" required="true">
        <cfargument name="securityCodeSystem" type="string" required="true">
        <cfargument name="securityCodeUser" type="string" required="true">

        <cfset local.aMessages = [] />
        <cfif arguments.commentAuthor EQ ''>
            <cfset arrayAppend(local.aMessages,'Please enter your name or nickname in the form')>
        </cfif>
        <cfif arguments.commentContent EQ ''>
            <cfset arrayAppend(local.aMessages,'Please provide a valid content for your comment') />
        </cfif>

        <cfif arguments.securityCodeUser NEQ arguments.securityCodeSystem>
                <cfset arrayAppend(local.aMessages,'The security code you typed is not correct.  Try again') />
        </cfif>
        <cfreturn local.aMessages />
    </cffunction>

    	<!---Get unapproved Comments--->
	<cffunction name="getUnapprovedComments" returntype="Query" roles="Administrator">
		<cfquery name="local.rs_unapprovedComments">
			SELECT TBL_COMMENTS.FLD_COMMENTID, TBL_COMMENTS.FLD_COMMENTDATE, TBL_COMMENTS.FLD_COMMENTAUTHOR, TBL_COMMENTS.FLD_COMMENTCONTENT, TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_NEWS.FLD_NEWSID
			FROM TBL_COMMENTS INNER JOIN TBL_NEWS ON TBL_COMMENTS.FLD_COMMENTNEWS = TBL_NEWS.FLD_NEWSID
			WHERE TBL_COMMENTS.FLD_COMMENTISAPPROVED = 0
			ORDER BY TBL_COMMENTS.FLD_COMMENTNEWS ASC
		</cfquery>
		<cfreturn local.rs_unapprovedComments /> 
	</cffunction>
	
	<!---get all comments--->
	<cffunction name="getAllComments" returntype="Query" roles="Administrator">
		<cfquery name="local.rs_allComments">
			SELECT TBL_COMMENTS.FLD_COMMENTID, TBL_COMMENTS.FLD_COMMENTDATE, TBL_COMMENTS.FLD_COMMENTAUTHOR, TBL_COMMENTS.FLD_COMMENTCONTENT, TBL_NEWS.FLD_NEWSTITLE
			FROM TBL_NEWS INNER JOIN TBL_COMMENTS ON TBL_NEWS.FLD_NEWSID = TBL_COMMENTS.FLD_COMMENTNEWS
			WHERE TBL_COMMENTS.FLD_COMMENTISAPPROVED = <cfqueryparam value="1" cfsqltype="cf_sql_integer" />
			ORDER BY TBL_NEWS.FLD_NEWSID ASC
		</cfquery>
		<cfreturn local.rs_allComments />
	</cffunction>
	
	<!---Get comment by ID--->
	<cffunction name="getCommentByID" returntype="Query" roles="Administrator">
		<cfargument name="commentID" type="numeric" required="true" />
		<cfquery name="local.rs_singleComment">
			SELECT TBL_COMMENTS.FLD_COMMENTAUTHOR, TBL_COMMENTS.FLD_COMMENTCONTENT, TBL_COMMENTS.FLD_COMMENTID
			FROM TBL_COMMENTS
			WHERE TBL_COMMENTS.FLD_COMMENTID = <cfqueryparam value="#arguments.commentID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		<cfreturn local.rs_singleComment />  
	</cffunction>
	
	<!---Update comment--->
	<cffunction name="updateComment" returntype="void" roles="Administrator">
		<cfargument name="commentAuthor" type="string" required="true" />
		<cfargument name="commentContent" type="string" required="true" />
		<cfargument name="commentApprove" type="numeric" required="true" />
		<cfargument name="commentID" type="numeric" required="true" /> 
		<cfquery>
			UPDATE TBL_COMMENTS
			SET
			FLD_COMMENTAUTHOR = <cfqueryparam value="#arguments.commentAuthor#" cfsqltype="cf_sql_varchar" />,
			FLD_COMMENTCONTENT = <cfqueryparam value="#arguments.commentContent#" cfsqltype="cf_sql_longvarchar" />,
			FLD_COMMENTISAPPROVED = <cfqueryparam value="#arguments.commentApprove#" cfsqltype="cf_sql_integer" />
			WHERE FLD_COMMENTID = <cfqueryparam value="#arguments.commentID#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cffunction>
	
	<!---ApproveComment--->
	<cffunction name="approveComment" returntype="void" roles="Administrator">
		<cfargument name="commentID" type="numeric" required="true" />
        <cfquery datasource="ows" name="updateOWSActors">
            update actors
            set age = 55
            where actorid = <cfqueryparam value=1 cfsqltype="cf_sql_integer" >
        </cfquery>
		<cfquery>
			UPDATE TBL_COMMENTS
			SET FLD_COMMENTISAPPROVED = 1
			WHERE FLD_COMMENTID = <cfqueryparam value="#arguments.commentID#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cffunction>
	
	<!---Delete comment--->
	<cffunction name="deleteComment" returntype="void" roles="Administrator">
		<cfargument name="commentID" type="numeric" required="true" />
		<cfquery>
			DELETE FROM TBL_COMMENTS
			WHERE FLD_COMMENTID = <cfqueryparam value="#arguments.commentID#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cffunction>
</cfcomponent>