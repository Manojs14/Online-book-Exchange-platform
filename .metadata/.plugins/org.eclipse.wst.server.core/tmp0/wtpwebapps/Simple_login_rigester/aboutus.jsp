<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background-image: url('background.jpg'); /* Ensure you have the background.jpg in your project directory */
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            width: 100%;
            z-index: 10;
        }
        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 80%;
            max-width: 600px;
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2em;
            margin: 10px 0;
        }
        a {
            color: #FFD700; /* Gold color for links */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .nav-item:hover{
        cursor:pointer;
        text-decoration: underline;
        }
        
    </style>
</head>
<body>
<%
System.out.println("line 83 of abu.jsp ");
String email=(String)request.getParameter("email");
System.out.println("line 83 of abu.jsp "+email);

%>
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
          <a class="nav-link active" aria-current="page" onclick="redirectToHome()">Home</a>
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
          <a class="nav-link" aria-disabled="true" >About us</a>
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

    <div class="content">
        <div class="container">
            <h1>About Us</h1>
            <p>Email: <a href="mailto:manucharlie121@gmail.com">manucharlie121@gmail.com</a></p>
            <p>Contact Number: <a href="tel:+919740693455">+919740693455</a></p>
            <p>Team Name: The Innovators</p>
        </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2mGkbo9iMfB5t0niyBQWf8Z5R4Ww4Nf2y0ZzH4rtkDd2IOVyk5KfqIxOf+M" crossorigin="anonymous"></script>
</body>
</html>
