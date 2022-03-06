package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.shop.dao.DepartmentDAO;
import com.shop.dao.impl.DepartmentDAOImpl;
import com.shop.model.Department;

/**
 * Servlet implementation class AddDepartment
 */
@WebServlet("/addDepartment")
public class AddDepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddDepartmentController() {
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
		if(session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
		request.getRequestDispatcher("views/admin/A-New-department.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int role = (Integer) session.getAttribute("role");
		if (session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else if (role != 1) {
			response.sendRedirect("loginController");
		} else {
			String departmentName = request.getParameter("departmentName");
			String departmentDesc = request.getParameter("departmentDesc");
			DepartmentDAO dao = new DepartmentDAOImpl();
			Department department = new Department(departmentName, departmentDesc);
			try {
				if (dao.getInsertDepartments(department)) {
					request.getRequestDispatcher("views/admin/A-New-department.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
