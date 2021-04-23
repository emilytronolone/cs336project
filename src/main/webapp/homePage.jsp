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
    if ((session.getAttribute("user") == null)) {
	%>
		You are not logged in<br/>
	
	<a href="login.jsp">Please Login</a>
	
	<%} else {
	
	%>
	<header> 
		<h1> Hello, <%=session.getAttribute("user")%>! </h1>
	</header>

	<%
	    }
	%> 
	</br>
    <li><a href="">Browse All Shoes</a></li> <!--  browse shoes -->
    <li><a href="search.jsp">Search Shoes</a></li>
	<li><a href="createAuction.jsp">Create Auction</a></li>
	<li><a href="">Check Alerts</a></li>