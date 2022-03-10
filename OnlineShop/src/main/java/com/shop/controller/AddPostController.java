package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.PostDAO;
import com.shop.dao.impl.PostDAOImpl;
import com.shop.model.Post;

/**
 * Servlet implementation class AddPostController
 */
@WebServlet("/addPostController")
public class AddPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + "/views/admin/A-New-post.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostDAO postDAO = new PostDAOImpl();
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String shortContent = null;
		if (content.length() < 60) {
			shortContent = content;
		} else {
			shortContent = content.substring(0, 60) + " ...";
		}

		LocalDateTime createdDate = LocalDateTime.now();

		Post post = new Post(author, title,  shortContent, content, createdDate, 1);

		try {
			if (postDAO.insertPost(post)) {
				request.setAttribute("nSuccess", true);
				request.getRequestDispatcher("/aListPostController").forward(request, response);
			} else {
				request.setAttribute("bError", true);
				request.getRequestDispatcher("/aListPostController").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
