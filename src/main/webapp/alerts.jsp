<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*"  %>

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
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			
			//String searchSize = request.getParameter("size");
			//String searchColor = request.getParameter("color");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			Object userID = session.getAttribute("user");
			String str = "SELECT * FROM alerts WHERE username= '" + userID + "'"; 
			 
		
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
	
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