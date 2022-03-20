package com.shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.CouponDAO;
import com.shop.dao.OfferDAO;
import com.shop.dao.OrderDAO;
import com.shop.dao.ProductDAO;
import com.shop.dao.impl.CouponDAOImpl;
import com.shop.dao.impl.OfferDAOImpl;
import com.shop.dao.impl.OrderDAOImpl;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Account;
import com.shop.model.Coupon;
import com.shop.model.Item;
import com.shop.model.Order;
import com.shop.service.EmailMessage;
import com.shop.service.EmailUtility;

/**
 * Servlet implementation class CheckOutController 123456
 */
@WebServlet("/checkOutController")
public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOutController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductDAO productDAO = new ProductDAOImpl();
		OfferDAO offerDAO = new OfferDAOImpl();
		CouponDAO couponDAO = new CouponDAOImpl();
		EmailMessage emailBean = new EmailMessage();
		Account account = (Account) session.getAttribute("acc");
		double total = (double) session.getAttribute("total");

		int productID = (int) session.getAttribute(("pID"));
		int quantity = (int) session.getAttribute(("quantity"));
		if(account.getFullname() == null || account.getFullname() == "") {
			response.sendRedirect("update");
			return;
		}
		if (session.getAttribute("coupon") != null) {
			Coupon coupon = (Coupon) session.getAttribute("coupon");
			String couponId = coupon.getCouponId();

			@SuppressWarnings("unchecked")
			ArrayList<Item> items = (ArrayList<Item>) request.getSession().getAttribute("items");
			System.out.println(total);
			int discountPercent = coupon.getDiscountPercent();
			double subTotal = (double) total - (total * discountPercent / 100);
			double vat = subTotal / 10;
			total = subTotal + vat;
			LocalDate localDate = java.time.LocalDate.now();
			String date = localDate.toString();
			String receiptDate = LocalDate.parse(date).plusDays(4).toString();
			OrderDAO orderDAO = new OrderDAOImpl();
			Order order = new Order(1, account.getAccountId(), date, receiptDate, total, 1);
			orderDAO.getInsertOrder(items, order);
			try {
				offerDAO.insertOffer(productID, couponId);
				couponDAO.decreasedCoupon(couponId);
				productDAO.decreasedProduct(quantity, productID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			@SuppressWarnings("unchecked")
			ArrayList<Item> items = (ArrayList<Item>) request.getSession().getAttribute("items");
			double vat = total / 10;
			total += vat;
			LocalDate localDate = java.time.LocalDate.now();
			String date = localDate.toString();
			String receiptDate = LocalDate.parse(date).plusDays(4).toString();
			OrderDAO orderDAO = new OrderDAOImpl();
			Order order = new Order(1, account.getAccountId(), date, receiptDate, total, 1);
			orderDAO.getInsertOrder(items, order);
			try {
				productDAO.decreasedProduct(quantity, productID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		emailBean.setSubject("Thank for ordering our product!");
		emailBean.setMessageType(1);
		// set the email of the user to send to
		emailBean.setTo(account.getEmail());
		// set content of email
		emailBean.setMessageType(1);
		emailBean.setMessage(THANK_YOU);

		try {
			// send mail for user
			EmailUtility.sendMail(emailBean);
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.getSession().removeAttribute("pID");
		request.getSession().removeAttribute("coupon");
		request.getSession().removeAttribute("quantity");
		request.getSession().removeAttribute("items");
		request.getSession().removeAttribute("total");
		request.getSession().removeAttribute("size");
		request.setAttribute("notification", "Buy Successful !!!");
		request.setAttribute("move", "viewOrdered");
		request.getRequestDispatcher("views/Notification.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private final String THANK_YOU = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "<head>\r\n"
			+ "    <meta charset=\"UTF-8\">\r\n" + "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
			+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
			+ "    <title>Document</title>\r\n" + "    <style>\r\n" + "        *{\r\n" + "  box-sizing:border-box;\r\n"
			+ " /* outline:1px solid ;*/\r\n" + "}\r\n" + "body{\r\n" + "background: #ffffff;\r\n"
			+ "background: linear-gradient(to bottom, #ffffff 0%,#e1e8ed 100%);\r\n"
			+ "filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e1e8ed',GradientType=0 );\r\n"
			+ "    height: 100%;\r\n" + "        margin: 0;\r\n" + "        background-repeat: no-repeat;\r\n"
			+ "        background-attachment: fixed;\r\n" + "  \r\n" + "}\r\n" + "\r\n" + ".wrapper-1{\r\n"
			+ "  width:100%;\r\n" + "  height:100vh;\r\n" + "  display: flex;\r\n" + "flex-direction: column;\r\n"
			+ "}\r\n" + ".wrapper-2{\r\n" + "  padding :30px;\r\n" + "  text-align:center;\r\n" + "}\r\n" + "h1{\r\n"
			+ "    font-family: 'Kaushan Script', cursive;\r\n" + "  font-size:4em;\r\n" + "  letter-spacing:3px;\r\n"
			+ "  color:#5892FF ;\r\n" + "  margin:0;\r\n" + "  margin-bottom:20px;\r\n" + "}\r\n" + ".wrapper-2 p{\r\n"
			+ "  margin:0;\r\n" + "  font-size:1.3em;\r\n" + "  color:#aaa;\r\n"
			+ "  font-family: 'Source Sans Pro', sans-serif;\r\n" + "  letter-spacing:1px;\r\n" + "}\r\n"
			+ ".go-home{\r\n" + "  color:#fff;\r\n" + "  background:#5892FF;\r\n" + "  border:none;\r\n"
			+ "  padding:10px 50px;\r\n" + "  margin:30px 0;\r\n" + "  border-radius:30px;\r\n"
			+ "  text-transform:capitalize;\r\n" + "  box-shadow: 0 10px 16px 1px rgba(174, 199, 251, 1);\r\n" + "}\r\n"
			+ ".footer-like{\r\n" + "  margin-top: auto; \r\n" + "  background:#D7E6FE;\r\n" + "  padding:6px;\r\n"
			+ "  text-align:center;\r\n" + "}\r\n" + ".footer-like p{\r\n" + "  margin:0;\r\n" + "  padding:4px;\r\n"
			+ "  color:#5892FF;\r\n" + "  font-family: 'Source Sans Pro', sans-serif;\r\n" + "  letter-spacing:1px;\r\n"
			+ "}\r\n" + ".footer-like p a{\r\n" + "  text-decoration:none;\r\n" + "  color:#5892FF;\r\n"
			+ "  font-weight:600;\r\n" + "}\r\n" + "\r\n" + "@media (min-width:360px){\r\n" + "  h1{\r\n"
			+ "    font-size:4.5em;\r\n" + "  }\r\n" + "  .go-home{\r\n" + "    margin-bottom:20px;\r\n" + "  }\r\n"
			+ "}\r\n" + "\r\n" + "@media (min-width:600px){\r\n" + "  .content{\r\n" + "  max-width:1000px;\r\n"
			+ "  margin:0 auto;\r\n" + "}\r\n" + "  .wrapper-1{\r\n" + "  height: initial;\r\n"
			+ "  max-width:620px;\r\n" + "  margin:0 auto;\r\n" + "  margin-top:50px;\r\n"
			+ "  box-shadow: 4px 8px 40px 8px rgba(88, 146, 255, 0.2);\r\n" + "}\r\n" + "  \r\n" + "}\r\n"
			+ "    </style>\r\n" + "</head>\r\n" + "<body>\r\n" + "    \r\n" + "<div class=content>\r\n"
			+ "    <div class=\"wrapper-1\">\r\n" + "      <div class=\"wrapper-2\">\r\n"
			+ "        <h1>Thank you !</h1>\r\n" + "        <p>Thanks for ordering to our products.  </p>\r\n"
			+ "        <p> </p>\r\n" + "        \r\n" + "      </div>\r\n" + "      <div class=\"footer-like\">\r\n"
			+ "      \r\n" + "        </p>\r\n" + "      </div>\r\n" + "  </div>\r\n" + "  </div>\r\n" + "  \r\n"
			+ "  <link href=\"https://fonts.googleapis.com/css?family=Kaushan+Script|Source+Sans+Pro\" rel=\"stylesheet\">\r\n"
			+ "</body>\r\n" + "</html>";
}
