<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Create Customer Rep Account</title>
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


		String newUsername = request.getParameter("username");   
		String newPassword = request.getParameter("password");
		String type = "customerRepresentative";

		
		//Make an insert statement for the accounts table:
		String insert = "INSERT INTO account(username, password, type)"
				+ "VALUES (?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newUsername);
		ps.setString(2, newPassword);
		ps.setString(3, type);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		
		//response.sendRedirect("login.jsp");
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Account successfully registered!");
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>


<button onclick="document.location='login.jsp'" type="button">Log in</button>



	</body>
</html>