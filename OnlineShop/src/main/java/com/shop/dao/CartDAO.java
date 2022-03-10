package com.shop.dao;

import com.shop.model.Account;
import com.shop.model.Cart;

public interface CartDAO {
	public void addCard(Account acc, Cart cart);

}
