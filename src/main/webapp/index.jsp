<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<%@include file="all_components/allCss.jsp" %>
<style>
    .back-img {
        width: 100%;
        height: 50vh;
        background: url("images/images.jpg");
        background-size: cover;
        background-repeat: no-repeat;
    }

    .crd-ho:hover {
        background-color: #CCCCCC;
    }
    body{
    background-image:url("images/background.jpg");
    }
</style>
</head>
<body >
<%@include file="all_components/navbar.jsp" %>
<div class="container-fluid back-img p-3">
            

        </div>
        
        
<!-- recent start.............................................................................................................. -->
       
        
        
        
        
        <div class="container">
            <h2 class="text-center">Recent Books</h2>
            <div class="row">
            
            <%
            BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());
            List<BookDetails> book = dao.getRecentBook();
            int i=4;
            for(BookDetails b: book){
            	if(i>0){
            		i--;
            %>
           
              <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="java book" src="<%=b.getPhotoName() %>" style="width:150px; height:200px"
                                class="img-thumblin">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>Category:<%= b.getBookCategory() %></p>
                         
                            <div class="row" style="margin:1px auto;">
                                	<%
                            		 User u = (User)session.getAttribute("userobj");
                                	
            						if(b.getType().equalsIgnoreCase("new")){
            						
                                        		 
                                        		if(u == null){
                                        			%>
                                        			
                                        			
                                            <a href="login.jsp"  style="margin:5px auto;" class="btn btn-primary  btn-sm "><i class="fa-solid fa-cart-plus"></i>Add to Cart</a>
                                            
                                            <%
                                        		}
                                        		else{
                                        	%>
                                        	
                                            <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>"  style="margin:5px auto;" class="btn btn-primary  btn-sm "><i class="fa-solid fa-cart-plus"></i>Add to Cart</a>
                                        	
                                        	
                                        	<%} %>
            							<%}%>
                                <a href="view_book.jsp?bid=<%=b.getBookId() %>" style="margin:5px auto;" class="btn btn-success btn-sm">View details</a>
                            </div>
                            <div class="row" >
                                <a href="" class="btn btn-danger btn-sm " style="margin:5px auto;  ">$ <%= Math.round(b.getPrice()) %></a>
                            </div>
                        </div>
                    </div>
                </div>
               <%}
            	}%> 
                
                
                
                
            </div>
			<div class="text-center">
				<a href="allRecentBooks.jsp" class="btn btn-danger btn-sm mt-1">View All</a>
			</div>
        </div>
        
        
        
        
        
        
<!-- Recent ends................................................................................................... -->
<hr>
<!-- New start.............................................................................................................. -->
        <div class="container">
            <h2 class="text-center">New Books</h2>
            <div class="row">
            
            <%
            	 book = dao.getNewBook();
            	 i=4;
            	for(BookDetails b: book){
            		if(i>0){
            			i--;
            %>
           
              <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="java book" src="<%=b.getPhotoName() %>" style="width:150px; height:200px"
                                class="img-thumblin">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>Category:<%=b.getBookCategory()%></p>
                         
                            <div class="row" style="margin:1px auto;">
                                <%
                            		 User u = (User)session.getAttribute("userobj");
                            		if(u == null){
                            			%>
                            			
                            			
                                <a href="login.jsp"  style="margin:5px auto;" class="btn btn-primary  btn-sm "><i class="fa-solid fa-cart-plus"></i>Add to Cart</a>
                                
                                <%
                            		}
                            		else{
                            	%>
                            	
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>"  style="margin:5px auto;" class="btn btn-primary  btn-sm "><i class="fa-solid fa-cart-plus"></i>Add to Cart</a>
                            	
                            	
                            	<%} %>
                                <a href="view_book.jsp?bid=<%=b.getBookId() %>" style="margin:5px auto;" class="btn btn-success btn-sm">View details</a>
                            </div>
                            <div class="row" >
                                <a href="" class="btn btn-danger btn-sm " style="margin:5px auto;  ">$ <%= Math.round(b.getPrice()) %></a>
                            </div>
                        </div>
                    </div>
                </div>
               <%}
            	}%> 
                
                
                
                
            </div>
			<div class="text-center">
				<a href="allNewBooks.jsp" class="btn btn-danger btn-sm mt-1">View All</a>
			</div>
        </div>
<!-- New ends....................................................................................................... -->
<hr>
<!-- Old start.............................................................................................................. -->
       <div class="container">
            <h2 class="text-center">Old Books</h2>
            <div class="row">
            
            <%
            	 book = dao.getOldBook();
            	 i=4;
            	for(BookDetails b: book){
            		if(i>0){
            			i--;
            %>
           
              <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt=<%= b.getBookName() %>  src="<%=b.getPhotoName() %>" style="width:150px; height:200px"
                                class="img-thumblin">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>Category:<%=b.getBookCategory()%></p>
                         
                            <div class="row" style="margin:1px auto;">
                            	
                                <a href="view_book.jsp?bid=<%=b.getBookId() %>" style="margin:5px auto;" class="btn btn-success btn-sm">View details</a>
                            </div>
                            <div class="row" >
                                <a href="" class="btn btn-danger btn-sm " style="margin:5px auto;  ">$ <%= Math.round(b.getPrice()) %></a>
                            </div>
                        </div>
                    </div>
                </div>
               <%}
            	}%> 
                
                
                
                
            </div>
			<div class="text-center">
				<a href="allOldBooks.jsp" class="btn btn-danger btn-sm m-5">View All</a>
			</div>
        </div>
<!-- OLd ends....................................................................................................... -->

<div style="margin-top:30px">
	<%@include file="admin/footer.jsp" %>
</div>

</body>
</html>
