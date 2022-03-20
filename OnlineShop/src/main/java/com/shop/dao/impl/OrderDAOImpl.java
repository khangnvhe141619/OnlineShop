package com.shop.dao.impl;

import java.sql.Connection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.shop.dao.OrderDAO;
import com.shop.model.Item;
import com.shop.model.Order;
import com.shop.model.OrderAdmin;
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
			pre.setString(4, order.getReceiptDate());
			pre.setDouble(5, order.getTotal());
			pre.setInt(6, order.getStatusId());
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
				Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("ReceiptDate"));
		        DateFormat dateFormat = null;
		        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				productOrderShip = new ProductOrderShip();
				productOrderShip.setTotal(rs.getDouble("Total"));
				productOrderShip.setDescription(rs.getString("Description"));
				productOrderShip.setImage(rs.getString("Image"));
				productOrderShip.setProductName(rs.getString("ProductName"));
				productOrderShip.setPrice(rs.getDouble("Price"));
				productOrderShip.setReceiptDate(dateFormat.format(date));
				productOrderShip.setQuantity(rs.getInt("Quantity"));
				productOrderShip.setProductID(rs.getInt("ProductID"));
				orders.add(productOrderShip);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public List<OrderAdmin> getListAllOrders(int index) throws SQLException, ParseException {
		List<OrderAdmin> orderAdmins = new ArrayList<>();
		OrderAdmin orderAdmin = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ALL_ORDER);
			pre.setInt(1, index);
			pre.setInt(2, index);
			rs = pre.executeQuery();
			while (rs.next()) {
				Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("OrderDate"));
		        DateFormat dateFormat = null;
		        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				orderAdmin = new OrderAdmin();
				orderAdmin.setStt(rs.getInt("STT"));
				orderAdmin.setShipper(rs.getString("ShipperName"));
				orderAdmin.setCustomer(rs.getString("Username"));
				orderAdmin.setOrderDate(dateFormat.format(date));
				orderAdmin.setTotal(rs.getDouble("Total"));
				orderAdmin.setStatus(rs.getString("Description"));
				orderAdmin.setOrderId(rs.getInt("OrderID"));
				orderAdmins.add(orderAdmin);
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
		return orderAdmins;
	}
	
	@Override
	public int getCountOrder() throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_COUNT_ORDER);
			rs = pre.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {

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
		return 0;
	}
	
	@Override
	public List<OrderAdmin> getListAllOrdersByStt(int stt) throws SQLException {
		List<OrderAdmin> orderAdmins = new ArrayList<>();
		OrderAdmin orderAdmin = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ALL_ORDER_BY_OID);
			pre.setInt(1, stt);
			rs = pre.executeQuery();
			while (rs.next()) {
				orderAdmin = new OrderAdmin();
				Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("ReceiptDate"));
			    DateFormat dateFormat = null;
			    dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			    orderAdmin.setReceiptDate(dateFormat.format(date));
				orderAdmin.setStt(rs.getInt("STT"));
				orderAdmin.setShipper(rs.getString("ShipperName"));
				orderAdmin.setCustomer(rs.getString("Username"));
				orderAdmin.setOrderDate(rs.getString("OrderDate"));
				orderAdmin.setTotal(rs.getDouble("Total"));
				orderAdmin.setStatus(rs.getString("Description"));
				orderAdmin.setOrderId(rs.getInt("OrderID"));
				orderAdmins.add(orderAdmin);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return orderAdmins;
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
				Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("ReceiptDate"));
		        DateFormat dateFormat = null;
		        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				productOrderShip = new ProductOrderShip();
				productOrderShip.setTotal(rs.getDouble("Total"));
				productOrderShip.setDescription(rs.getString("Description"));
				productOrderShip.setImage(rs.getString("Image"));
				productOrderShip.setProductName(rs.getString("ProductName"));
				productOrderShip.setPrice(rs.getDouble("Price"));
				productOrderShip.setReceiptDate(dateFormat.format(date));
				productOrderShip.setQuantity(rs.getInt("Quantity"));
				productOrderShip.setProductID(rs.getInt("ProductID"));
				orders.add(productOrderShip);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public List<ProductOrderShip> getListOrdersByCancel(int account) throws SQLException {
		List<ProductOrderShip> orders = new ArrayList<>();
		ProductOrderShip productOrderShip = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ORDER_BY_CANCEL);
			pre.setInt(1, account);
			rs = pre.executeQuery();
			while (rs.next()) {
				Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("ReceiptDate"));
		        DateFormat dateFormat = null;
		        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				productOrderShip = new ProductOrderShip();
				productOrderShip.setTotal(rs.getDouble("Total"));
				productOrderShip.setDescription(rs.getString("Description"));
				productOrderShip.setImage(rs.getString("Image"));
				productOrderShip.setProductName(rs.getString("ProductName"));
				productOrderShip.setPrice(rs.getDouble("Price"));
				productOrderShip.setReceiptDate(dateFormat.format(date));
				productOrderShip.setQuantity(rs.getInt("Quantity"));
				productOrderShip.setProductID(rs.getInt("ProductID"));
				orders.add(productOrderShip);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("ReceiptDate"));
		        DateFormat dateFormat = null;
		        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				productOrderShip = new ProductOrderShip();
				productOrderShip.setTotal(rs.getDouble("Total"));
				productOrderShip.setDescription(rs.getString("Description"));
				productOrderShip.setImage(rs.getString("Image"));
				productOrderShip.setProductName(rs.getString("ProductName"));
				productOrderShip.setPrice(rs.getDouble("Price"));
				productOrderShip.setReceiptDate(dateFormat.format(date));
				productOrderShip.setQuantity(rs.getInt("Quantity"));
				productOrderShip.setProductID(rs.getInt("ProductID"));
				orders.add(productOrderShip);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public boolean getUpdateOrder(int status, int oid, int shipperID, String receiptDate, Double total) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_UPDATE_ORDER);
			pre.setInt(1, status);
			pre.setInt(2, shipperID);
			pre.setString(3, receiptDate);
			pre.setDouble(4, total);
			pre.setInt(5, oid);
			check = pre.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return check;
	}
	
	public static void main(String[] args) throws SQLException, ParseException {
		LocalDate localDate = java.time.LocalDate.now();
		String date = localDate.toString();
		System.out.println(LocalDate.parse(date).plusDays(1).toString());
	}
}
