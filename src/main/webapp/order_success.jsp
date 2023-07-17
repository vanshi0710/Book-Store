<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

	<%@include file="all_components/navbar.jsp"%>
	<div class="container text-center mt-3">
		<i class="fa-regular fa-circle-check fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your order has been placed successfully</h2>
		<h3>Within 5 days your order will be delivered.</h3>
		<a href="order.jsp" class="btn btn-dander m-3">View Order</a>
		
	</div>
	
	<div >
		<%@include file="all_components/footer.jsp"%>

	</div>
</body>
</html>