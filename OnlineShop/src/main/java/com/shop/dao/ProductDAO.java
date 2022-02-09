package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Product;

public interface ProductDAO {
	//get product by id
	public Product getProductById(String id) throws SQLException;

	//add product to db
	public boolean insertProduct(Product product) throws SQLException;

	//update product to db
	public boolean updateProduct(Product product) throws SQLException;

	//delete product from db
	public boolean deleteProduct(String id) throws SQLException;

	//get total of  product
	public List<Product> getListToTalProduct(int row) throws SQLException;
}
