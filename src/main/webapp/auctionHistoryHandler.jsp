<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*"  %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Auction History</title>
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
			
			String requestedSerialNum = request.getParameter("serialNum");
			//String searchColor = request.getParameter("color");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM bid WHERE serialNumber = " + requestedSerialNum; 
			 
		
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
	
			if (result.next()) { %>
			<h2>Search Results:</h2>
			<table>
				<tr>
					<th>Price</th>
					<th>Username</th>
				</tr>
		<%	do { %>
				<tr>
					<td>$<%= result.getString("price") %> </td>
					<td><%= result.getString("username") %></td>
				</tr>
		<%	} while (result.next()); %> 
			</table>
	<%	} else { %>
			<h2>No results matching your serial number.</h2>
	<%	}
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
		
			
		%>
	
	<% } %>

		</br>
		<button onclick="document.location='homePage.jsp'" type="button">Back to Home</button>



	</body>
</html>