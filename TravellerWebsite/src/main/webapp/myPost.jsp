<%@page import="com.traveller.pojo.User"%>
<%@page import="com.traveller.pojo.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.traveller.dao.PostDao"%>
<%@page import="com.traveller.pojo.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel - my post</title>

 <link rel="icon" href="asset/images/1200px-Eo_circle_orange_letter-t.svg.png" type="image/png" sizes="16*16">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
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

<!-- header section ends -->

<!-- Modal -->
<jsp:include page="modal.jsp"></jsp:include>



<!-- book section starts  -->

<br />
<br />
<br />
<br />

<section class="login" id="login">

    <h1 class="heading mt-3">
        <span>M</span>
        <span>y</span>
        <span class="space"></span>
        <span>P</span>
        <span>o</span>
        <span>s</span>
        <span>t</span>
    </h1>
    
    <div class="container">
    	<div class="row mt-0">
	<%
	PostDao pd = new PostDao();
	
	
	int id = u.getId();
		
	
	ArrayList<Posts> postsByUId = pd.getPostsByUId(id);
	if(postsByUId.size()==0){
		out.println("<h3 class='display-3 text-center mt-5'>No Posts<h3>");
		out.println("<div class='text-center'>");
		out.println("<a href='addPost.jsp' class='btn btn-primary'>Add Post</a> <a href='blog.jsp' class='btn btn-primary'>Back to Bolgs</a>");
		out.println("</div");
		return;
	}
	

	
	for (Posts p : postsByUId) {
	%>
	
	<div class="col-md-8 offset-md-2 mt-2">
		<div class="card mt-3">
			<img class="card-img-top" src="asset/blogPic/<%=p.getpPic()%>"
				alt="<%=p.getpLocation()%>">
			<div class="card-body">
				<h1 class="card-title text-capitalize fw-bold fs-1">
					<%=p.getpTitle()%>
				</h1>
				<div style="display:inline-block; background-color:#555555 ; padding: 3px 13px 0px 10px; border-radius:3px;" class="mb-3 mt-0 pt-2">
				<h5 class="fst-italic fs-4  text-white text-capitalize" >
					<i class="fa fa-map-marker text-warning"></i> &nbsp;<%=p.getpLocation()%></h5></div>
					
					<div id="desc">
					<h3 class="card-text fw-light fs-3"><%=p.getpDesc()%></h3>
					</div>
					<br />
				
				<a href="editPost.jsp?pid=<%=p.getPid() %>" class="btn btn-primary m-0 ">Edit</a>&nbsp; &nbsp;
				<a href="DeletePostServlet?pid=<%=p.getPid() %>" class="btn btn-primary m-0" id="delete">Delete</a>
				
			</div>

		</div>


	</div>

	<%
	}
	%>
	
	</div>
    </div>

</section>


<!-- footer section  -->

<jsp:include page="footer.jsp"></jsp:include>


<script>
$(document).ready(function(){
	$("#delete").click(function(){
		swal("Done!", "Post Deleted Successfully....!", "success");
		
	});
	
	
});



</script>



<!-- custom js file link  -->
<script src="asset/js/script.js"></script>

</body>
</html>