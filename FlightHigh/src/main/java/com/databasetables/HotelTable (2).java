package com.databasetables;

public class HotelTable {
	private int hotelID;
	private String name;
	private String location;
	private int starRating;
	
	
	public HotelTable() {
		
	}
	
	public HotelTable(int hotelID, String name, String location, int starRating) {
		super();
		this.hotelID = hotelID;
		this.name = name;
		this.location = location;
		this.starRating = starRating;
	}

	
	public int getHotelID() {
		return hotelID;
	}
	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getStarRating() {
		return starRating;
	}
	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}
	@Override
	public String toString() {
		return "HotelTable [hotelID=" + hotelID + ", name=" + name + ", location=" + location + ", starRating="
				+ starRating + "]";
	}
	
	
}
