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
import com.shop.utils.Validation;

/**
 * Servlet implementation class ListPostByTagController
 */
@WebServlet("/listPostByTag")
public class ListPostByTagController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListPostByTagController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total = 0;
		int sum = 0;
		TagDAO tagDAO = new TagDAOImpl();
		PostDAO postDAO = new PostDAOImpl();
		List<Post> lstPost = new ArrayList<Post>();
		List<Post> lstTop5Post = new ArrayList<Post>();
		List<Tag> lstTag = new ArrayList<Tag>();

		String search = request.getParameter("name");

		String index = request.getParameter("page");
		int page = Validation.convertStringToInt(index);

		try {
			sum = postDAO.countPostByOption("tag", search);
			lstPost = postDAO.getListPostByOption("tag", search, (page - 1) * 3);
			lstTop5Post = postDAO.getTop5HotPost();
			total = postDAO.countPostByOption("tag", search) / 3;
			lstTag = tagDAO.getAllTag();
			if (postDAO.countPostByOption("tag", search) % 3 != 0) {
				total += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("isSearch", 1);
		request.setAttribute("result", sum);
		request.setAttribute("search", search);
		request.setAttribute("check", 2);
		request.setAttribute("lstTag", lstTag);
		request.setAttribute("lstTop5Post", lstTop5Post);
		request.setAttribute("lstPost", lstPost);
		request.setAttribute("total", total);
		request.setAttribute("tag", page);
		request.getRequestDispatcher("views/Blog.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total = 0;
		int sum = 0;
		TagDAO tagDAO = new TagDAOImpl();
		PostDAO postDAO = new PostDAOImpl();
		List<Post> lstPost = new ArrayList<Post>();
		List<Post> lstTop5Post = new ArrayList<Post>();
		List<Tag> lstTag = new ArrayList<Tag>();

		String search = request.getParameter("name");

		String index = request.getParameter("page");
		int page = Validation.convertStringToInt(index);

		try {
			sum = postDAO.countPostByOption("tag", search);
			lstPost = postDAO.getListPostByOption("tag", search, (page - 1) * 3);
			lstTop5Post = postDAO.getTop5HotPost();
			total = postDAO.countPostByOption("tag", search) / 3;
			lstTag = tagDAO.getAllTag();
			if (postDAO.countPostByOption("tag", search) % 3 != 0) {
				total += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("isSearch", 1);
		request.setAttribute("result", sum);
		request.setAttribute("search", search);
		request.setAttribute("check", 2);
		request.setAttribute("lstTag", lstTag);
		request.setAttribute("lstTop5Post", lstTop5Post);
		request.setAttribute("lstPost", lstPost);
		request.setAttribute("total", total);
		request.setAttribute("tag", 1);
		request.getRequestDispatcher("views/Blog.jsp").forward(request, response);
	}

}
