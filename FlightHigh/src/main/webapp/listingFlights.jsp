<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.sqlQueries.JDBCconnection" %>
    <%@ page import="com.sqlQueries.QueryFlight" %>
    <%@ page import="com.databasetables.FlightTable"%>
    <%@ page import="com.generalfunctions.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/booking/button_css.css">
<link rel="stylesheet" href="css/booking_css/check.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css">
<title>Available Flights</title>
</head>
<body>

	

		<table class="content-table" align="center">
        <thead>
          <tr>
            <th>    </th>
            <th>FlighID</th>
            <th>Origin Country</th>
            <th>Destination Country</th>
            <th>Departure Date</th>
            <th>Departure Time</th>
            <th>Arrival Date</th>
            <th>Arrival Time</th>
            <th>Airline</th>
            <th>Aircraft Name</th>
            <th>Class</th>
          </tr>
        </thead>
		<tbody> 
			<% 
			Connection con = JDBCconnection.CreateConnection();

			
			String orgCountry = request.getParameter("orgCountry");
			String destCountry = request.getParameter("destCountry");
			String returnDate = request.getParameter("returnDate");
			String departureDate = request.getParameter("departureDate");
			String parseddeptDate = GeneralFunctions.parseDate(departureDate);
			String parsedretDate = GeneralFunctions.parseDate(returnDate);
			
			FlightTable flight = new FlightTable();
			flight.setOriginCountry(orgCountry);
			flight.setDestinationCountry(destCountry);
			flight.setDepartureDate(parseddeptDate);
			flight.setReturnDate(parsedretDate);
			
			List <FlightTable> flights = QueryFlight.checkFlight(flight);
		
			
			if(flights.size()==0){
				String redirectURL2= "html/booking/booking_failed.html";
		        response.sendRedirect(redirectURL2);
		        
			}	
				
		 %> 
 
			<% 
			
			
				for (FlightTable flt : flights) { 
			%> 
			<tr> 
				<td></td>
				<td><%=flt.getFlightID()%></td> 
				<td><%=flt.getOriginCountry() %></td> 
				<td><%=flt. getDestinationCountry()%></td> 
				<td><%=flt. getDepartureDate()%></td> 
				<td><%=flt. getDepartureTime()%></td>
				<td><%=flt. getReturnDate()%></td> 
				<td><%=flt. getArrivalTime()%></td>
				<td><%=flt. getAirlineName()%></td>  
				<td><%=flt. getAircraftName()%></td>
				<td><input type="checkbox" name="v"><label for="v">First class</label><br>
            		<input type="checkbox" name="v"><label for="v">Business</label><br>
            		<input type="checkbox" name="v"><label for="v">Economy</label>
            	</td>  
			</tr> 
			<% 
				} 
			%> 
		</tbody> 
	</table> 
		<form id="button">
        <div class="ok">
            <a href="html/booking/booking_done.html">submit</a>
        </div>
        </form>
</body>
</html>