<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Base64"%>
<%@ page import="java.sql.*, java.io.*"%>
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
<title>Welocme To Store</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<Style>
	
	
	 .nav-item:hover{
        cursor:pointer;
        text-decoration: underline;
        }
       
        
	</Style>
</head>
<body>
<%
HttpServletRequest req= (HttpServletRequest)pageContext.getRequest();
HttpSession ses=req.getSession(true); 
String status=(String)req.getAttribute("Status");
String sesemail= (String)ses.getValue("email");
System.out.println("The session email= "+sesemail +" and status is "+status);
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
          <a class="nav-link" onclick="gotoviewbook()">ViewBook</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" >Web Store</a>
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

<%if ( status!=null && status.equals("failure") ){%>
 <div id="notification" class="alert alert-danger fade show" role="alert">
    </div>
        <script>
        // Trigger the showNotification function onload
        document.addEventListener('DOMContentLoaded', function() {
            showNotification();
        });

        function showNotification() {
            var notification = document.getElementById('notification');
            notification.innerHTML = 'Could not buy , Try Again...!';
            
            // Add the "show" class to display the alert
            notification.classList.add('show');

            // After 3 seconds, hide the alert using Bootstrap's "hide" class
            setTimeout(function() {
                notification.classList.remove('show');
            }, 3000);
        }
    	</script>
    	<%} else if(status!=null && status.equals("success") ){%>
   			 <div id="notification" class="alert alert-success fade show" role="alert">
    </div>
        <script>
        // Trigger the showNotification function onload
        document.addEventListener('DOMContentLoaded', function() {
            showNotification();
        });

        function showNotification() {
            var notification = document.getElementById('notification');
            notification.innerHTML = 'requested buyer Successfully';
            
            // Add the "show" class to display the alert
            notification.classList.add('show');

            // After 3 seconds, hide the alert using Bootstrap's "hide" class
            setTimeout(function() {
                notification.classList.remove('show');
            }, 3000);
        }
    	</script>
   	<% }%>
<div class="container">
        <div class="row">
            <%
Connection con;
Statement stmt;
ResultSet rs;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Manu2341");
	System.out.println("connected");
	stmt=con.createStatement();
	rs=stmt.executeQuery("SELECT * FROM login.employees inner join login.books where employees.id=books.id");
	int count=0;
	while(rs.next()){
	Blob blob = rs.getBlob("image");
			byte[] imageBytes = blob.getBytes(1, (int) blob.length());
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	%>
		  <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100">
                    <img src="data:image/jpeg;base64,<%= base64Image %>" class="card-img-top" alt="Book Image" style="height: 20rem;">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString(8) %></h5>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><b>Author Of Book: <%= rs.getString(9) %></b></li>
                        <li class="list-group-item"><b>Published Year: <%= rs.getString(10) %></b></li>
                        <li class="list-group-item"><b>Name of Seller: <%= rs.getString(2) %></b></li>
                        <li class="list-group-item"><b>Email of Seller: <%= rs.getString(4) %></b></li>
                        <li class="list-group-item"><b>Phone Number of Seller: <%= rs.getString(5) %></b></li>
                    </ul>
                        <a href="buyers.jsp?d=<%=rs.getInt(7)%>&e=<%=rs.getString(4)%>&s=<%=sesemail %>" class="btn btn-success">Buybook</a>
                </div>
            </div>
            
	<%}
}catch(Exception e){
	e.printStackTrace();
}
%>
</div>
</div>    	
    	
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
</html>