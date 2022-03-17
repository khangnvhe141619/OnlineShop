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
import com.shop.dao.ShipperDAO;
import com.shop.dao.impl.OrderDAOImpl;
import com.shop.dao.impl.ShipperDAOImpl;
import com.shop.model.OrderAdmin;
import com.shop.model.Shipper;

/**
 * Servlet implementation class UpdateOrderAdminController
 */
@WebServlet("/updateOrderAdminController")
public class AUpdateOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AUpdateOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int stt = Integer.parseInt(request.getParameter("stt"));
		HttpSession session = request.getSession();
		if(session.getAttribute("account") != null) {
			OrderDAO dao = new OrderDAOImpl();
			ShipperDAO dao2 = new ShipperDAOImpl();
			try {
				List<OrderAdmin> list = dao.getListAllOrdersByStt(stt);
				List<Shipper> list2 = dao2.getListShipper();
				request.setAttribute("list", list);
				request.setAttribute("list2", list2);
				request.getRequestDispatcher("views/admin/A-Edit-order.jsp").forward(request, response);
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
		int oid = Integer.parseInt(request.getParameter("oid"));
		int status = Integer.parseInt(request.getParameter("status"));
		try {
			OrderDAO dao = new OrderDAOImpl();
			dao.getUpdateOrder(status, oid);
			request.getRequestDispatcher("listOrderController").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
