package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.OrderDAO;
import com.shop.dao.impl.OrderDAOImpl;
import com.shop.model.Order;
import com.shop.model.ProductOrderShip;

/**
 * Servlet implementation class ViewOrdered
 */
@WebServlet("/viewOrdered")
public class ViewOrderedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOrderedController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int account = (int) session.getAttribute("account");
		if(session.getAttribute("account") != null) {
			OrderDAO dao = new OrderDAOImpl();
			try {
				List<ProductOrderShip> listOrder = dao.getListOrders(account);
				request.setAttribute("listOrder", listOrder);
				request.getRequestDispatcher("views/ProductOrderShip.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("loginController");
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
