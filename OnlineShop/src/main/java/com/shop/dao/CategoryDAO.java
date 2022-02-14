package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Category;

public interface CategoryDAO {
	public List<Category> getListAllCategory() throws SQLException;
}
