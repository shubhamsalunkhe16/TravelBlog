<%@page import="com.traveller.pojo.User"%>
<%@ page  errorPage="error.jsp"%>

<% User u=(User)session.getAttribute("currentUser");
%> 

<%if (u!=null) {%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-secondary text-white ">
      <div class="text-center">
       <h1 class="modal-title" id="exampleModalLabel">
        Personal Detalis</h1>
      </div>
       
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div id="uInfo">
      <div class="box text-center">
        <img src="asset/profilePic/<%=u.getProfile() %>" style="border-radius:50%" width="20%" height="20%" class="mb-4 img-fluid " alt="" /><br />
        <h1 > <%=u.getFname()%> <%=u.getLname() %></h1>
      
      </div>
      
        <table class="table table-hover">
        	<tr>
        		<td><h4> ID : </h4></td>
        		<td><h4><%=u.getId() %></h4> </td>
        	</tr>
        	<tr>
        		<td><h4>Email :</h4></td>
        		<td><h4><%=u.getEmail()  %></h4></td>
        	</tr>
        	<tr>
        		<td><h4>Contact :</h4></td>
        		<td><h4><%=u.getContact() %></h4></td>
        	</tr>
        </table>
        </div>
        
        
        <div id="uEdit" style="display:none;">
        <form action="EditServlet"  method="post" enctype="multipart/form-data">
        <table class="table table-hover">
        	<tr>
        		<td><h4> ID : </h4></td>
        		<td><h4><input type="text" placeholder="enter name" name="id" value="<%=u.getId() %>" readonly></h4> </td>
        	</tr>
        	<tr>
        	<tr>
        		<td><h4>First Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h4></td>
        		<td><h4><input type="text" placeholder="enter name" name="fname" value="<%=u.getFname() %>" autofocus="autofocus" required></h4></td>
        	</tr>
        	<tr>
        		<td><h4>Last Name :</h4></td>
        		<td><h4> <input type="text" placeholder="enter name" name="lname" value="<%=u.getLname() %>" required></h4></td>
        	</tr>
        	<tr>
        		<td><h4>Email :</h4></td>
        		<td><h4> <input type="text" placeholder="enter email" name="email" value="<%=u.getEmail() %>" required></h4></td>
        	</tr>
        	<tr>
        		<td><h4>Contact :</h4></td>
        		<td><h4> <input type="text" placeholder="enter contact" name="contact" value="<%=u.getContact() %>" required></h4></td>
        	</tr>
        	<tr>
        		<td><h4>Password :</h4></td>
        		<td><h4><input type="password" placeholder="enter password" name="password" value="<%=u.getPassword()%>" required></h4></td>
        	</tr>
        	<tr>
        		<td><h4>Profile Pic :</h4></td>
        		<td><h4> <input type="file" name="profile" ></h4></td>
        	</tr>
        	<tr>
        		<td></td>
        		<td><h4> <input type="submit" class="btn" value="Save"></h4></td>
        	</tr>
        </table>            
        </form>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-btn">Edit</button>
        
               
    </div>
        
        
        <script>
        $(document).ready(function(){
        	let editStatus=false;
        
  
			
        	$("#edit-btn").click(function(){
        		if(editStatus==false){
        			$("#uInfo").hide();	
        			$("#uEdit").show();
        			$(this).text("Back");
        			editStatus=true;
        		}else{
        			$("#uInfo").show();
        			$("#uEdit").hide();
        			$(this).text("Edit");
        			editStatus=false;
        		}
        		
        	});
        	
        	
        	
        });
        
        
        </script>
        
      </div>
    </div>
  </div>

<%} %>
