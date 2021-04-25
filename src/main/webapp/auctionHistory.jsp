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

Submit the Serial Number of the shoe you would like to see the history for:

		<form action="auctionHistoryHandler.jsp" method="POST">
			<label for="serialNum">Serial Number:</label><br>
  			<input type="number" id="serialNum" name="serialNum"><br>
  			
       
       		<input type="submit" value="Search"/>
     	</form>
     	
 <br/>
	<button onclick="document.location='homePage.jsp'" type = "button">Go to Home Page</button>
 
</body>
</html>