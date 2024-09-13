<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Base64"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Views Of Book</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<style>
  .nav-item:hover{
        cursor:pointer;
        text-decoration: underline;
        }
</style>
</head>
<body>
<%
HttpServletRequest req= (HttpServletRequest)pageContext.getRequest();
HttpSession ses=req.getSession(true); 
String sesemail= (String)ses.getValue("email");
System.out.println("The session email= "+sesemail);
%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" onclick="redirectToHome()">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" onclick="gotoaddbook()">AddBook</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" >ViewBook</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" onclick="gotostore()">Web Store</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-disabled="true" onclick="gotoaboutus()">About us</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" aria-disabled="true" onclick="logout()">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script type="text/javascript">
		var email="<%=sesemail%>";
		
        function redirectToHome() {
            window.location.href = 'Home.jsp?email='+encodeURIComponent(email);
        }
   
        function logout() {
            window.location.href = 'login.jsp';
        }
        
        function gotoviewbook(){
    		window.location.href='viewbook.jsp?email=' +  encodeURIComponent(email);
    	}
        
      	function gotoaddbook(){
    		window.location.href='add.jsp?email=' +  encodeURIComponent(email);
    	}
        
		function gotostore(){
		window.location.href='Store.jsp?email=' +  encodeURIComponent(email);
		}
	
		function gotoaboutus() {
		window.location.href = 'aboutus.jsp?email=' + encodeURIComponent(email);
		}
</script>
	<h1 class="justify-content">Details Of Books </h1>
   <% 
   HttpServletResponse resp= (HttpServletResponse)pageContext.getResponse();
   Connection con=null;
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   int id=0;
   PrintWriter pw;
	String success=(String)req.getAttribute("status");
	System.out.println("status = "+success);
	if(success !=null&&"success".equals(success)){
	%>
		 <div id="notification" class="alert alert-success fade show" role="alert">
    </div>
        <script>
        // Trigger the showNotification function onload
        document.addEventListener('DOMContentLoaded', function() {
            showNotification();
        });
        function showNotification() {
            var notification = document.getElementById('notification');
            notification.innerHTML = 'Deleted Successfully';
            
            // Add the "show" class to display the alert
            notification.classList.add('show');

            // After 3 seconds, hide the alert using Bootstrap's "hide" class
            setTimeout(function() {
                notification.classList.remove('show');
            }, 3000);
        }
    	</script>
	<% 
	}  
	String status=(String)req.getAttribute("status");
	System.out.println("status= "+status);
	if(success !=null&&"failed".equals(status)){
	%>
		 <div id="notification" class="alert alert-danger fade show" role="alert">
    </div>
        <script>
        // Trigger the showNotification function onload
        document.addEventListener('DOMContentLoaded', function() {
            showNotification();
        });

        function showNotification() {
            var notification = document.getElementById('notification');
            notification.innerHTML = 'Could Not Delete , Try Again...!';
            
            // Add the "show" class to display the alert
            notification.classList.add('show');

            // After 3 seconds, hide the alert using Bootstrap's "hide" class
            setTimeout(function() {
                notification.classList.remove('show');
            }, 3000);
        }
    	</script>
	<% 
	}
    %>

<%
String email=req.getParameter("email");
String email2=(String) req.getAttribute("email");
String eid=req.getParameter("emailid");

System.out.println("Inside Viewbook.java kuch kuch   "+email);
System.out.println("Inside Viewbook.java huch kuch   "+email2);
System.out.println("Inside Viewbook.java kuch kuch emailid   "+eid);

if(email2!=null)
{
	email=email2;
}
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login" ,"root","Manu2341");
	System.out.println("conected");
	pstmt=con.prepareStatement("Select * from employees where `email`=?");
	pstmt.setString(1, email);
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		id=rs.getInt(1);
	}
	System.out.println("The id of user=  "+id);
	pw=resp.getWriter();
	pstmt=con.prepareStatement("select * from books where `id`=?");
	pstmt.setInt(1, id);
	rs=pstmt.executeQuery();
	while(rs.next()) {
		System.out.println("Inside the view book.java resultset"+rs.getString(3));%>
		
			
			
			<div class="card" style="width: 18rem;">
			<%   Blob blob = rs.getBlob("Image");
            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
           
String encodedImage = URLEncoder.encode(base64Image, "UTF-8");%>
<img src='data:image/jpeg;base64,<%=base64Image%>' alt='Retrieved Image'
class="card-img-top" >
  <div class="card-body">
    <h5 class="card-title">Book :<%=rs.getString(3) %></h5>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><b>Author Of Book  :<%=rs.getString(4) %> </b></li>
    <li class="list-group-item"><b>Published Year :<%=rs.getString(5) %></b></li>
  </ul>
  <div class="card-body">
    <a href="UpdateBook.jsp?u=<%=rs.getInt(2)%>&e=<%=email%>"  class="btn btn-success">Edit</a>
    <a href="Delete?d=<%=rs.getInt(2)%>&e=<%=email%> "class="card-link btn btn-danger">Delete</a>
       
  </div>
</div>
			<% 
	}}catch (SQLException e) {
        e.printStackTrace();
} 
	finally{
		if(rs!=null){
			rs.close();
		}
		if(pstmt!=null){
			pstmt.close();
		}
		if(con!=null){
			con.close();
			}
	}
%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

</body>
</html>