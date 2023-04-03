<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.sqlQueries.JDBCconnection" %>
    <%@ page import="com.sqlQueries.QueryLogin" %>
    <%@ page import="com.sqlQueries.QuerySignUp" %>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection con = JDBCconnection.CreateConnection();

	
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String password = request.getParameter("password");
	
	System.out.println(fname);
	
	
	boolean exists = QueryLogin.TestUser(fname,lname,password);
	
	if(exists){
		
        	String redirectURL1= "html/homepage/Flight.html";
        	response.sendRedirect(redirectURL1);
        
        }
        else{
        	
        	String redirectURL2= "html/login_html/login_page.html";
            response.sendRedirect(redirectURL2);
        	}
	
	
        

%>
</body>
</html>