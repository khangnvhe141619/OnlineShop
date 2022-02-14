package com.shop.utils;

import java.sql.SQLException;

import com.shop.dao.AccountDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.model.Account;

public class Test {
	public static void main(String[] args) throws SQLException {
		AccountDAO dao = new AccountDAOImpl();
//		Account a = dao.getLogin("admin@gmail.com", "admin");
//		if (a != null) {
//			System.out.println("OK");
//		} else {
//			System.out.println("NOT OK");
//		}
		dao.getInsertAccount(new Account("dong123", "123", "dasd@gmail.com", "0312321312", "2021-02-10"));
	}
}
