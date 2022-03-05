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
import com.shop.dao.DepartmentDAO;
import com.shop.dao.impl.DepartmentDAOImpl;
import com.shop.model.Department;

@WebServlet("/listDepartmentController")
public class ListDepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListDepartmentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			DepartmentDAO dao = new DepartmentDAOImpl();
			try {
				List<Department> list = dao.getListDepartments();
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/admin/A-List-department.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
