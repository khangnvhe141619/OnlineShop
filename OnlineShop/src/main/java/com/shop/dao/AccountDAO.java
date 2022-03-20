package com.shop.dao;

import java.sql.SQLException;
import java.util.List;
import com.shop.model.Account;
import com.shop.model.Address;


public interface AccountDAO {
	Account getLogin(String userName, String password) throws SQLException;
	
	boolean getCheckUsername(String userName) throws SQLException;
	
	boolean getUpdateAddress(int accountId, String address) throws SQLException;
	
	Account getInfoAccountID(String AccountID) throws SQLException;
	
	boolean getInsertAccount(Account account) throws SQLException;
	
	List<Account> getListAccount() throws SQLException;
	
	Account getInfoAccountIDInt(int AccountID) throws SQLException;
	
	public Account findPassword(String email) throws SQLException;
	
	Account getInfoAcc(String username) throws SQLException;
	
	Address getAddress(int accountId) throws SQLException;
	
	boolean getUpdateAccountInfo(Account account) throws SQLException;
	
	boolean getUpdateAccount(Account account) throws SQLException;
	
	boolean getChangePassword(Account account) throws SQLException;
	
	Account getCheckPassword(int accountID, String password) throws SQLException;
	
	List<Account> getListAccountOfAdmin(int index, int accountID) throws SQLException;
	
	List<Account> getListAccountOfAdminBlock(int index) throws SQLException;
	
	int getCountAccounts(int accountID) throws SQLException;
	
	int getCountAccountsBlock() throws SQLException;
	
	boolean getDeleteAccount(int id) throws SQLException;
	
	boolean getBlockAccount(int accountID) throws SQLException;
	
	boolean getUnBlockAccount(int accountID) throws SQLException;
	
	boolean getUpdateRole(int accountId, int role) throws SQLException;
}
