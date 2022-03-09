package com.shop.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.shop.dao.PostCmtDAO;
import com.shop.dao.impl.PostCmtDAOImpl;
import com.shop.model.PostCmt;
import com.shop.utils.Validation;

/**
 * Servlet implementation class CommentPostController
 */
@WebServlet("/commentPostController")
public class CommentPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentPostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)???
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession ss = request.getSession(true);
			
			if (ss.getAttribute("account") == null) {
				request.getRequestDispatcher("views/Login.jsp").forward(request, response);
				return;
			}
			int accId = (int) ss.getAttribute("account");
			String pId = request.getParameter("pId");
			int postID = Validation.convertStringToInt(pId);

			String comment = request.getParameter("comment");
			LocalDateTime localDate = LocalDateTime.now();

			System.out.println(postID);

			PostCmtDAO pCmtDAO = new PostCmtDAOImpl();
			PostCmt postCmt = new PostCmt(postID, accId, comment, localDate);
			if (pCmtDAO.addCommentToPost(postCmt)) {
				request.setAttribute("pId", postID);
				request.getRequestDispatcher("/viewDetailsPost?pId=" + postID).forward(request, response);

			} else {
				request.getRequestDispatcher("/viewDetailsPost?pId=" + postID).forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
