<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%
    if ((session.getAttribute("user") == null)) {
%>
	You are not logged in<br/>
	
	<a href="login.jsp">Please Login</a>
	
	<%} else {
	
	%>
	Welcome <%=session.getAttribute("user")%>!

	<button onclick="document.location='logout.jsp'" type="button">Log Out</button>

	<%
	    }
	%>