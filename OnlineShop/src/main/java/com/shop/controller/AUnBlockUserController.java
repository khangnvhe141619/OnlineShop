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

/**
 * Servlet implementation class UnBlockUserController
 */
@WebServlet("/unBlockUserController")
public class AUnBlockUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AUnBlockUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int accountID = Integer.parseInt(request.getParameter("accountID"));
		try {
			AccountDAO dao = new AccountDAOImpl();
			dao.getUnBlockAccount(accountID);
			response.sendRedirect("listUserBlockController");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
//1233
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
