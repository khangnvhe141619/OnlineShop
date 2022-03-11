package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.ShipperDAO;
import com.shop.dao.impl.ShipperDAOImpl;
import com.shop.model.Shipper;

/**
 * Servlet implementation class AListShipperController
 */
@WebServlet("/aListShipperController")
public class AListShipperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AListShipperController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total = 0;
		int sumShipper = 0;
		ShipperDAO shipperDAO = new ShipperDAOImpl();
		List<Shipper> lstShipper = new ArrayList<Shipper>();
		try {
			if (request.getParameter("page") == null) {
				lstShipper = shipperDAO.getListShipperPaging(0);
				sumShipper = shipperDAO.countTotalShipper();
				total = shipperDAO.countTotalShipper() / 3;
				if (shipperDAO.countTotalShipper() % 3 != 0) {
					total = total + 1;
				}
				request.setAttribute("result", 1);
				request.setAttribute("check", 0);
				request.setAttribute("totalShipper", sumShipper);
				request.setAttribute("lstShipper", lstShipper);
				request.setAttribute("total", total);
				request.setAttribute("tag", 1);
				request.getRequestDispatcher("views/admin/A-List-shipper.jsp").forward(request, response);
			} else {
				int page = Integer.parseInt(request.getParameter("page"));
				lstShipper = shipperDAO.getListShipperPaging((page - 1) * 3);
				sumShipper = shipperDAO.countTotalShipper();
				total = shipperDAO.countTotalShipper() / 3;
				if (shipperDAO.countTotalShipper() % 3 != 0) {
					total += 1;
				}
				request.setAttribute("result", 1);
				request.setAttribute("check", 0);
				request.setAttribute("totalPost", sumShipper);
				request.setAttribute("lstShipper", lstShipper);
				request.setAttribute("total", total);
				request.setAttribute("tag", page);
				request.getRequestDispatcher("views/admin/A-List-shipper.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", "Error!");
			request.getRequestDispatcher("views/404.jsp").forward(request, response);
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
