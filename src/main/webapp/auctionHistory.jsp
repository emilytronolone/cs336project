<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction History</title>
</head>
<body>
<h2>Auction History</h2>

Submit the Serial Number of the item you would like to see the history for:

		<form action="auctionHistoryHandler.jsp" method="POST">
			<label for="serialNum">Serial Number:</label><br>
  			<input type="number" id="serialNum" name="serialNum"><br>
       
 OR
 </br>
Submit the username to view all auctions a specific buyer or seller has participated in </br>
			<label for="username">Username:</label><br>
  			<input type="text" id="username" name="username"><br>
  			
       		<input type="submit" value="Search"/>
     	</form>
     	
 <br/>
	<button onclick="document.location='homePage.jsp'" type = "button">Go to Home Page</button>
 
</body>
</html>