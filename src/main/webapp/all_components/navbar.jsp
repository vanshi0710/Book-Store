<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid bg-custom" style="height:2vh">
	
</div>
<div class="container-fluid p-3">
	<div class="row">
	<div class="col-md-3">
	<h3>Vellichor</h3></div>
	<div class ="col-md-5">
		<form class="form-inline my-2 my-lg-0" action="searchBooks.jsp" method="post">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="ch">
			<button class="btn btn-outline-success my-2 my-sm-2" type="submit">Search</button>
		</form>
	</div>
	<div class="col-md-4">
			<c:if test="${not empty userobj}">
				<a href="checkOut.jsp" class="p-4 fa-2x text-primary" ><i class="fa-solid fa-cart-plus "></i> Cart</a>
				<a href="" class="btn btn-success">${userobj.name}</a>
				<a  data-toggle="modal" data-target="#exampleModal" class="btn btn-primary">Logout</a>
			</c:if>
			<c:if test="${empty userobj}">
				<a href="login.jsp" class="btn btn-success">Login</a>
				<a href="register.jsp" class="btn btn-primary">Register</a>
			</c:if>
	</div>
</div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Do You Want To Logout.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="logout" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-sharp fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="allRecentBooks.jsp"><i class="fa-solid fa-book-open-reader"></i> Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="allNewBooks.jsp"><i class="fa-solid fa-book-open-reader"></i> New Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="allOldBooks.jsp"><i class="fa-solid fa-book-open-reader"></i> Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
				<a href="settings.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i> Settings</a> 
			<a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-address-book"></i> Contact Us</a>
		</form>
	</div>
</nav>