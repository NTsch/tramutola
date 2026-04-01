xquery version "3.1";
declare namespace atom = "http://www.w3.org/2005/Atom";
declare namespace cei = "http://www.monasterium.net/NS/cei";

let $input := collection('input')
for $entry in $input
where $entry//cei:seal[ancestor::cei:tenor]
order by base-uri($entry)
return <charter name="{base-uri($entry)}">{
    $entry//cei:seal[ancestor::cei:tenor]
    }</charter>