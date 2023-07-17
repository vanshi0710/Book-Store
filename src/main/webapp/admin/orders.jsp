<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color:#E6E6E6">
<%@include file="navbar.jsp" %>
<h3 class="text-center">Hello Admin</h3>
<div class="container">
	<table class="table table-striped ">
  <thead class="bg-dark text-white">
    <tr>
      <th scope="col"> Order ID</th>
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
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConnect());
				List< BookOrder  > list = dao.getAllOrderDetails();
				for( BookOrder b :list){
					
			%>
				<tr>
					<td><%= b.getOrder_id() %></td>
					<td><%= b.getUserName() %></td>
					<td><%= b.getEmail() %></td>
					<td><%= b.getAddress() %></td>
					<td><%= b.getPhone()%></td>					
					<td><%= b.getBook_name() %></td>
					<td><%= b.getAuthor() %></td>
					<td><%= b.getPrice() %></td>
					<td><%= b.getPaymentType() %></td>
				</tr>
				<%} %>
  </tbody>
</table>
</div>
<div style="margin-top:320px">
	
<%@include file="footer.jsp" %>
</div>
</body>
</html>