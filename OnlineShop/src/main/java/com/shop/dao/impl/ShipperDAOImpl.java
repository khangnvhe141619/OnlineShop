package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.ShipperDAO;
import com.shop.model.Shipper;
import com.shop.utils.DBConnection;
import com.shop.utils.SQLCommand;

public class ShipperDAOImpl implements ShipperDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Shipper> getListShipperPaging(int row) throws SQLException {
		List<Shipper> shippers = new ArrayList<>();
		String sql = "SELECT *\r\n" + "FROM Shipper\r\n" + "ORDER BY ShipperID\r\n"
				+ "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, row);
			rs = ps.executeQuery();
			while (rs.next()) {
				shippers.add(new Shipper(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
		return shippers;
	}

	@Override
	public boolean insertShipper(Shipper shipper) throws SQLException {
		int row = 0;
		String sql = "INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES (?, ?, ?)";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, shipper.getShipperName());
			ps.setString(2, shipper.getEmail());
			ps.setString(3, shipper.getPhone());
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
	public boolean updateShipper(Shipper shipper) throws SQLException {
		String sql = "UPDATE Shipper\r\n" + "SET ShipperName = ?, Email = ?, Phone = ?\r\n" + "WHERE ShipperID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, shipper.getShipperName());
			ps.setString(2, shipper.getEmail());
			ps.setString(3, shipper.getPhone());
			ps.setInt(4, shipper.getShipperID());
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
	public boolean deleteShipper(String id) throws SQLException {
		int row = 0;
		String sql = "DELETE Shipper WHERE ShipperID = ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

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

	@Override
	public List<Shipper> getListShipper() throws SQLException {
		List<Shipper> shippers = new ArrayList<>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(SQLCommand.LIST_SHIPPER);
			rs = ps.executeQuery();
			while (rs.next()) {
				shippers.add(new Shipper(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
		return shippers;
	}

	@Override
	public int countTotalShipper() throws SQLException {
		String sql = "SELECT COUNT(*) FROM Shipper";
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
	public Shipper getShipperInformation(String id) throws SQLException {
		String sql = "SELECT *\r\n" + "FROM Shipper\r\n" + "WHERE ShipperID = ?";
		Shipper shipper = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				shipper = new Shipper();
				shipper.setShipperID(rs.getInt("ShipperID"));
				shipper.setShipperName(rs.getString("ShipperName"));
				shipper.setEmail(rs.getString("Email"));
				shipper.setPhone(rs.getString("Phone"));
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
		return shipper;
	}

}
