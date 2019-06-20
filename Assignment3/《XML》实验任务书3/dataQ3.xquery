xquery version "1.0";


declare function local:getRsv($aid as xs:string) as element()*
{
	for $flight in doc("Flights-Data.xml")/doc/Flight,
		$reser in doc("Flights-Data.xml")/doc/Reservation
	where ($flight/source=$aid or $flight/destination=$aid) 
	and $reser/date = "2005-12-24"and $flight/@flightId=$reser/flightRef
	return $reser 
};


<result>
{
	for $airport in doc("Flights-Data.xml")/doc/Airport
	let $int as xs:integer:=count(local:getRsv($airport/@airId))
	where $int>0
	order by $int descending
	return <inf>
			<name>
				{$airport}
			</name>
			
			<passengerNum>
				{$int}
			</passengerNum>)
	       </inf>
}
</result>
