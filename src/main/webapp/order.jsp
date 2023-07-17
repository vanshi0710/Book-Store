<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
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
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container p-1">
		<h2 class="text-center ">Your Orders</h2>

		<table class="table table-striped mt-5 mb-5">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone Number</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>

					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConnect());
				List<BookOrder> list = dao.getOrderDetails(u.getEmail());
				for (BookOrder b : list) {
				%>
				<tr>
					<td><%=b.getOrder_id()%></td>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getAddress()%></td>
					<td><%=b.getPhone()%></td>
					<td><%=b.getBook_name()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div>
		<%@include file="all_components/footer.jsp"%>

	</div>


</body>
</html>