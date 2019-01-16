package servlet;


import java.util.Properties;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.mail.util.MailSSLSocketFactory;
import java.io.IOException;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.activation.*;

@WebServlet("/Send2")

public class Send2 extends HttpServlet
{


	private static final long serialVersionUID = 1L;
	private static String jdbcDriver = "com.mysql.jdbc.Driver";
	public static String jdbcUrl = "jdbc:mysql://localhost:3306/login";
	public static String jdbcUser = "root";
	public static String jdbcPwd = "123456";
	private static Connection conn;
	public static Statement stmt;
	static {

		try {

			Class.forName(jdbcDriver);

			conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);

			stmt = conn.createStatement();

		} catch (Exception e) {

			e.printStackTrace();

		}

	}


public void service(HttpServletRequest request, HttpServletResponse response) 

		throws ServletException, IOException {


		String to =request.getParameter("email");
		String location =request.getParameter("location");
		String date =request.getParameter("date");
		String start =request.getParameter("start");	   
		String end =request.getParameter("end");
		String from = "351526562@qq.com";
		List<String> email=new ArrayList<String>();
		String interviewer =request.getParameter("interviewer"); 
		String[] uname=interviewer.split("\\*");
		
		for (int i=1;i<uname.length;i++)
		{	
			try {
				
				String username=uname[i];
				
				String sql="SELECT * from login where username='"+username+"'";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					 String ee=rs.getString(3);
					 
					 email.add(ee);}
				
			} catch (Exception e) {

				e.printStackTrace();

			}
			

		};
		
		request.setAttribute("tet", email);
		StringBuffer dat=new StringBuffer(date);
		dat.insert(6,"-");
		dat.insert(4,"-");
		StringBuffer st=new StringBuffer(start);
		st.insert(2,":");
		StringBuffer ed=new StringBuffer(end);
		ed.insert(2,":");
  
   String host = "smtp.qq.com";  

 
   Properties properties = System.getProperties();

  
   properties.setProperty("mail.smtp.host", host);

   properties.put("mail.smtp.auth", "true");
  
   properties.put("mail.smtp.ssl.enable", "true");


   Session session = Session.getDefaultInstance(properties,new Authenticator(){
     public PasswordAuthentication getPasswordAuthentication()
     {
      return new PasswordAuthentication("351526562@qq.com", "azwfuubluuwxbhca"); 
     }
    });

   try{
    
      MimeMessage message = new MimeMessage(session);

      
      message.setFrom(new InternetAddress(from));

      
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));

    
      message.setSubject("Interview");

      
      message.setText("You will have a interview on "+dat+" from "+st+" to "+ed+" at "+location+".");

      
      Transport.send(message);
      
   }catch (MessagingException mex) {
      mex.printStackTrace();
   }
   
   request.getRequestDispatcher("Meeting2").forward(request, response);
}
}