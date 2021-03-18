<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
	<head>
    	<title>Register Page</title>
	</head>
	<header>
		<h1> Register </h1>
	</header>
	<body>
    	<div class="information">
        <form action="registerHandler.jsp" method="POST">  
            <label for="username">Create Username: </label>
            <input type="text" name="username" id="username" placeholder="Username"> <br>
    
            <label>Create Password: </label>
            <input type="password" name="password" placeholder="Password"> <br>
    
            <label>Confirm Password: </label>
            <input type="password" name="confirm_password" placeholder="Confirm Password"> <br>
    
            <input type="submit" value="Register">
        </form>
    </div>
	
	</body>
</html>