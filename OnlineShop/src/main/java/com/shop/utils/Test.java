package com.shop.utils;

import java.sql.SQLException;
<<<<<<< HEAD
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.ProductDAO;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.model.Product;

public class Test {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		ProductDAO pd = new ProductDAOImpl();
		List<Product> lp = new ArrayList<Product>();
		Product p = pd.getProductById("1");
		System.out.println(p);
		LocalDateTime cDate=Validation.getLocalDateTime("2022-02-12 20:10:15");
		LocalDateTime pDate=Validation.getLocalDateTime("2022-02-13 20:10:15");
//		System.out.println(cDate+" - "+pDate);
//		Product p1=new Product(1, "PP", "pp.jpg", "aa", cDate, "vv", pDate, 1, "alo", 10, 20000, 40);
//		boolean add=pd.insertProduct(p1);
//		System.out.println(add);
		
		Product p2=new Product(4 ,1, "PP", "pp.jpg", "bb", cDate, "vv", pDate, 1, "alo", 10, 20000, 40);
		boolean up=pd.updateProduct(p2);
		System.out.println(up);
	}

=======

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
>>>>>>> dongns
}
