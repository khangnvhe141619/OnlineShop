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
import com.shop.model.OrderAdmin;

/**	
 * Servlet implementation class ListOrderController
 */
@WebServlet("/listOrderController")
public class ListOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("account") != null) {
			OrderDAO dao = new OrderDAOImpl();
			try {
				List<OrderAdmin> list = dao.getListAllOrders();
				for (OrderAdmin product : list) {
					System.out.println(product.toString());
				}
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/admin/A-List-order.jsp").forward(request, response);
			} catch (SQLException e) {
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
