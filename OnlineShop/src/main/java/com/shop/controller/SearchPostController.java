package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.PostDAO;
import com.shop.dao.impl.PostDAOImpl;
import com.shop.model.Post;
import com.shop.utils.Validation;

/**
 * Servlet implementation class SearchPostController
 */
@WebServlet("/searchPostController")
public class SearchPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total = 0;
		int sum=0;
		PostDAO postDAO = new PostDAOImpl();
		List<Post> lstPost = new ArrayList<Post>();
		
		HttpSession session = request.getSession();
		
		String search = (String) session.getAttribute("SE");
		String option = (String) session.getAttribute("SL");

		switch (option) {
		case "pTitle":
			option = "title";
			break;
		case "pAuthor":
			option = "author";
			break;
		case "pTag":
			option = "tag";
			break;
		case "pChoose":
			request.setAttribute("error", true);
			request.getRequestDispatcher("views/Blog.jsp").forward(request, response);
			return;
		}
		String index = request.getParameter("page");
		int page = Validation.convertStringToInt(index);

		try {
			sum=postDAO.countPostByOption(option, search);
			lstPost = postDAO.getListPostByOption(option, search, (page - 1) * 3);
			total = postDAO.countPostByOption(option, search) / 3;
			if (postDAO.countPostByOption(option, search) % 3 != 0) {
				total += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("isPaging", 0);
		request.setAttribute("result", sum);
		request.setAttribute("search", search);
		request.setAttribute("select", option);
		request.setAttribute("check", 1);
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
		int sum=0;
		PostDAO postDAO = new PostDAOImpl();
		List<Post> lstPost = new ArrayList<Post>();
		HttpSession session = request.getSession();
		
		if (request.getParameter("search") == null) {
			request.getRequestDispatcher("views/Blog.jsp").forward(request, response);

		}else {
			String search = request.getParameter("search");
			String option = request.getParameter("select");

			session.removeAttribute("SE");
			session.removeAttribute("SL");

			session.setAttribute("SE", search);
			session.setAttribute("SL", option);
			
			switch (option) {
			case "pTitle":
				option = "title";
				break;
			case "pAuthor":
				option = "author";
				break;
			case "pTag":
				option = "tag";
				break;
			case "pChoose":
				request.setAttribute("error", true);
				request.getRequestDispatcher("views/Blog.jsp").forward(request, response);
				return;
			}
			try {
				sum=postDAO.countPostByOption(option, search);
				lstPost = postDAO.getListPostByOption(option, search, 0);
				total = postDAO.countPostByOption(option, search) / 3;
				if (postDAO.countPostByOption(option, search) % 3 != 0) {
					total += 1;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			request.setAttribute("isPaging", 0);
			request.setAttribute("result", sum);
			request.setAttribute("search", search);
			request.setAttribute("select", option);
			request.setAttribute("check", 1);
			request.setAttribute("lstPost", lstPost);
			request.setAttribute("total", total);
			request.setAttribute("tag", 1);
			request.getRequestDispatcher("views/Blog.jsp").forward(request, response);
		}
	}

}
