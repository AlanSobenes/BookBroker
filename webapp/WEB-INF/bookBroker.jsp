<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Book Lender Dashboard</title>
</head>
<body>
<div class="container" style="margin-top:30px">
		<div class=" d-flex justify-content-around " >
			<div>
				 <h4 class="shadow p-3 mb-5 bg-body rounded text-info">Hello <c:out value="${user.userName}"/>. Welcome, to... </h4>
				 <h1 class="shadow p-3 mb-5 bg-body rounded text-info" style="margin-top:-30px">The Book Broker!</h1>
			</div>
			<div>
				<a href="/logout" ><button class="btn btn-primary">Logout</button></a>
				<br />	
				<br />
				<br />
				<br />
				<a href="/home" ><button class="btn btn-primary">Back to the Shelves</button></a>
			</div>
		</div>
		<h5>Available Books to Borrow</h5>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Title</th>
						<th scope="col">Author Name</th>	
						<th scope="col">Owner</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allBooks }" var="book">
						<tr>
							<td><c:out value="${book.id }"/></td>
							<td><a href="/${book.id }/show"><c:out value="${book.title }"/></a></td>
							<td><c:out value="${book.author_name }"/></td>
							<td><c:out value="${book.user.getUserName() }"/></td>
							<td style="display:flex">
								<c:if test="${user.id == book.user.id }">
								<a href="/${book.id }/editBook" style="margin-right: 10px"><button class="btn btn-warning" >edit</button></a>
								<form action="/${book.id}/deleteBook" method="post">
							    	<input type="hidden" name="_method" value="delete">
							    	<input type="submit" value="Delete" class="btn btn-outline-danger">
								</form>
								</c:if>
								<c:if test="${user.id != book.user.id }">
									<c:if test="${book.borrower.id == null }">
									<a href="/${book.id }/borrow" style="margin-right: 10px"><button class="btn btn-info" >Borrow</button></a>
									</c:if>
								</c:if>
								</td>
						</tr>
						</c:forEach>
				</tbody>
			</table>
			<h5>Books I'm Borrowing</h5>
			
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Title</th>
						<th scope="col">Author Name</th>	
						<th scope="col">Owner</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${borrowedBooks }" var="book">
						<c:if test="${user.id == book.borrower.id }">
						<tr>
							<td><c:out value="${book.id }"/></td>
							<td><a href="/${book.id }/show"><c:out value="${book.title }"/></a></td>
							<td><c:out value="${book.author_name }"/></td>
							<td><c:out value="${book.user.getUserName() }"/></td>
							<td >
									<a href="/${book.id }/return" style="margin-right: 10px"><button class="btn btn-success" >Return</button></a>
							</td>
						</tr>
						</c:if>
						</c:forEach>
				</tbody>
			</table>
			
		
							
					
									
						
					
		
		
		</div>
	</div>

</body>
</html>