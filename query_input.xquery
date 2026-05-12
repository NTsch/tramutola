xquery version "3.1";
declare namespace atom = "http://www.w3.org/2005/Atom";
declare namespace cei = "http://www.monasterium.net/NS/cei";

let $input := collection('input')
for $entry in $input
where empty($entry//cei:graphic[@url])
return $entry/base-uri()