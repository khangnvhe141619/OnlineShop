package com.shop.dao;

import java.util.ArrayList;

import com.shop.model.Item;
import com.shop.model.Order;

public interface OrderDAO {
	void getInsertOrder(ArrayList<Item> items, Order order);
}
