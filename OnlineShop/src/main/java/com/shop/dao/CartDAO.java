package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Account;
import com.shop.model.Product;

public interface CartDAO {
Account getLogin(String userName, String password) throws SQLException;
	
	boolean getCheckUsername(String userName) throws SQLException;
	
	boolean getCheckEmail(String email) throws SQLException;
	
	boolean getInsertAccount(Account account) throws SQLException;

}
