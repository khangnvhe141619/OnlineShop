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
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/Account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			AccountDAO accountDAO = new AccountDAOImpl();
			Account account = accountDAO.getLogin(email, pass);
			if(account != null) {
//				HttpSession session = request.getSession();
//				session.setAttribute("email", email);
//				session.setAttribute("mem",member.getId());
				request.getRequestDispatcher("views/Index.jsp").forward(request, response);
			} else {
				request.setAttribute("failedLogin", true);
				request.setAttribute("e", email);
				request.setAttribute("p", pass);
				request.getRequestDispatcher("views/Account.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("errorLogin", true);
			request.getRequestDispatcher("views/Account.jsp").forward(request, response);
		}
	}
}
