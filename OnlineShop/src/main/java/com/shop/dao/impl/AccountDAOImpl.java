package com.shop.dao.impl;

import java.io.IOException;
import java.sql.Connection;
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
			pre = con.prepareStatement(SQLCommand.LOGIN);
			pre.setString(1, userName);
			pre.setString(2, password);
			rs = pre.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11),
						rs.getDate(12));
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

	public static void main(String[] args) throws SQLException {
		AccountDAO dao = new AccountDAOImpl();
		Account a = dao.getLogin("admin", "admin");
		if (a != null) {
			System.out.println("OK");
		} else {
			System.out.println("NOT OK");
		}
	}
}
