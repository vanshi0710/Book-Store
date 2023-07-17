<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_components/allCss.jsp" %>
</head>
<body style="background-color:#E6E6E6">
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
<%@include file="all_components/navbar.jsp" %>
<div class="container p-3">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card p-3">
				<div class="card-body">
					<form action="update_profile" method="post">
						<div class="text-center">
							<h2>Edit profile</h2>
						</div>
						<c:if test="${not empty sucessMsg}">
							<h4 class="text-center text-primary"> ${sucessMsg}</h4>
							<c:remove var="sucessMsg" scope = "session" />
							</c:if>
							<c:if test="${not empty failMsg}">
							<h4 class="text-center text-danger"> ${failMsg}</h4>
							<c:remove var="failMsg" scope = "session" />
							</c:if>
						<input type="hidden" name="uid" value="${userobj.id }">
						<div class="mb-3">
					    	<label for="exampleInputName" class="form-label">Name</label>
					    	<input type="text" class="form-control" id="exampleInputName" name="name" value="${userobj.name }">
					    </div>
						<div class="mb-3"> 
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" value="${userobj.email}">
					    </div>
					    <div class="mb-3">
					    	<label for="exampleInputPhno" class="form-label">Phone Number</label>
					    	<input type="number" class="form-control" id="exampleInputPhno" name="phno" value="${userobj.phno}">
					    </div>
					  	<div class="mb-3">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
					  	</div>
					  	<button type="submit" class="btn btn-primary">Save</button>
					</form>
				</div>
			
			</div>
		</div>
	</div>
</div>
<%@include file="all_components/footer.jsp" %>
</body>
</html>