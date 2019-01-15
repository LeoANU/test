package servlet;


import java.util.Properties;
import java.security.GeneralSecurityException;
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

@WebServlet("/Send")

public class Send extends HttpServlet
{


	private static final long serialVersionUID = 1L;

public void service(HttpServletRequest request, HttpServletResponse response) 

		throws ServletException, IOException {


		String to =request.getParameter("email");
		String location =request.getParameter("location");
		String date =request.getParameter("date");
		String start =request.getParameter("start");	   
		String end =request.getParameter("end");
		String from = "351526562@qq.com";
		StringBuffer dat=new StringBuffer(date);
		dat.insert(6,"-");
		dat.insert(4,"-");
		StringBuffer st=new StringBuffer(start);
		dat.insert(2,":");
		StringBuffer ed=new StringBuffer(end);
		dat.insert(2,":");
  
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
}
}