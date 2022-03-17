package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.shop.dao.ContactDAO;
import com.shop.model.Contact;
import com.shop.utils.DBConnection;

public class ContactDAOImpl implements ContactDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public Contact getInformation() throws SQLException {
		String sql = "SELECT * \r\n" + "FROM Contact";
		Contact contact = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				contact = new Contact();
				contact.setName(rs.getString("ShopName"));
				contact.setDesc(rs.getString("Desc"));
				contact.setEmail(rs.getString("Email"));
				contact.setPhone(rs.getString("Phone"));
				contact.setAddress(rs.getString("Address"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return contact;
	}
	
    public static void main(String[] args) {
        ContactDAOImpl cd=new ContactDAOImpl();
        try {
			Contact c=cd.getInformation();
			System.out.println(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
