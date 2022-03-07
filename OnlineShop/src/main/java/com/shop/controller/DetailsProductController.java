package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.ProductDAOImpl;
import com.shop.dao.impl.ReviewDAOImpl;
import com.shop.model.Product;
import com.shop.model.Review;

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
		String idx = request.getParameter("id");

		int id = Integer.parseInt(idx);
		System.out.println(id);
		ProductDAOImpl pdImpl = new ProductDAOImpl();
		ReviewDAOImpl rvImpl= new ReviewDAOImpl();
		try {
			List<Review> listRv= rvImpl.getReviews(id);
			Product pd = pdImpl.getProductById(id);
			System.out.println(pd.toString());
			request.setAttribute("listRv", listRv);
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
		
	}

}
