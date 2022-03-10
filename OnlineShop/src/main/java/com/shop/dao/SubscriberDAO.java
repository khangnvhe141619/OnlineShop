package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Subscriber;

public interface SubscriberDAO {
	public List<Subscriber> getAllSubscribe(int row) throws SQLException;

	public boolean insertSubscriber(Subscriber subscriber) throws SQLException;

	public int countTotalSubscriber() throws SQLException;
}
