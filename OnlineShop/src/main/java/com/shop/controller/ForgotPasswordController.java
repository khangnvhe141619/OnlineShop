package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shop.service.CustomerService;
import com.shop.service.EmailMessage;
import com.shop.service.EmailUtility;

/**
 * Servlet implementation class ForgotPasswordController 123
 */
@WebServlet("/forgotPasswordController")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPasswordController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/Forgot-password.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmailMessage emailBean = new EmailMessage();
		String email = request.getParameter("email").trim();
		String newPassword = CustomerService.resetCustomerPassword(email);
		if (newPassword == null) {
			request.setAttribute("emailError", true);
			request.getRequestDispatcher("views/Forgot-password.jsp").forward(request, response);
		} else {
			// set subject for email
			emailBean.setSubject("Reset Your Password");
			// set the email of the user to send to
			emailBean.setTo(email);
			emailBean.setMessageType(1);
			// set content of email
			String password = "\r\n" + "<!doctype html>\r\n" + "<html lang=\"en-US\">\r\n" + "\r\n" + "<head>\r\n"
					+ "    <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" />\r\n"
					+ "    <title>Reset Password Email Template</title>\r\n"
					+ "    <meta name=\"description\" content=\"Reset Password Email Template.\">\r\n"
					+ "    <style type=\"text/css\">\r\n"
					+ "        a:hover {text-decoration: underline !important;}\r\n" + "    </style>\r\n"
					+ "</head>\r\n" + "\r\n"
					+ "<body marginheight=\"0\" topmargin=\"0\" marginwidth=\"0\" style=\"margin: 0px; background-color: #f2f3f8;\" leftmargin=\"0\">\r\n"
					+ "    <!--100% body table-->\r\n"
					+ "    <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#f2f3f8\"\r\n"
					+ "        style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: 'Open Sans', sans-serif;\">\r\n"
					+ "        <tr>\r\n" + "            <td>\r\n"
					+ "                <table style=\"background-color: #f2f3f8; max-width:670px;  margin:0 auto;\" width=\"100%\" border=\"0\"\r\n"
					+ "                    align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n"
					+ "                    <tr>\r\n"
					+ "                        <td style=\"height:80px;\">&nbsp;</td>\r\n"
					+ "                    </tr>\r\n" + "                    <tr>\r\n"
					+ "                        <td style=\"text-align:center;\">\r\n"
					+ "                          <a href=\"https://rakeshmandal.com\" title=\"logo\" target=\"_blank\">\r\n"
					+ "                            <img width=\"60\" src=\"https://i.ibb.co/hL4XZp2/android-chrome-192x192.png\" title=\"logo\" alt=\"logo\">\r\n"
					+ "                          </a>\r\n" + "                        </td>\r\n"
					+ "                    </tr>\r\n" + "                    <tr>\r\n"
					+ "                        <td style=\"height:20px;\">&nbsp;</td>\r\n"
					+ "                    </tr>\r\n" + "                    <tr>\r\n"
					+ "                        <td>\r\n"
					+ "                            <table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "                                style=\"max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\">\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td style=\"height:40px;\">&nbsp;</td>\r\n"
					+ "                                </tr>\r\n" + "                                <tr>\r\n"
					+ "                                    <td style=\"padding:0 35px;\">\r\n"
					+ "                                        <h1 style=\"color:#1e1e2d; font-weight:500; margin:0;font-size:32px;font-family:'Rubik',sans-serif;\">You have\r\n"
					+ "                                            requested to reset your password</h1>\r\n"
					+ "                                        <span\r\n"
					+ "                                            style=\"display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;\"></span>\r\n"
					+ "                                        <p style=\"color:#455056; font-size:15px;line-height:24px; margin:0;\">\r\n"
					+ "                                            We just simply send you a new password.\r\n"
					+ "                                        </p>\r\n"
					+ "                                        <a href=\"javascript:void(0);\"\r\n"
					+ "                                            style=\"background:#20e277;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;font-size:14px;padding:10px 24px;display:inline-block;border-radius:50px;\">"
					+ newPassword + "                                            </a>\r\n"
					+ "                                    </td>\r\n" + "                                </tr>\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td style=\"height:40px;\">&nbsp;</td>\r\n"
					+ "                                </tr>\r\n" + "                            </table>\r\n"
					+ "                        </td>\r\n" + "                    <tr>\r\n"
					+ "                        <td style=\"height:20px;\">&nbsp;</td>\r\n"
					+ "                    </tr>\r\n" + "                    <tr>\r\n"
					+ "                        <td style=\"text-align:center;\">\r\n"
					+ "                            <p style=\"font-size:14px; color:rgba(69, 80, 86, 0.7411764705882353); line-height:18px; margin:0 0 0;\">&copy; <strong>G4</strong></p>\r\n"
					+ "                        </td>\r\n" + "                    </tr>\r\n"
					+ "                    <tr>\r\n"
					+ "                        <td style=\"height:80px;\">&nbsp;</td>\r\n"
					+ "                    </tr>\r\n" + "                </table>\r\n" + "            </td>\r\n"
					+ "        </tr>\r\n" + "    </table>\r\n" + "    <!--/100% body table-->\r\n" + "</body>\r\n"
					+ "\r\n" + "</html>";
			emailBean.setMessage(password);

			try {
				// send mail for user
				EmailUtility.sendMail(emailBean);
				request.setAttribute("title", "Forgot password!");
				request.setAttribute("describe",
						"Your data has been successfully submitted. We sent your password via the email.");
				request.getRequestDispatcher("views/Thankyou.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
