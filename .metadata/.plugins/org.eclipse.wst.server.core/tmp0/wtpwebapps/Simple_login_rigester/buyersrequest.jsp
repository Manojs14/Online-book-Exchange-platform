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
<div class="container">
        <div class="row">
	<h1 class="justify-content">Details Of Buyers </h1><% 
			 HttpServletResponse resp= (HttpServletResponse)pageContext.getResponse();
	   Connection con=null;
	   PreparedStatement pstmt=null;
	   Statement stmt=null;
	   ResultSet rs=null;
	   int id=0;
	   PrintWriter pw;
		
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("loaded");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login" ,"root","Manu2341");
		System.out.println("conected");
		pstmt=con.prepareStatement("select * from buyers where buyers.sellersemail= ?");
		pstmt.setString(1, sesemail);
		rs=pstmt.executeQuery();
		if(rs.next()){
		stmt=con.createStatement();
		pstmt=con.prepareStatement(
			    "SELECT * " +
			    	    "FROM (SELECT * " +
			    	          "FROM login.buyers AS b " +
			    	          "INNER JOIN login.books AS bo ON b.bookid = bo.book_id where b.sellersemail= ?) AS boo " +
			    	    "INNER JOIN login.employees AS e ON boo.id = e.id"
			    	);
		pstmt.setString(1, sesemail);
		rs=pstmt.executeQuery();
		while(rs.next()){
		
	  Blob blob = rs.getBlob("Image");
	            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
	            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	String encodedImage = URLEncoder.encode(base64Image, "UTF-8");%>
	<div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100">
                    <img src="data:image/jpeg;base64,<%= base64Image %>" class="card-img-top" alt="Book Image" style="height: 20rem;">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><b>Name OF Book: <%= rs.getString(7) %></b></li>
                        <li class="list-group-item"><b>Buyers Email: <%= rs.getString(2) %></b></li>
                        <li class="list-group-item"><b>Buyers Pnum: <%= rs.getLong(15) %></b></li>
                    </ul>
                </div>
            </div>
	
				<% 
		}}
		
		else{%>
			<h1 >" NO buyers Requested "</h1>
		<% }
	}catch (SQLException e) {
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