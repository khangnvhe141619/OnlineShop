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
 * Servlet implementation class AEditCategory
 */
@WebServlet("/AEditCategory")
public class AEditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AEditCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryDAOImpl pd = new CategoryDAOImpl();		
		String cName= request.getParameter("categoryName");
		String pageIn=request.getParameter("index");
		int index= Integer.parseInt(pageIn);
		request.setAttribute("index", index);
		request.setAttribute("categoryName", cName);
		try {
			Category category =pd.getCategoryByID(pageIn);
			request.setAttribute("category",category);
			request.setAttribute("index", index);
			request.setAttribute("categoryName", cName);
			request.getRequestDispatcher("views/admin/A-Edit-category.jsp").forward(request, response);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAOImpl pd = new CategoryDAOImpl();		
		String pageIn=request.getParameter("index");
		int index= Integer.parseInt(pageIn);
		String cName= request.getParameter("categoryName");
		Category category = new Category(index, cName);
		try {
			Boolean kq = pd.updateCategory(category);
			if(kq==true) {
				request.setAttribute("mess", "Update Successfull");
				request.setAttribute("index", index);
				request.getRequestDispatcher("CategoryController?index=1").forward(request, response);
			}else {
				request.setAttribute("mess", "Update false");
				request.getRequestDispatcher("CategoryController?index=1").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
