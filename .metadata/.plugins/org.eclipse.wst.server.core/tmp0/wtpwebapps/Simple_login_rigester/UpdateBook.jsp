<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Books</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<!-- to retrieve the email and send it through the form by hiding -->
	<%
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String bookname = null;
	String bookauth = null;
	int pubyear = 0;
	Blob img = null;
	HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
	String email = req.getParameter("e");
	String id = req.getParameter("u");
	int bookid = Integer.parseInt(id);
	System.out.println("Inside Updatebook.jsp   " + email);
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "Manu2341");
	System.out.println("conected");
	pstmt = con.prepareStatement("Select * from books where `book_id`=?");
	pstmt.setInt(1, bookid);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		bookname = rs.getString(3);
		System.out.println("inside updatebook.java bookname  " + bookname);
		bookauth = rs.getString(4);
		System.out.println("inside updatebook.java bookauth  " + bookauth);
		pubyear = rs.getInt(5);
		System.out.println("inside updatebook.java pubyear   " + pubyear);
	}
	%>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="viewbook.jsp">viewbook</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="add.jsp">Addbooks</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Store.jsp">Web
							Store</a></li>
					<li class="nav-item"><a class="nav-link" aria-disabled="true"
						href="aboutus.jsp">Aboutus</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container text-left">
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4">
				<h1 class="text-center">Update Books</h1>

				<!--form for adding the books  -->
				<form action="Update?e=<%=email%>&id=<%=bookid%>" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<%
						System.out.println("Inside the form in updatebook.jsp   " + email);
						%>

						<label for="Bookname" class="form-label">Book Name </label> <input
							type="text" value="<%=bookname%>" class="form-control"
							id="Bookname" name="Bookname" aria-describedby="text"
							placeholder="Enter The book Name" required>
					</div>
					<div class="mb-3">
						<label for="Bookauth" class="form-label"> Book author</label> <input
							type="text" class="form-control" value="<%=bookauth%>"
							name="Bookauth" id="Bookauth" placeholder="Enter The author name"
							required>
					</div>
					<div class="mb-3">
						<label for="number" class="form-label">Published year</label> <input
							type="number" class="form-control" value="<%=pubyear%>"
							name="publishyear" id="publishyear"
							placeholder="Enter The Published Year" required>
					</div>
					<label>Insert Image Of book</label> <br> <input type="file"
						name="file" accept=".jpg, .jpeg, .png, .gif" required> <br>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
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