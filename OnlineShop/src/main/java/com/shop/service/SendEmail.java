package com.shop.service;

import java.awt.Color;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendEmail {
	private final String emailSubject = "The new password send to from giai-ma.blogspot.com";

    public void sendEmail(String emailToAddress, String textMessage) {

        final String username = "khacongkenh@gmail.com";//Enter your email
        final String password = "Khang2k0"; //Enter your password 

        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "25");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.EnableSSL.enable", "true");

//        props.setProperty("mail.smtp.socketFactory.class",
//                "javax.net.ssl.SSLSocketFactory");
//        props.setProperty("mail.smtp.socketFactory.fallback", "false");
//        props.setProperty("mail.smtp.port", "465");
//        props.setProperty("mail.smtp.socketFactory.port", "465");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailToAddress));
            message.setSubject(emailSubject);
            message.setContent("Hiii", "text/html; charset=UTF-8");
            // send the email
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
//		
    	SendEmail se=new SendEmail();
    	se.sendEmail("khang2k0@gmail.com", "Hii");
	}
}
