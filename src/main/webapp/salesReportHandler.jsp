<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
	</head>
</html>	
	<%
	String reportType = request.getParameter("type");
    if (reportType.equals("totalEarnings")) {
	%>
		<h2>Sales Report:</h2>
		<h2>Total Earnings: $810</h2>
		    		
	
	<%} else if(reportType.equals("earningsPerItem")) {
		
	
	%>
	<h2>Total Items Sold: 10:</h2>
		<h2>Earnings per item: $8.10</h2>

	<%} else if(reportType.equals("earningsPerItemType")) {

		%>
		<h2>Heels: $80</h2>
	<h2>Sandals: $480 </h2>
	<h2>Sneakers: $250</h2>
	
	<%} else if(reportType.equals("earningsPerEndUser")) {
		
	
	%>
	<h2>Alyssa: $56</h2>
	<h2>Chris: $480 </h2>
	<h2>Emily: $24</h2>
	<h2>Tom: $250</h2>
	
	<%} else if(reportType.equals("bestSelling")) {
		
	
	%>
	<h2>Best Selling Item: Sneakers</h2>
		
	
	<%} else if(reportType.equals("bestBuyers")) {
		
	
	%>
	<h2>Top Buyer: Chris</h2>
		
	<%
	    }
	%> 
	