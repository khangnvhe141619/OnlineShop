package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CategoryDAOImpl;

/**
 * Servlet implementation class DeleteCateController 1234
 */
@WebServlet("/DeleteCateController")
public class ADeleteCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ADeleteCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAOImpl pd = new CategoryDAOImpl();		
		String pageIn=request.getParameter("index");
		int index= Integer.parseInt(pageIn);
		boolean kq;
		try {
			kq = pd.deleteCategory(index);
			if(kq==true) {
				request.setAttribute("mess", "Delete successfull");
				request.getRequestDispatcher("/CategoryController?index=1").forward(request, response);
			}else {
				request.setAttribute("mess", "Delete False");
				request.getRequestDispatcher("/CategoryController?index=1").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
