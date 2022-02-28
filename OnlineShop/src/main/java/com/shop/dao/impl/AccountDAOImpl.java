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
			pre = con.prepareStatement(SQLCommand.login);
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
			pre = con.prepareStatement(SQLCommand.checkUsername);
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
			pre = con.prepareStatement(SQLCommand.insertAccount);
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
			pre = con.prepareStatement(SQLCommand.listAccount);
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
        public static void main(String[] args) {
        
    }
}
