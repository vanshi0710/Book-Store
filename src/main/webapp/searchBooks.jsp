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
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
.crd-ho:hover {
	background-color: #CCCCCC;
}
</style>
</head>
<body style="background-color: #E6E6E6">

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
			showToast();
			function showToast(content)
			{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
			}	
			</script>
		<c:remove var="addCart" scope="session" />



	</c:if>
	<c:if test="${not empty failed}">
		<div id="toast">${failed}</div>

		<script type="text/javascript">
			showToast();
			function showToast(content)
			{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
			}	
			</script>
		<c:remove var="failed" scope="session" />


	</c:if>



	<%@include file="all_components/navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<%
			String ch =request.getParameter("ch");
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());
			List<BookDetails> book = dao.getSearchBook(ch);

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
								style="margin: 5px auto;">$<%=Math.round(b.getPrice())%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>

	</div>

	<div style="margin-top: 143px">
		<%@include file="admin/footer.jsp"%>

	</div>
</body>
</html>