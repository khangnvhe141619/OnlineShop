package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.shop.dao.OrderDAO;
import com.shop.dao.ProductDAO;
import com.shop.dao.impl.OrderDAOImpl;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Account;
import com.shop.model.Item;
import com.shop.model.Order;
import com.shop.model.Product;

/**
 * Servlet implementation class CheckOutController
 */
@WebServlet("/checkOutController")
public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOutController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductDAO productDAO = new ProductDAOImpl();
		Account account = (Account) session.getAttribute("acc");
		int productID = (int) session.getAttribute(("pID"));
		int quantity = (int) session.getAttribute(("quantity"));
		
		double total = (double) session.getAttribute("total");
		if (account != null) {
			@SuppressWarnings("unchecked")
			ArrayList<Item> items = (ArrayList<Item>) request.getSession().getAttribute("items");
			
			double vat = total / 10;
			total += vat;
			LocalDate localDate = java.time.LocalDate.now();
			String date = localDate.toString();
			OrderDAO orderDAO = new OrderDAOImpl();
			Order order = new Order(1, account.getAccountId(), date, total, 1);
			orderDAO.getInsertOrder(items, order);
			try {
				productDAO.decreasedProduct(quantity, productID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().removeAttribute("pID");
			request.getSession().removeAttribute("quantity");
			request.getSession().removeAttribute("items");
			request.getSession().removeAttribute("total");
			request.getSession().removeAttribute("size");
			request.setAttribute("notification", "Buy Successful !!!");
			request.setAttribute("move", "viewOrdered");
			request.getRequestDispatcher("views/Notification.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "You have to login to CheckOut!!!");
			request.getRequestDispatcher("viewCart").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
