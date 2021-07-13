<%@page import="com.traveller.pojo.User"%>
<%@page import="com.traveller.dao.UserDao"%>
<%@page import="com.traveller.pojo.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.traveller.dao.PostDao"%>
	<%
	User u = (User) session.getAttribute("currentUser");
	

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (u == null) {
		response.sendRedirect("login.jsp");
	}
	%>

<div class="row mt-0" >
	<%
	PostDao pd = new PostDao();
	
	int cid= Integer.parseInt(request.getParameter("cid"));
	ArrayList<Posts> posts=null;
	if(cid==0){
		posts = pd.getAllPosts();	
	}else{
		posts=pd.getPostsByCat(cid);
	}
	
	if(posts.size()==0){
		out.println("<h3 class='display-3 text-center mt-5'>No Posts<h3>");
		return;
	}
	
	
	ArrayList<Posts> postsByCat = pd.getAllPosts();
	 
	

	
	for (Posts p : posts) {
	%>
	
	<div class="col-md-6 mt-2">
		<div class="card mt-3 " >
			<img class="card-img-top" src="asset/blogPic/<%=p.getpPic()%>"
				alt="<%=p.getpLocation()%>" height="250px">
			<div class="card-body">
				<h1 class="card-title text-capitalize fw-bold fs-1">
					<%=p.getpTitle()%>
				</h1>
				<div style="display:inline-block; background-color:#555555 ; padding: 3px 13px 0px 10px; border-radius:3px;" class="mb-3 mt-0 pt-2">
				<h5 class="fst-italic fs-4  text-white text-capitalize" >
					<i class="fa fa-map-marker text-warning"></i> &nbsp;<%=p.getpLocation()%></h5></div>
					
					<div id="desc" style="max-height:105px;overflow: hidden;">
					<h3 class="card-text fw-light fs-3"><%=p.getpDesc()%></h3>
					</div>
					<br />
				
				<a href="singlePost.jsp?pid=<%=p.getPid() %>&uid=<%=p.getuId() %>" class="btn btn-primary" >Read More</a>
			</div>

		</div>


	</div>

	<%
	}
	%>
	
	</div>