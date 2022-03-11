package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Product;

public interface ProductDAO {
	// get product by id
	public Product getProductById(int id) throws SQLException;

	// add product to db
	public boolean insertProduct(Product product) throws SQLException;

	// update product to db
	public boolean updateProduct(Product product) throws SQLException;

	// delete product which have id="id" from db
	public boolean deleteProduct(int id) throws SQLException;

	// get total of product
	public List<Product> getListAllProduct(int index) throws SQLException;

	public List<Product> getAllProduct();

	public int countProduct() throws SQLException;

	public int countSearch(int cateid, String pname, int to, int end) throws SQLException;

	public List<Product> searchProduct(int index, int cateid, String pname, int to, int end) throws SQLException;
	
	public boolean decreasedProduct(int amount, int id) throws SQLException;
}
