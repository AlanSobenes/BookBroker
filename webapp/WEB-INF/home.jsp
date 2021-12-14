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
				 <h2 class="shadow p-3 mb-5 bg-body rounded text-info">Welcome, <c:out value="${name }"></c:out></h2>
				 <h5>Books from everyones shelves:</h5>
			</div>
			<div>
				<a href="/logout" ><button class="btn btn-primary">Logout</button></a>
				<br />	
				<br />
				<a href="/bookBroker" ><button class="btn btn-warning">Book Market</button></a>
				<br />
				<br />
				<a href="/addBook" ><button class="btn btn-success">+ Add to my shelf!</button></a>
			</div>
		</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Title</th>
						<th scope="col">Author Name</th>	
						<th scope="col">Posted By</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allBooks }" var="book">
						<tr>
							<td><c:out value="${book.id }"/></td>
							<td><a href="/${book.id }/show"><c:out value="${book.title }"/></a></td>
							<td><c:out value="${book.author_name }"/></td>
							<td><c:out value="${book.user.getUserName() }"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		
		</div>
	</div>
	

</body>
</html>