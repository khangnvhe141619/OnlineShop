package com.shop.dao;

import java.sql.SQLException;

import fa.training.model.Member;

public interface UserDAO {
	Member getLogin(String userName, String password) throws SQLException;
}
