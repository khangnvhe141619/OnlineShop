package com.shop.dao.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;
import com.shop.utils.DBConnection;
import com.shop.utils.Validation;

import fa.training.utils.SQLCommand;

public class ProductDAOImpl implements ProductDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public Product getProductById(String id) throws SQLException {
		String sql = "";
		Product product = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				product = new Product();
				product.setProductID(rs.getInt("ProductID"));
				product.setCategoryId(rs.getInt("CategoryId"));
				product.setProductName(rs.getString("ProductName"));
				product.setImage(rs.getString("Image"));
				product.setDescription(rs.getString("Description"));
				String cDate = rs.getString("CreatedDate");
				LocalDateTime createdDate = Validation.getLocalDateTime(cDate);
				product.setCreatedDate(createdDate);
				product.setIssuingCompany(rs.getString("IssuingCompany"));
				String pDate = rs.getString("PublicationDate");
				LocalDateTime publicationDate = Validation.getLocalDateTime(pDate);
				product.setPublicationDate(publicationDate);
				product.setCoverType(rs.getInt("CoverTypeId"));
				product.setPublishingCompany(rs.getString("PublishingCompany"));
				product.setQuantity(rs.getInt("Quantity"));
				product.setPrice(rs.getDouble("Price"));
				product.setNumberPage(rs.getInt("NumberPage"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return product;
	}

	@Override
	public boolean insertProduct(Product product) throws SQLException {
		String sql = "";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, product.getCategoryId());
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getImage());
			ps.setString(4, product.getDescription());
			ps.setString(5, product.getCreatedDate().toString());
			ps.setString(6, product.getIssuingCompany());
			ps.setString(7, product.getPublicationDate().toString());
			ps.setInt(8, product.getCoverType());
			ps.setString(9, product.getPublishingCompany());
			ps.setInt(10, product.getQuantity());
			ps.setDouble(11, product.getPrice());
			ps.setInt(12, product.getNumberPage());
			row = ps.executeUpdate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return row > 0;
	}

	@Override
	public boolean updateProduct(Product product) throws SQLException {
		String sql = "";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, product.getCategoryId());
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getImage());
			ps.setString(4, product.getDescription());
			ps.setString(5, product.getCreatedDate().toString());
			ps.setString(6, product.getIssuingCompany());
			ps.setString(7, product.getPublicationDate().toString());
			ps.setInt(8, product.getCoverType());
			ps.setString(9, product.getPublishingCompany());
			ps.setInt(10, product.getQuantity());
			ps.setDouble(11, product.getPrice());
			ps.setInt(12, product.getNumberPage());
			row = ps.executeUpdate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return row > 0;
	}

	@Override
	public boolean deleteProduct(String id) throws SQLException {
		String sql = "";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			row = ps.executeUpdate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row > 0;
	}

	@Override
	public List<Product> getListToTalProduct(int row) throws SQLException {
		String sql = "";
		Product product = null;
		List<Product> lstProduct = new ArrayList<Product>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, row);
			rs = ps.executeQuery();
			while (rs.next()) {
				product = new Product();
				product.setProductID(rs.getInt("ProductID"));
				product.setCategoryId(rs.getInt("CategoryId"));
				product.setProductName(rs.getString("ProductName"));
				product.setImage(rs.getString("Image"));
				product.setDescription(rs.getString("Description"));
				String cDate = rs.getString("CreatedDate");
				LocalDateTime createdDate = Validation.getLocalDateTime(cDate);
				product.setCreatedDate(createdDate);
				product.setIssuingCompany(rs.getString("IssuingCompany"));
				String pDate = rs.getString("PublicationDate");
				LocalDateTime publicationDate = Validation.getLocalDateTime(pDate);
				product.setPublicationDate(publicationDate);
				product.setCoverType(rs.getInt("CoverTypeId"));
				product.setPublishingCompany(rs.getString("PublishingCompany"));
				product.setQuantity(rs.getInt("Quantity"));
				product.setPrice(rs.getDouble("Price"));
				product.setNumberPage(rs.getInt("NumberPage"));
				lstProduct.add(product);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return lstProduct;
	}

	@Override
	public int countTotalProduct() throws SQLException {
		String sql = "";
		int count = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return count;
	}

}
