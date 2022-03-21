package com.shop.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class AEditProduct
 */
@MultipartConfig
@WebServlet("/AEditProduct")
public class AEditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AEditProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	int index = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		CategoryDAOImpl cateDAO = new CategoryDAOImpl();
		ProductDAOImpl pd = new ProductDAOImpl();
		List<Category> listCate = new ArrayList<>();
		List<BookCover> listBK = new ArrayList<>();
		index = Integer.parseInt(request.getParameter("index"));
		String cate = request.getParameter("cateName");
		String cover = request.getParameter("cover");
		System.out.println(cover);
		int coverID = Integer.parseInt(cover);

		try {
			Product p = pd.getProductById(index);
			listCate = cateDAO.getListAllCategory();
			listBK = pd.getAllBookcover();
			request.setAttribute("coverid", coverID);
			request.setAttribute("cate", cate);
			request.setAttribute("product", p);
			request.setAttribute("listCategory", listCate);
			request.setAttribute("listBK", listBK);
			request.getRequestDispatcher("views/admin/A-Product-detail.jsp").forward(request, response);
		} catch (SQLException e) {

			request.setAttribute("mess", "Edit false");
			request.getRequestDispatcher("ListProdtuct?index=1").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			CategoryDAOImpl cateDAO = new CategoryDAOImpl();
			ProductDAOImpl pd = new ProductDAOImpl();
			List<Category> listCate = new ArrayList<>();
			List<BookCover> listBK = new ArrayList<>();;
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
			if(publishDate.isEmpty()) {
				throw new SQLException();
			}
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

			listCate = cateDAO.getListAllCategory();
			listBK = pd.getAllBookcover();

			Product product = new Product(index, cID, pName, filename, des, localDate, iss, dateTime, coverId, company,
					quantity, price, num);
			Boolean kq = pd.updateProduct(product);
			if (kq == true) {
				
				request.setAttribute("categoryID", cateId);
				request.setAttribute("coverid", coverId);
				request.setAttribute("product", product);
				request.setAttribute("mess", "Edit success");
				request.getRequestDispatcher("ListProdtuct?index=1").forward(request, response);
			} else {
				request.setAttribute("mess", "Edit false");
				request.getRequestDispatcher("ListProdtuct?index=1").forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("mess", "Edit false");
			request.getRequestDispatcher("ListProdtuct?index=1").forward(request, response);
		}
	}

}
