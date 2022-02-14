package com.shop.dao.impl;

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

public class ProductDAOImpl implements ProductDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public Product getProductById(String id) throws SQLException {
		String sql = "SELECT * \r\n" + "FROM Product\r\n" + "WHERE ProductID = ?";
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
				product.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
				product.setIssuingCompany(rs.getString("IssuingCompany"));
				product.setPublicationDate(rs.getTimestamp("PublicationDate").toLocalDateTime());
				product.setCoverType(rs.getInt("CoverTypeId"));
				product.setPublishingCompany(rs.getString("PublishingCompany"));
				product.setQuantity(rs.getInt("Quantity"));
				product.setPrice(rs.getDouble("Price"));
				product.setNumberPage(rs.getInt("NumberPage"));
			}
		} catch (Exception e) {
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
		String sql = "INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, product.getCategoryId());
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getImage());
			ps.setString(4, product.getDescription());
			ps.setString(5, Validation.getStringFromLocalDateTime(product.getCreatedDate()));
			ps.setString(6, product.getIssuingCompany());
			ps.setString(7, Validation.getStringFromLocalDateTime(product.getPublicationDate()));
			ps.setInt(8, product.getCoverType());
			ps.setString(9, product.getPublishingCompany());
			ps.setInt(10, product.getQuantity());
			ps.setDouble(11, product.getPrice());
			ps.setInt(12, product.getNumberPage());
			row = ps.executeUpdate();
		} catch (Exception e) {
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
		String sql = "UPDATE Product\r\n"
				+ "SET [CategoryId] = ?, [ProductName] = ?, [Image] = ?, [Description] = ?, [CreatedDate] = ?,\r\n"
				+ "[IssuingCompany] = ?, [PublicationDate] = ?, [CoverTypeId] = ?,\r\n"
				+ "[PublishingCompany] = ?, [Quantity] = ?, [Price] = ?, [NumberPage] = ?\r\n"
				+ " WHERE ProductID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, product.getCategoryId());
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getImage());
			ps.setString(4, product.getDescription());
			ps.setString(5, Validation.getStringFromLocalDateTime(product.getCreatedDate()));
			ps.setString(6, product.getIssuingCompany());
			ps.setString(7, Validation.getStringFromLocalDateTime(product.getPublicationDate()));
			ps.setInt(8, product.getCoverType());
			ps.setString(9, product.getPublishingCompany());
			ps.setInt(10, product.getQuantity());
			ps.setDouble(11, product.getPrice());
			ps.setInt(12, product.getNumberPage());
			ps.setInt(13, product.getProductID());
			row = ps.executeUpdate();
		} catch (Exception e) {
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
		String sql = "DELETE FROM Product WHERE ProductID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row > 0;
	}

	@Override
	public List<Product> getListAllProduct(int row) throws SQLException {
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
				product.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
				product.setIssuingCompany(rs.getString("IssuingCompany"));
				product.setPublicationDate(rs.getTimestamp("PublicationDate").toLocalDateTime());
				product.setCoverType(rs.getInt("CoverTypeId"));
				product.setPublishingCompany(rs.getString("PublishingCompany"));
				product.setQuantity(rs.getInt("Quantity"));
				product.setPrice(rs.getDouble("Price"));
				product.setNumberPage(rs.getInt("NumberPage"));
				lstProduct.add(product);
			}
		} catch (Exception e) {
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
		String sql = "SELECT COUNT(*) FROM Product";
		int count = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
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
