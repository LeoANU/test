package servlet;



import java.io.IOException;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.ResultSet;

import java.sql.Statement;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CommentServlet")
@MultipartConfig
public class CommentServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private static String jdbcDriver = "com.mysql.jdbc.Driver";

	public static String jdbcUrl = "jdbc:mysql://localhost:3306/interview";

	public static String jdbcUser = "root";

	public static String jdbcPwd = "123456";

	private static Connection conn;

	public static Statement st;

	

	static {

		try {

			Class.forName(jdbcDriver);

			conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);

			st = conn.createStatement();

		} catch (Exception e) {

			e.printStackTrace();

		}

	}



	

	

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) //

			throws ServletException, IOException {

        List<String> list=new ArrayList<String>();

	


		try {
			
			
			 String id=request.getParameter("id");
			 String sql="SELECT * from interview where id='"+id+"'";
			 ResultSet rs=st.executeQuery(sql);
			 while(rs.next()){
				 String c1=rs.getString(5);
				 String c2=rs.getString(6);
				 String c3=rs.getString(7);
				 String c4=rs.getString(8);
				 String c5=rs.getString(9);
				 list.add(c1);
				 list.add(c2);
				 list.add(c3);
				 list.add(c4);
				 list.add(c5);
				 
			 }

		} catch (Exception e) {

			e.printStackTrace();

		}
	
		request.setAttribute("mylist",list);


		request.getRequestDispatcher("/comment.jsp").forward(request, response);



	}

}
