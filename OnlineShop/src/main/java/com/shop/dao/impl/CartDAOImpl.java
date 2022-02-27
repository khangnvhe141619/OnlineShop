package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.dao.CartDAO;
import com.shop.model.Account;
import com.shop.model.Cart;
import com.shop.utils.DBConnection;
import com.shop.utils.SQLCommand;

public class CartDAOImpl implements CartDAO {
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;
	@Override
	public void addCard(Account acc, Cart cart) {
		
	}


}
