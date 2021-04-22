<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//get parameters from the html form at bidPage
		float highBid = request.getParameter("HighBid");
		float currBid = request.getParamerter("CurrentBid");
		float increment = request.getParamteter("increment");
		String userID = request.getParameter("username");
		float shoeID = request.getParameter("shoeID");
	
		
		//Make an insert statement for the accounts table:
		String insert = "INSERT INTO autobid(currBid, highestBid, increment, username, serialNumber "
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setFloat(1, currBid);
		ps.setFloat(2, highBid);
		ps.setFloat(3, increment);
		ps.setString(4, userID);
		ps.setFloat(5, shoeID);
		//Run set query against the DB
		ps.executeUpdate();
		
		//close the connection
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
	 
