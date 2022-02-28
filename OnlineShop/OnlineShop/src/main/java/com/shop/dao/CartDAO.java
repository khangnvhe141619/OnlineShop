package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Account;
import com.shop.model.Cart;
import com.shop.model.Product;

public interface CartDAO {
	public void addCard(Account acc, Cart cart);

}
