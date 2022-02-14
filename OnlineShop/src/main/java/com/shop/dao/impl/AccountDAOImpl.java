package com.shop.dao.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11),
						rs.getString(12));
			}
		} catch (IOException e) {
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
		} catch (IOException e) {
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
	public boolean getCheckEmail(String email) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.checkEmail);
			pre.setString(1, email);
			rs = pre.executeQuery();
			check = rs.next();
		} catch (IOException e) {
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
			pre.setString(3, account.getEmail());
			pre.setString(4, account.getPhonenumber());
			pre.setString(5, account.getcreatedDate());
			check = pre.executeUpdate() == 1;
		} catch (IOException e) {
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
}
