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

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//ps.setString(1, "4");
		ps.setString(1, newBid);
		ps.setString(2, newNum);
		ps.setObject(3, userID);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		
		//response.sendRedirect("login.jsp");
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Bid successfully submitted!");
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error");
	}
%>


		<button onclick="document.location='homePage.jsp'" type="button">Back to Home</button>



	</body>
</html>