package com.shop.dao;

import java.sql.SQLException;

import com.shop.model.Contact;

public interface ContactDAO {
	public Contact getInformation() throws SQLException;
}
