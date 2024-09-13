//package login.regester;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
//
//@WebServlet("/Add2")
//@MultipartConfig
//public class Add2 extends HttpServlet {
//	
//	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
//	String s=req.getParameter("Bookname");
//	System.out.println("inside add2.java   "+s);
//	Part file=req.getPart("file");
//	   String fileName = file.getSubmittedFileName();
//	System.out.println("Photo name"+fileName);
//	req.getRequestDispatcher("/viewbook.jsp").forward(req, response);
//	}
//
//}
