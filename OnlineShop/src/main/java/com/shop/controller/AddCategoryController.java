package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CategoryDAOImpl;
import com.shop.model.Category;

/**
 * Servlet implementation class AddCategoryController
 */
@WebServlet("/AddCategoryController")
public class AddCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }
//1233
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/admin/A-New-category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String catename= request.getParameter("categoryName");
			Category category = new Category(catename);
			CategoryDAOImpl ca= new CategoryDAOImpl();
			try {
				Boolean kq = ca.insertCategory(category);
				if(kq==true) {
					request.setAttribute("mess", "Add Successfully!");
					request.getRequestDispatcher("/CategoryController?index=1").forward(request, response);
				}else {
					request.setAttribute("mess", "Add Failed!");
					request.getRequestDispatcher("/CategoryController?index=1").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
	}

}
