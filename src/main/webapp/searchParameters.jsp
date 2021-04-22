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
			String entity = request.getParameter("size");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM shoes WHERE size = " + entity;
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Item");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Serial Number");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Info");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Bidding Price");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Buy-It-Now Price");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print("placeholder");
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("serialNumber"));
				out.print("</td>");
				out.print("<td>");
				
				out.print("Size: " + result.getString("size") + " ");
				out.println("Color: " + result.getString("color")+ " ");
				out.println("Demographic: "+ result.getString("demographic")+ " ");
				out.println("Style: "+ result.getString("style")+ " ");
				out.println("    ");
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("biddingPrice"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("buyItNowPrice"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
		
			
		%>
	
	<% } %>
</body>
</html>