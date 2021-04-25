<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>

	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//get parameters from the html form at bidPage
		String highBid = request.getParameter("HighBid");
		String currBid = request.getParameter("CurrentBid");
		String incr = request.getParameter("increment");
		Object userID = session.getAttribute("user");
		String shoeID = request.getParameter("serialNumber");
	
		
		//Make an insert statement for the autobid table:
		String insert = "INSERT INTO autobid(currBid, highestBid, increment, username, serialNumber) "
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, currBid);
		ps.setString(2, highBid);
		ps.setString(3, incr);
		ps.setObject(4, userID);
		ps.setString(5, shoeID);
		//Run set query against the DB
		ps.executeUpdate();
		
    
		//if the autobid already exists in the bid table, just update it, if not then create a bid for this 
		ResultSet boo = stmt.executeQuery("SELECT * FROM bid WHERE username= '" + userID + "' AND serialNumber = '" + shoeID + "'");
		if (boo.next()) {
			String update = "UPDATE bid SET price = ? WHERE username= '" + userID + "' AND serialNumber = '" + shoeID + "'";
			PreparedStatement ps2 = con.prepareStatement(update);
			
			//add parameters
			ps2.setString(1, currBid);
			ps2.executeUpdate();
		}
		else {
			
			String insert2 = "INSERT INTO bid(price, serialNumber, username) " 
				+ "VALUES (? , ? , ?)";
			
			PreparedStatement ps2 = con.prepareStatement(insert2);
			
			//add parameters to query
			ps2.setString(1, currBid);
			ps2.setString(2, shoeID);
			ps2.setObject(3, userID);
			
			ps2.executeUpdate();
			
		}
		
		//check the bid table for lower bids  
		String getLowerBids = "SELECT username FROM bid WHERE serialNumber = '" + shoeID + "' AND price < '" + currBid + "'";
		ResultSet lowBids = stmt.executeQuery(getLowerBids);
				
		// create alerts to let lower bidders know they've been outbid 
		while(lowBids.next()){
			String s = lowBids.getString("username");
			
			String insert2 = "INSERT INTO alerts(username, serialNumber, price) " 
					+ "VALUES (? , ? , ?)";
				PreparedStatement ps2 = con.prepareStatement(insert2);
				//add parameters to query
				ps2.setString(1, s);
				ps2.setString(2, shoeID);
				ps2.setObject(3, currBid);
				ps2.executeUpdate();
		}
		
		//check for other autobids against this item
		ResultSet boo = stmt.executeQuery("SELECT * FROM bid WHERE username= '" + userID + "' AND serialNumber = '" + shoeID + "'");
		if (boo.next()) {
			String update = "UPDATE bid SET price = ? WHERE username= '" + userID + "' AND serialNumber = '" + shoeID + "'";
			PreparedStatement ps2 = con.prepareStatement(update);
			
			//add parameters
			ps2.setString(1, currBid);
			ps2.executeUpdate();
		}
		
		
		
		
				
		//close the connection
		con.close();
		out.print("Autobid successfully posted!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
	
	%>
	<button onclick="document.location='homePage.jsp'" type="button">Back to Home</button>