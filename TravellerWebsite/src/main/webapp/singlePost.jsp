<%@page import="com.traveller.pojo.User"%>
<%@page import="com.traveller.dao.UserDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.traveller.pojo.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.traveller.dao.PostDao"%>
<%@page import="com.traveller.pojo.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel - post</title>

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
	if (u1 == null) {
		response.sendRedirect("login.jsp");
	}
	%>

	<!-- header section starts  -->

	<jsp:include page="navbar.jsp"></jsp:include>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<!-- header section ends -->

	<!-- Modal -->
	<jsp:include page="modal.jsp"></jsp:include>

	<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	int uid = Integer.parseInt(request.getParameter("uid"));
	
	
PostDao pd = new PostDao();

	Posts p= pd.getPostsByPid(pid);
	
	UserDao ud = new UserDao();
	User u=ud.uInfoForPost(uid);
	
	
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card mb-3">
					<img class="card-img-top" src="asset/blogPic/<%=p.getpPic()%>"
				alt="<%=p.getpLocation()%>">
			<div class="card-body">
				<h1 class="card-title text-capitalize fw-bold fs-1 my-3">
					<%=p.getpTitle()%>
				</h1>
				<div style="display:inline-block; background-color:#555555 ; padding: 3px 13px 0px 10px; border-radius:3px;" class="mb-3 mt-0 pt-2">
				<h5 class="fst-italic fs-4  text-white text-capitalize" >
					<i class="fa fa-map-marker text-warning"></i> &nbsp;<%=p.getpLocation()%></h5></div><br />
					
					<div style="display:inline-block; background-color:#555555 ; padding: 3px 13px 0px 10px; border-radius:3px;" class="mb-3 mt-0 pt-2">
					<h5 class="fst-italic fs-4  text-white text-capitalize" >
					<i class="far fa-calendar-alt text-warning"></i> &nbsp;<%= DateFormat.getDateInstance().format(p.getpDate())%></h5></div><br />
					
					<div style="display:inline-block; background-color:#555555 ; padding: 3px 13px 0px 10px; border-radius:3px;" class="mb-3 mt-0 pt-2">
					<h5 class="fst-italic fs-4  text-white text-capitalize" >
					<i class="fa fa-user text-warning"></i> &nbsp;Posted by <%=u.getFname()%> <%=u.getLname()%></h5></div><br />
					
					
				<h3 class="card-text fw-light fs-3"><%=p.getpDesc()%></h3>
				<a href="blog.jsp" class="btn btn-primary">Back to Blogs</a>
			</div>
				</div>


			</div>
		</div>
	</div>




	<!-- footer section  -->

	<jsp:include page="footer.jsp"></jsp:include>


<script src="asset/js/script.js"></script>


</body>
</html>