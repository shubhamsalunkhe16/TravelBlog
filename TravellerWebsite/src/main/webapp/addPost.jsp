
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
    <title>Travel - add post</title>

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


<!-- addpost section starts  -->
<br />
<br />
<br />
<br />


<!-- contact section starts  -->

<section class="contact" id="contact">
    
    <h1 class="heading">
     <span>A</span>
        <span>d</span>
        <span>d</span>
        <span class="space"></span>
        <span>P</span>
        <span>o</span>
        <span>s</span>
        <span>t</span>
    </h1>

    <div class="row">

        <div class="image">
            <img src="asset/images/3251.jpg" alt="">
        </div>

        <form action="AddPostServlet" method="post" enctype="multipart/form-data" id="post-form">
            
            <select required name="cid"  class="form-select form-select-lg p-3 fw-normal fs-3 mb-3  " aria-label=".form-select-lg example">
      <option hidden value="">Select Category</option>
       <%
                CategoryDao cd = new CategoryDao();
                ArrayList<Categories> catList=cd.getCategories();
               	for(Categories c : catList){
               		%>
               	
               		
               		 <option value="<%= c.getcId()%>"><%= c.getcName()%></option>
               		
                
               	<%
               	
               	} %>
  

      
    </select>
            <div class="inputBox" >
                <input style="width:100%;" type="text" placeholder="Title" name="pTitle" required>
                
            </div>
             <div class="inputBox">
                <input type="text" placeholder="Location" name="pLocation" required>
                <input type="file" name="pPic">
            </div>
            <textarea placeholder="Description"  id="" cols="30" rows="10" name="pDesc" required></textarea>
            <input type="submit" class="btn" value="Post">
        </form>

    </div>
    
</section>





<!-- footer section  -->

<jsp:include page="footer.jsp"></jsp:include>















<!-- custom js file link  -->
<script>
$(document).ready(function(){
	$("form").submit(function(){
		swal("Done!", "Posted Successfully....!", "success");
		
	});
	
	
});



</script>
<script src="asset/js/script.js"></script>

</body>
</html>