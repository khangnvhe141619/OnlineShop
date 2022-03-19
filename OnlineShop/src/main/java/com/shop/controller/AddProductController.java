package com.shop.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shop.dao.impl.CategoryDAOImpl;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.BookCover;
import com.shop.model.Category;
import com.shop.model.Product;
import com.shop.utils.Validation;

/**
 * Servlet implementation class AddProductController
 */
@MultipartConfig
@WebServlet("/AddProductController")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		CategoryDAOImpl cateDAO = new CategoryDAOImpl();
		ProductDAOImpl pd = new ProductDAOImpl();
		List<Category> listCate = new ArrayList<Category>();
		List<BookCover> listBK = new ArrayList<BookCover>();
		try {
			listCate = cateDAO.getListAllCategory();
			listBK = pd.getAllBookcover();
			request.setAttribute("listCategory", listCate);
			request.setAttribute("listBK", listBK);
			RequestDispatcher rd = request.getRequestDispatcher("views/admin/A-New-product.jsp");
			rd.forward(request, response);
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
		try {
			String cateId = request.getParameter("category");
			int cID = Integer.parseInt(cateId);
			String pName = request.getParameter("productName");
			String des = request.getParameter("productDesc");
			String iss = request.getParameter("issuingCompany");
			Part part = request.getPart("productImage");
			String covId = request.getParameter("coverType");
			int coverId = Integer.parseInt(covId);
			LocalDateTime localDate = LocalDateTime.now();
			String publishDate = request.getParameter("publicationDate");
			LocalDateTime dateTime = Validation.getLocalDateTime(publishDate + " 00:00:00");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			Double price = Double.parseDouble(request.getParameter("price"));
			int num = Integer.parseInt(request.getParameter("numberOfPage"));
			String company = request.getParameter("publishingCompany");
			String realPath = request.getServletContext().getRealPath("/common/images/products");
			String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
			if (!Files.exists(Path.of(realPath))) {
				Files.createDirectories(Path.of(realPath));
			}

			part.write(realPath + "/" + filename);
			Product product = new Product(cID, pName, filename, des, localDate, iss, dateTime, coverId, company,
					quantity, price, num);
			ProductDAOImpl pd = new ProductDAOImpl();
			boolean kq = pd.insertProduct(product);
			if (kq == true) {
				request.setAttribute("mess", "Add Successfully!");
				request.getRequestDispatcher("ListProdtuct?index=1").forward(request, response);
			} else {
				request.setAttribute("mess", "ADD Failed!");
				request.getRequestDispatcher("ListProdtuct?index=1").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("mess", "ADD Failed!");
			request.getRequestDispatcher("ListProdtuct?index=1").forward(request, response);
		}
	}

}
