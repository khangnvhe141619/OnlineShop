package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.shop.dao.AccountDAO;
import com.shop.model.Account;
import com.shop.utils.DBConnection;
import com.shop.utils.SQLCommand;

public class AccountDAOImpl implements AccountDAO {
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;

	@Override
	public Account getLogin(String userName, String password) throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.LOGIN);
			pre.setString(1, userName);
			pre.setString(2, userName);
			pre.setString(3, password);
			rs = pre.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), 
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getString(11));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}

	@Override
	public boolean getCheckUsername(String username) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_ACCOUNT_FROM_USERNAME);
			pre.setString(1, username);
			rs = pre.executeQuery();
			check = rs.next();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return check;
	}

	@Override
	public boolean getInsertAccount(Account account) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.INSERT_ACCOUNT);
			pre.setString(1, account.getUsername());
			pre.setString(2, account.getPassword());
			pre.setString(3, account.getCreatedDate());
			check = pre.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return check;
	}
	
	@Override
	public List<Account> getListAccount() throws SQLException {
		List<Account> accounts = new ArrayList<>();
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.LIST_ACCOUNT);
			rs = pre.executeQuery();
			while (rs.next()) {
				accounts.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), 
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getString(11)));
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return accounts;
	}

	@Override
	public Account getInfoAcc(String username) throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_ACCOUNT_FROM_USERNAME);
			pre.setString(1, username);
			rs = pre.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), 
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getString(11));
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}
	

	@Override
	public boolean getUpdateAccount(Account account) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.UPDATE_ACCOUNT);
			pre.setString(1, account.getUsername());
			pre.setString(2, account.getFullname());
			pre.setString(3, account.getEmail());
			pre.setString(4, account.getPhonenumber());
			pre.setString(5, account.getAvatar());
			pre.setInt(6, account.getAccountId());
			check = pre.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return check;
	}
	
	@Override
	public Account findPassword(String email) throws SQLException {
		String sql = "SELECT Username, Password FROM Account WHERE Email LIKE ?";
		Account account = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, email);
			rs = pre.executeQuery();
			if (rs.next()) {
				account = new Account();
				account.setUsername(rs.getString("Username"));
				account.setPassword(rs.getString("Password"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return account;

	}

	@Override
	public boolean getChangePassword(Account account) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_CHANGE_PASSWORD);
			pre.setString(1, account.getPassword());
			pre.setInt(2, account.getAccountId());
			check = pre.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return check;
	}
	
	@Override
	public Account getCheckPassword(int accountID, String password) throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_CHECK_PASSWORD);
			pre.setString(1, password);
			pre.setInt(2, accountID);
			rs = pre.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2));
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}
	
	public static void main(String[] args) throws SQLException {
		AccountDAO accountDAO = new AccountDAOImpl();
		Account account = accountDAO.getCheckPassword(1, "zxdsdadasdc");
		System.out.println(account);
	}
}
