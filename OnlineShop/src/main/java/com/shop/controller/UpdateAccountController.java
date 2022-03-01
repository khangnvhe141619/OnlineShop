package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
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
 * Servlet implementation class UpdateAccountController
 */
@WebServlet("/UpdateAccountController")
public class UpdateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateAccountController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("email") == null || session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			String email = (String) session.getAttribute("email");
			AccountDAO accountDAO = new AccountDAOImpl();
			try {
				Account acc = accountDAO.getInfoAcc(email);
				request.setAttribute("account", acc);
			} catch (SQLException e) {
				request.setAttribute("errorSQL", true);
				request.getRequestDispatcher("views/Update-account.jsp").forward(request, response);
				e.printStackTrace();
			} finally {
				request.getRequestDispatcher("views/Update-account.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
