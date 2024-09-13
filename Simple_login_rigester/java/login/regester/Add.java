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

@WebServlet("/Addbook")
@MultipartConfig
public class Add extends HttpServlet {
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;
	int userid;
	int count;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//retrieve the values from the filled form
		String Bookname=req.getParameter("Bookname");
		String Bookauth=req.getParameter("Bookauth");
		String publishyear=req.getParameter("publishyear");
		Part file=req.getPart("file");
		String email=req.getParameter("email");
		System.out.println("EMail=  "+email);
		System.out.println("We are in add.java for book=  "+Bookname);
		System.out.println("We are in add.java for auth=  "+Bookauth);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Manu2341");
			System.out.println("connected");
			pstmt=con.prepareStatement("select `id` from employees where `email`=?");
			pstmt.setString(1,email);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				// Retrieve the 'id' from the result set
				userid = rs.getInt("id");
				System.out.println("Employee id ="+userid);
			}
			//Insert values to books table
			pstmt=con.prepareStatement("insert into books(`id`,`book_name`,`author_name`,`published_year`,`Image`) values(?,?,?,?,?)");
			pstmt.setInt(1,userid);
			pstmt.setString(2, Bookname);
			pstmt.setString(3, Bookauth);
			pstmt.setString(4, publishyear);
			pstmt.setBlob(5, file.getInputStream());
			count=pstmt.executeUpdate();
			System.out.println("the value of count ="+count);
			if(count>0&&userid>0) {
				req.setAttribute("status", "success");
				req.getRequestDispatcher("/Home.jsp").forward(req, resp);

			}
			else {
				req.setAttribute("status", "failed");
				req.getRequestDispatcher("/add.jsp").forward(req, resp);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
