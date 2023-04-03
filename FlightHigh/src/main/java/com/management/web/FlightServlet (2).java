//package com.management.web;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.databasetables.FlightTable;
//import com.sqlQueries.QueryFlight;
//
///**
// * Servlet implementation class FlightServlet
// */
//@WebServlet("/")
//public class FlightServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	private FlightTable fligthDAO;
//    
//    public FlightServlet() {
//        this.fligthDAO = new FlightTable();
//    }
//
//	
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		this.doGet(request, response);
//	}
//
//    
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String action = request.getServletPath();
////		try {
////			listFlights(request,response);
////		} catch (Exception e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
//		if(action.equals("showAvailableFlights")){
//			try {
//				listFlights(request,response);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		
//	}
//	
//	public static void listFlights(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		String orgCountry = request.getParameter("orgCountry");
//		String destCountry = request.getParameter("destCountry");
//		String returnDate = request.getParameter("returnDate");
//		String departureDate = request.getParameter("departureDate");
//		
//		//System.out.println(returnDate);//mm/dd/yyyy
//		//System.out.println(departureDate);
//		//String parsedretDate = GeneralFunctions.parseDate(returnDate);
//		//String parseddeptDate = GeneralFunctions.parseDate(departureDate);
//		
//		List <FlightTable> availableFlights = QueryFlight.checkFlight(orgCountry,destCountry,"2022-09-04","2022-10-04");
//		request.setAttribute("listFlights", availableFlights);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("Test.jsp");
//		dispatcher.forward(request, response);
//		
//	}
//
//	
//	
//}
