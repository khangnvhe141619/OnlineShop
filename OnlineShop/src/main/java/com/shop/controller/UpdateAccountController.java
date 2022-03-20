package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shop.dao.AccountDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.model.Account;
import com.shop.model.Address;
//lalala
/**
 * Servlet implementation class UpdateAccountController
 */
@WebServlet("/update")
public class UpdateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateAccountController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("email") == null || session.getAttribute("account") == null) {
			response.sendRedirect("loginController");
		} else {
			int accountId = (Integer) session.getAttribute("account");
			String email = (String) session.getAttribute("email");
			AccountDAO accountDAO = new AccountDAOImpl();
			try {
				Address address = accountDAO.getAddress(accountId);
				Account acc = accountDAO.getInfoAcc(email);
				request.setAttribute("account", acc);
				request.setAttribute("address", address);
			} catch (SQLException e) {
				request.setAttribute("errorSQL", true);
				request.getRequestDispatcher("views/Update-account.jsp").forward(request, response);
				e.printStackTrace();
			} finally {
				request.getRequestDispatcher("views/Update-account.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filename = null;
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		HttpSession session = request.getSession();
		int accountID = (int) session.getAttribute("account");
		AccountDAO accountDAO = new AccountDAOImpl();
		try {
			Account acc = accountDAO.getInfoAcc(username);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletContext servletContext = this.getServletConfig().getServletContext();
			File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			factory.setRepository(repository);
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			HashMap<String, String> fields = new HashMap<>();
			while (iter.hasNext()) {
				FileItem item = iter.next();
				if (item.isFormField()) {
					fields.put(item.getFieldName(), item.getString());
				} else {
					filename = item.getName();
					if (filename == null || filename.equals("")) {
						break;
					} else {
						Path path = Paths.get(filename);
						String storePath = servletContext.getRealPath("/uploads");
						File uploadFile = new File(storePath + "/" + path.getFileName());
						item.write(uploadFile);
						System.out.println(storePath + "/" + path.getFileName());
					}
				}
			}
			acc = accountDAO.getInfoAccountIDInt(accountID);
			System.out.println(acc.toString());
			System.out.println("naskljdnaskldnklasndklas");
			address = fields.get("address");
			username = fields.get("username");
			fullname = fields.get("fullname");
			email = fields.get("email");
			phonenumber = fields.get("phonenumber");
			System.out.println(filename);
			Account accountNew = new Account(accountID, username, fullname, email, phonenumber, filename);
			System.out.println(accountNew);
			System.out.println("update oke");
			if (filename == null || filename.equals("")) {
				accountNew.setAvatar(acc.getAvatar());
				System.out.println(acc.getAvatar());
			}
			if (accountDAO.getUpdateAccount(accountNew)) {
				if(accountDAO.getUpdateAddress(accountID, address)) {
					Address add = accountDAO.getAddress(accountID);
					request.setAttribute("address", add);
					request.setAttribute("account", accountNew);
					request.getRequestDispatcher("views/Update-account.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("failedUpdate", true);
				request.setAttribute("account", accountNew);
				request.getRequestDispatcher("views/Update-account.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("errorSQL", true);
			request.getRequestDispatcher("views/Update-account.jsp").forward(request, response);
			e.printStackTrace();
		}
	}
}
