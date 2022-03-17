package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
 * Servlet implementation class ListUserBlockController
 */
@WebServlet("/listUserBlockController")
public class AListBlockedUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AListBlockedUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			AccountDAO dao = new AccountDAOImpl();
			try {
				int index = 1;
				int size = 6;
		        int count = dao.getCountAccountsBlock();
		        int endPage = count / size;
		        if (count % size != 0) {
		            endPage++;
		        }
				List<Account> list = dao.getListAccountOfAdminBlock(index);
				request.setAttribute("count", count);
				request.setAttribute("index", index);
				request.setAttribute("list", list);
				request.setAttribute("endPage", endPage);
				request.getRequestDispatcher("views/admin/A-Block-user.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			AccountDAO dao = new AccountDAOImpl();
			try {
				int index = Integer.parseInt(request.getParameter("index"));
				int size = 6;
		        int count = dao.getCountAccountsBlock();
		        int endPage = count / size;
		        if (count % size != 0) {
		            endPage++;
		        }
		        if(index < 1) {
		        	index = 1;
		        }
		        if(index > endPage) {
		        	index = endPage;
		        }
				List<Account> list = dao.getListAccountOfAdminBlock(index);
				request.setAttribute("count", count);
				request.setAttribute("index", index);
				request.setAttribute("list", list);
				request.setAttribute("endPage", endPage);
				request.getRequestDispatcher("views/admin/A-Block-user.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
