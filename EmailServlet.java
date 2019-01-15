package servlet;

import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.UUID;
import javax.activation.DataHandler;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import com.sun.mail.util.MailSSLSocketFactory;


public class EmailServlet {
	private static String from = "351526562@qq.com";
	private static String to = "leo.liu08@sap.com";
	public static void main(String []args) throws GeneralSecurityException{
		Properties props = new Properties();
		props.setProperty("mail.smtp.host", "smtp.qq.com");

		props.put("mail.smtp.auth", "true");
		   
		   props.put("mail.smtp.ssl.enable", "true");
		  
		Authenticator auth = new Authenticator() {
			@Override 
			protected PasswordAuthentication getPasswordAuthentication() {
				String username = "351526562@qq.com";
				String pwd = "azwfuubluuwxbhca";
				return new PasswordAuthentication(username, pwd);
			}
			};
			Session mailSession = Session.getInstance(props, auth);
			Message msg = new MimeMessage(mailSession);
			try {
				

	            msg.setFrom(new InternetAddress(from));
	            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            msg.setSubject("Interview");

	            StringBuffer sb = new StringBuffer();
	            String room="Room 1";
	            String date="20190116";
	            String start="1400";
	            String end="1500";
	            StringBuffer buffer = sb.append("BEGIN:VCALENDAR\n" +
	                    "PRODID:-//Microsoft Corporation//Outlook 9.0 MIMEDIR//EN\n" +
	                    "VERSION:2.0\n" +
	                    "METHOD:REQUEST\n" +
	                    "BEGIN:VEVENT\n" +
	                    "ATTENDEE;ROLE=REQ-PARTICIPANT;RSVP=TRUE:MAILTO:"+to+"\n" +
	                    "ORGANIZER:MAILTO:"+from+"\n" +
	                    "DTSTART:"+date+"T"+start+"00Z\n" +
	                    "DTEND:"+date+"T"+end+"00Z\n" +
	                    "LOCATION:"+room+"\n" +
	                    "TRANSP:OPAQUE\n" +
	                    "SEQUENCE:0\n" +
	                    "UID:"+UUID.randomUUID().toString()+"\n" +
	                    "DTSTAMP:20190114T120102Z\n" +
	                    "CATEGORIES:Meeting\n" +
	                    "DESCRIPTION:This the time of the interview.\n\n" +
	                    "SUMMARY:Interview\n" +
	                    "PRIORITY:5\n" +
	                    "CLASS:PUBLIC\n" +
	                    "BEGIN:VALARM\n" +
	                    "TRIGGER:PT1440M\n" +
	                    "ACTION:DISPLAY\n" +
	                    "DESCRIPTION:Reminder\n" +
	                    "END:VALARM\n" +
	                    "END:VEVENT\n" +
	                    "END:VCALENDAR");
	          	            
	            BodyPart messageBodyPart = new MimeBodyPart();

	            messageBodyPart.setHeader("Content-Class", "urn:content-  classes:calendarmessage");
	            messageBodyPart.setHeader("Content-ID", "calendar_message");
	            messageBodyPart.setDataHandler(new DataHandler(
	                    new ByteArrayDataSource(buffer.toString(), "text/calendar;method=REQUEST")));

	            Multipart multipart = new MimeMultipart();

	            multipart.addBodyPart(messageBodyPart);

	            msg.setContent(multipart);
	            
	            
				msg.saveChanges();
			} catch (Exception ex) {
			}
			sendEmail(msg);
	}

	public static Boolean sendEmail(Message msg){
		try {
			Transport.send(msg);
			return true;
		}catch (SendFailedException e) {
			System.out.println(e);
			return false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

}

	
	
	
	
	


	
	

