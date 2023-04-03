package com.sqlQueries;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.databasetables.FlightTable;

public class QueryFlight {
	
	public static List checkFlight(FlightTable flight ) throws Exception {
		
		
		String fromCountry = flight.getOriginCountry();
		String toCountry = flight.getDestinationCountry();
		Date depDate = Date.valueOf(flight.getDepartureDate());
        Date retDate = Date.valueOf(flight.getReturnDate());
     

        Connection connection = JDBCconnection.CreateConnection();
        PreparedStatement selectstatement ;
        ResultSet rs = null;
        
        String selectsql = "SELECT * FROM flight F , aircraft A, airline AL"
        		+ " WHERE F.originCountry =? AND destinationCountry=? AND departureDate =? AND returnDate =? "
        		+ "AND F.aircraftID = A.aircraftID AND AL.airlineID = A.airlineID";
        

        selectstatement = connection.prepareStatement(selectsql);
        selectstatement.setString(1,fromCountry);
        selectstatement.setString(2,toCountry);
        selectstatement.setDate(3,depDate);
        selectstatement.setDate(4,retDate);
        rs = selectstatement.executeQuery();
       
        int flightID = 0;
        String aircraftName = null;
        String originCountry = null;
        String destinationCountry = null;
        String departureTime = null;
        String arrivalTime = null;
        String departureDate = null;
        String returnDate = null;
        String airlineName = null;
        float price = 0;
        
       
        
        List <FlightTable> flights = new ArrayList<>();
        
        	while(rs.next()) {
        		flightID = rs.getInt("flightID");
        		aircraftName = rs.getNString("name");
        		originCountry  = rs.getNString("F.originCountry");
        		destinationCountry = rs.getNString("destinationCountry");
        		departureTime = ""+rs.getTime("departureTime");
        		arrivalTime = ""+rs.getTime("arrivalTime");
        		departureDate =""+ rs.getDate("departureDate");
        		returnDate =""+ rs.getDate("returnDate");
        		airlineName = rs.getNString("airlineName");
        		price = rs.getFloat("price");
        		
        		FlightTable availableFlight = new FlightTable(flightID,aircraftName,originCountry,
        				destinationCountry,departureTime,arrivalTime,departureDate,returnDate,airlineName,price);
        		
        		flights.add(availableFlight);
        	}
        
        connection.close();
        return flights;
    }
public static List displayFlight()  throws Exception {
		
		
	

        Connection connection = JDBCconnection.CreateConnection();
        PreparedStatement selectstatement ;
        ResultSet rs = null;
        
        String selectsql = "SELECT * FROM flight F , aircraft A, airline AL WHERE F.aircraftID = A.aircraftID AND AL.airlineID = A.airlineID";
        

        selectstatement = connection.prepareStatement(selectsql);
        rs = selectstatement.executeQuery();
       
        int flightID = 0;
        String aircraftName = null;
        String originCountry = null;
        String destinationCountry = null;
        String departureTime = null;
        String arrivalTime = null;
        String departureDate = null;
        String returnDate = null;
        String airlineName = null;
        float price = 0;
        
       
        
        List <FlightTable> flights = new ArrayList<>();
        
        	while(rs.next()) {
        		flightID = rs.getInt("flightID");
        		aircraftName = rs.getNString("name");
        		originCountry  = rs.getNString("F.originCountry");
        		destinationCountry = rs.getNString("destinationCountry");
        		departureTime = ""+rs.getTime("departureTime");
        		arrivalTime = ""+rs.getTime("arrivalTime");
        		departureDate =""+ rs.getDate("departureDate");
        		returnDate =""+ rs.getDate("returnDate");
        		airlineName = rs.getNString("airlineName");
        		price = rs.getFloat("price");
        		
        		FlightTable availableFlight = new FlightTable(flightID,aircraftName,originCountry,
        				destinationCountry,departureTime,arrivalTime,departureDate,returnDate,airlineName,price);
        		
        		flights.add(availableFlight);
        	}
        
        connection.close();
        return flights;
    }
	
	
}
