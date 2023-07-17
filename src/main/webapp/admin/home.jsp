<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp" %>
<style>
a,a:hover{
  text-decoration: none;
  color:black;
}
</style>
</head>
<body style="background-color:#E6E6E6">
<%@include file="navbar.jsp" %>
<h1 class="text-center m-4">Admin Dashboard</h1>
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<a href="addBook.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-square-plus fa-3x text-primary"></i>
						<h3>Add Books</h3>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-3">
			<a href="allBooks.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-book fa-3x text-danger"></i>
						<h3>All Books</h3>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-box-open fa-3x text-warning"></i>
					<h3>Orders</h3>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-3">
			<a data-toggle="modal" data-target="#exampleModal" s>
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
						<h3>LogOut</h3>
					</div>
				</div>
			</a>
		</div>
	</div>
</div>
<div style="margin-top:320px">
	
<%@include file="footer.jsp" %>
</div>
</body>
</html>