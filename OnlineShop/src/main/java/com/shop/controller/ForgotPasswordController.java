package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.AccountDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.model.Account;
import com.shop.service.EmailMessage;
import com.shop.service.EmailUtility;

/**
 * Servlet implementation class ForgotPasswordController
 */
@WebServlet("/forgotPasswordController")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPasswordController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/Forgot-password.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDAO accountDAO = new AccountDAOImpl();
		EmailMessage emailBean = new EmailMessage();
		Account account = null;
		String email = request.getParameter("email").trim();
		try {
			account = accountDAO.findPassword(email);
			if (account == null) {
				request.setAttribute("emailError", true);
				request.getRequestDispatcher("views/Forgot-password.jsp").forward(request, response);
			} else {
				// set subject for email
				emailBean.setSubject("Reset Your Password");
				// set the email of the user to send to
				emailBean.setTo(email);
				// set content of email
				String s = "<html>\n<head>\n<title>Hola</title>\n</head>\n<body>Alo Alo</body></html>";
				emailBean.setMessage(
						"Hi " + account.getUsername() + "! Your password is: " + account.getPassword() + "\n" + s);
				try {
					// send mail for user
					EmailUtility.sendMail(emailBean);
					request.setAttribute("title", "Forgot password!");
					request.setAttribute("describe",
							"Your data has been successfully submitted. We sent your password via the email.");
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

}
