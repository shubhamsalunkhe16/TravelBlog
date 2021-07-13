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
    <title>Travel - gallery</title>

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

</head>
<body>
    
<!-- header section starts  -->

<jsp:include page="navbar.jsp"></jsp:include>

<!-- header section ends -->

<!-- Modal -->
<jsp:include page="modal.jsp"></jsp:include>





<br />
<br />
<br />
<br />

	<!-- services section ends -->

	<!-- gallery section starts  -->

	<section class="gallery" id="gallery">

		<h1 class="heading">
			<span>g</span> <span>a</span> <span>l</span> <span>l</span> <span>e</span>
			<span>r</span> <span>y</span>
		</h1>

		<div class="box-container">
<%
					PostDao pd = new PostDao();
					ArrayList<Posts> allPost = pd.getPostsForGallary();
					for (Posts p : allPost) {
					%>
					
					


			<div class="box">
				<img src="asset/blogPic/<%=p.getpPic() %>" alt="">
				<div class="content">
					<h3 class="mt-5 pt-3"><%=p.getpTitle() %></h3>
				</div>
			</div>
			
			<%} %>
			
		</div>

	</section>

	<!-- gallery section ends -->



<!-- footer section  -->

<jsp:include page="footer.jsp"></jsp:include>







<!-- custom js file link  -->
<script src="asset/js/script.js"></script>

</body>
</html>