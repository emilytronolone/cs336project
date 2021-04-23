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
		Class.forName("com.mysql.jdbc.Driver");
	    ApplicationDB myDB = new ApplicationDB();
	    Connection con = myDB.getConnection();
		//Create a SQL statement
		Statement stmt = con.createStatement();

		String newSize = request.getParameter("size");
		String newColor = request.getParameter("color");
		String newDemo = request.getParameter("demographic");
		String newStyle = request.getParameter("style");
		String newReserve = request.getParameter("reserve");
		//String newEndDate = request.getParameter("end");
		
		//Make an insert statement for the accounts table:
		String insert = "INSERT INTO shoes(serialNumber, biddingPrice, reserve, size, color, demographic, style)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, "4");
		ps.setString(2, "0");
		ps.setString(3, newReserve);
		ps.setString(4, newSize);
		ps.setString(5, newColor);
		ps.setString(6, newDemo);
		ps.setString(7, newStyle);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		
		//response.sendRedirect("login.jsp");
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Item successfully posted!");
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>


<!-- <button onclick="document.location='login.jsp'" type="button">Log in</button> -->



	</body>
</html>