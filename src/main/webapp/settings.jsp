<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_components/allCss.jsp"%>
<style>
a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #E6E6E6">
	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container">
	<h3 class="text-center">Hello, ${userobj.name}</h3>
		<div class="row p-5">

			<div class="col-md-4">
				<a href="sell_books.jsp">
					<div class="card">

						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open  fa-3x"></i>
							</div>
							<h2>Sell old books</h2>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">

						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open  fa-3x"></i>
							</div>
							<h2>My books</h2>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">

						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square  fa-3x"></i>
							</div>
							<h2>Edit Profile</h2>
						</div>
					</div>
				</a>
			</div>

		</div>
		<div class="row p-5">
			
			<div class="col-md-6">
				<a href="order.jsp"><div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h2>My Orders</h2>
							Track my order
						</div>
					</div></a>
			</div>
			<div class="col-md-6">
				<a href="contact.jsp"><div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-circle-user fa-3x"></i>
							</div>
							<h2>Help Center</h2>
							24X7 service
						</div>
					</div></a>
			</div>
		</div>
	</div>

	<div>
		<%@include file="all_components/footer.jsp"%>

	</div>

</body>
</html>