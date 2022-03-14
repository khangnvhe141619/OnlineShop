package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.PostDAO;
import com.shop.dao.impl.PostDAOImpl;

/**
 * Servlet implementation class ADeletePostController 123
 */
@WebServlet("/aDeletePostController")
public class ADeletePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ADeletePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAOImpl();
		String id = request.getParameter("pId");
		try {
			if(postDAO.deletePost(id)) {
				request.setAttribute("dSuccess", true);
				request.getRequestDispatcher("/aListPostController").forward(request, response);
			}else {
				request.setAttribute("bError", true);
				request.getRequestDispatcher("/aListPostController").forward(request, response);
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
