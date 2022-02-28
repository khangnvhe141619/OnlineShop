package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shop.dao.AccountDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.model.Account;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/registerController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/Signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String repassword = request.getParameter("repass");
		LocalDate localDate = java.time.LocalDate.now();
		String date = localDate.toString();
		Account account = new Account(username, password, date);
		AccountDAO accountDAO = new AccountDAOImpl();
		try {
			if(!password.equals(repassword)){
	            request.setAttribute("error", "Password and Re-Password isn't match !!!");
	            request.getRequestDispatcher("views/Signup.jsp").forward(request, response);
	        }else if(accountDAO.getCheckUsername(username)) {
				request.setAttribute("errorUsername", true);
				request.setAttribute("account", account);
				request.getRequestDispatcher("views/Signup.jsp").forward(request, response);
			} else if(accountDAO.getInsertAccount(account)) {
				response.sendRedirect(request.getContextPath()+ "/loginController");
			} else {
				request.setAttribute("failedRegister", true);
				request.setAttribute("account", account);
				request.getRequestDispatcher("views/Signup.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("errorSQL", true);
			request.setAttribute("account", account);
			request.getRequestDispatcher("views/Signup.jsp").forward(request, response);
			e.printStackTrace();
		}
	}

}
