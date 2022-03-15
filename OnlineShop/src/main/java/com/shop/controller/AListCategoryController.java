package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CategoryDAOImpl;
import com.shop.model.Category;

/**
 * Servlet implementation class CategoryController 12333
 */
@WebServlet("/CategoryController")
public class AListCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AListCategoryController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			CategoryDAOImpl ct = new CategoryDAOImpl();
			int index = 1;
			int count = ct.countCa();
			int pageSize = 3;
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;
			}
			List<Category> lsct = ct.getListCategory(index);
			request.setAttribute("lsct", lsct);
			request.setAttribute("tag", index);
			request.setAttribute("count", count);
			request.setAttribute("endpage", endPage);
			request.getRequestDispatcher("views/admin/A-List-category.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("loi");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			CategoryDAOImpl ct = new CategoryDAOImpl();

			String pageIn = request.getParameter("index");
			if (pageIn == null) {
				pageIn = "1";
			}
			int index = Integer.parseInt(pageIn);
			int count = ct.countCa();
			int pageSize = 3;
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;
			}
			List<Category> lsct = ct.getListCategory(index);
			request.setAttribute("lsct", lsct);
			request.setAttribute("tag", index);
			request.setAttribute("count", count);
			request.setAttribute("endpage", endPage);
			request.getRequestDispatcher("views/admin/A-List-category.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("loi");
		}
	}

}
