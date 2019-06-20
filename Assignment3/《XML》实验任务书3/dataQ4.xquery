xquery version "1.0";

for $reser in doc("Flights-Data.xml")/doc/Reservation
let $fid := $reser/flightRef

return
	<des>
	{
		for $flight in doc("Flights-Data.xml")/doc/Flight
		let $des := $flight/destination
		where $flight/@flightId = $fid 
		return data($des)
	}
	
	</des>