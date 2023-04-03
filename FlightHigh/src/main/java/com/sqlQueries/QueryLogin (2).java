package com.sqlQueries;

import java.sql.*;

public class QueryLogin {
	
	
	
	
	
	 public static boolean TestUser(String fname, String lname, String password) throws Exception {

	        Connection connection = JDBCconnection.CreateConnection();
	        PreparedStatement statement ;
	        ResultSet rs = null;
	        boolean correct = false;

	        String sql = "SELECT * FROM customer WHERE firstName =? and lastName=? and password=?";


	            statement = connection.prepareStatement(sql);
	            statement.setString(1, fname);
	            statement.setString(2, lname);
	            statement.setString(3, password);
	            rs = statement.executeQuery();
	            
	            if (rs.next()) correct = true;
	           
	            
	        
	            connection.close();
	            return correct;
	    }
}

