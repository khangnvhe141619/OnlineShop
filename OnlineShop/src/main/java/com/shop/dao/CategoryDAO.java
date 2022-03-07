package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Category;
import com.shop.model.Product;

public interface CategoryDAO {
	public List<Category> getListAllCategory() throws SQLException;
	
	public Category getCategoryByID(String categoryId) throws SQLException;
	
	public List<Product> getListProductByCategory(String categoryId) throws SQLException;
	
	public boolean insertCategory(Category category) throws SQLException;
	
	public boolean updateCategory(Category category) throws SQLException;
	
	public boolean deleteCategory(int categoryId) throws SQLException;
	
}
