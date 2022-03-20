package com.shop.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.model.Account;

/**
 * Servlet Filter implementation class SaleFilter
 */
@WebFilter(urlPatterns = { "/listOrderController", "/updateOrderAdminController", "/aListShipperController",
		"/addShipperController", "/aEditShipperController", "/aDeleteShipperController", "/AlistCoupon", "/AddCoupon",
		"/AEditCoupon", "/ADeleteCouponControler" })
public class SaleFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public SaleFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Account account = (Account) session.getAttribute("acc");
		if (account == null || account.getRole() != 3 && account.getRole() != 1) {
			res.sendRedirect(req.getContextPath() + "/loginController");
		} else {
			chain.doFilter(request, response);
		}
		// pass the request along the filter chain
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
