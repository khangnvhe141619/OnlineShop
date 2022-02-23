package com.shop.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.shop.model.Account;

public class SendMail {
	 //generate vrification code
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //send email to the user email
    public boolean sendEmail(Account user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "khacongkenh@gmail.com";
        String password = "Khang2k0";

        try {

            // your host email smtp server details
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "25");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
//            pr.put("mail.smtp.socketFactory.port", "587");
//            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            try {
                //set email message details
                Message mess = new MimeMessage(session);

                //set from email address
                mess.setFrom(new InternetAddress(fromEmail));
                //set to email address or destination email address
                mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
                //set email subject
                mess.setSubject("Order Confirmation");

                //set message text
                mess.setText("Hi " + user.getEmail() +"! Ordered successfully. Please Confirm your Order using this code: " + user.getEmail());
                //send the message
                Transport.send(mess);

                test = true;
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
//    public static void main(String[] args) {
//		SendMail sm=new SendMail();
//		Account a=new Account("abc", "123", "khang2k0@gmail.com", "0312321312", "2021-02-10");
//		boolean f=sm.sendEmail(a);
//		System.out.println(f);
//	}
}
