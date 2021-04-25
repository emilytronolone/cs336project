<%@ page import ="java.sql.*" %>
<%@ page import="com.cs336.pkg.*"  %>

<% 
//find out if an auction is over


	//connect to the database
    ApplicationDB myDB = new ApplicationDB();
    Connection con = myDB.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs;
    
    //pull the data pertaining to the active auctions 
    rs = st.executeQuery("select * from shoes");
    while(rs.next()){
    	String time = rs.getString("endi");
    	
    	
    }
    
    
    
    
	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	con.close();
	out.print("Bid successfully submitted!");
    
    
    %>