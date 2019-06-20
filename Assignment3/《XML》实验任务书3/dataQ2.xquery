xquery version "1.0";


declare function local:getFlights($aid as xs:string) as element()*
{
	for $flight in doc("Flights-Data.xml")/doc/Flight
	where ($flight/source=$aid or $flight/destination=$aid) and $flight/date="2005-12-24"
	return $flight
};

declare function local:getNum() as element()*
{
	for $airport in doc("Flights-Data.xml")/doc/Airport
	let $i := count(local:getFlights($airport/@airId))
	order by $i descending
	return <result>{$airport,<count>{$i}</count>}</result>
	
};

declare function local:getMax($c as xs:string) as element()*
{
	for $i in local:getNum()
	where string($i/count)=$c 
	return $i
};

local:getMax(string(local:getNum()[1]/count))