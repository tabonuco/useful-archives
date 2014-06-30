xquery version "1.0";

declare namespace ead="urn:isbn:1-931666-22-9";
declare namespace xlink = "http://www.w3.org/1999/xlink";

import module namespace functx="http://www.functx.com" 
    at "http://www.xqueryfunctions.com/xq/functx-1.0-doc-2007-01.xq";

declare variable $COLLECTION as document-node()* := db:open('MSSAAtExport');

for $note in $COLLECTION//ead:ead//ead:note
let $doc := base-uri($note),
$parent-note := $note/ancestor::ead:c/ead:note
return
<dupes>
<doc>{$doc}</doc>
<results>{if ($note eq $parent-note)
       then "same"
       else "different"
     }</results>
</dupes>
