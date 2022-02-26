package com.shop.dao;

import java.sql.SQLException;

import com.shop.model.Subscriber;

public interface SubscriberDAO {
	public boolean insertSubscriber(Subscriber subscriber) throws SQLException;
}
