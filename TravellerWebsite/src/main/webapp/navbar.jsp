<%@page import="com.traveller.pojo.User"%>
<%@ page errorPage="error.jsp"%>

<header>

	<div id="menu-bar" class="fas fa-bars"></div>

	<a href="index.jsp" class="logo"><span>T</span>ravel</a>
	<%
	User u = (User) session.getAttribute("currentUser");
	%>

	<nav class="navbar">
		<a href="index.jsp">Home</a>

		<%
		if (u == null) {
		%>

	  <a href="gallery.jsp">Gallery</a> <a
			href="contact.jsp">Contact</a> <a href="register.jsp">Register</a><a
			href="login.jsp">Login</a>

		<%
		}
		%>
		<%
		if (u != null) {
		%>

		<a href="blog.jsp">Blogs</a> <a href="addPost.jsp">Post</a> <a href="myPost.jsp">My Posts</a>  <a href="LogoutServlet">Logout</a>
		<%
		}
		%>




	</nav>
	<!--  
	<div class="icons">
		<i class="fas fa-search" id="search-btn"></i> 
		-->
	<%
	if (u != null) {
	%>
	<div class="icons" id="profile">
		<img src="asset/profilePic/<%=u.getProfile()%>" alt="" width="30px"
			height="30px"
			style="border-radius: 50%;border:2px solid orange; position: relative; top: -3px;" /> 
			 <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal" class="fw-normal fs-2 text-capitalize text-white " style="border-radius: 50%; position: relative; top: 2px; left: 5px;"><%=u.getFname()%></a>
			
		<%
		}
		%>


	</div>
	<!--  
	<form action="" class="search-bar-container">
		<input type="search" id="search-bar" placeholder="search here...">
		<label for="search-bar" class="fas fa-search"></label>
	</form>
-->
</header>