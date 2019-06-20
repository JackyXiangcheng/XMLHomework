xquery version "1.0";

for $flight in doc("Flights-Data.xml")/doc/Flight
let $dat := $flight/date, $src := $flight/source
let $airportI := for $airport in doc("Flights-Data.xml")/doc/Airport
	let $airportName := $airport/name
	where $airportName  = "North Pole"
	return $airport/@airId

where $dat = "2005-12-24" and $src=$airportI 


return <result>{$flight}</result> 
	