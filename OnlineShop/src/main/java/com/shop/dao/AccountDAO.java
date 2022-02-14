package com.shop.dao;

import java.sql.SQLException;
import com.shop.model.Account;

public interface AccountDAO {
	Account getLogin(String userName, String password) throws SQLException;
	
	boolean getCheckUsername(String userName) throws SQLException;
	
	boolean getCheckEmail(String email) throws SQLException;
	
	boolean getInsertAccount(Account account) throws SQLException;
}
