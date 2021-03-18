<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	session.invalidate();

%>
	You have logged out<br/>

<button onclick="document.location='login.jsp'" type="button">Log back in</button>

