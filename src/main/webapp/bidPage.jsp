
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
     <form action="submitBid.jsp" method="POST">
     
       Bid: <input type="number" name="CurrentBid"/> <br/>
       HighLimit:<input type="number" name="HighBid"/> <br/>
       Increment: <input type="number" name="increment"/> <br/>
       Serial Number of Shoe:<input type="number" name="serialNumber"/> <br/>
       
       <input type="submit" value="Submit Bid"/>
     </form>
   </body>
</html>
    