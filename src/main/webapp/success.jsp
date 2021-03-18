<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%
    if ((session.getAttribute("user") == null)) {
%>
	You are not logged in<br/>
	<a href="login.jsp">Please Login</a>
	
	<%} else {
	
	%>
	Welcome <%=session.getAttribute("user")%>  //this will display the username that is stored in the session.
	<a href='logout.jsp'>Log out</a>
	<%
	    }
	%>