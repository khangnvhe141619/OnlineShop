package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CouponDAOImpl;
import com.shop.model.Coupon;

/**
 * Servlet implementation class AlistCoupon
 */
@WebServlet("/AlistCoupon")
public class AlistCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlistCoupon() {
        super();
        // TODO Auto-generated constructor stub
    }
//123
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			CouponDAOImpl pd = new CouponDAOImpl();
			String pageIn = request.getParameter("index");
			if(pageIn==null) {
				pageIn="1";
			}
			int index = Integer.parseInt(pageIn);
			int count = pd.countCoupon();
			int pageSize = 5;
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;

			}
			List<Coupon> listP = pd.getListCoupon(index);
			if(listP.isEmpty()) {
				request.setAttribute("mess", "Coupon not exits!!!");
				request.getRequestDispatcher("views/admin/A-List-coupon.jsp").forward(request, response);
			}
			else {
				request.setAttribute("listp", listP);
				request.setAttribute("count", count);
				request.setAttribute("endpage", endPage);
				request.setAttribute("tag", index);
				request.getRequestDispatcher("views/admin/A-List-coupon.jsp").forward(request, response);                  
			}
		} catch (Exception e) {
			System.out.println("loi");
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
