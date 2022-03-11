package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.SubscriberDAO;
import com.shop.dao.impl.SubscriberDAOImpl;
import com.shop.model.Subscriber;
import com.shop.service.EmailMessage;
import com.shop.service.EmailUtility;

/**
 * Servlet implementation class SubscribeController
 */
@WebServlet("/subscribeController")
public class SubscribeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       //check
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubscribeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/Home.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubscriberDAO subscriberDAO = new SubscriberDAOImpl();
		EmailMessage emailBean = new EmailMessage();
		Subscriber subscriber = null;
		String email = request.getParameter("email");
		String fullname = request.getParameter("name");
		LocalDateTime date = LocalDateTime.now();
		try {
			subscriber = new Subscriber(fullname, email, date);
			boolean add = subscriberDAO.insertSubscriber(subscriber);
			if (!add) {
				request.getRequestDispatcher("views/Home.jsp").forward(request, response);
			} else {
				// set subject for email
				emailBean.setSubject("Thank for subscribing our website");
				// set the email of the user to send to
				emailBean.setTo(email);
				// set content of email
				emailBean.setMessageType(1);
				emailBean.setMessage(THANKYOU);
				try {
					// send mail for user
					EmailUtility.sendMail(emailBean);
					request.setAttribute("title", "Thank you!");
					request.setAttribute("describe", "Your data has been successfully submitted. Thank for subscribing our website.");
					request.getRequestDispatcher("views/Thankyou.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private final String THANKYOU="<!DOCTYPE html>\r\n"
			+ "<html lang=\"en\">\r\n"
			+ "<head>\r\n"
			+ "    <meta charset=\"UTF-8\">\r\n"
			+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
			+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
			+ "    <title>Document</title>\r\n"
			+ "    <style>\r\n"
			+ "        *{\r\n"
			+ "  box-sizing:border-box;\r\n"
			+ " /* outline:1px solid ;*/\r\n"
			+ "}\r\n"
			+ "body{\r\n"
			+ "background: #ffffff;\r\n"
			+ "background: linear-gradient(to bottom, #ffffff 0%,#e1e8ed 100%);\r\n"
			+ "filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e1e8ed',GradientType=0 );\r\n"
			+ "    height: 100%;\r\n"
			+ "        margin: 0;\r\n"
			+ "        background-repeat: no-repeat;\r\n"
			+ "        background-attachment: fixed;\r\n"
			+ "  \r\n"
			+ "}\r\n"
			+ "\r\n"
			+ ".wrapper-1{\r\n"
			+ "  width:100%;\r\n"
			+ "  height:100vh;\r\n"
			+ "  display: flex;\r\n"
			+ "flex-direction: column;\r\n"
			+ "}\r\n"
			+ ".wrapper-2{\r\n"
			+ "  padding :30px;\r\n"
			+ "  text-align:center;\r\n"
			+ "}\r\n"
			+ "h1{\r\n"
			+ "    font-family: 'Kaushan Script', cursive;\r\n"
			+ "  font-size:4em;\r\n"
			+ "  letter-spacing:3px;\r\n"
			+ "  color:#5892FF ;\r\n"
			+ "  margin:0;\r\n"
			+ "  margin-bottom:20px;\r\n"
			+ "}\r\n"
			+ ".wrapper-2 p{\r\n"
			+ "  margin:0;\r\n"
			+ "  font-size:1.3em;\r\n"
			+ "  color:#aaa;\r\n"
			+ "  font-family: 'Source Sans Pro', sans-serif;\r\n"
			+ "  letter-spacing:1px;\r\n"
			+ "}\r\n"
			+ ".go-home{\r\n"
			+ "  color:#fff;\r\n"
			+ "  background:#5892FF;\r\n"
			+ "  border:none;\r\n"
			+ "  padding:10px 50px;\r\n"
			+ "  margin:30px 0;\r\n"
			+ "  border-radius:30px;\r\n"
			+ "  text-transform:capitalize;\r\n"
			+ "  box-shadow: 0 10px 16px 1px rgba(174, 199, 251, 1);\r\n"
			+ "}\r\n"
			+ ".footer-like{\r\n"
			+ "  margin-top: auto; \r\n"
			+ "  background:#D7E6FE;\r\n"
			+ "  padding:6px;\r\n"
			+ "  text-align:center;\r\n"
			+ "}\r\n"
			+ ".footer-like p{\r\n"
			+ "  margin:0;\r\n"
			+ "  padding:4px;\r\n"
			+ "  color:#5892FF;\r\n"
			+ "  font-family: 'Source Sans Pro', sans-serif;\r\n"
			+ "  letter-spacing:1px;\r\n"
			+ "}\r\n"
			+ ".footer-like p a{\r\n"
			+ "  text-decoration:none;\r\n"
			+ "  color:#5892FF;\r\n"
			+ "  font-weight:600;\r\n"
			+ "}\r\n"
			+ "\r\n"
			+ "@media (min-width:360px){\r\n"
			+ "  h1{\r\n"
			+ "    font-size:4.5em;\r\n"
			+ "  }\r\n"
			+ "  .go-home{\r\n"
			+ "    margin-bottom:20px;\r\n"
			+ "  }\r\n"
			+ "}\r\n"
			+ "\r\n"
			+ "@media (min-width:600px){\r\n"
			+ "  .content{\r\n"
			+ "  max-width:1000px;\r\n"
			+ "  margin:0 auto;\r\n"
			+ "}\r\n"
			+ "  .wrapper-1{\r\n"
			+ "  height: initial;\r\n"
			+ "  max-width:620px;\r\n"
			+ "  margin:0 auto;\r\n"
			+ "  margin-top:50px;\r\n"
			+ "  box-shadow: 4px 8px 40px 8px rgba(88, 146, 255, 0.2);\r\n"
			+ "}\r\n"
			+ "  \r\n"
			+ "}\r\n"
			+ "    </style>\r\n"
			+ "</head>\r\n"
			+ "<body>\r\n"
			+ "    \r\n"
			+ "<div class=content>\r\n"
			+ "    <div class=\"wrapper-1\">\r\n"
			+ "      <div class=\"wrapper-2\">\r\n"
			+ "        <h1>Thank you !</h1>\r\n"
			+ "        <p>Thanks for subscribing to our news website.  </p>\r\n"
			+ "        <p> </p>\r\n"
			+ "        \r\n"
			+ "      </div>\r\n"
			+ "      <div class=\"footer-like\">\r\n"
			+ "      \r\n"
			+ "        </p>\r\n"
			+ "      </div>\r\n"
			+ "  </div>\r\n"
			+ "  </div>\r\n"
			+ "  \r\n"
			+ "  <link href=\"https://fonts.googleapis.com/css?family=Kaushan+Script|Source+Sans+Pro\" rel=\"stylesheet\">\r\n"
			+ "</body>\r\n"
			+ "</html>";
}
