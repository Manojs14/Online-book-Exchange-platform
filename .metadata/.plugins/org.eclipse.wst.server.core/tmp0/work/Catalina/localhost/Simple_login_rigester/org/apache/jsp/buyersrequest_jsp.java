/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.85
 * Generated at: 2024-07-01 06:06:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URLEncoder;
import java.util.Base64;
import java.sql.*;
import java.io.*;
import java.sql.DriverManager;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;

public final class buyersrequest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("java.net.URLEncoder");
    _jspx_imports_classes.add("java.util.Base64");
    _jspx_imports_classes.add("java.sql.SQLException");
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
    _jspx_imports_classes.add("java.sql.DriverManager");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>The Views Of Book</title>\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\"\r\n");
      out.write("	integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("	<style>\r\n");
      out.write("  .nav-item:hover{\r\n");
      out.write("        cursor:pointer;\r\n");
      out.write("        text-decoration: underline;\r\n");
      out.write("        }\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

HttpServletRequest req= (HttpServletRequest)pageContext.getRequest();
HttpSession ses=req.getSession(true); 
String sesemail= (String)ses.getValue("email");
System.out.println("The session email= "+sesemail);

      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-expand-lg bg-body-tertiary\">\r\n");
      out.write("  <div class=\"container-fluid\">\r\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\r\n");
      out.write("      <ul class=\"navbar-nav\">\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link active\" aria-current=\"page\" onclick=\"redirectToHome()\">Home</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" onclick=\"gotoaddbook()\">AddBook</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" >ViewBook</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" onclick=\"gotostore()\">Web Store</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" aria-disabled=\"true\" onclick=\"gotoaboutus()\">About us</a>\r\n");
      out.write("        </li>\r\n");
      out.write("         <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" aria-disabled=\"true\" onclick=\"logout()\">Logout</a>\r\n");
      out.write("        </li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("		var email=\"");
      out.print(sesemail);
      out.write("\";\r\n");
      out.write("		\r\n");
      out.write("        function redirectToHome() {\r\n");
      out.write("            window.location.href = 'Home.jsp?email='+encodeURIComponent(email);\r\n");
      out.write("        }\r\n");
      out.write("   \r\n");
      out.write("        function logout() {\r\n");
      out.write("            window.location.href = 'login.jsp';\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        function gotoviewbook(){\r\n");
      out.write("    		window.location.href='viewbook.jsp?email=' +  encodeURIComponent(email);\r\n");
      out.write("    	}\r\n");
      out.write("        \r\n");
      out.write("      	function gotoaddbook(){\r\n");
      out.write("    		window.location.href='add.jsp?email=' +  encodeURIComponent(email);\r\n");
      out.write("    	}\r\n");
      out.write("        \r\n");
      out.write("		function gotostore(){\r\n");
      out.write("		window.location.href='Store.jsp?email=' +  encodeURIComponent(email);\r\n");
      out.write("		}\r\n");
      out.write("	\r\n");
      out.write("		function gotoaboutus() {\r\n");
      out.write("		window.location.href = 'aboutus.jsp?email=' + encodeURIComponent(email);\r\n");
      out.write("		}\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("	<h1 class=\"justify-content\">Details Of Buyers </h1>");
 
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
	String encodedImage = URLEncoder.encode(base64Image, "UTF-8");
      out.write("\r\n");
      out.write("	<div class=\"col-md-3 col-sm-6 mb-4\">\r\n");
      out.write("                <div class=\"card h-100\">\r\n");
      out.write("                    <img src=\"data:image/jpeg;base64,");
      out.print( base64Image );
      out.write("\" class=\"card-img-top\" alt=\"Book Image\" style=\"height: 20rem;\">\r\n");
      out.write("                    <ul class=\"list-group list-group-flush\">\r\n");
      out.write("                        <li class=\"list-group-item\"><b>Name OF Book: ");
      out.print( rs.getString(7) );
      out.write("</b></li>\r\n");
      out.write("                        <li class=\"list-group-item\"><b>Buyers Email: ");
      out.print( rs.getString(2) );
      out.write("</b></li>\r\n");
      out.write("                        <li class=\"list-group-item\"><b>Buyers Pnum: ");
      out.print( rs.getLong(15) );
      out.write("</b></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("	\r\n");
      out.write("				");
 
		}}
		
		else{
      out.write("\r\n");
      out.write("			<h1 >\" NO buyers Requested \"</h1>\r\n");
      out.write("		");
 }
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
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("  	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js\"\r\n");
      out.write("		integrity=\"sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js\"\r\n");
      out.write("		integrity=\"sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
