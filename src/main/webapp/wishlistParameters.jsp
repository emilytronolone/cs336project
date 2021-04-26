<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Successfully added!</title>
</head>
<body>


       
		<%	
		
		try {
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			
			String wLSize = request.getParameter("size");   
    		String wLColor = request.getParameter("color");
   	 		String wLStyle = request.getParameter("style");
   	 		String wLDemo = request.getParameter("demographic");
			
			String insert = "INSERT INTO wishList(size, color, style, demographic)" 
							+ "VALUES (?, ?, ?, ?)"; 
			 
		
			PreparedStatement ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, wLSize);
			ps.setString(2, wLColor);
			ps.setString(3, wLStyle);
			ps.setString(4, wLDemo);
			//Run the query against the DB
			ps.executeUpdate();
			//Run the query against the DB
			
			
			//response.sendRedirect("login.jsp");
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			out.print("Your wish list has been updated! You will receive a notification when this item becomes available.");
			
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
	%>

	
	<br/>
	<button onclick="document.location='homePage.jsp'" type = "button">Go to Home Page</button>

</body>
</html>