<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Login Form</title>
   </head>
   <header>
   	<h1> Login </h1>
   </header>
   <body>
     <form action="checkLoginDetails.jsp" method="POST">
     
     Select account type:
      <select name="type" id="type">
      	<option value="customer">Customer</option>
     	<option value="admin">Admin</option>
      	<option value="customRep">Customer Representative</option>
  	 </select>
     <br> </br>
     
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Login"/>
     </form>
   </body>
</html>