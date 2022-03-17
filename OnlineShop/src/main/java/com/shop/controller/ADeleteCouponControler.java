package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CouponDAOImpl;

/**
 * Servlet implementation class ADeleteCouponControler
 */
@WebServlet("/ADeleteCouponControler")
public class ADeleteCouponControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ADeleteCouponControler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CouponDAOImpl cp = new CouponDAOImpl();	
		String code=request.getParameter("index");
	
		boolean kq;
		try {
			kq = cp.deleteCoupon(code);
			if(kq==true) {
				request.setAttribute("mess", "Delete successfull");
				request.getRequestDispatcher("AlistCoupon?index=1").forward(request, response);
			}else {
				request.setAttribute("mess", "Delete False");
				request.getRequestDispatcher("AlistCoupon?index=1").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
