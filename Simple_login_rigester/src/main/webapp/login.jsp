<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body >
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup.jsp">Signup</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-disabled="true" href="about.jsp">About us</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container text-center" >
<h3>Login</h3>
Don't have an account?<a href="signup.jsp">Signup</a>
  <div class="row">
    <div class="col-4">
    </div>
    <div class="col-4">
   
      <form action="login" method="post">
    <% 
    HttpServletRequest req=(HttpServletRequest)pageContext.getRequest();
    HttpServletResponse resp=(HttpServletResponse)pageContext.getResponse();
	String s=(String)req.getAttribute("status");
	System.out.println("statu= "+s);
	if(s !=null&&"failed".equals(s)){
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
            notification.innerHTML = 'Invalid credentials';
            
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
  <div class="mb-3">
    <label for="exampleInputName" class="form-label">Email</label>
    <input type="text" name ="email"class="form-control" id="exampleInputName" aria-describedby="NameHelp" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="pass" class="form-control" id="exampleInputPassword1" required>
  </div>
  <button type="submit" class="btn btn-primary" >Submit</button>
</form>
    </div>
    <div class="col-4">
    </div>
  </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</html>