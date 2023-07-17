<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #E6E6E6">

	<%@include file="all_components/navbar.jsp"%>




	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h2>Your Selected item</h2>

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnect());
								List<Cart> c = dao.getBookByUser(u.getId());
								double totalprice = 0.00;
								for (Cart cart : c) {

									totalprice = cart.getTotalPrice();
								%>
								<tr>
									<td><%=cart.getBookName()%></td>
									<td><%=cart.getAuthor()%></td>
									<td>$ <%=cart.getPrice()%></td>
									<td><a href="remove_book?cid=<%=cart.getCid()%>"
										class="btn btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td>$ <%=totalprice%>
								</tr>

							</tbody>
						</table>
					</div>

				</div>


			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center text-success">Your Details For Order</h2>
						<form action="order" method="post" onsubmit="return validate()">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-row">
								<div class=" form-group col-md-6">
									<label for="inputEmail4" class="form-label">Name</label> <input
										type="text" class="form-control" id="inputName" name="name"
										value="${userobj.name }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" class="form-label">Email</label> <input
										type="email" class="form-control" id="inputPassword4"
										name="email" value="${userobj.email }">
								</div>
							</div>
							<div class="form-row">
								<div class=" form-group col-md-6">
									<label for="inputEmail4" class="form-label">Phone
										Number</label> <input type="number" class="form-control" name="phno"
										value="${userobj.phno }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" class="form-label">Address</label>
									<input type="text" class="form-control" name="address" required>
								</div>
							</div>
							<div class="form-row">
								<div class=" form-group col-md-6">
									<label for="inputEmail4" class="form-label">LandMark</label> <input
										type="text" class="form-control" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" class="form-label">city</label> <input
										type="text" class="form-control" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class=" form-group col-md-6">
									<label for="inputEmail4" class="form-label">State</label> <input
										type="text" class="form-control" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" class="form-label">Pincode</label>
									<input type="Number" class="form-control" name="pincode"
										required>
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select name="paymentType"
									id="payment" required>
									<option value="null">--Select--</option>
									<option value="cod">Cash On delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-primary">Continue Shoping</a>
							</div>


						</form>

					</div>
				</div>

			</div>
		</div>

	</div>


	<div style="margin-top: 100px">
		<%@include file="admin/footer.jsp"%>

	</div>
	<script>
	function validate(){
		var a = document.getElementById("payment").value;
		if(a == "null"){
			alert("Please Select Payment mode");
			return false;
		}
	}
</script>

</body>
</html>