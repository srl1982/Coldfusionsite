<!--- <cf_front title="HS Street band - Agenda"> --->
<cf_front title="HS Street band - Agenda">
    <!--- <cfset eventsService2 = createObject("component", "cf2016.cfTraining.components.eventService")/> --->


    <div id="pageBody">
    <div id="calendarContent">
      <cfif isDefined("url.eventID")>
        <cfset rsSingleEvent = application.eventsService.getEventByID(url.eventID)>
        <!--- <cfdump var="#rsSingleEvent#"> --->
        <cfoutput>
          <h1>#rsSingleEvent.FLD_EVENTNAME#</h1>
          #rsSingleEvent.FLD_eventDescription#
        </cfoutput>
        <a href="agenda.cfm">Go back to the agenda</a>

      <cfelse>
        <!--- Output the upcoming event table --->
        <cfset rsCurrentEvents = application.eventsService.getCurrentEvents()/>


      <h1> Agenda for <cfoutput>#now()#</cfoutput></h1>
      <!--- <cfdump var="#rsCurrentEvents#">
      <cfdump var="#rsCurrentEvents_results#">
      <cfdump var="#rsCurrentEvents.recordCount#" name="recordcount"> --->
        <!--- Check for no current events --->
        <cfif rsCurrentEvents.recordCount EQ 0>
          <p>Sorry, there are no events to be displayed at this time.</p>
        <cfelse>
            <table>
                <cfoutput query="rsCurrentEvents">
                  <tr>
                      <th>#dateFormat(FLD_EVENTDATETIME, 'mmm dd yyyy')#</th>
                      <td>#FLD_EventName# - #FLD_EVENTLOCATION# (#FLD_EVENTVENUE#)</td>
                      <td><a href="agenda.cfm?eventID=#FLD_EVENTID#">Read More</a></td>
                  </tr>
                </cfoutput>
            </table>
        </cfif>
      </cfif>
    </div>
    <div id="calendarSideBar">
      <cfif isDefined("url.eventID")>
        <cfoutput>
        <h1>Next Event</h1>
        <div id="EventDetails">
          <p id="eventDate"><span id="month">#dateFormat(rsSingleEvent.FLD_EVENTDATETIME,"mmm")#</span> <span id="days">#dateFormat(rsSingleEvent.FLD_EVENTDATETIME,"d")#</span></p>
          <h2>#rsSingleEvent.FLD_EVENTNAME# - #rsSingleEvent.FLD_EVENTLOCATION#</h2>
        </div>
        <p>Venue:#rsSingleEvent.FLD_EVENTVENUE#</p>
        <p class="alignRight"><a href="agenda.cfm?eventID=#rsSingleEvent.FLD_EVENTID#">Read More</a></p>
      </cfoutput>
      <cfelse>

      <cfif rsCurrentEvents.recordCount EQ 0>
          <p>Sorry, there is no next event.</p>
      <cfelse>
        <cfoutput>
        <h1>Next Event</h1>
              <div id="EventDetails">
                <p id="eventDate"><span id="month">#dateFormat(rsCurrentEvents.FLD_EVENTDATETIME,"mmm")#</span> <span id="days">#dateFormat(rsCurrentEvents.FLD_EVENTDATETIME,"d")#</span></p>
                <h2>#rsCurrentEvents.FLD_EVENTNAME# - #rsCurrentEvents.FLD_EVENTLOCATION#</h2>
              </div>
              <p>Venue:#rsCurrentEvents.FLD_EVENTVENUE#</p>
              <p class="alignRight"><a href="agenda.cfm?eventID=#rsCurrentEvents.FLD_EVENTID#">Read More</a></p>
            </cfoutput>
        </cfif>
      </cfif>
       </div>
  </div>
</cf_front>