package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.shop.dao.AccountDAO;
import com.shop.model.Account;
import com.shop.model.Address;
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
	public boolean getUpdateRole(int accountId, int role) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_UPDATE_ROLE);
			pre.setInt(1, role);
			pre.setInt(2, accountId);
			check = pre.executeUpdate() == 1;
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
	public List<Account> getListAccountOfAdmin(int index, int accountID) throws SQLException {
		List<Account> accounts = new ArrayList<>();
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ACCOUNT);
			pre.setInt(1, accountID);
			pre.setInt(2, index);
			pre.setInt(3, index);
			rs = pre.executeQuery();
			while (rs.next()) {
				accounts.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
	public Address getAddress(int accountId) throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_ADDRESS_FROM_ACCOUNTID);
			pre.setInt(1, accountId);
			rs = pre.executeQuery();
			while (rs.next()) {
				return new Address(rs.getInt(1), rs.getString(2));
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
	public Account getInfoAccountID(String AccountID) throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_ACCOUNT_FROM_ACCOUNTID);
			pre.setString(1, AccountID);
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
	public Account getInfoAccountIDInt(int AccountID) throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_ACCOUNT_FROM_ACCOUNTID_INT);
			pre.setInt(1, AccountID);
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
	public boolean getUpdateAccountInfo(Account account) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.UPDATE_ACCOUNT_INFO);
			pre.setString(1, account.getUsername());
			pre.setString(2, account.getFullname());
			pre.setString(3, account.getEmail());
			pre.setString(4, account.getPhonenumber());
			pre.setInt(5, account.getAccountId());
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
	public boolean getUpdateAddress(int accountId, String address) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_UPDATE_ADDRESS);
			pre.setString(1, address);
			pre.setInt(2, accountId);
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
		String sql = "SELECT * FROM Account WHERE Email LIKE ?";
		Account account = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, email);
			rs = pre.executeQuery();
			if (rs.next()) {
				account = new Account();
				account.setAccountId(rs.getInt("AccountID"));
				account.setUsername(rs.getString("Username"));
				account.setPassword(rs.getString("Password"));
				account.setFullname(rs.getString("FullName"));
				account.setGender(rs.getInt("Gender"));
				account.setEmail(rs.getString("Email"));
				account.setPhonenumber(rs.getString("PhoneNumber"));
				account.setAvatar(rs.getString("Avatar"));
				account.setRole(rs.getInt("Role"));
				account.setActive(rs.getInt("Active"));
				account.setCreatedDate(rs.getString("CreatedDate"));
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
	
	@Override
	public int getCountAccounts(int accountID) throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_COUNT_ACCOUNT);
			pre.setInt(1, accountID);
			rs = pre.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {

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
		return 0;
	}
	
	@Override
	public List<Account> getListAccountOfAdminBlock(int index) throws SQLException {
		List<Account> accounts = new ArrayList<>();
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ACCOUNT_BLOCK);
			pre.setInt(1, index);
			pre.setInt(2, index);
			rs = pre.executeQuery();
			while (rs.next()) {
				accounts.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
	public int getCountAccountsBlock() throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_COUNT_ACCOUNT_BLOCK);
			rs = pre.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {

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
		return 0;
	}
	
	@Override
	public boolean getDeleteAccount(int id) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			System.out.println(id);
			pre = con.prepareStatement(SQLCommand.GET_DELETE_AccountID);
			pre.setInt(1, id);
			check = pre.executeUpdate() == 1;
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
	public boolean getBlockAccount(int accountID) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_BLOCK_ACCOUNT);
			pre.setInt(1, accountID);
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
	
	public static void main(String[] args) throws SQLException {
		AccountDAO dao = new AccountDAOImpl();
		boolean check = dao.getUpdateAccountInfo(new Account(2, "Khang123", "Van Khang", "123@123.com", "0123213213"));
		if(check) {
			System.out.println("OK");
		} else {
			System.out.println("NOT OK");
		}
	}

	@Override
	public boolean getUnBlockAccount(int accountID) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_UNBLOCK_ACCOUNT);
			pre.setInt(1, accountID);
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
}
