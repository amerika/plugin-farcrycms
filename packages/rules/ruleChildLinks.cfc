<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $
$Community: FarCry CMS http://www.farcrycms.org $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: $
$Author: $
$Date: $
$Name:  $
$Revision: $

|| DESCRIPTION || 
$Description: 
ruleChildLinks (FarCry Core)
List teasers for the current nodes children.  Children types are restricted to
dmHTML, dmLink and dmInclude content types.

Known Issues:
Teaser template listing is only from dmHTML.  But dmInclude is also a possible 
child object, so if a method is chosen that is not in dmInclude then it 
fails to display anything.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au)$

--->

<cfcomponent displayname="Utility: Child Links Rule" extends="farcry.core.packages.rules.rules" 
	hint="List teaser displays for the current navigation folders children.  
		Children content types are restricted to dmHTML, dmLink and dmInclude. 
		This publishing rule is commonly used on section landing pages to 
		build a summary for the pages in the section.">

	<cfproperty ftSeq="1" ftFieldset="" name="displayMethod" type="string" default="displayTeaser" hint="Teaser display method to render children links." ftLabel="Display method" ftType="webskin" ftTypename="dmHTML,dmInclude,dmLink" ftPrefix="displayTeaser" />
	<cfproperty ftSeq="2" ftFieldset="" name="intro" type="string" default="" hint="Intro test to child link listing; can be any relevant HTML code and content." ftLabel="Intro" ftType="string" />
	
</cfcomponent>
