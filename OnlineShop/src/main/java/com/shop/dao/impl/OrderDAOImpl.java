package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.shop.dao.OrderDAO;
import com.shop.model.Item;
import com.shop.model.Order;
import com.shop.model.ProductOrderShip;
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

	@Override
	public List<ProductOrderShip> getListOrders(int account) throws SQLException {
		List<ProductOrderShip> orders = new ArrayList<>();
		ProductOrderShip productOrderShip = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ORDER);
			pre.setInt(1, account);
			rs = pre.executeQuery();
			while (rs.next()) {
				productOrderShip = new ProductOrderShip();
				productOrderShip.setTotal(rs.getDouble("Total"));
				productOrderShip.setDescription(rs.getString("Description"));
				productOrderShip.setImage(rs.getString("Image"));
				productOrderShip.setProductName(rs.getString("ProductName"));
				productOrderShip.setPrice(rs.getDouble("Price"));
				productOrderShip.setQuantity(rs.getInt("Quantity"));
				productOrderShip.setProductID(rs.getInt("ProductID"));
				orders.add(productOrderShip);
			}
			
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return orders;
	}
	
	@Override
	public List<ProductOrderShip> getListOrdersByPending(int account) throws SQLException {
		List<ProductOrderShip> orders = new ArrayList<>();
		ProductOrderShip productOrderShip = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ORDER_BY_PENDING);
			pre.setInt(1, account);
			rs = pre.executeQuery();
			while (rs.next()) {
				productOrderShip = new ProductOrderShip();
				productOrderShip.setTotal(rs.getDouble("Total"));
				productOrderShip.setDescription(rs.getString("Description"));
				productOrderShip.setImage(rs.getString("Image"));
				productOrderShip.setProductName(rs.getString("ProductName"));
				productOrderShip.setPrice(rs.getDouble("Price"));
				productOrderShip.setQuantity(rs.getInt("Quantity"));
				productOrderShip.setProductID(rs.getInt("ProductID"));
				orders.add(productOrderShip);
			}
			
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return orders;
	}
	
	@Override
	public List<ProductOrderShip> getListOrdersByCompleted(int account) throws SQLException {
		List<ProductOrderShip> orders = new ArrayList<>();
		ProductOrderShip productOrderShip = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ORDER_BY_COMPLETED);
			pre.setInt(1, account);
			rs = pre.executeQuery();
			while (rs.next()) {
				productOrderShip = new ProductOrderShip();
				productOrderShip.setTotal(rs.getDouble("Total"));
				productOrderShip.setDescription(rs.getString("Description"));
				productOrderShip.setImage(rs.getString("Image"));
				productOrderShip.setProductName(rs.getString("ProductName"));
				productOrderShip.setPrice(rs.getDouble("Price"));
				productOrderShip.setQuantity(rs.getInt("Quantity"));
				productOrderShip.setProductID(rs.getInt("ProductID"));
				orders.add(productOrderShip);
			}
			
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return orders;
	}
	
	public static void main(String[] args) throws SQLException {
		OrderDAO pd = new OrderDAOImpl();
		List<ProductOrderShip> lp = pd.getListOrdersByPending(2);
		for (ProductOrderShip product : lp) {
			System.out.println(product.toString());
		}
	}
}
