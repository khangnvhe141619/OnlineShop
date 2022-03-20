package com.shop.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import com.shop.model.Item;
import com.shop.model.Order;
import com.shop.model.OrderAdmin;
import com.shop.model.ProductOrderShip;

public interface OrderDAO {
	void getInsertOrder(ArrayList<Item> items, Order order);
	
	List<ProductOrderShip> getListOrders(int account) throws SQLException;
	
	List<ProductOrderShip> getListOrdersByPending(int account) throws SQLException;
	
	List<ProductOrderShip> getListOrdersByCompleted(int account) throws SQLException;
	
	List<ProductOrderShip> getListOrdersByCancel(int account) throws SQLException;
	
	List<OrderAdmin> getListAllOrders(int index) throws SQLException, ParseException;
	
	List<OrderAdmin> getListAllOrdersByStt(int stt) throws SQLException;
	
	boolean getUpdateOrder(int status, int oid, int shipperID, String receiptDate, Double total) throws SQLException;
	
	int getCountOrder() throws SQLException;
}
