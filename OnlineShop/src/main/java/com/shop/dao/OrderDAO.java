package com.shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.shop.model.Item;
import com.shop.model.Order;
import com.shop.model.ProductOrderShip;

public interface OrderDAO {
	void getInsertOrder(ArrayList<Item> items, Order order);
	
	List<ProductOrderShip> getListOrders(int account) throws SQLException;
}
