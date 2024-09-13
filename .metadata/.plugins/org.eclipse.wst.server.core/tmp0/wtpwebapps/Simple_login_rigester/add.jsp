<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
  .nav-item:hover{
        cursor:pointer;
        text-decoration: underline;
        }
</style>
</head>
<body>
<!-- to retrieve the email and send it through the form by hiding -->
<%
HttpServletRequest req= (HttpServletRequest)pageContext.getRequest();
String s=req.getParameter("email");
System.out.println("AAAAAAAAAAAAAAA "+s);
%>

<%
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
          <a class="nav-link active" aria-current="page" onclick="redirectToHome()">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" >AddBook</a>
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

<div class="container text-left">
  <div class="row">
    <div class="col-4">
      
    </div>
    <div class="col-4">
	<h1 class ="text-center">Add Books</h1>
	<!-- if there is any errors function is handled-->
	    <% 
	String error=(String)req.getAttribute("status");
	System.out.println("status in add.jsp= "+error);
	if(error !=null&&"failed".equals(error)){
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
            notification.innerHTML = 'Failed to upload';
            
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
    <!--form for adding the books  -->
	<form action="Addbook" method ="post"  enctype="multipart/form-data">
	<div class="mb-3">
	    <input type="hidden" name="email" value= <%=s %>  class="d-none visually-hidden">
	    <%System.out.println("Inside the form in add.jsp   "+s); %>
	    
    <label for="Bookname" class="form-label">Book Name </label>
    <input type="text" class="form-control" id="Bookname" name="Bookname" aria-describedby="text" placeholder="Enter The book Name" required>
  </div>
   <div class="mb-3">
    <label for="Bookauth" class="form-label"> Book author</label>
    <input type="text" class="form-control" name="Bookauth" id="Bookauth"  placeholder="Enter The author name" required>
  </div>
  <div class="mb-3">
    <label for="number" class="form-label">Published year</label>
    <input type="number" class="form-control" name="publishyear" id="publishyear" placeholder="Enter The Published Year" required>
  </div>
 <label>Insert Image Of book</label>
	<br>
	<input type="file" name="file" accept=".jpg, .jpeg, .png, .gif" required>
	<br> 
 	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
    </div>
    <div class="col-4">
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
 

</body>

</html>