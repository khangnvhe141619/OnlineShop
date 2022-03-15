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
 * Servlet implementation class Login
 */
@WebServlet("/loginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Account account;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("username");
			String pass = request.getParameter("password");
			AccountDAO accountDAO = new AccountDAOImpl();
			account = accountDAO.getLogin(email, pass);
			HttpSession session = request.getSession();
			if(account != null) {
				if(account.getActive() == 1) {
					session.setAttribute("acc", account);
					session.setAttribute("email", email);
					session.setAttribute("account",account.getAccountId());
					session.setAttribute("username",account.getUsername());
					session.setAttribute("role",account.getRole());
					if(account.getRole() == 1) {
						request.getRequestDispatcher("/aHomeController").forward(request, response);
					} else {
						request.getRequestDispatcher("views/Home.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("block", true);
					request.setAttribute("email", email);
					request.setAttribute("pass", pass);
					request.getRequestDispatcher("views/Login.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("failedLogin", true);
				request.setAttribute("email", email);
				request.setAttribute("pass", pass);
				request.getRequestDispatcher("views/Login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("errorLogin", true);
			request.getRequestDispatcher("views/Login.jsp").forward(request, response);
		}
	}
}
