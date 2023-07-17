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
<title>Admin: Add Book</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #E6E6E6">
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
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
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());
						BookDetails b = dao.getBookById(id);
						%>
						<form action="../editBook" method="post">
						<input type=text value="<%=b.getBookId()%>" hidden name="bookId">
							<div class="text-center">
								<h2>Edit Book</h2>
							</div>



							<div class="mb-3">
								<label class="form-label">Book Name*</label> <input type="text"
									class="form-control" name="BookName" required="required"
									value="<%=b.getBookName()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Author Name*</label> <input
									type="text" class="form-control" id="author" name="author"
									required="required" value="<%=b.getAuthor()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Price*</label> <input type="number"
									class="form-control" id="price" name="price"
									required="required" value="<%=b.getPrice()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Book Category*</label> <input
									type="text" class="form-control" id="category" name="category"
									required="required" value="<%=b.getBookCategory()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Book Status*</label> <select
									id="inputSElect" class="form-control" name="bstatus">
									<%
									if ("active".equals(b.getStatus())) {
									%>

									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="inactive">Inactive</option>
									<option value="active">Active</option>
									<%
									}
									%>
								</select>
							</div>

							<button type="submit" class="btn btn-primary">Save</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>

</body>
</html>