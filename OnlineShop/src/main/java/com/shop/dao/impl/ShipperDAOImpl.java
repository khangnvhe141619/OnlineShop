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

public class ShipperDAOImpl implements ShipperDAO{
	
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;

	@Override
	public List<Shipper> getListShipper() throws SQLException {
		List<Shipper> shippers = new ArrayList<>();
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.LIST_SHIPPER);
			rs = pre.executeQuery();
			while (rs.next()) {
				shippers.add(new Shipper(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
		return shippers;
	}

}
