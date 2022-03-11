package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CategoryDAOImpl;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Category;
import com.shop.model.Product;

/**
 * Servlet implementation class SearchProductController
 */
@WebServlet("/search")
public class SearchProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchProductController() {
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
			ProductDAOImpl pd = new ProductDAOImpl();
			CategoryDAOImpl ct = new CategoryDAOImpl();
			String name = request.getParameter("name");
			String cate = request.getParameter("category");
			String t = request.getParameter("to");
			String e = request.getParameter("end");
			if (name == "" && cate == "" && t == "" && e == "") {
				request.getRequestDispatcher("/list").forward(request, response);
			}
			int cateid = Integer.parseInt(cate);

			if (t == null || t.trim().length() == 0) {
				t = "-1";
			}
			if (e == null || e.trim().length() == 0) {
				e = "-1";
			}
			int to = Integer.parseInt(t);
			int end = Integer.parseInt(e);
			System.out.println(cateid);
			System.out.println(name.toUpperCase());

			String pageIn = request.getParameter("index");
			if (pageIn == null) {
				pageIn = "1";
			}
			int index = Integer.parseInt(pageIn);
			int count = pd.countSearch(cateid, name, to, end);
			int pageSize = 3;
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;

			}

			List<Product> listP = pd.searchProduct(index, cateid, name, to, end);
			List<Category> lsct = ct.getListAllCategory();
			if (listP.isEmpty()) {
				request.setAttribute("mess", "Can not find");
				request.setAttribute("lsct", lsct);
				request.setAttribute("listp", listP);
				request.setAttribute("endpage", endPage);
				request.getRequestDispatcher("views/Shop.jsp").forward(request, response);
				request.getRequestDispatcher("views/Shop.jsp").forward(request, response);
			} else {
				request.setAttribute("mess", "There are " + count + " searched results");
				request.setAttribute("lsct", lsct);
				request.setAttribute("listp", listP);
				request.setAttribute("name", name);
				request.setAttribute("tag", index);
				request.setAttribute("endpage", endPage);
				request.setAttribute("cate", cateid);
				request.getRequestDispatcher("views/Shop.jsp").forward(request, response);
			}

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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
