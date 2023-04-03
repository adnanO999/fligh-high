package com.sqlQueries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databasetables.DutyfreeTable;


public class QueryDutyfree {
	
	public List checkDutyfree(DutyfreeTable dutyfree) throws SQLException, ClassNotFoundException {
		
		String location = dutyfree.getLocation();
		
		Connection connection = JDBCconnection.CreateConnection();
        PreparedStatement selectstatement ;
        ResultSet rs = null;
        
        String selectsql = "SELECT * FROM dutyfree NATURAL JOIN airport "
        		+ " WHERE location =?";
        

        selectstatement = connection.prepareStatement(selectsql);
        selectstatement.setString(1,location);
        rs = selectstatement.executeQuery();
       
        String airportName = null;
        String dutyfreeLocation = null;
        int airportID = 0;
        int dutyFreeID = 0;
        
        List <DutyfreeTable> dutyFree = new ArrayList<>();
        
        	while(rs.next()) {
        		airportName = rs.getString("airportName");
        		dutyfreeLocation = rs.getNString("location");
        		airportID  = rs.getInt("airportID");
        		dutyFreeID  = rs.getInt("dutyfreeID");
        		
        		DutyfreeTable availableDutyfree = new DutyfreeTable(dutyFreeID,airportID,dutyfreeLocation,airportName);
        		dutyFree.add(availableDutyfree);
        	}
        
        connection.close();
        return dutyFree;
    }
		
	}

