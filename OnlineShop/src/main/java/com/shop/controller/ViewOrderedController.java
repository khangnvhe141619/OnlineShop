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
import com.shop.model.ProductOrderShip;

/**
 * Servlet implementation class ViewOrdered
 */
@WebServlet("/viewOrdered")
public class ViewOrderedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   //121221    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOrderedController() {
        super();
        // TODO Auto-generated constructor stub
    }
//check
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int account = (int) session.getAttribute("account");
		String pending = request.getParameter("pending");
		String completed = request.getParameter("completed");
		String cancel = request.getParameter("cancel");
		if(session.getAttribute("account") != null) {
			OrderDAO dao = new OrderDAOImpl();
			try {
				if(pending != null) {
					List<ProductOrderShip> listOrder = dao.getListOrdersByPending(account);
					request.setAttribute("color", "#EE4D2D");
					request.setAttribute("HEADER", "PENDING");
					request.setAttribute("listOrder", listOrder);
				} else if(completed != null) {
					List<ProductOrderShip> listOrder = dao.getListOrdersByCompleted(account);
					request.setAttribute("color1", "#EE4D2D");
					request.setAttribute("HEADER", "COMPLETED");
					request.setAttribute("listOrder", listOrder);
				}else if(cancel != null) {
					List<ProductOrderShip> listOrder = dao.getListOrdersByCancel(account);
					request.setAttribute("color3", "#EE4D2D");
					request.setAttribute("HEADER", "CANCEL");
					request.setAttribute("listOrder", listOrder);
				} else {
					List<ProductOrderShip> listOrder = dao.getListOrders(account);
					request.setAttribute("color2", "#EE4D2D");
					request.setAttribute("HEADER", "ALL");
					request.setAttribute("listOrder", listOrder);
				}
				request.setAttribute("pending", "Pending");
				request.setAttribute("completed", "Completed");
				request.setAttribute("cancel", "Cancel");
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
