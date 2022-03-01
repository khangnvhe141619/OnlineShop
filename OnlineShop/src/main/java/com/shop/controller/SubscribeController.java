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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
				emailBean.setMessage("Thank you for liking and subscribing to our website. We hope you have a good experience using our products.\r\n"
						+ "Regards\r\n"
						+ "Admin");
				try {
					// send mail for user
					EmailUtility.sendMail(emailBean);
					request.getRequestDispatcher("views/Home.jsp").forward(request, response);

				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
