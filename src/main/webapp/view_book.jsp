<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="all_components/allCss.jsp" %>
</head>
<body style="background-color:#E6E6E6">
<%@include file="all_components/navbar.jsp" %>
<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDaoImpl dao=new BookDaoImpl(DBConnect.getConnect());
BookDetails b=dao. getBookById(bid);

%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
			<img src="<%=b.getPhotoName() %>" width=250px height=300px> <br>
			<h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName() %></span></h4>
			<h4>Category:  <span class="text-success"><%= b.getBookCategory() %></span> </h4>
			<h4>Author Name :  <span class="text-success"><%=b.getAuthor() %></span></h4>
			</div>
			
			
			<div class="col-md-6 text-center p-5 border bg-white">
			
			<%
			if(b.getType().equalsIgnoreCase("old")){
				%>
				<h2 class="text-primary">Contact to Seller</h2>
				<h4 class="text-primary">Email: <%=b.getEmail() %></h4>
				<%
			}
			%>
			<br><br>
				<h2><%=b.getBookName() %></h2>
				<div class="row">
					<div class="col-md-4  text-danger text-center p-2">
						<i class="fa-solid fa-sack-dollar fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-fast fa-2x"></i>
						<p>Fast Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
				</div>
				
				<div class="text-center p-3">
					<div class="row">
						<div class="col-md-6">
						<%
						if(b.getType().equalsIgnoreCase("old")){
								%>
						<a href="index.jsp"  style="margin:5px auto;" class="btn btn-success btn-lr "><i class="fa-solid fa-cart-plus"></i>Continue Shoping</a>
                            
						<%}
						else{
                            		 User u = (User)session.getAttribute("userobj");
                            		if(u == null){
                            			%>
                            			
                            			
                                <a href="login.jsp"  style="margin:5px auto;" class="btn btn-primary  btn-sm "><i class="fa-solid fa-cart-plus"></i>Add to Cart</a>
                                
                                <%
                            		}
                            		else{
                            	%>
                            	
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>"  style="margin:5px auto;" class="btn btn-primary  btn-sm "><i class="fa-solid fa-cart-plus"></i>Add to Cart</a>
                            	
                            	
                            	<%} 
                            		}%>
                               
						</div>
						<div class="col-md-6">
						<a href="" class="btn btn-danger btn-lr " style="margin:5px auto;  ">$ <%=b.getPrice() %></a>
                                 
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>