<%@page import="com.traveller.pojo.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel - register</title>

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

<!-- book section starts  -->

<br />
<br />
<br />
<br />

<section class="reg" id="reg">

    <h1 class="heading">
        <span>r</span>
        <span>e</span>
        <span>g</span>
        <span>i</span>
        <span>s</span>
        <span>t</span>
        <span>e</span>
        <span>r</span>
    </h1>

    <div class="row">

        <div class="image">
            <img src="asset/images/contact-img.svg" alt="travelling">
        </div>

        <form action="UserServlet" method="post">
                <%
        Message m=(Message)session.getAttribute("msg");
        if(m!=null){
        %>
        <div class="alert <%=m.getBootClass() %>" role="alert">
  <h3><%=m.getMsg() %></h3>
</div>


<%
session.removeAttribute("msg");
        }
%>
        
            <div class="inputBox">
                <h3>First Name</h3>
                <input type="text" placeholder="enter first name" name="fname" autofocus="autofocus" required>
            </div>
            <div class="inputBox">
                <h3>Last Name</h3>
                <input type="text" placeholder="enter last name" name="lname" required>
            </div>
            <div class="inputBox">
                <h3>Email</h3>
                <input type="text" placeholder="enter email" name="email" required>
            </div>
            <div class="inputBox">
                <h3>Contact</h3>
                <input type="text" placeholder="enter contact" name="contact" maxlength="10"  required>
            </div>
            <div class="inputBox">
                <h3>Password</h3>
                <input type="password" placeholder="enter password" name="password" required>
            </div>
                       <input type="submit" class="btn" value="Register">
        </form>

    </div>

</section>

<!-- book section ends -->



<!-- footer section  -->

<jsp:include page="footer.jsp"></jsp:include>






<!-- custom js file link  -->
<script src="asset/js/script.js"></script>

</body>
</html>