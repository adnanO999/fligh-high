package com.databasetables;

import java.util.Date;

public class FlightTable {
	private int flightID;
	private String aircraftName;
	private String airlineName;
	private String originCountry;
	private String destinationCountry;
    private String departureTime;
    private String arrivalTime;
    private String departureDate;
    private String returnDate;
    private float price;
   
    
   
    public FlightTable(int flightID, String aircraftName, String originCountry, String destinationCountry,
			String departureTime, String arrivalTime, String departureDate, String returnDate, String airlineName,float price) {
		super();
		this.flightID = flightID;
		this.aircraftName = aircraftName;
		this.originCountry = originCountry;
		this.destinationCountry = destinationCountry;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.departureDate = departureDate;
		this.returnDate = returnDate;
		this.airlineName = airlineName;
		this.price = price;
	}
	
	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public FlightTable() {
		
	}

	public String getAirlineName() {
		return airlineName;
	}

	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}

	public int getFlightID() {
		return flightID;
	}
	public void setFlightID(int flightID) {
		this.flightID = flightID;
	}
	public String getAircraftName() {
		return aircraftName;
	}
	public void setAircraftName(String aircraftName) {
		this.aircraftName = aircraftName;
	}
	public String getOriginCountry() {
		return originCountry;
	}
	public void setOriginCountry(String originCountry) {
		this.originCountry = originCountry;
	}
	public String getDestinationCountry() {
		return destinationCountry;
	}
	public void setDestinationCountry(String destinationCountry) {
		this.destinationCountry = destinationCountry;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String arrivalDate) {
		this.returnDate = arrivalDate;
	}
	@Override
	public String toString() {
		return "Flight [flightID=" + flightID + ", aircraftName=" + aircraftName + ", originCountry="
				+ originCountry + ", destinationCountry=" + destinationCountry + ", departureTime=" + departureTime
				+ ", arrivalTime=" + arrivalTime + ", departureDate=" + departureDate + ", returnDate=" + returnDate
				+ ", airlineName=" + airlineName + "]";
	}
}
