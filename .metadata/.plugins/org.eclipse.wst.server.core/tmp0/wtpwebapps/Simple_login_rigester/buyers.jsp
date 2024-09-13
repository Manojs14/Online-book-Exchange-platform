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
<title>Insert title here</title>
</head>
<body>
<%
HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
HttpServletResponse resp = (HttpServletResponse) pageContext.getResponse();
HttpSession ses=req.getSession(true); 
String selleremail = req.getParameter("e");
String email = req.getParameter("s");
String id = req.getParameter("d");
int bookid = Integer.parseInt(id);
System.out.println("Inside buyer.jsp   " + selleremail +" "+bookid+" "+email);
%>
<div class="container">
<div class="row">
    <%
Connection con;
PreparedStatement stmt;
ResultSet rs;

try {
Class.forName("com.mysql.cj.jdbc.Driver");
System.out.println("loaded");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Manu2341");
System.out.println("connected");
stmt=con.prepareStatement("Insert Into buyers ( `buyemail`, `sellersemail`, `bookid`) Values(?,?,?)") ;
stmt.setString(1,email);
stmt.setString(2, selleremail);
stmt.setInt(3, bookid);
boolean r=stmt.execute();
System.out.println("The boolean r is "+r);
if(r==false){
	ses.setAttribute("email", email);
	req.setAttribute("Status", "success");
	req.getRequestDispatcher("Store.jsp").forward(req, resp);
	}else{
		ses.setAttribute("email", email);
		req.setAttribute("Status", "failure");
		req.getRequestDispatcher("Store.jsp").forward(req, resp);
	}
}catch(Exception e){
e.printStackTrace();
}
%>
</div>
</div>
%>
</body>
</html>