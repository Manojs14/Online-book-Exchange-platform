package login.regester;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Update")
@MultipartConfig
public class UpdateBook extends HttpServlet {
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;
	int count;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//retrieve the values from the filled form
		String Bookname=req.getParameter("Bookname");
		String Bookauth=req.getParameter("Bookauth");
		String publishyear=req.getParameter("publishyear");
		int pubyear=Integer.parseInt(publishyear);
		Part file=req.getPart("file");
		String email=req.getParameter("e");
		String id=req.getParameter("id");
		int bookid=Integer.parseInt(id);
		System.out.println("EMail=  "+email);
		System.out.println("We are in Updatebook.java for book=  "+Bookname);
		System.out.println("We are in Updatebook.java for auth=  "+Bookauth);
		System.out.println("We are in Updatebook.java for bookid=  "+bookid);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Manu2341");
			System.out.println("connected");
			
			//Update values to books table
			pstmt=con.prepareStatement("Update books set `book_name`=?,`author_name`=?,`published_year`=?,`Image`=? where `book_id`=?");
			pstmt.setString(1, Bookname);
			pstmt.setString(2, Bookauth);
			pstmt.setInt(3, pubyear);
			pstmt.setBlob(4, file.getInputStream());
			pstmt.setInt(5, bookid);
			count=pstmt.executeUpdate();
			System.out.println("the value of count ="+count);
			System.out.println();
			if(count>0&&bookid>0) {
				req.setAttribute("email", email);
				req.setAttribute("status", "success");
				req.getRequestDispatcher("/viewbook.jsp").forward(req, resp);

			}
			else {
				req.setAttribute("status", "failed");
				req.getRequestDispatcher("/UpdateBook.jsp").forward(req, resp);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
