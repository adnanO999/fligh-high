<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.sqlQueries.JDBCconnection" %>
    <%@ page import="com.sqlQueries.QueryHotel" %>
    <%@ page import="com.databasetables.HotelTable"%>
    <%@ page import="com.generalfunctions.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/booking_css/check.css">
<link rel="stylesheet" href="css/hotel_css/listingHotels.css">
<title>Available NearbyHotels</title>
</head>
<body>

	

		<table class="content-table" align="center">
        <thead>
          <tr>
            <th>    </th>
            <th>Name</th>
            <th>Location</th>
            <th>Star Rating</th>
          </tr>
        </thead>
		<tbody> 
			<% 
			Connection con = JDBCconnection.CreateConnection();

			
			String city = request.getParameter("cityHotel");
			
			
			HotelTable hotel = new HotelTable();
			hotel.setLocation(city);
			
			System.out.println(city);
			List <HotelTable> hotels = QueryHotel.checkHotels(hotel);
		
			
			if(hotels.size()==0){
				//String redirectURL2= "html/booking/booking_failed.html";
		        //response.sendRedirect(redirectURL2);
		        
			}	
				
		 %> 
 
			<% 
				for (HotelTable htl : hotels) { 
			%> 
			<tr> 
				<td></td>
				<td><%=htl.getName()%></td> 
				<td><%=htl.getLocation() %></td> 
				<td><%=htl. getStarRating()%></td>  
			</tr> 
			<% 
				} 
			%> 
		</tbody> 
	</table> 
		<div class="ok">
      			<a href="booking_done.html">return</a>
      		</div>
</body>
</html>