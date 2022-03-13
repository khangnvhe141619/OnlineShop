package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.ProductDAOImpl;

/**
 * Servlet implementation class DeleteController 12345
 */
@WebServlet("/DeleteController")
public class DeleteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAOImpl pd = new ProductDAOImpl();		
		String pageIn=request.getParameter("index");
		int index= Integer.parseInt(pageIn);
		boolean kq;
		try {
			kq = pd.deleteProduct(index);
			if(kq==true) {
				request.setAttribute("mess", "Delete successfull");
				request.getRequestDispatcher("/ListProdtuct?index=1").forward(request, response);
			}else {
				request.setAttribute("mess", "Delete False");
				request.getRequestDispatcher("/ListProdtuct?index=1").forward(request, response);
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
		doGet(request, response);
	}

}
