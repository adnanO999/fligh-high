<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.sqlQueries.JDBCconnection" %>
    <%@ page import="com.sqlQueries.QueryLogin" %>
    <%@ page import="com.sqlQueries.QuerySignUp" %>
    <%@ page import="com.databasetables.UserTable" %>
    <%@ page import="java.sql.*" %>
    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/login_css/loginerror.css">
<title>Error1</title>
</head>
<body>

<%
	Connection con = JDBCconnection.CreateConnection();
	
	UserTable checkuser = new UserTable();	
	UserTable insertuser = new UserTable();

	String email = request.getParameter("email");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String password = request.getParameter("password");
	String username = request.getParameter("username");
	
	checkuser.setEmail(email);
	checkuser.setUsername(username);
	
	insertuser.setFirstName(fname);
	insertuser.setLastName(lname);
	insertuser.setPassword(password);
	insertuser.setEmail(email);
	insertuser.setUsername(username);
	
	String exists = QuerySignUp.checkUser(checkuser);
	
	%>
	 
<%if(!exists.equals("")){%>	
		<div class="error">
			<div class="sky">
				<p><span>e</span><span>r</span><span>r</span><span>o</span><span>r</span></p>
				<div class="grass"></div>
				<img alt="" src="images/plane1.png" class="plane">
			</div>
			<div class="field">
				<h2>Opps...<%=exists%> already exits</h2>
				<a href="#">try another username</a>
			</div>
		</div>
	
	<%}%>	
	
	<% if(exists.equals("")){
    	boolean created = QuerySignUp.registerUser(insertuser);
    	if(created){
    	String redirectURL2= "html/homepage/Flight.html";
        response.sendRedirect(redirectURL2);
    	}
	}
        
	%>
        	

</body>
</html>