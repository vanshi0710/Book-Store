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
<%@include file="all_components/navbar.jsp" %>
<div class="container p-3">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card p-3">
				<div class="card-body">
					<form action="login" method="post">
						<div class="text-center">
							<h2>Login</h2>
							<c:if test="${not empty succMsg}">
							<h4 class="text-center text-primary"> ${succMsg}</h4>
							<c:remove var="succMsg" scope = "session" />
							</c:if>
							<c:if test="${not empty failedMsg}">
							<h4 class="text-center text-danger"> ${failedMsg}</h4>
							<c:remove var="failedMsg" scope = "session" />
							</c:if>
						</div>
						
						<div class="mb-3">
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
					    </div>
					    
					  	<div class="mb-3">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
					  	</div>
					  	<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			
			</div>
		</div>
	</div>
</div>
<div style="margin-top:143px">
<%@include file="all_components/footer.jsp" %>
	
</div>
</body>
</html>