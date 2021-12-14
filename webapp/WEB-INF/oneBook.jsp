<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Read Share</title>
</head>
<body>
	<div class="container" style="margin-top:30px">
		<div class=" d-flex justify-content-around " >
			<div>
				 <h2 class="shadow p-3 mb-5 bg-body rounded text-info"><c:out value="${book.title }"/></h2>
				 
			</div>
			<div>
				<a href="/bookBroker" ><button class="btn btn-warning">Book Market</button></a>
				<br />
				<br />
				<a href="/home" ><button class="btn btn-primary">Back to the Shelves</button></a>
			</div>
			
			
		</div>
		<div>
			
				<c:if test="${user.id != book.user.id }">
		 			<h4><span class="text-danger"><c:out value="${book.user.getUserName() }" /> </span> read <span class="text-warning"><c:out value="${book.title }"/></span> by <span class="text-success"><c:out value="${book.author_name }"/></span> </h4>
					<br />
					<h5>Here are <c:out value="${book.user.getUserName() }'s"/> thoughts:</h5>	 		
		 		</c:if>
		 		<c:if test="${user.id == book.user.id }">	
		 			<h4>You have read <span class="text-warning"><c:out value="${book.title }"/></span> by <span class="text-success"><c:out value="${book.author_name }"/></span> </h4>
		 			<br />
					<h5>Here are Your thoughts:</h5>
		 		</c:if>
			<hr />
				<p><c:out value="${book.thoughts }"/></p>
			<hr />
			
				<c:if test="${user.id == book.user.id }">
					<div  class="d-flex bd-highlight" style="justify-content:end">
						<a href="/${book.id }/editBook" style="margin-right: 10px"><button class="btn btn-warning" >edit</button></a>
						<form action="/${book.id}/deleteBook" method="post">
					    	<input type="hidden" name="_method" value="delete">
					    	<input type="submit" value="Delete" class="btn btn-outline-danger">
						</form>
						
						
					</div>
					
				</c:if>
		</div>
		
	</div>

</body>
</html>