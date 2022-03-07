package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Shipper;

public interface ShipperDAO {
	List<Shipper> getListShipper() throws SQLException;
}
