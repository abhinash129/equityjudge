//package com.nivesh.util;
//
//import java.io.UnsupportedEncodingException;
//import java.util.Properties;
//
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//import org.springframework.stereotype.Component;
//import com.nivesh.bo.EmailBO;
//
//@Component
//public class SMTPEmailSend implements IEmailMessageSend {
//
//    @Override
//    public void sendMail(final EmailBO emailBO) {
//
//        // 1st step: Set properties for Gmail SMTP
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com");  
//        props.put("mail.smtp.port", "587");  
//        props.put("mail.smtp.auth", "true");  
//        props.put("mail.smtp.starttls.enable", "true"); // Enables STARTTLS
//
//        // 2nd step: Get the session object  
//        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(emailBO.getSenderEmailId(), emailBO.getSenderPassword());
//            }
//        });
//
//        try {
//            // 3rd step: Compose message
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(emailBO.getSenderEmailId(), "Equity Judge Mailer"));
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailBO.getReciverEmailId()));
//            message.setSubject(emailBO.getSubject());
//            message.setContent(emailBO.getMessage(), "text/html");
//
//            // 4th step: Send email
//            Transport.send(message);
//            System.out.println("Email sent successfully!");
//
//        } catch (MessagingException | UnsupportedEncodingException e) {
//            e.printStackTrace();
//            throw new RuntimeException("Failed to send email: " + e.getMessage(), e);
//        }
//    }
//}








package com.nivesh.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.nivesh.bo.EmailBO;

@Component
public class SMTPEmailSend implements IEmailMessageSend {

	@Override
	public void sendMail(final EmailBO emailBO) {

				//1st step) Get the session object	
				Properties props = new Properties();
				props.put("mail.smtp.host", "mail.equityjudge.com");  
				props.put("mail.smtp.socketFactory.port", "8080");  
				/*props.put("mail.smtp.socketFactory.class",  
						"javax.net.ssl.SSLSocketFactory");  */
				props.put("mail.smtp.auth", "true");  
				props.put("mail.smtp.port", "8080");  
				
				
				props.put("mail.debug", "true");
				
					System.out.println(emailBO.getSenderEmailId());
					System.out.println(emailBO.getSenderPassword());
			
				
				Session session = Session.getDefaultInstance(props,
						new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(emailBO.getSenderEmailId(),emailBO.getSenderPassword());
					}
				});
				//2nd step)compose message
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(emailBO.getSenderEmailId(),"Equityjudge Support Team"));
					message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailBO.getReciverEmailId()));
					message.setSubject(emailBO.getSubject());
					message.setContent(emailBO.getMessage(), "text/html");

					//3rd step)send message
					Transport.send(message);

					System.out.println(emailBO.getSenderEmailId());
					System.out.println(emailBO.getSenderPassword());
					
					
				} catch (MessagingException e) {
					throw new RuntimeException(e);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		    
		    }

}
