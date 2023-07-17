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
</head>
<body style="background-color: #E6E6E6">
	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card p-3">
					<div class="card-body">
						<h2 class="text-center text-success">Add Address</h2>
						<form action="" method="post">
							<div class="form-row">
							
								<div class="form-group col-md-6">
									<label for="inputPassword4" class="form-label">Address</label>
									<input type="text" class="form-control" id="inputPassword4">
								</div>
								<div class=" form-group col-md-6">
									<label for="inputEmail4" class="form-label">LandMark</label> <input
										type="text" class="form-control" id="inputEmail4">
								</div>
							</div>
							<div class="form-row">
								
								<div class="form-group col-md-4">
									<label for="inputPassword4" class="form-label">city</label> <input
										type="text" class="form-control" id="inputPassword4">
								</div>
								<div class=" form-group col-md-4">
									<label for="inputEmail4" class="form-label">State</label> <input
										type="text" class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4" class="form-label">Zip</label> <input
										type="Number" class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center">
						 	<button class= "btn btn-warning">Order Now</button>
						 	 </div>

						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 168px">
		<%@include file="all_components/footer.jsp"%>

	</div>
</body>
</html>


