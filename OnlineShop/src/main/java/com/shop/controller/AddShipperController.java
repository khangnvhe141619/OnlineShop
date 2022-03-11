package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.ShipperDAO;
import com.shop.dao.impl.ShipperDAOImpl;
import com.shop.model.Shipper;

/**
 * Servlet implementation class AddShipperController
 */
@WebServlet("/addShipperController")
public class AddShipperController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddShipperController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/admin/A-New-shipper.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShipperDAO shipperDAO = new ShipperDAOImpl();
		String fname = request.getParameter("shipperName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		Shipper shipper = new Shipper(fname, email, phone);
		try {
			if (shipperDAO.insertShipper(shipper)) {
				request.setAttribute("cSuccess", true);
				request.getRequestDispatcher("/aListShipperController").forward(request, response);
			}else {
				request.setAttribute("sError", true);
				request.getRequestDispatcher("/aListShipperController").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
