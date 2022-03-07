package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.PostCmtDAO;
import com.shop.dao.PostDAO;
import com.shop.dao.impl.PostCmtDAOImpl;
import com.shop.dao.impl.PostDAOImpl;
import com.shop.model.Post;

/**
 * Servlet implementation class AViewPostDetailController
 */
@WebServlet("/aViewPostDetail")
public class AViewPostDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AViewPostDetailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostDAO postDAO = new PostDAOImpl();
		PostCmtDAO postCmtDAO = new PostCmtDAOImpl();
		String id = request.getParameter("pId");
		Post post = null;
		int sum = 0;
		try {
			post = postDAO.getPostInformation(id);
			sum = postCmtDAO.countTotalCommentByPostID(id);
			request.setAttribute("post", post);
			request.setAttribute("sum", sum);
			request.getRequestDispatcher("views/admin/A-Post-detail.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
