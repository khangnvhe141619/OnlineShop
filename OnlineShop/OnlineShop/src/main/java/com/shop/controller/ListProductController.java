package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.ProductDAO;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Product;

/**
 * Servlet implementation class ListProductController
 */
@WebServlet("/list")
public class ListProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ProductDAOImpl pd = new ProductDAOImpl();
//			String indexp = request.getParameter("index");
//			int index= Integer.parseInt(indexp);
//			System.out.println(indexp);
			int count = pd.countProduct();
			int pageSize = 3;
			int endPage = 0;
			endPage=count/pageSize;
			if(count%pageSize!=0) {
				endPage++;
				
			}
			List<Product> listP= pd.getListAllProduct(1);
			request.setAttribute("listp", listP);
			request.setAttribute("endpage", endPage);
//			request.setAttribute("tag", index);
			request.getRequestDispatcher("views/Shop.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("loi");
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