<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Signup</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
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
 <div class="row">
    <div class="col-4">
    <h1></h1>
    </div>
    <div class="col-4">
    <h1>SignUp Form</h1>
    <h6>Already Have An Account? <a href="login.jsp">Login</a></h6>
     <form action="Signup" method="post">
     <% 
    HttpServletRequest req=(HttpServletRequest)pageContext.getRequest();
    HttpServletResponse resp=(HttpServletResponse)pageContext.getResponse();
	String status=(String)req.getAttribute("emialexist");
	System.out.println("status in signup.jsp= "+status);
	if(status !=null&&"emailAlreadyExists".equals(status)){
	%>
		<script>
		alert("Email Already Exists , Please Enter Another Email");
		</script>
	<% 
	}
    %>
    <% 
    
	String s1=(String)req.getAttribute("pnumexist");
	System.out.println("status in signjsp= "+s1);
	if(s1 !=null&&"pnumAlreadyExists".equals(s1)){
	%>
		<script>
		alert("Pnum Already Exists , Please Enter Another Pnum");
		</script>
	<% 
	}
    %>
    
  <div class="mb-3">
    <label for="name" class="form-label">Name </label>
    <input type="text" class="form-control" id="name" name="uname" aria-describedby="text" placeholder="Enter The Name" required>
  </div>
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter The Email Address" required>
  </div>
  <div class="mb-3">
    <label for="number" class="form-label">Phone number</label>
    <input type="number" class="form-control" name="pnum" id=number placeholder="Enter The Phone Number" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" name= "pass" id="exampleInputPassword1" placeholder ="Enter The Password" required>
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<div class="col-4" >
  
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
 
</body>
