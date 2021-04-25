<%@ page import ="java.sql.*" %>
<%@ page import="com.cs336.pkg.*"  %>

<% 
//find out if an auction is over


	//connect to the database
    ApplicationDB myDB = new ApplicationDB();
    Connection con = myDB.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs;
    
    //get all instances of shoe auctions that have ended
    rs = st.executeQuery("SELECT * FROM shoes WHERE DATEDIFF(CURRENT_TIMESTAMP, endi) > 0");
    while(rs.next()){
    	String endauction = rs.getString("endi");
    	String number = rs.getString("serialNumber");
    	
    	
			//check to see who won the auction
    		ResultSet boo = st.executeQuery("SELECT * FROM bid WHERE price = (SELECT MAX price FROM bid WHERE serialNumber = '" + number + "')");
			
			boo.next();
			String winner = boo.getString("username");
			String finalCost = boo.getString("price");
			
			//check to see if reserve price was met 
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
    
    
    
    
	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	con.close();
	out.print("Bid successfully submitted!");
    
    
    %>