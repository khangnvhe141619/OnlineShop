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
import com.shop.dao.DepartmentDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.dao.impl.DepartmentDAOImpl;
import com.shop.model.Account;
import com.shop.model.Department;

/**
 * Servlet implementation class UserDetailController
 */
@WebServlet("/userDetailController")
public class AUserDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AUserDetailController() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("email") == null || session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			String id = request.getParameter("accountID");
			String accountID = request.getParameter("AcountID");
			AccountDAO accountDAO = new AccountDAOImpl();
			DepartmentDAO departmentDAO = new DepartmentDAOImpl();
			try {
				List<Department> list = departmentDAO.getListAllDepartments();
				if(id != null) {
					Account acc = accountDAO.getInfoAccountID(id);
					request.setAttribute("account", acc);
				} else {
					Account acc = accountDAO.getInfoAccountID(accountID);
					request.setAttribute("account", acc);
				}
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/admin/A-User-detail.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
