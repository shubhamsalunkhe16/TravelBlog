<%@page import="com.traveller.pojo.User"%>
<%@page import="com.traveller.pojo.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.traveller.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	errorPage="error.jsp"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel - Home</title>


<link rel="icon" href="asset/images/1200px-Eo_circle_orange_letter-t.svg.png" type="image/png" sizes="16*16">

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>


<!-- custom css file link  -->
<style>
header .logo {
	text-decoration: none;
}

header .navbar a {
	text-decoration: none;
}

</style>

<link rel="stylesheet" href="asset/css/style.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

</head>
<body>

	<%
	User u1 = (User) session.getAttribute("currentUser");
	

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
	%>

	<!-- header section starts  -->

	<jsp:include page="navbar.jsp"></jsp:include>

	<!-- header section ends -->

	<!-- Modal -->
	<jsp:include page="modal.jsp"></jsp:include>


	<!-- home section starts  -->

	<section class="home" id="home">

		<div class="content">
			<h3>adventure is worthwhile</h3>
			<p>Travel is the Healthiest addiction</p>
			<%
			User u=(User)session.getAttribute("currentUser");
			if(u==null){
			%>
			
			<a href="login.jsp" class="btn">discover more</a>
			
			<%} 
			if(u!=null){
			%>
			
			<a href="profile.jsp" class="btn">discover more</a>
			
			<%} %>
			
			
		</div>


		<div class="video-container">
			<video src="asset/images/vid-1.mp4" id="video-slider" loop autoplay
				muted></video>
		</div>

	</section>

	<!-- home section ends -->



	<!-- services section starts  -->

	<section class="services" id="services">

		<h1 class="heading">
			<span>F</span> <span>e</span> <span>a</span> <span>t</span> <span>u</span>
			<span>r</span> <span>e</span> <span>s</span>
		</h1>

		<div class="box-container">

			<div class="box">
				<i class="fa fa-street-view"></i>
				<h3>Explore more</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fa fa-share-alt"></i>
				<h3>share your experience</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fa fa-puzzle-piece"></i>
				<h3>connect with travellers</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-globe-asia"></i>
				<h3>around the world</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-plane"></i>
				<h3>fastest travel</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-hiking"></i>
				<h3>adventures</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>

		</div>

	</section>




	<!-- footer section  -->

	<jsp:include page="footer.jsp"></jsp:include>





<!-- custom js file link  -->
<script src="asset/js/script.js"></script>






</body>
</html>