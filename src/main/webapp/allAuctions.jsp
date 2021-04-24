<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*"  %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
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
			
			String searchSize = request.getParameter("size");
			//String searchColor = request.getParameter("color");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM shoes"; 
			 
		
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
	
			if (result.next()) { %>
			<h2>Search Results:</h2>
			<table>
				<tr>
					<th>Item</th>
					<th>Size</th>
					<th>Color</th>
					<th>Demographic</th>
					<th>Style</th>
					<th>Bidding Price</th>
					<th>End Date/Time</th>
				</tr>
		<%	do { %>
				<tr>
					<td text-align: left> <%= result.getString("serialNumber") %> </td>
					<td><%= result.getString("size") %></td>
					<td><%= result.getString("color") %></td>
					<td><%= result.getString("demographic") %></td>
					<td><%= result.getString("style") %></td>
					<td>$<%= result.getString("biddingPrice") %></td>
					<td><%= result.getString("end") %></td>
				</tr>
		<%	} while (result.next()); %> 
			</table>
	<%	} else { %>
			<h2>No results matching your search parameters.</h2>
	<%	}
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
		
			
		%>
	
	<% } %>
</body>
</html>