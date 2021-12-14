<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Read Share</title>
</head>
<body>
	<div class="container" style="margin-top:40px">
		<div >	
			<h1 style="color:purple">Book Club</h1>
			<h4  >A place for friends to share thoughts on books.</h4>
		</div>
		<br/>
		<div class="d-flex justify-content-around">	
			<div>
				<h1>Register</h1>
				<div class="shadow-lg p-3 mb-5 bg-body rounded">
					<form:form action="/register" method="post" modelAttribute="newUser">
					        <div class="form-group">
					            <label>Name:</label>
					            <form:input path="userName" class="form-control" />
					            <form:errors path="userName" class="text-danger" />
					        </div>
					        <div class="form-group">
					            <label>Email:</label>
					            <form:input path="email" class="form-control" />
					            <form:errors path="email" class="text-danger" />
					        </div>
					        <div class="form-group">
					            <label>Password:</label>
					            <form:password path="password" class="form-control" />
					            <form:errors path="password" class="text-danger" />
					        </div>
					        <div class="form-group">
					            <label>Confirm Password:</label>
					            <form:password path="confirm" class="form-control" />
					            <form:errors path="confirm" class="text-danger" />
					        </div>
					        <input type="submit" value="Register" class="btn btn-primary" />
					</form:form>
				</div>
				</div>		   
			    <div>
			    <h2>Login</h2>
				    <div class="shadow-lg p-3 mb-5 bg-body rounded">	
				    	<form:form action="/login" method="post" modelAttribute="newLogin">
					        <div class="form-group">
					        	<form:errors path="*"  class="text-danger"/>
					        	<br/>
					            <label>Email:</label>
					            <form:input path="email" class="form-control" />
					           
					        </div>
					        <div class="form-group">
					            <label>Password:</label>
					            <form:password path="password" class="form-control" />
					           
					        </div>
					        <input type="submit" value="Login" class="btn btn-success" />
				    	</form:form>
				    </div>
			  </div>
		   
		</div>
	 	
	    
	</div>
  

</body>
</html>