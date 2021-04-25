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
    		ResultSet boo = stmt.executeQuery("SELECT MAX * FROM bid WHERE serialNumber = '" + number + "'"); 
			
    	}
			
			
    }
    
    
    
    
	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	con.close();
	out.print("Bid successfully submitted!");
    
    
    %>