package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Shipper;

public interface ShipperDAO {

	public List<Shipper> getListShipper() throws SQLException;

	public List<Shipper> getListShipperPaging(int row) throws SQLException;

	public boolean insertShipper(Shipper shipper) throws SQLException;

	public boolean updateShipper(Shipper shipper) throws SQLException;

	public boolean deleteShipper(String id) throws SQLException;

	public int countTotalShipper() throws SQLException;

	public Shipper getShipperInformation(String id) throws SQLException;
}
