<%@ page import ="java.sql.*" %>
<%@ page import="com.cs336.pkg.*"  %>

<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String accType = request.getParameter("type");
    Class.forName("com.mysql.jdbc.Driver");
    
    ApplicationDB myDB = new ApplicationDB();
    
    Connection con = myDB.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs;
  
    rs = st.executeQuery("select * from account where username='" + userid + "' and password='" + pwd+ "'and type='" + accType + "' ");
    
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    }

    	else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>