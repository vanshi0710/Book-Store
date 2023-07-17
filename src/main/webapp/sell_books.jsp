<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Book</title>

<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #E6E6E6">
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-3 md-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card p-3">
					<div class="card-body">
						<c:if test="${not empty failedMsg}">
							<h4 class="text-center text-danger">${failedMsg}</h4>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty sucessMsg}">
							<p class="text-center text-success">${sucessMsg}</p>
							<c:remove var="sucessMsg" scope="session" />
						</c:if>
						<c:if test="${empty userobj}">
						<c:redirect url="login.jsp"/>
							
						</c:if>
						
						
						<form action="addOldBook" method="post" enctype="multipart/form-data">
							<div class="text-center">
							
								<h2>Sell old Book</h2>
							</div>
									<input type="hidden" value="${userobj.email }" name="user">

							<div class="mb-3">
								<label class="form-label">Book Name*</label> <input type="text"
									class="form-control" name="BookName" required="required">
							</div>
							<div class="mb-3">
								<label class="form-label">Author Name*</label> <input
									type="text" class="form-control" id="author" name="author"
									required="required">
							</div>
							<div class="mb-3">
								<label class="form-label">Price*</label> <input type="number"
									class="form-control" id="price" name="price"
									required="required">
							</div>
							<div class="mb-3">
								<label class="form-label">Book Category*</label> <input
									type="text" class="form-control" id="category" name="category"
									required="required">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Upload Photo</label> <input
									type="text" class="form-control" id="bimg" name="bimg"
									required="required">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
<div >
		<%@include file="all_components/footer.jsp"%>

	</div>

</body>
</html>