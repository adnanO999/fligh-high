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
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Flights</title>
    <link rel="stylesheet" href="css/booking_css/check.css">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = JDBCconnection.CreateConnection();

	
	String orgCountry = request.getParameter("orgCountry");
	String destCountry = request.getParameter("destCountry");
	String returnDate = request.getParameter("returnDate");
	String departureDate = request.getParameter("departureDate");
	
	System.out.println(returnDate);//mm/dd/yyyy
	System.out.println(departureDate);
	//String parsedretDate = GeneralFunctions.parseDate(returnDate);
	//String parseddeptDate = GeneralFunctions.parseDate(departureDate);
	
	
	List <FlightTable> flights = QueryFlight.checkFlight(orgCountry,destCountry,"2022-09-04","2022-10-04");
	
	//System.out.println(request.getContextPath());
	
	if(flights.size()==0){
		  //"html/booking/booking_done.html";
        	//String redirectURL1= "Test.jsp";
        	//response.sendRedirect(redirectURL1);
		   //out.println("<h1>available </h1>"+available.get(0));
		   //FlightTable flt = flights.get(0);
		   //System.out.println(flights);
		String redirectURL2= "html/booking/booking_failed.html";
        response.sendRedirect(redirectURL2);
        
        }	
	else{
		for(int i=0;i<flights.size();i++){
		
		out.println("<table> <tr><td>"+flights.get(i).getOriginCountry()+" </td>  </tr>   </table> ");
		}
	}
	
       
%>
<jsp:declaration>String orgCountry = null;</jsp:declaration>
<jsp:scriptlet> if(flights.size()!=0){
	orgCountry = flights.get(0).getOriginCountry();
	
}
</jsp:scriptlet>


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
            <th>AircraftID</th>
            <th>Class</th>
          </tr>
        </thead>
        <tbody>
          <tr>  
            <td><input type="checkbox" name="v"></td>
            <td>F1000</td>
            <td><jsp:expression>orgCountry </jsp:expression></td>
            <td>France</td>
            <td>12/7/2022</td>
            <td>5:00:00AM</td>
            <td>12/8/2022</td>
            <td>6:00:00PM</td>
            <td>Middle East Airlines</td>
            <td>A1000</td>
            <td><input type="checkbox" name="v"><label for="v">First class</label><br>
            <input type="checkbox" name="v"><label for="v">Business</label><br>
            <input type="checkbox" name="v"><label for="v">Economy</label>
            </td>
          </tr>
          <td><input type="checkbox" name="v"></td>
            <td>F1001</td>
            <td>France</td>
            <td>Spain</td>
            <td>12/7/2022</td>
            <td>5:00:00AM</td>
            <td>12/8/2022</td>
            <td>6:00:00PM</td>
            <td>Air France</td>
            <td>A1001</td>
            <td><input type="checkbox" name="v"><label for="v">First class</label><br>
                <input type="checkbox" name="v"><label for="v">Business</label><br>
                <input type="checkbox" name="v"><label for="v">Economy</label>
            </td>
        </td>
        </tbody>
      </table>
      <div class="ok">
      <a href="booking_done.html">submit</a>
      </div>










</body>
</html>