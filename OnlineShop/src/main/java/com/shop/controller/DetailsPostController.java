package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
import com.shop.model.PostCmt;

/**
 * Servlet implementation class DetailsPostController
 */
@WebServlet("/viewDetailsPost")
public class DetailsPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailsPostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("pId");

		PostDAO postDAO = new PostDAOImpl();
		PostCmtDAO pCmtDAO = new PostCmtDAOImpl();
		List<PostCmt> lstPostCmt = new ArrayList<PostCmt>();
		Post post = null;
		int totalCmt = 0;
		try {
			post = postDAO.getPostInformation(id);
			lstPostCmt = pCmtDAO.getListCmtByPostID(id);
			totalCmt = pCmtDAO.countTotalCommentByPostID(id);
			request.setAttribute("post", post);
			request.setAttribute("lstPostCmt", lstPostCmt);
			request.setAttribute("totalCmt", totalCmt);
			request.getRequestDispatcher("views/DetailPost.jsp").forward(request, response);
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
