
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
   <head>
      <title>Bid On Item</title>
   </head>
   <header>
   	<h1> Enter Your AutoBid for This Item </h1>
   </header>
   <body>
     <form action="enterBidDetails.jsp" method="POST">
     
       Bid: <input type="number" name="CurrentBid"/> <br/>
       HighLimit:<input type="number" name="HighBid"/> <br/>
       <input type="submit" value="Login"/>
     </form>
   </body>
</html>
    