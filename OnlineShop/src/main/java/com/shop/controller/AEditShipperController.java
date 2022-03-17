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
import com.shop.utils.Validation;

/**
 * Servlet implementation class AEditShipper
 */
@WebServlet("/aEditShipperController")
public class AEditShipperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//1233
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AEditShipperController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShipperDAO shipperDAO = new ShipperDAOImpl();
		String id = request.getParameter("sId");
		Shipper shipper = null;
		try {
			shipper = shipperDAO.getShipperInformation(id);
			request.setAttribute("shipper", shipper);
			request.getRequestDispatcher("views/admin/A-Edit-shipper.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShipperDAO shipperDAO = new ShipperDAOImpl();
		String id = request.getParameter("sId");
		int shipperId = Validation.convertStringToInt(id);
		String fname = request.getParameter("shipperName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		Shipper shipper = new Shipper(shipperId, fname, email, phone);
		try {
			if (shipperDAO.updateShipper(shipper)) {
				request.setAttribute("shipper", shipper);
				request.setAttribute("sEdit", true);
				request.getRequestDispatcher("views/admin/A-Edit-shipper.jsp").forward(request, response);
			} else {
				request.setAttribute("sError", true);
				request.getRequestDispatcher("/aListShipperController").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
