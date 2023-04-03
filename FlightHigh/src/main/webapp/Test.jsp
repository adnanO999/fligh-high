<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.management.web.FlightServlet"%>
<%@ page import="com.sqlQueries.JDBCconnection" %>
    <%@ page import="com.sqlQueries.QueryFlight" %>
    <%@ page import="com.databasetables.FlightTable"%>
    <%@ page import="com.generalfunctions.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>



<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/booking_css/check.css">
	
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<title>Available Flights</title>
	
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
		
		//out.println("<table> <tr><td>"+flights.get(i).getOriginCountry()+" </td>  </tr>   </table> ");
		}
	}
	
       
%>
<jsp:declaration>String orgCountry = null;</jsp:declaration>
<jsp:scriptlet> if(flights.size()!=0){
	orgCountry = flights.get(0).getOriginCountry();
	
}
</jsp:scriptlet>

<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: darkorange">
			<div>
				<a href="#" class="navbar-brand"> 
					Available Flights </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/showAvailableFlights"
					class="nav-link">flights</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Book Your Flight</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Country</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="flight" items="${availableFlights}">

						<tr>
						    
							<td><c:out value="${flight.getFlightId()}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.country}" /></td>
							<td><a href="edit?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
	
</body>
</html>