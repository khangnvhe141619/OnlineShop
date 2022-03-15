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
public class AListDepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  //ShowList Department     
    public AListDepartmentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			DepartmentDAO dao = new DepartmentDAOImpl();
			try {
				int index = 1;
				int size = 6;
		        int count = dao.getCountDepartments();
		        int endPage = count / size;
		        if (count % size != 0) {
		            endPage++;
		        }
				List<Department> list = dao.getListDepartments(index);
				request.setAttribute("count", count);
				request.setAttribute("index", index);
				request.setAttribute("list", list);
				request.setAttribute("endPage", endPage);
				request.getRequestDispatcher("views/admin/A-List-department.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			DepartmentDAO dao = new DepartmentDAOImpl();
			try {
				int index = Integer.parseInt(request.getParameter("index"));
				int size = 6;
		        int count = dao.getCountDepartments();
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
				List<Department> list = dao.getListDepartments(index);
				request.setAttribute("count", count);
				request.setAttribute("index", index);
				request.setAttribute("list", list);
				request.setAttribute("endPage", endPage);
				request.getRequestDispatcher("views/admin/A-List-department.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
