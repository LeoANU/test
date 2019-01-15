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

@WebServlet("/InterviewServlet")
@MultipartConfig
public class InterviewServlet extends HttpServlet{
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
			
			
			String fname=request.getParameter("fname");
			String sql="SELECT interviewer,date,start,end,location,comment from process where resume='"+fname+"'";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				 String interviewer=rs.getString(1);
				 String date=rs.getString(2);
				 String start=rs.getString(3);
				 String end=rs.getString(4);
				 String location=rs.getString(5);
				 String comment=rs.getString(6);
				 list.add(interviewer);
				 list.add(date);
				 list.add(start);
				 list.add(end);
				 list.add(location);
				 list.add(comment);
				 
			 }

		} catch (Exception e) {

			e.printStackTrace();

		}
	
		request.setAttribute("mylist",list);


		request.getRequestDispatcher("/checkinterview.jsp").forward(request, response);



	}

}
