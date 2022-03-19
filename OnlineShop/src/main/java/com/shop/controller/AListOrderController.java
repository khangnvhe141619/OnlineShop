package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
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
 * Servlet implementation class ListOrderController 123
 */
@WebServlet("/listOrderController")
public class AListOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AListOrderController() {
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
				int index = 1;
				int size = 6;
		        int count = dao.getCountOrder();
		        int endPage = count / size;
		        if (count % size != 0) {
		            endPage++;
		        }
				List<OrderAdmin> list = dao.getListAllOrders(index);
				request.setAttribute("count", count);
				request.setAttribute("index", index);
				request.setAttribute("list", list);
				request.setAttribute("endPage", endPage);
				request.getRequestDispatcher("views/admin/A-List-order.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ParseException e) {
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
		HttpSession session = request.getSession();
		if(session.getAttribute("account") != null) {
			OrderDAO dao = new OrderDAOImpl();
			try {
				int index = Integer.parseInt(request.getParameter("index"));
				int size = 6;
		        int count = dao.getCountOrder();
		        int endPage = count / size;
		        if (count % size != 0) {
		            endPage++;
		        }
		        if(index < 1) {
		        	index = 1;
		        }
		        if(index > endPage) {
		        	index = endPage;
		        }
				List<OrderAdmin> list = dao.getListAllOrders(index);
				request.setAttribute("count", count);
				request.setAttribute("index", index);
				request.setAttribute("list", list);
				request.setAttribute("endPage", endPage);
				request.getRequestDispatcher("views/admin/A-List-order.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("loginController");
		}
	}

}
