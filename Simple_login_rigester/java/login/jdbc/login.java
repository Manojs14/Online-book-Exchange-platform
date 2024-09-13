package login.jdbc;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login  extends HttpServlet {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	RequestDispatcher r;
	PrintWriter pw;
	HttpSession ses;
	public void doPost(HttpServletRequest req,HttpServletResponse resp) {
		String email=req.getParameter("email");
		System.out.println(email);
		String pass=req.getParameter("pass");
		System.out.println(pass);
		String query="Select * from employees where`email`=? and`pass`=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Manu2341");
			System.out.println("connected");
			pstmt=con.prepareStatement(query);
			pstmt.setString(1,email);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next()) {	
			System.out.println("rs.next");
			req.setAttribute("email", email);
			try {
				ses=req.getSession(true);
				ses.putValue("email", email);
				req.getRequestDispatcher("/Home.jsp").forward(req, resp);
			} catch (ServletException|IOException e) {
				e.printStackTrace();
			}
			}
			
			else {
			req.setAttribute("status","failed");
			try {
				req.getRequestDispatcher("/login.jsp").include(req,resp);
			} catch (ServletException|IOException e) {
				e.printStackTrace();
			}
		}
	}
			catch (SQLException|ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
		    try {
		        if (rs != null) rs.close();
		        if (pstmt != null) pstmt.close();
		        if (con != null) con.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}
	}
}