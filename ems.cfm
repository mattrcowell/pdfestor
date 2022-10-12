<cfset idlist = directoryList(expandPath("./EMS")) />

<cfloop array="#idlist#" item="itm" index="idx">
    <cfset file = fileRead(itm) />
    <cfdump var="#file#" label="#itm#" />
</cfloop>


<cfdump var="#variables#" />