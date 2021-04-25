<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*"%>


<!DOCTYPE html>
<html>
<head>
    <title>Alerts</title>
</head>
<body>
    <% if(session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       } else { %>
       
		<%	
		List<String> list = new ArrayList<String>();
		
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement st = con.createStatement();

			
		    //get all instances of shoe auctions that have ended
		    ResultSet rs = st.executeQuery("SELECT * FROM shoes WHERE DATEDIFF(CURRENT_TIMESTAMP, endi) > 0");
		    while (rs.next()) {
		    	
		    	String endauction = rs.getString("endi");
		    	String number = rs.getString("serialNumber");
		    	
				//check to see who won the auction
				ResultSet boo = st.executeQuery("SELECT * FROM bid WHERE price = (SELECT MAX(price) FROM bid) AND serialNumber = '" + number + "'");	
	    		
				
				if (boo.next()) {
					String winner = boo.getString("username");
					String finalCost = boo.getString("price");
					ResultSet reservePrice = st.executeQuery("SELECT * FROM shoes WHERE serialNumber = '" + number + "'");
					reservePrice.next();
					String reserve = reservePrice.getString("reserve");
					int res = Integer.parseInt(reserve);
					int fin = Integer.parseInt(finalCost);
					
					if (res<fin){
						//alert the winner of the auction if the reserve price was met otherwise move on
						String alertWinner = "INSERT INTO alerts(username, serialNumber, price, alertType) " 
								+ "VALUES (? , ? , ?, ?)";
						
						PreparedStatement ps3 = con.prepareStatement(alertWinner);
						//add parameters to query
						ps3.setString(1, winner);
						ps3.setString(2, number);
						ps3.setObject(3, finalCost);
						ps3.setString(4, "You have won the auction!");
						ps3.executeUpdate();
						
						
						//delete the auction from the shoes table
						String deleteAuction = "DELETE FROM shoes WHERE serialNumber = '" + number + "'";
						st.executeQuery(deleteAuction);
					}
				}
				break;
		    }
		    
		   
			
			Object userID = session.getAttribute("user");
			String str = "SELECT * FROM alerts WHERE username= '" + userID + "'"; 
			//Run the query against the database.
			ResultSet result = st.executeQuery(str);
	
			if (result.next()) { %>
			<h2>Your alerts:</h2>
			<table>
				<tr>
					<th>Serial Number</th>
					<th>Shoe Price</th>
					<th>Message</th>
					
				</tr>
		<%	do { %>
				<tr>
					<td><%= result.getString("serialNumber") %></td>
					<td>$<%= result.getString("price") %></td>
					<td><%= result.getString("alertType") %></td>
				</tr>
		<%	} while (result.next()); %> 
			</table>
	<%	} else { %>
			<h2>No alerts.</h2>
	<%	}
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
		
			
		%>
	
	<% } %>
</body>
</html>