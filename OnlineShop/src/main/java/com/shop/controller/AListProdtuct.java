package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Product;

/**
 * Servlet implementation class ListProdtuct
 */
@WebServlet("/ListProdtuct")
public class AListProdtuct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AListProdtuct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			ProductDAOImpl pd = new ProductDAOImpl();
			String pageIn = request.getParameter("index");
			int index = 1;
			int count = pd.countProduct();
			int pageSize = 5;
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;

			}
			List<Product> listP = pd.getListProduct(index);
			request.setAttribute("count", count);
			request.setAttribute("listp", listP);
			request.setAttribute("endpage", endPage);
			request.setAttribute("tag", index);
			request.getRequestDispatcher("views/admin/A-List-product.jsp").forward(request, response);
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
			ProductDAOImpl pd = new ProductDAOImpl();
			String pageIn = request.getParameter("index");
			int index = Integer.parseInt(pageIn);
			int count = pd.countProduct();
			int pageSize = 5;
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;

			}
			List<Product> listP = pd.getListProduct(index);
			request.setAttribute("count", count);
			request.setAttribute("listp", listP);
			request.setAttribute("endpage", endPage);
			request.setAttribute("tag", index);
			request.getRequestDispatcher("views/admin/A-List-product.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("loi");
		}
	}

}
