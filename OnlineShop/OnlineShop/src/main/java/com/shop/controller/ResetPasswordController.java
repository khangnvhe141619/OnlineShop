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
 * Servlet implementation class ResetPasswordController
 */
@WebServlet("/resetPasswordController")
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResetPasswordController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/Reset-password.jsp").forward(request, response);
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
				request.getRequestDispatcher("views/Reset-password.jsp").forward(request, response);
			} else {
				// set subject for email
				emailBean.setSubject("Reset Your Password");
				// set the email of the user to send to
				emailBean.setTo(email);
				// set content of email
				emailBean.setMessage("Hi " + account.getUsername() + "! Your password is: " + account.getPassword());
				try {
					// send mail for user
					EmailUtility.sendMail(emailBean);
					request.getRequestDispatcher("views/Login.jsp").forward(request, response);

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
