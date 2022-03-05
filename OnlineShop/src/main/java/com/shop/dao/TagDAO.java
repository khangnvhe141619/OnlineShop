package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Tag;

public interface TagDAO {
	public List<Tag> getAllTag() throws SQLException;
	
}
