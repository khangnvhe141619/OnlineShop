package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.AccountDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.model.Account;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/ChangePassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String currentpass = request.getParameter("currentpass");
		String newpass = request.getParameter("newpass");
		String repass = request.getParameter("repass");
		HttpSession session = request.getSession();
		int accountID = (int) session.getAttribute("account");
		Account account = new Account(accountID, repass);
		AccountDAO accountDAO = new AccountDAOImpl();
		try {
			if (!newpass.equals(repass)) {
				request.setAttribute("NotMatch", true);
			} else if (accountDAO.getCheckPassword(accountID, currentpass) == null) {
				request.setAttribute("PasswordIncorrect", true);
			} else if (accountDAO.getCheckPassword(accountID, currentpass) != null) {
				accountDAO.getChangePassword(account);
				request.setAttribute("successfully", true);
				request.getRequestDispatcher("views/ChangePassword.jsp").forward(request, response);
			} else {
				request.setAttribute("failedRegister", true);
			}
			request.setAttribute("currentpass", currentpass);
			request.setAttribute("newpass", newpass);
			request.setAttribute("repass", repass);
			request.getRequestDispatcher("views/ChangePassword.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("errorSQL", true);
			request.getRequestDispatcher("views/ChangePassword.jsp").forward(request, response);
			e.printStackTrace();
		}
	}
}
