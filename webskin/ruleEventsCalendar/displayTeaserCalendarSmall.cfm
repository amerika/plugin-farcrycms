<cfsetting enablecfoutputonly="yes">
<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmEvent/displayTeaserCalendarSmall.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:03:54 $
$Name:  $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: dmEvent -- calendar listing$
$TODO: $

|| DEVELOPER ||
$Developer: Brendan Sisson (brendan@daemon.com.au) $
--->
<!--- @@displayname: Small Calendar --->
<!--- @@author: Brendan Sisson --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/extjs" prefix="extjs">

<cfparam name="arguments.stParam" default="#structNew()#" />

<!--- loop over number of months to display --->
<cfloop from="0" to="#stobj.months-1#" index="displayMonth">
	<!--- work out year and month --->
	<cfset month = "#Month(dateadd("m",displayMonth,now()))#">
	<cfset year = "#Year(dateadd("m",displayMonth,now()))#">

	<!---Find the start day  the month--->
	<cfset start_day = DayOfWeek(createdate("#year#","#month#","1"))>
	
	<!---Find the total no of days in the month--->
	<cfset total_days_in_month = DaysInMonth(createdate("#year#","#month#","1"))>
	
	<!---Find the end day of the month--->
	<cfset end_day = DayOfWeek(createdate("#year#","#month#","#total_days_in_month#"))>
	
	<!--- show calendar --->
	<cfoutput>
	<table class="table1 calendar">
		<thead>
			<tr>
				<th colspan="7">#monthasstring(month)#</th>
			</tr>
		</thead>
		<tbody>
		<!--- show days of week --->
		<tr>
			<cfloop from="1" to="7" index="d">
				<th><cfoutput>#left(dayofweekasstring(d),1)#</cfoutput></th>
			</cfloop>
		</tr>
		</cfoutput>
		<cfset week_day = start_day>
		<cfset display_day = 1>
		<cfset week=1>
		<!--- loop through calendar month --->
		<cfloop condition = "#display_day# LTE #total_days_in_month#">
			<!--- start new week --->
			<cfoutput><tr></cfoutput>
				<!--- loop through week --->
				<cfloop condition = "#week_day# LTE 7">
					<cfloop condition = "#start_day# NEQ 1">
						<!--- date is in previous month --->
						<cfoutput><td>&nbsp;</td></cfoutput>
						<cfset start_day = start_day - 1>
					</cfloop>
					<cfif display_day LTE total_days_in_month>
						<cfset currentDate = DateFormat(createdate("#year#","#month#","#display_day#"))>
						<!--- check for event --->
						<cfset eventDisplayed = 0>
						<cfset eventTitles = "">
						
						<cfquery dbtype="query" name="qDayEvents" result="res">
						SELECT * FROM arguments.stParam.qEvents									
						WHERE startDate <= '#DateFormat(DateAdd("d", 1, currentDate))#'
						AND endDate >= '#currentDate#'
						</cfquery>
						<cfif qDayEvents.recordCount>
							<cfset eventDisplayed = 1>
							<cfloop query="qDayEvents">
								<cfif len(eventTitles)>
									<cfset eventTitles = eventTitles & "#chr(13)##chr(13)##qDayEvents.title##chr(13)##qDayEvents.location#">
								<cfelse>
									<cfset eventTitles = eventTitles & "#qDayEvents.title##chr(13)##qDayEvents.location#">
								</cfif>
								<cfset eventObjectid = qDayEvents.objectid>
							</cfloop>
						</cfif>
		
						<!--- check if display day as event or empty --->
						<cfsavecontent variable="tdClass">
							<cfif currentdate eq dateformat(now()) OR eventDisplayed>
								<cfoutput> class="</cfoutput>
							</cfif>
							<cfif currentdate eq dateformat(now())>
								<cfoutput>caltoday</cfoutput>
							</cfif>
							<cfif eventDisplayed>
								<cfoutput> calevent"</cfoutput>
							</cfif>
							<cfif currentdate eq dateformat(now()) OR eventDisplayed>
								<cfoutput>"</cfoutput>
							</cfif>
						</cfsavecontent>						
						
						<cfoutput><td #tdClass#></cfoutput>
						
						<!--- display date --->
						<cfif eventDisplayed>
							<cfoutput><a href="#application.url.conjurer#?objectid=#eventObjectid#" class="eventLink"></cfoutput>
						</cfif>
						
						<cfif len(eventTitles)>
							<extjs:toolTip toolTip="#eventTitles#">
								<cfoutput>#display_day#</cfoutput>
							</extjs:toolTip>
						<cfelse>
							<cfoutput>#display_day#</cfoutput>
						</cfif>
						
						<cfif eventDisplayed>
							<cfoutput></a></cfoutput>
						</cfif>
						
						<cfoutput></td></cfoutput>
					<cfelse>
						<cfloop condition="#end_day# NEQ 7">
							<!--- date is in next month --->
							<cfset end_day = end_day + 1>
							<cfoutput><td>&nbsp;</td></cfoutput>
						</cfloop>	
					</cfif>
					<cfset week_day = week_day + 1>
					<cfset display_day = display_day + 1>
				</cfloop>
			<cfoutput></tr>
			</cfoutput>
			<cfset week_day = 1>
			<cfset week = week + 1>
		</cfloop>
	<cfoutput>
	</tbody></table>
	</cfoutput>
</cfloop>
<cfsetting enablecfoutputonly="no">