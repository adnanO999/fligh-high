package com.sqlQueries;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCconnection {
//	public static int Great() {
//		return 4;
//	}
	
	public static Connection CreateConnection() throws SQLException, ClassNotFoundException{
        
        Class.forName("com.mysql.cj.jdbc.Driver");

        
        String url = "jdbc:mysql://localhost:3306/airport_management_system";
        String user = "root";
        String password = "adnan#123456";

        Connection connection = DriverManager.getConnection(url, user, password);
        System.out.println("connected");

        return connection;
    }
}
