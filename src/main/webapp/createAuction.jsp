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
			<label for="size">Size</label>
				<select name="size" id="size">
					<option value="" disabled selected hidden="true">Select	size</option>
					<option value="1">1</option>
					<option value="1.5">1.5</option>
					<option value="2">2</option>
					<option value="2.5">2.5</option>
					<option value="3">3</option>
					<option value="3.5">3.5</option>
					<option value="4">4</option>
					<option value="4.5">4.5</option>
					<option value="5">5</option>
					<option value="5.5">5.5</option>
					<option value="6">6</option>
					<option value="6.5">6.5</option>
					<option value="7">7</option>
					<option value="7.5">7.5</option>
					<option value="8">8</option>
					<option value="8.5">8.5</option>
					<option value="9">9</option>
					<option value="9.5">9.5</option>
					<option value="10">10</option>
					<option value="10.5">10.5</option>
					<option value="11">11</option>
					<option value="11.5">11.5</option>
					<option value="12">12</option>
					<option value="12.5">12.5</option>
					<option value="13">13</option>
				</select> <br> 
				
				<label for="color">Color</label>
				<select name="color" id="color">
					<option value="" disabled selected hidden="true">Select	color</option>
					<option value="red">Red</option>
					<option value="orange">Orange</option>
					<option value="yellow">Yellow</option>
					<option value="green">Green</option>
					<option value="blue">Blue</option>
					<option value="white">White</option>
					<option value="black">Black</option>
					<option value="brown">Brown</option>
				</select> <br> 
			
				<label for="style">Style</label> 
				<select name="style" id="style">
					<option value="" disabled selected hidden="true">Select style</option>
					<option value="Boots">Boots</option>
					<option value="Heels">Heels</option>
					<option value="Flats">Flats</option>
					<option value="Loafers">Loafers</option>
					<option value="Sneakers">Sneakers</option>
					<option value="Sandals">Sandals</option>
				</select> <br>

				<label for="demographic">Demographic</label> 
				<select name="demographic" id="demographic">
					<option value="" disabled selected hidden="true">Select demographic</option>
					<option value="men">Men's</option>
					<option value="women">Women's</option>
					<option value="child">Children's</option>
				</select> <br>
  			
  				<label for="reserve">Reserve Price:</label><br>
  				<input type="number" id="reserve" name="reserve" step=".01"><br>
  			
  			<!--<label for="end">Auction End:</label><br>-->
  			<!--<input type="date" id="end" name="end"><br>-->
  		
  			<input type="submit" value="Post">
		</form>
	</body>
</html>