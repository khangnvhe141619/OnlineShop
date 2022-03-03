package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.dao.OrderDAO;
import com.shop.model.Item;
import com.shop.model.Order;
import com.shop.utils.DBConnection;
import com.shop.utils.SQLCommand;

public class OrderDAOImpl implements OrderDAO{
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;

	@Override
	public void getInsertOrder(ArrayList<Item> items, Order order){
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.INSERT_Order);
			pre.setInt(1, order.getShipId());
			pre.setInt(2, order.getAccountId());
			pre.setString(3, order.getOrderDate());
			pre.setDouble(4, order.getTotal());
			pre.setInt(5, order.getStatusId());
			pre.executeUpdate();
			int orderid = 0;
			pre = con.prepareStatement(SQLCommand.SELECT_Order_MAX);
            rs = pre.executeQuery();
            if (rs.next()) {
                orderid = Integer.parseInt(rs.getString("mx"));
            }
            for (int i = 0; i < items.size(); i++) {
            	pre = con.prepareStatement(SQLCommand.INSERT_OrderDetail);
                Item it = items.get(i);
                pre.setInt(1, orderid);
                pre.setInt(2, it.getProduct().getProductID());
                pre.setInt(3, it.getQuantity());
                pre.executeUpdate();
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public static void main(String[] args) throws SQLException {
//		OrderDAO dao = new OrderDAOImpl();
//		boolean check = dao.getInsertOrder(new Order(1, 2, "2020-02-22", 321.3, 1));
//		if(check == true) {
//			System.out.println("true");
//		} else {
//			System.out.println("false");
//		}
	}
}
