<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manual Bidding</title>
	</head>
	<body>

	<%
	try {

		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
	    ApplicationDB myDB = new ApplicationDB();
	    Connection con = myDB.getConnection();
		//Create a SQL statement
		Statement stmt = con.createStatement();

		String newNum = request.getParameter("serialNum");
		String newBid = request.getParameter("bid");
		Object userID = session.getAttribute("user");
		
		//Make an insert statement for the accounts table:
		String insert = "INSERT INTO bid(price, serialNumber, username)"
				+ "VALUES (?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		ResultSet boo = stmt.executeQuery("SELECT * FROM bid WHERE username= '" + userID + "' AND serialNumber = '" + newNum + "'");
		if (boo.next()) {
			String update = "UPDATE bid SET price = ? WHERE username= '" + userID + "' AND serialNumber = '" + newNum + "'";
			PreparedStatement ps2 = con.prepareStatement(update);
			
			//add parameters
			ps2.setString(1, newBid);
			ps2.executeUpdate();
		} else {
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			//ps.setString(1, "4");
			ps.setString(1, newBid);
			ps.setString(2, newNum);
			ps.setObject(3, userID);
			//Run the query against the DB
			ps.executeUpdate();
		}
		
		//check the bid table for lower bids  
		String getLowerBids = "SELECT username FROM bid WHERE serialNumber = '" + newNum + "' AND price < '" + newBid + "'";
		ResultSet lowBids = stmt.executeQuery(getLowerBids);
				
		// create alerts to let lower bidders know they've been outbid 
		while(lowBids.next()){
			String s = lowBids.getString("username");
			String insert2 = "INSERT INTO alerts(username, serialNumber, price, alertType) " 
			+ "VALUES (? , ? , ?, ?)";
			PreparedStatement ps2 = con.prepareStatement(insert2);
			//add parameters to query
			ps2.setString(1, s);
			ps2.setString(2, newNum);
			ps2.setObject(3, newBid);
			ps2.setString(4, "You have been outbid!");
			ps2.executeUpdate();
		}
				
		//check for other bids against this item
		ResultSet boo2 = stmt.executeQuery("SELECT * FROM bid WHERE username= '" + userID + "' AND serialNumber = '" + newNum + "'");
		if (boo2.next()) {
			String update = "UPDATE bid SET price = ? WHERE username= '" + userID + "' AND serialNumber = '" + newNum + "'";
			PreparedStatement ps2 = con.prepareStatement(update);
			
			//add parameters
			ps2.setString(1, newBid);
			ps2.executeUpdate();
		}
		
		//response.sendRedirect("login.jsp");
	
		
		
		//check for autobids against this item
		ResultSet autos = stmt.executeQuery("SELECT * FROM autobid WHERE serialNumber = '" + newNum + "'");
		//if there is an autobid for this item
		if(autos.next()){
			int highest = Integer.parseInt(autos.getString("highestBid"));
			int incr = Integer.parseInt(autos.getString("increment"));
			int bid = Integer.parseInt(newBid);
			//increment if possible 
			if(incr+bid < highest){
				String user = autos.getString("username");
				newBid = incr+bid+"";
				
				
				String update = "UPDATE bid SET price = ? WHERE username= '" + user + "' AND serialNumber = '" + newNum + "'";
				PreparedStatement ps2 = con.prepareStatement(update);
				//add parameters
				ps2.setString(1, newBid);
				ps2.executeUpdate();
				
				
				
				String updateauto = "UPDATE autobid SET currBid = ? WHERE username= '" + user + "' AND serialNumber = '" + newNum + "'";
				PreparedStatement ps4 = con.prepareStatement(update);
				//add parameters
				ps4.setString(1, newBid);
				ps4.executeUpdate();
				
				
				//check the bid table for lower bids  
				String getlow = "SELECT username FROM bid WHERE serialNumber = '" + newNum + "' AND price < '" + newBid + "'";
				ResultSet lowBids2 = stmt.executeQuery(getlow);
				// create alerts to let lower bidders know they've been outbid 
				while(lowBids2.next()){
					String s = lowBids2.getString("username");
					
					String insert2 = "INSERT INTO alerts(username, serialNumber, price, alertType) " 
							+ "VALUES (? , ? , ?, ?)";
						PreparedStatement ps3 = con.prepareStatement(insert2);
						//add parameters to query
						ps3.setString(1, s);
						ps3.setString(2, newNum);
						ps3.setObject(3, newBid);
						ps3.setString(4, "You have been outbid!");
						ps3.executeUpdate();
				}
			}
			
		}
		
		//update shoe table to reflect new price of product
		String updateShoes = "UPDATE shoes SET biddingPrice = ? WHERE serialNumber = '" + newNum + "'";
		PreparedStatement ps5 = con.prepareStatement(updateShoes);
		ps5.setString(1, newBid);
		ps5.executeUpdate();
	

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Bid successfully submitted!");
		
		//notify them if there are any bids higher than theirs now
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error");
	}
%>


		<button onclick="document.location='homePage.jsp'" type="button">Back to Home</button>



	</body>
</html>