package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.SubscriberDAO;
import com.shop.dao.impl.SubscriberDAOImpl;
import com.shop.model.Subscriber;

/**
 * Servlet implementation class AListSubscriberController
 */
@WebServlet("/aListSubscriberController")
public class AListSubscriberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AListSubscriberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total = 0;
		int sumSubscribe = 0;
		SubscriberDAO subscribeDAO = new SubscriberDAOImpl();
		List<Subscriber> lstSubscriber = new ArrayList<Subscriber>();
		try {
			if (request.getParameter("page") == null) {
				lstSubscriber = subscribeDAO.getAllSubscribe(0);
				sumSubscribe = subscribeDAO.countTotalSubscriber();
				total = subscribeDAO.countTotalSubscriber() / 3;
				if (subscribeDAO.countTotalSubscriber() % 3 != 0) {
					total = total + 1;
				}
				request.setAttribute("result", 1);
				request.setAttribute("check", 0);
				request.setAttribute("totalSubscribe", sumSubscribe);
				request.setAttribute("lstSubscriber", lstSubscriber);
				request.setAttribute("total", total);
				request.setAttribute("tag", 1);
				request.getRequestDispatcher("views/admin/A-List-subscriber.jsp").forward(request, response);
			} else {
				int page = Integer.parseInt(request.getParameter("page"));
				lstSubscriber = subscribeDAO.getAllSubscribe((page - 1) * 3);
				sumSubscribe = subscribeDAO.countTotalSubscriber();
				total = subscribeDAO.countTotalSubscriber() / 3;
				if (subscribeDAO.countTotalSubscriber() % 3 != 0) {
					total += 1;
				}
				request.setAttribute("result", 1);
				request.setAttribute("check", 0);
				request.setAttribute("totalSubscribe", sumSubscribe);
				request.setAttribute("lstSubscriber", lstSubscriber);
				request.setAttribute("total", total);
				request.setAttribute("tag", page);
				request.getRequestDispatcher("views/admin/A-List-subscriber.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", "Error!");
			request.getRequestDispatcher("views/404.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
