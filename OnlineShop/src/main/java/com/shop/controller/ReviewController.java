package com.shop.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.impl.ReviewDAOImpl;
import com.shop.model.Review;

/**
 * Servlet implementation class ReviewController
 */
@WebServlet("/review")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Date date = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession ss = request.getSession(true);
			int accid = (int) ss.getAttribute("account");
			String pid = request.getParameter("pid");
			int id = Integer.parseInt(pid);
			String ratet = request.getParameter("rating");
			int rate = Integer.parseInt(ratet);
			String content = request.getParameter("content");
			LocalDate localDate = java.time.LocalDate.now();
			String date = localDate.toString();

			System.out.println(id);

			System.out.println(content);
			System.out.println(rate);
			System.out.println(date);

			ReviewDAOImpl rv = new ReviewDAOImpl();
			Review review = new Review();
			if(rv.isBought(id, accid)) {
				rv.addReview(id, accid, content, rate, date);
				request.setAttribute("id", id);
				request.setAttribute("mess", "Add comment successfull");
				request.getRequestDispatcher("/details?id="+pid).forward(request, response);
		
			}else {
				request.setAttribute("mess", "You didn't buy this profuct before. Please buy it to Add Review!!!");
                request.getRequestDispatcher("/details?id="+pid).forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
