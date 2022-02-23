package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Account;

public interface AccountDAO {
	Account getLogin(String userName, String password) throws SQLException;
	
	boolean getCheckUsername(String userName) throws SQLException;
	
	boolean getCheckEmail(String email) throws SQLException;
	
	boolean getInsertAccount(Account account) throws SQLException;
	
	List<Account> getListAccount() throws SQLException;
	
	public Account findPassword(String email) throws SQLException;
}
