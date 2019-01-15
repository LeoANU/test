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
public class SendEmail2
{

public static void main(String [] args) throws GeneralSecurityException
{
   
   String to = "leo.liu08@sap.com";

 
   String from = "351526562@qq.com";

  
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

    
      message.setSubject("Interviewwwww");

      String leo="liu";
      message.setText("Hello,"+leo);

    
      Transport.send(message);
      System.out.println("Sent message successfully.");
   }catch (MessagingException mex) {
      mex.printStackTrace();
   }
}
}