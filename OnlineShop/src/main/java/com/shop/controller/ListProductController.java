package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.impl.CategoryDAOImpl;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Category;
import com.shop.model.Product;
//checkListproduct
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			ProductDAOImpl pd = new ProductDAOImpl();
			CategoryDAOImpl ct = new CategoryDAOImpl();
//			
//			String cate = request.getParameter("cateid");
//			System.out.println(cate);
//			int cateid = Integer.parseInt(cate);
			String pageIn=request.getParameter("index");
			if(pageIn==null || pageIn.equalsIgnoreCase("-1")) {
				pageIn="1";
			}
			int index= Integer.parseInt(pageIn);
			int count = pd.countProduct();
			int pageSize = 3;
			int endPage = 0;
			endPage=count/pageSize;
			if(count%pageSize!=0) {
				endPage++;
			}
			List<Product> listP= pd.getListAllProduct(index);
			List<Category> lsct = ct.getListAllCategory();
//			request.setAttribute("cateid", cateid);
			request.setAttribute("lsct", lsct);
			request.setAttribute("listp", listP);
			request.setAttribute("endpage", endPage);
			request.setAttribute("tag", index);
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
