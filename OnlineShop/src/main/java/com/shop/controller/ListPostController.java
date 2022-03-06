package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.PostDAO;
import com.shop.dao.TagDAO;
import com.shop.dao.impl.PostDAOImpl;
import com.shop.dao.impl.TagDAOImpl;
import com.shop.model.Post;
import com.shop.model.Tag;

/**
 * Servlet implementation class ListPostController
 */
@WebServlet("/listPostController")
public class ListPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListPostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int total = 0;
		PostDAO postDAO = new PostDAOImpl();
		TagDAO tagDAO = new TagDAOImpl();
		List<Post> lstPost = new ArrayList<Post>();
		List<Post> lstTop5Post = new ArrayList<Post>();
		List<Tag> lstTag = new ArrayList<Tag>();
		try {
			if (request.getParameter("page") == null) {
				lstPost = postDAO.getAllPost(0);
				lstTop5Post = postDAO.getTop5HotPost();
				total = postDAO.countTotalPost() / 3;
				lstTag = tagDAO.getAllTag();
				if (postDAO.countTotalPost() % 3 != 0) {
					total = total + 1;
				}
				request.setAttribute("isSearch", 0);
				request.setAttribute("result", 1);
				request.setAttribute("check", 0);
				request.setAttribute("lstTag", lstTag);
				request.setAttribute("lstTop5Post", lstTop5Post);
				request.setAttribute("lstPost", lstPost);
				request.setAttribute("total", total);
				request.setAttribute("tag", 1);
				request.getRequestDispatcher("views/Blog.jsp").forward(request, response);
			} else {
				int page = Integer.parseInt(request.getParameter("page"));
				lstPost = postDAO.getAllPost((page - 1) * 3);
				lstTop5Post = postDAO.getTop5HotPost();
				total = postDAO.countTotalPost() / 3;
				lstTag = tagDAO.getAllTag();
				if (postDAO.countTotalPost() % 3 != 0) {
					total += 1;
				}
				request.setAttribute("isSearch", 0);
				request.setAttribute("result", 1);
				request.setAttribute("check", 0);
				request.setAttribute("lstTag", lstTag);
				request.setAttribute("lstTop5Post", lstTop5Post);
				request.setAttribute("lstPost", lstPost);
				request.setAttribute("total", total);
				request.setAttribute("tag", page);
				request.getRequestDispatcher("views/Blog.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", "Error!");
			request.getRequestDispatcher("views/404.jsp").forward(request, response);
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
