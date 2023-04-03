package com.sqlQueries;
import com.databasetables.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QuerySignUp {
	
	public static String checkUser(UserTable user) throws Exception {
		
		String email = user.getEmail();
		String username = user.getUsername();

        Connection connection = JDBCconnection.CreateConnection();
        PreparedStatement statement ;
        ResultSet rs = null;
        String exist = "";

        String sql = "SELECT email,username FROM customer WHERE email =? OR username =?";

        statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, username);
        rs = statement.executeQuery();
     
        if(rs.next()) {
        	if(rs.getString("username").equals(username)) exist = "username";
        	else if(rs.getString("email").equals(email)) exist = "email";
        	
        }
        
        connection.close();
        return exist;
    }
	
	public static boolean registerUser(UserTable insertuser) throws Exception {
		String fname = insertuser.getFirstName();
		String lname = insertuser.getLastName();
		String password = insertuser.getPassword();
		String email = insertuser.getEmail();
		String username = insertuser.getUsername();

        Connection connection = JDBCconnection.CreateConnection();
        PreparedStatement statement ;
        int  rowInserted = 0;
        boolean created = false;

        String sql = "INSERT INTO customer (firstName,lastName,password,email,username) values (?,?,?,?,?)";

        statement = connection.prepareStatement(sql);
        statement.setString(1, fname);
        statement.setString(2, lname);
        statement.setString(3, password);
        statement.setString(4, email);
        statement.setString(5, username);
        rowInserted = statement.executeUpdate();
     
        if (rowInserted == 1) created = true;
        
        connection.close();
        return created;
    }
	
}
