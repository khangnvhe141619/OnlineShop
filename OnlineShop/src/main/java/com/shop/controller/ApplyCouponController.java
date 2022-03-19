package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.CouponDAO;
import com.shop.dao.impl.CouponDAOImpl;
import com.shop.model.Coupon;

/**
 * Servlet implementation class ApplyCouponController
 */
@WebServlet("/applyCouponController")
public class ApplyCouponController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyCouponController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CouponDAO couponDAO = new CouponDAOImpl();
		String code = request.getParameter("couponCode").toUpperCase();
		Coupon coupon = null;
		try {
			coupon = couponDAO.getCouponbyID(code);
			if (coupon == null) {
				request.setAttribute("cCode", code);
				request.setAttribute("mess", "Not exist or expired!!");
				request.getRequestDispatcher("/viewCart").forward(request, response);
			} else {
				request.setAttribute("mess", "Apply Successfully!");
				request.getSession().setAttribute("coupon", coupon);
				request.getRequestDispatcher("/viewCart").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
