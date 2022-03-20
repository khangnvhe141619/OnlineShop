package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shop.dao.DepartmentDAO;
import com.shop.dao.impl.DepartmentDAOImpl;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/DeleteDepartmentController")
public class ADeleteDepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ADeleteDepartmentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		DepartmentDAO dao = new DepartmentDAOImpl();
		try {
			int total = dao.countAccountByID(id);
			if (total == 0) {
				boolean check = dao.getDeleteDepartments(id);
				if (check) {
					System.out.println(id);
					if (check == true) {
						System.out.println("true");
						request.setAttribute("dSuccess", true);
						request.getRequestDispatcher("listDepartmentController").forward(request, response);
					} else {
						System.out.println("false");
					}
				}
			} else {
				request.setAttribute("dError", true);
				request.getRequestDispatcher("listDepartmentController").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub why
		doGet(request, response);
	}

}
