<cfif structKeyExists(url,'delete')>
    <cfset application.eventsService.deleteEvent(url.delete)/>
</cfif>

<!--- Get list of current events --->
<cfset currentEvents = application.eventsService.getCurrentEvents() />

<cf_admin title="title Goes Here">
<script>
    function confirmDelete(eventId){
            if(window.confirm("Are you sure you want to delete this event?")){
                window.location.href="/cf2016/cftraining/admin/events.cfm?delete=" + eventId;
            }
            else{
                null;
            }
    }
</script>
    <div id="pageBody">
        <h1>Events Administration</h1>
        <cfif structKeyExists(url,"add")>
            <p class="feedback">The event has been successfully created!</p>
        </cfif>
        <cfif structKeyExists(url,"update")>
            <p class="feedback">The event has been successfully updated!</p>
        </cfif>
        <p><a href="eventAdd.cfm">[Add an event]</a></p>
        <cfif currentEvents.recordCount eq 0>
             <p>No events currently to disply</p>
        <cfelse>
        <table>
            <thead>
                <tr>
                    <th>Event Date</th>
                    <th>Event Name</th>
                    <th>Event Location</th>
                    <th>Created by</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput  query="currentEvents">
                    <tr>
                        <td>#dateFormat(FLD_EVENTDATETIME, "mm/dd/yyyy")#</td>
                        <td>#FLD_EVENTNAME#</td>
                        <td>#FLD_EVENTLOCATION#</td>
                        <td>#fld_userfirstname# #fld_userlastname#</td>
                        <td><a href="eventEdit.cfm?eventID=#FLD_EVENTID#">Edit this event</a></td>
                        <td><a href="javascript:confirmDelete(#FLD_EVENTID#);">Delete this event</a></td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
        </cfif>
    </div>
</cf_admin>