
<%@page import="com.traveller.pojo.User"%>
<%@page import="com.traveller.pojo.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.traveller.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel - blogs</title>

   <link rel="icon" href="asset/images/1200px-Eo_circle_orange_letter-t.svg.png" type="image/png" sizes="16*16">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- custom css file link  -->
    <style>
    header .logo{
  text-decoration: none; 
}
header .navbar a{
	 text-decoration: none;
}

#desc{
border: 1px soild red;

}

    </style>
  
    <link rel="stylesheet" href="asset/css/style.css">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
    
	<%
	User u = (User) session.getAttribute("currentUser");
	

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (u == null) {
		response.sendRedirect("login.jsp");
	}
	%>

	<!-- header section starts  -->

	<jsp:include page="navbar.jsp"></jsp:include>


	<!-- Modal -->
	<jsp:include page="modal.jsp"></jsp:include>

	<!-- header section ends -->
	<br />
	<br />
	<br />
	<br />
	<br />

	<!--main body starts  -->
	<div class="container">
		<div class="row mb-5 mt-4">
			<div class="col-md-4 mt-4">
				<div class="list-group    fw-normal fs-3">
					<a href="#" class="list-group-item list-group-item-action list-group-item-light active c-link"
						aria-current="true" onclick="getPosts(0,this)"> All Posts </a>
					<%
					CategoryDao cd1 = new CategoryDao();
					ArrayList<Categories> catList1 = cd1.getCategories();
					for (Categories c1 : catList1) {
					%>


					<a href="#" class="list-group-item list-group-item-action c-link" onclick="getPosts(<%=c1.getcId() %>,this)"><%=c1.getcName()%></a>


					<%
					}
					%>

				</div>

			</div>
			<div class="col-md-8">
			
			<div class="container text-center mt-5 pt5" id="loader">
			<i class="fa fa-spinner fa-5x fa-spin"></i>
			<p class="display-4 mt-2">Loading.........</p>
			</div>
			
			<div class="container-fluid" id="post-container">
			
			
			</div>
			
			</div>
		</div>
	</div>




	<!--main body ends  -->


	<!-- footer section  -->

	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- get all posts by ajax  -->
	<script>
	function getPosts(catId,temp){
		
		$("#loader").show();
		$("#post-container").hide();
		$("#post-footer").hide();
		$(".c-link").removeClass("active")
		
		$.ajax({
			url:"loadPost.jsp",
			data:{cid:catId},
			success:function(data, textStatus, jqXHR){
				$("#loader").hide();
				$("#post-container").show();
				$("#post-footer").show();
				$("#post-container").html("<h1>"+data+"</h1>");
				$(temp).addClass("active")
				
			},
			
		});
		
	};
	
	
	$(document).ready(function(){
		let postRef = $(".c-link")[0];
		getPosts(0,postRef);
		
	});
	
	
	
	</script>

<script src="asset/js/script.js"></script>
</body>
</html>