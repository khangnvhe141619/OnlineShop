package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.CouponDAO;
import com.shop.model.Coupon;
import com.shop.utils.DBConnection;

public class CouponDAOImpl implements CouponDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Coupon> getListCoupon(int index) throws SQLException {
		String sql = "SELECT ROW_NUMBER() over (order by CouponID) as stt, * FROM Coupon \r\n"
				+ "				ORDER BY CouponID\r\n" + "	OFFSET ?  ROWS FETCH NEXT 5 ROWS ONLY";
		Coupon ca = null;
		List<Coupon> lsCa = new ArrayList<Coupon>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, (index - 1) * 5);

			rs = ps.executeQuery();
			while (rs.next()) {
				ca = new Coupon();
				ca.setStt(rs.getInt("stt"));
				ca.setCouponId(rs.getString(2));
				ca.setDiscountDesc(rs.getString(3));
				ca.setDiscountPercent(rs.getInt(4));
				ca.setQuantity(rs.getInt(5));
				lsCa.add(ca);
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
		} // TODO Auto-generated method stub
		return lsCa;
	}

	@Override
	public Boolean insertCoupon(Coupon coupon) throws SQLException {
		String sql = "INSERT INTO Coupon VALUES(?, ?, ?, ?)";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, coupon.getCouponId());
			ps.setString(2, coupon.getDiscountDesc());
			ps.setInt(3, coupon.getDiscountPercent());
			ps.setInt(4, coupon.getQuantity());
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

	@Override
	public int countCoupon() throws SQLException {
		String sql = "SELECT COUNT(*) \r\n" + "FROM Coupon";
		int count = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
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
		return count;

	}

	@Override
	public boolean updateCoupon(Coupon coupon) throws SQLException {
		String sql = "UPDATE Coupon\r\n" + "SET CouponDesc=?,DiscountPercent=?,Quantity=?\r\n"
				+ "WHERE CouponID LIKE ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, coupon.getDiscountDesc());
			ps.setInt(2, coupon.getDiscountPercent());
			ps.setInt(3, coupon.getQuantity());
			ps.setString(4, coupon.getCouponId());
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

	@Override
	public boolean deleteCoupon(String couponID) throws SQLException {
		String sql = "\r\n" + "DELETE FROM Coupon\r\n" + "WHERE CouponID LIKE ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, couponID);
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

	@Override
	public Coupon getCouponbyID(String code) throws SQLException {
		String sql = "SELECT *\r\n" + "FROM Coupon\r\n" + "WHERE CouponID LIKE ? AND Quantity > 0";
		Coupon ca = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, code);
			rs = ps.executeQuery();
			if (rs.next()) {
				ca = new Coupon();
				ca.setCouponId(rs.getString(1));
				ca.setDiscountDesc(rs.getString(2));
				ca.setDiscountPercent(rs.getInt(3));
				ca.setQuantity(rs.getInt(4));
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
		return ca;
	}

	@Override
	public boolean decreasedCoupon(String id) throws SQLException {
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareCall("{Call procedure_decrease_coupon(?)}");
			ps.setString(1, id);

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
