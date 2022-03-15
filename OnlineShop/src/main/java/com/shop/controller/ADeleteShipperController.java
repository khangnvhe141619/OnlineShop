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

/**
 * Servlet implementation class ADeleteShipperController
 */
@WebServlet("/aDeleteShipperController")
public class ADeleteShipperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ADeleteShipperController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShipperDAO shipperDAO = new ShipperDAOImpl();
		String id = request.getParameter("sId");
		try {
			if(shipperDAO.deleteShipper(id)) {
				request.setAttribute("dSuccess", true);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
