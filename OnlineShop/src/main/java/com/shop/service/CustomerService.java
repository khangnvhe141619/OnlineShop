package com.shop.service;

import java.sql.SQLException;
import java.util.Random;
import com.shop.dao.AccountDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.model.Account;

public class CustomerService {
	public static String resetCustomerPassword(String email) {
		String s = "abc123ABCghjKIUTVUpm789qEACyxn456Los";
		AccountDAO accountDAO = new AccountDAOImpl();
		String randomPassword = "";
		Random r = new Random();
		char[] pass = new char[8];
		Account account = null;
		try {
			account = accountDAO.findPassword(email);
			for (int i = 0; i < 8; i++) {
				pass[i] = s.charAt(r.nextInt(20));
				randomPassword += pass[i];
			}
			account.setPassword(randomPassword);
			boolean h = accountDAO.getChangePassword(account);
			System.out.println(h);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return randomPassword;
	}

//	public static void main(String[] args) {
//		AccountDAO accountDAO = new AccountDAOImpl();
//		String account = resetCustomerPassword("khacongkenh@gmail.com");
//		System.out.println(account);
//	}
}
