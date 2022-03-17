package com.shop.dao;

import java.sql.SQLException;

public interface OfferDAO {
	public boolean insertOffer(int productId, String couponId) throws SQLException;
}
