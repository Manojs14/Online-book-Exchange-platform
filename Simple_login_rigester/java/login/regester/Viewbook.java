package login.regester;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Viewbook")
public class Viewbook extends HttpServlet {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int id;
	PrintWriter pw;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		pw=resp.getWriter();
		String email=req.getParameter("email");
		System.out.println("Inside Viewbook.java   "+email);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login" ,"root","Manu2341");
			System.out.println("conected");
			pstmt=con.prepareStatement("Select * from employees where `email`=?");
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				id=rs.getInt(1);
			}
			System.out.println("The id of user=  "+id);
			pstmt=con.prepareStatement("select * from books where `id`=?");
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("Inside the view book.java resultset"+rs.getString(3));
			}
//			req.setAttribute("res", rs);
//			req.getRequestDispatcher("viewbook.jsp").forward(req, resp);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}






