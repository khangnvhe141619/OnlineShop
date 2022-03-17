package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import com.shop.dao.CartDAO;
import com.shop.model.Account;
import com.shop.model.Cart;
import com.shop.model.Item;

public class CartDAOImpl implements CartDAO {
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;

	@Override
	public void addCard(Account acc, Cart cart) {
		LocalDate curDate = java.time.LocalDate.now();
		String date = curDate.toString();
		try {
			// add vao bang order
			String sql = "INSERT INTO [Order]\r\n" + "VALUES(?,?,?,?,?,?)";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setInt(1, 1);
			pre.setInt(2, acc.getAccountId());
			pre.setString(3, date);
			pre.setString(4, date);
			pre.setDouble(5, cart.getTotalMoney());
			pre.setInt(6, 1);
			pre.executeUpdate();
			// lay ra id cua order vua add
			String sqll = "SELECT TOP 1 OrderID\r\n" + "from [Order]\r\n" + "order by OrderID desc";
			PreparedStatement pre2 = con.prepareStatement(sqll);
			rs = pre2.executeQuery();
			// add vao bang orderDetails
			if (rs.next()) {
				int oid = rs.getInt(1);
				for (Item i : cart.getItems()) {
					String sql4 = "INSERT INTO [OrderDetail]\r\n" + "VALUES(?,?,?)";
					PreparedStatement pre3 = con.prepareStatement(sql4);
					pre3.setInt(1, oid);
					pre3.setInt(2, i.getProduct().getProductID());
					pre3.setInt(3, i.getQuantity());
					pre3.executeUpdate();
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {

	}
}
