<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manual Bidding</title>
	</head>
	<body>
		<form action="manBidHandler.jsp" method="POST">
			<label for="serialNum">Serial Number:</label><br>
  			<input type="number" id="serialNum" name="serialNum"><br>
  			
  			<label for="bid">Bid:</label><br>
  			<input type="number" id="bid" name="bid"><br>
       
       		<input type="submit" value="Submit Bid"/>
     	</form>
	</body>
</html>