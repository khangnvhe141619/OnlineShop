package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Category;
import com.shop.model.Product;

public interface CategoryDAO {
	public List<Category> getListAllCategory() throws SQLException;
	
	public Category getCategoryByID() throws SQLException;
	
	public List<Product> getProductByCategory() throws SQLException;
	
	public boolean insertCategory() throws SQLException;
	
	public boolean updateCategory() throws SQLException;
	
	public boolean deleteCategory() throws SQLException;
	
}
