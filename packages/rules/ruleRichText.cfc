<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->
<cfcomponent 
    extends="farcry.core.packages.rules.rules" 
    displayname="Rich Text Block" 
	hint="Display a rich text block; does not allow embeds or media."
    icon="fa-font">

    <cfproperty name="title" type="string" required="no" default="" 
        ftSeq="10" ftFieldset="Rich Text Rule" ftLabel="Admin Title" 
        ftvalidation="required"
        fthint="Admin title only. Will not be shown to users.">

    <cfproperty name="text" type="longchar" required="yes" default="" 
        ftSeq="20" ftFieldset="Rich Text Rule" ftLabel="Rich Text" 
        ftType="richtext"
        hint="Text to display.  Can be any combination of content and HTML markup.">

</cfcomponent>

