package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.dao.OfferDAO;
import com.shop.utils.DBConnection;

public class OfferDAOImpl implements OfferDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public boolean insertOffer(int productId, String couponId) throws SQLException {
		String sql = "INSERT INTO Offer ([ProductId], [CouponId]) VALUES (?,?)";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productId);
			ps.setString(2, couponId);
			row = ps.executeUpdate();

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
		return row > 0;
	}

}
