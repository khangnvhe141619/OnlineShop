package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.PostDAO;
import com.shop.dao.impl.PostDAOImpl;
import com.shop.model.Post;
import com.shop.utils.Validation;

/**
 * Servlet implementation class AEditPostController
 */
@WebServlet("/aEditPostController")
public class AEditPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AEditPostController() {
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
		String id = request.getParameter("pId");
		Post post = null;
		try {
			post = postDAO.getPostInformation(id);
			request.setAttribute("post", post);
			request.getRequestDispatcher("views/admin/A-Edit-post.jsp").forward(request, response);
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
		PostDAO postDAO = new PostDAOImpl();
		String id = request.getParameter("pId");
		int postId=Validation.convertStringToInt(id);
		String author=request.getParameter("author");
		String title=request.getParameter("title");
		
		String content=request.getParameter("content");
		String shortContent=content.substring(0, 45)+" ...";
		Post post=new Post(postId, author, title, shortContent, content, postId);
		try {			
			if(postDAO.updatePost(post)) {
				request.setAttribute("uSuccess", true);
				request.setAttribute("post", post);
				request.getRequestDispatcher("views/admin/A-Edit-post.jsp").forward(request, response);
			}else {
				request.setAttribute("uError", true);
				request.setAttribute("post", post);
				request.getRequestDispatcher("views/admin/A-Post-detail.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
