<%@ page import ="java.sql.*" %>
<%@ page import="com.cs336.pkg.*"  %>

<% 
//find out if an auction is over


	//connect to the database
    ApplicationDB myDB = new ApplicationDB();
    Connection con = myDB.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs;
    
    
    ResultSet now = st.executeQuery("SELECT NOW()");
    String nowTime = now.toString();
    
    //pull the data pertaining to the active auctions 
    rs = st.executeQuery("select * from shoes");
    while(rs.next()){
    	String endauction = rs.getString("endi");
    	String number = rs.getString("serialNumber");
    	
    	//if the endauction time has passed
    	if (endauction gt nowTime) {
			//check to see who won the auction
    		ResultSet boo = stmt.executeQuery("SELECT * FROM bid WHERE price = (SELECT MAX price FROM bid WHERE serialNumber = '" + number + "')");
			
			boo.next();
			String winner = boo.getString("username");
			String finalCost = boo.getString("price");
			
			
			//alert the winner that they have won the auction
			String alertWinner = "INSERT INTO alerts(username, serialNumber, price, alertType) " 
					+ "VALUES (? , ? , ?, ?)";
			
			PreparedStatement ps3 = con.prepareStatement(insert2);
			//add parameters to query
			ps3.setString(1, winner);
			ps3.setString(2, newNum);
			ps3.setObject(3, number);
			ps3.setString(4, "You have won the auction!");
			ps3.executeUpdate();
			
			
			//delete the auction from the shoes table
			String deleteAuction = "DELETE FROM shoes WHERE serialNumber = '" + number + "'";
			stmt.executeQuery(deleteAuction);
			
			
    	}
			
			
    }
    
    
    
    
	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	con.close();
	out.print("Bid successfully submitted!");
    
    
    %>