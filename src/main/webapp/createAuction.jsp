<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Create Auction</title>
	</head>
	<body>
		<form action="auctionHandler.jsp" method="POST">
			<label for="size">Size:</label><br>
  			<input type="number" id="size" name="size" step=".5"><br>
  			
  			<label for="color">Color:</label><br>
  			<input type="text" id="color" name="color"><br>
  			
  			<label for="demographic">Demographic:</label><br>
  			<input type="text" id="demographic" name="demographic"><br>
  			
  			<label for="style">Style:</label><br>
  			<input type="text" id="style" name="style"><br>
  			
  			<label for="reserve">Reserve Price:</label><br>
  			<input type="number" id="reserve" name="reserve" step=".01"><br>
  			
  			<!--<label for="end">Auction End:</label><br>-->
  			<!--<input type="date" id="end" name="end"><br>-->
  		
  			<input type="submit" value="Post">
		</form>
	</body>
</html>