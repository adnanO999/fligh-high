package com.databasetables;

public class DutyfreeTable {
	int dutyfreeID;
	int airportID;
	String location;
	String airportName;
	
	public DutyfreeTable() {}
	
	
	public DutyfreeTable(int dutyfreeID, int airportID, String location, String airportName) {
		super();
		this.dutyfreeID = dutyfreeID;
		this.airportID = airportID;
		this.location = location;
		this.airportName = airportName;
	}


	public int getDutyfreeID() {
		return dutyfreeID;
	}
	public void setDutyfreeID(int dutyfreeID) {
		this.dutyfreeID = dutyfreeID;
	}
	public int getAirportID() {
		return airportID;
	}
	public void setAirportID(int airportID) {
		this.airportID = airportID;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAirportName() {
		return airportName;
	}

	public void setAirportName(String airportName) {
		this.airportName = airportName;
	}

	@Override
	public String toString() {
		return "DutyfreeTable [dutyfreeID=" + dutyfreeID + ", airportID=" + airportID + ", location=" + location
				+ ", airportName=" + airportName + "]";
	}

	
	
	

}
