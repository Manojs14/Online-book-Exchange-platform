<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
  .nav-item:hover{
        cursor:pointer;
        text-decoration: underline;
        }
</style>
</head>
<body>

<%
HttpServletRequest req= (HttpServletRequest)pageContext.getRequest();
HttpServletResponse resp=(HttpServletResponse)pageContext.getResponse();
HttpSession ses=req.getSession(true); 
String sesemail= (String)ses.getValue("email");
System.out.println("The session email= "+sesemail);
%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" onclick="gotoaddbook()">AddBook</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" onclick="gotoviewbook()">ViewBook</a>
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


<div class="container text-center">
<div>
<%

String s=req.getParameter("email");
req.setAttribute("useremail",s);
%>
<%if (sesemail!=null) {%>
<h1>welcome to book store, <%=s %></h1>
</div>
<%} %>
    <% 
   
	String success=(String)req.getAttribute("status");
	System.out.println("statu= "+success);
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
            notification.innerHTML = 'Uploaded Successfully';
            
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
    
    </div>
    <% 
   
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
            notification.innerHTML = 'Could not upload , Try Again...!';
            
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

  <div class="row">
    <div class="col-5" style="padding-left:150px" >
     <form id="myForm1" action="Home" method="post">
    <input type="hidden" name="email" value=<%=s %> class="d-none visually-hidden">
    <div class="card" style="width: 18rem;">
  <img src="images/addimage.jpeg" class="card-img-top" alt="Add book" style="height:27rem;" onclick="redirect()">
  <div class="card-body" >
    <span class="card-text">Add Book.</span>
  </div>
</div>
      </form>
      <script type="text/javascript">
      function redirect(){
    	  
    		  document.getElementById("myForm1").submit();
    		  
    	        }
      </script>
      
    </div>
    <div class="col-4">
    <form id="myForm2" action="viewbook.jsp" method="post">
    <input type="hidden" name="email" value=<%=s %> class="d-none visually-hidden">
     <div class="card" style="width: 18rem;">
  <img src="images/viewbook.avif" class="card-img-top" alt="View Added book" onclick="submitForm()">
  <div class="card-body">
    <span class="card-text">View Book.</span>
  </div>
</div>
      </form>
      <script type="text/javascript">
      function submitForm(){
    	  document.getElementById("myForm2").submit();
      }
      </script>
    </div>
    <div class="col">
      <div class="col-4" >
      <form id="myForm3" action="buyersrequest.jsp" method="post">
      <input type="hidden" name="email" value=<%=s %> class="d-none visually-hidden">
       <div class="card" style="width: 18rem;">
    <img src="images/buyers.jpeg" class="card-img-top" alt="View Added book" onclick="submitForm2()"style=" height:27rem;">
    <div class="card-body">
      <span class="card-text">Buyers-Request.</span>
    </div>
  </div>
        </form>
        <script type="text/javascript">
        function submitForm2(){
      	  document.getElementById("myForm3").submit();
        }
      </script>
<!--      <a href="viewbook.jsp">VIewbook</a>
 -->    </div>
  </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</html>