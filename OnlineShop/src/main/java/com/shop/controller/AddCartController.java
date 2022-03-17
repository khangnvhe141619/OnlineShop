package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.ProductDAO;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Item;
import com.shop.model.Product;

@WebServlet("/addCart")
public class AddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCartController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int id = Integer.parseInt(request.getParameter("id"));
		double total = 0;
		HttpSession session = request.getSession();
		ProductDAO pd = new ProductDAOImpl();
		List<Product> prods = pd.getAllProduct();
		List<Item> items = (List<Item>) session.getAttribute("items");
		if (items == null) {
			items = new ArrayList<>();
		}
		boolean flag = false;
		for (int i = 0; i < items.size(); i++) {
			if (items.get(i).getProduct().getProductID() == id) {
				items.get(i).setQuantity(items.get(i).getQuantity() + quantity);
				flag = true;
			}
			total += items.get(i).getProduct().getPrice() * items.get(i).getQuantity();
			if (items.get(i).getQuantity() == 0) {
				items.remove(i);
				i--;
			}
		}
		if (!flag) {
			Product pr = new Product();
			for (int i = 0; i < prods.size(); i++) {
				if (prods.get(i).getProductID() == id) {
					pr = prods.get(i);
					break;
				}
			}
			Item i = new Item();
			i.setProduct(pr);
			i.setQuantity(quantity);
			items.add(i);
			total += pr.getPrice() * quantity;
		}
		request.getSession().setAttribute("pID", id);
		request.getSession().setAttribute("quantity", quantity);
		request.getSession().setAttribute("items", items);
		request.getSession().setAttribute("total", total);
		request.getSession().setAttribute("size", items.size());
		response.sendRedirect("viewCart");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
