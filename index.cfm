<!---
    extract EMS data from estimate and/or supplement documents in pdf format
--->

<cfdirectory action="list" directory="#expandPath('./PDF')#" name="inPDFs">

<cfpdf action="extractText" name="content" source="#expandPath('./PDF/gieco_estimate.pdf')#" />

<cfset arytags = REfindNoCase('(<(\w+)(\s?(\w+)="(\d)"\s?)?>)', content, 1, true, 'all') />

<cfset pagecontent = mid(content, arytags[3].pos[1], arytags[4].pos[1]-arytags[3].pos[1]) />
<cfset pagecontent2 = mid(content, arytags[4].pos[1], arytags[5].pos[1]-arytags[4].pos[1]) />

<cfloop from="1" to="#arrayLen(arytags)#" index="idx" >
    <cfif isNumeric(arytags[idx].match[-1]) AND idx LT arrayLen(arytags)>
        <cfset pg = mid(content, arytags[idx].pos[1], arytags[idx+1].pos[1]-arytags[idx].pos[1]) />
        <cfoutput>
            #pg#<br />
        </cfoutput>
    </cfif>
</cfloop>


<!---
<cfset aryContent=listToArray(content, chr(10)) />
<cfset page = 0 />
<cfset oper = arrayNew() />
<cfset arrayAppend(oper, "Repl") />
<cfset arrayAppend(oper, "Rpr") />
<cfset arrayAppend(oper, "R&I") />

<cfset strLineItem = structNew() />
<cfset structInsert(strLineItem,"Line", '') />
<cfset structInsert(strLineItem,"Oper", '') />
<cfset structInsert(strLineItem,"Desc", '') />
<cfset structInsert(strLineItem,"Part", '') />
<cfset structInsert(strLineItem,"Qty", '') />
<cfset structInsert(strLineItem,"Price", '') />
<cfset structInsert(strLineItem,"Labor", '') />
<cfset structInsert(strLineItem,"Paint", '') />

<cfloop from=1 to="#arrayLen(aryContent)#" index="i">
    <cfif i GTE 74>
        <cfif reFind(reLine, aryContent[i])>
            <cfset aryLineItem = listToArray(aryContent[i], chr(32)) />

            <cfloop  array="#oper#" index="j">
                <cfif findNoCase(j, aryContent[i])>
                    <cfset locoper = findNoCase(j, aryContent[i]) />
                    <cfset reDesc = reFind('\s([A-Za-z/_0-9]+)\s+', aryContent[i], locoper+len(j), true) />
                    <cfset rePart = reFind('\s([A-Z0-9]+)\s', aryContent[i], locoper, true) />
                    <cfset subDesc = mid(reDesc.match[1], 1, findNoCase(rePart.match[1], reDesc.match[1])-1) />
                    <cfset rePrice = reFind('(\d+\.\d{2})\s', aryContent[i], locoper, true) />
                    <cfset reLabor = reFind('(\d+\.\d)\s', aryContent[i], locoper, true) />
                    <cfset rePaint = reFind('(\d+\.\d)\s', aryContent[i], reLabor.pos[1]+reLabor.len[1]-1, true) />

                    <cfset structUpdate(strLineItem, 'Oper', j) />
                    <cfif arrayLen(rePart.match) GT 2>
                        <cfset structUpdate(strLineItem, 'Part', rePart.match[2]) />
                        <cfset structUpdate(strLineItem, 'Qty', rePart.match[3]) />
                    </cfif>
                    <cfset structUpdate(strLineItem, 'Price', rePrice.match[1]) />
                    <cfset structUpdate(strLineItem, 'Labor', reLabor.match[1]) />
                    <cfset structUpdate(strLineItem, 'Paint', rePaint.match[1]) />
                    <cfset structUpdate(strLineItem, 'Desc', subDesc) />

                </cfif>
            </cfloop>
            
        </cfif>
    </cfif>
    <cfif findNoCase('<page pagenumber=',aryContent[i])>
        <cfset page++ />
    </cfif>

</cfloop>
--->
<cfdump var="#variables#" />
