<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 30px">
		<div class=" d-flex justify-content-around " >
			<div>
				 <h2 class="shadow p-3 mb-5 bg-body rounded text-info">Change your Entry</h2>
				 
			</div>
			<div>
				<a href="/home" ><button class="btn btn-primary">Back to the Shelves</button></a>
			</div>
		</div>
		<div class="form-group">
			<form:form action="/${book.id }/editTheBook" method="post" modelAttribute="book">
				<input type="hidden" name="_method" value="put" />
			 
			  <form:input type="hidden" path="user" value="${user_id }" />
			  
				<p>
			       <form:label path="title" class="text-info">Title:</form:label>
			       <form:errors path="title" class="text-danger"/>
			       <form:input path="title" class="form-control"/>
			   </p>
			   <p>
			       <form:label path="author_name" class="text-info">Author:</form:label>
			       <form:errors path="author_name" class="text-danger"/>
			       <form:input path="author_name" class="form-control"/>
			   </p>
			   <p>
			       <form:label path="thoughts" class="text-info">My Thoughts:</form:label>
			       <form:errors path="thoughts" class="text-danger"/>
			       <form:input  path="thoughts" class="form-control"/>
			   </p>
			    <p style="display:flex; justify-content:end">
			   		<input type="submit" class="btn btn-outline-info">
			   </p>
			</form:form> 
		</div> 
	</div>
		  

</body>
</html>