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
.crd-ho:hover {
	background-color: #CCCCCC;
}
</style>
</head>
<body style="background-color: #E6E6E6">

	


	<%@include file="all_components/navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());
			List<BookDetails> book = dao.getOldBook();

			for (BookDetails b : book) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="<%=b.getBookName()%> "
							src="<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>

						<div class="row" style="margin: 1px auto;">
							
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								style="margin: 5px auto;" class="btn btn-success btn-sm">View
								details</a>
						</div>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm "
								style="margin: 5px auto;">$ <%=Math.round(b.getPrice())%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>

	</div>

	<div >
		<%@include file="admin/footer.jsp"%>

	</div>
</body>
</html>