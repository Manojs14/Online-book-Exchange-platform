package login.regester;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Delete")
public class Delete extends HttpServlet {
	Connection con;
	PreparedStatement stmt;
	ResultSet rs;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String d=req.getParameter("d");
		int id=Integer.parseInt(d);
		String email=req.getParameter("e");
		System.out.println("inside delete.java id "+id);
		System.out.println("inside delete.java email "+email);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Manu2341");
			System.out.println("connected");
			stmt=con.prepareStatement("Delete from  books where `book_id`=?");
			stmt.setInt(1, id);
			int i=stmt.executeUpdate();
			if (i>0) {
				req.setAttribute("status", "success");
				System.out.println("Deleted Successfully");
			}
			else {
				req.setAttribute("status", "failed");
				System.out.println("Deleted not possible");
			}
			req.setAttribute("email", email);
			System.out.println(email);
			req.getRequestDispatcher("/viewbook.jsp").forward(req, resp);
//			if(con!=null) {
//				con.close();
//			}
//			if(stmt!=null) {
//				stmt.close();
//			}
//			if(rs!=null) {
//				rs.close();
//			}
	} catch(Exception e) {
		e.printStackTrace();
		}
	}
}
