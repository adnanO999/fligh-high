package com.sqlQueries;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.databasetables.FlightTable;
import com.databasetables.HotelTable;

public class QueryHotel {
public static List checkHotels(HotelTable hotel) throws Exception {
	 
		
		String location = hotel.getLocation();
		
        Connection connection = JDBCconnection.CreateConnection();
        PreparedStatement selectstatement ;
        ResultSet rs = null;
        
        String selectsql = "SELECT name,location,starRating FROM nearbyhotel"
        		+ " WHERE location =?";
        

        selectstatement = connection.prepareStatement(selectsql);
        selectstatement.setString(1,location);
        rs = selectstatement.executeQuery();
       
        String hotelName = null;
        String hotelLocation = null;
        int hotelRating = 0;
        
        List <HotelTable> hotels = new ArrayList<>();
        
        	while(rs.next()) {
        		hotelName = rs.getString("name");
        		hotelLocation = rs.getNString("location");
        		hotelRating  = rs.getInt("starRating");
        		
        		HotelTable availableHotel = new HotelTable(0,hotelName,hotelLocation,hotelRating);
        		hotels.add(availableHotel);
        	
        	}
        
        connection.close();
        return hotels;
    }
}
