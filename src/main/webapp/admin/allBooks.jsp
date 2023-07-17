<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #E6E6E6">
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	<h4>
		<c:if test="${not empty failedMsg}">
							<h4 class="text-center text-danger">${failedMsg}</h4>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty sucessMsg}">
							<p class="text-center text-success">${sucessMsg}</p>
							<c:remove var="sucessMsg" scope="session" />
						</c:if>
	</h4>
	<div class="container">
		<table class="table table-striped ">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">ID</th>
					<td scope="col">Image</td>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());
				List<BookDetails> list = dao.getAllBooks();
				
				for (BookDetails b : list){
					%>
					<tr>
					<th><%= b.getBookId()%></th>
					<td scope="row"><img src="<%= b.getPhotoName() %>" width=50px height="50px"></td>
					<td><%= b.getBookName()%></td>
					<td><%= b.getAuthor() %></td>
					<td>$ <%= b.getPrice() %></td>
					<td><%= b.getBookCategory()%></td>
					
					<td><a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary">Edit</a><a
						href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger ml-1">Delete</a></td>
				</tr>
					
					<%
				}
				%>
				
				
			</tbody>
		</table>
	</div>
	<div style="margin-top: 260px">

		<%@include file="footer.jsp"%>
	</div>
</body>
</html>