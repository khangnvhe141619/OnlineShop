package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Product;

/**
 * Servlet implementation class DetailsProductController
 */
@WebServlet("/details")
public class DetailsProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailsProductController() {
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
		String idx = request.getParameter("id");

		int id = Integer.parseInt(idx);
		System.out.println(id);
		ProductDAOImpl pdImpl = new ProductDAOImpl();
		try {
			Product pd = pdImpl.getProductById(id);
			System.out.println(pd.toString());
			request.setAttribute("p", pd);
			request.getRequestDispatcher("views/DetailProduct.jsp").forward(request, response);

		} catch (SQLException e) {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
