<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
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
	
	<div>
		<%@include file="all_components/footer.jsp"%>
		
		
		<div class="container">
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
		<table class="table table-striped ">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">ID</th>
					<td scope="col">Image</td>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());
				User u = (User)session.getAttribute("userobj");
				List<BookDetails> list = dao.getBookByOld(u.getEmail());
				
				for (BookDetails b : list){
					%>
					<tr>
					<th><%= b.getBookId()%></th>
					<td scope="row"><img src="<%= b.getPhotoName() %>" width=50px height="50px"></td>
					<td><%= b.getBookName()%></td>
					<td><%= b.getAuthor() %></td>
					<td> $ <%= b.getPrice() %></td>
					<td><a href="delete_old?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger ml-1">Delete</a></td>
				</tr>
					
					<%
				}
				%>
				
				
			</tbody>
		</table>
	</div>

	</div>

</body>
</html>