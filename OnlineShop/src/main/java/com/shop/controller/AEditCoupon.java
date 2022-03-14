package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CouponDAOImpl;
import com.shop.model.Coupon;

/**
 * Servlet implementation class AEditCoupon
 */
@WebServlet("/AEditCoupon")
public class AEditCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AEditCoupon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CouponDAOImpl co =new CouponDAOImpl();
		String code=request.getParameter("index");
		try {
			Coupon cp= co.getCouponbyID(code);
			request.setAttribute("cp", cp);
			request.getRequestDispatcher("views/admin/A-Edit-coupon.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code= request.getParameter("couponCode");
		String des= request.getParameter("couponDesc");
		int per =Integer.parseInt(request.getParameter("percent"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Coupon co = new Coupon(code,des, per, quantity);
		CouponDAOImpl cp = new CouponDAOImpl();
		try {
			Boolean kq = cp.updateCoupon(co);
			if (kq == true) {
				request.setAttribute("mess", "Update success");
				request.getRequestDispatcher("AlistCoupon").forward(request, response);
			} else {
				request.setAttribute("mess", "Update False");
				request.getRequestDispatcher("AlistCoupon").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
