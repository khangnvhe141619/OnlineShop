package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.CategoryDAO;
import com.shop.model.Category;
import com.shop.model.Product;
import com.shop.utils.DBConnection;

public class CategoryDAOImpl implements CategoryDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Category> getListAllCategory() throws SQLException {
		String sql = "SELECT * FROM Category";
		List<Category> lstCategory = new ArrayList<Category>();
		Category category = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				category = new Category();
				category.setCategoryID(rs.getInt("CategoryID"));
				category.setCategoryName(rs.getString("CategoryName"));
				lstCategory.add(category);
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
		return lstCategory;

	}

	@Override
	public Category getCategoryByID(String categoryId) throws SQLException {
		String sql = "SELECT * FROM Category WHERE CategoryID = ?";
		Category category = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, categoryId);
			rs = ps.executeQuery();
			if (rs.next()) {
				category = new Category();
				category.setCategoryID(rs.getInt(1));
				category.setCategoryName(rs.getString(2));				
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
		return category;

	}

	@Override
	public List<Product> getListProductByCategory(String categoryId) throws SQLException {
		String sql = "SELECT * FROM Product WHERE CategoryID = ?";
		Product product = null;
		List<Product> lstProduct = new ArrayList<Product>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, categoryId);
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
	public boolean insertCategory(Category category) throws SQLException {
		String sql = "INSERT [dbo].[Category] ([CategoryName]) "
				+ "VALUES (?)";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			
			ps.setString(1, category.getCategoryName());	
			
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

	public List<Category> getListCategory(int index) throws SQLException {
		String sql = "SELECT ROW_NUMBER() over (order by CategoryID) as stt, * FROM Category \r\n"
				+ "ORDER BY CategoryID\r\n"
				+ "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
		Category ca = null;
		List<Category> lsCa = new ArrayList<Category>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, (index - 1) * 3);

			rs = ps.executeQuery();
			while (rs.next()) {
				ca = new Category();
				ca.setStt(rs.getInt("stt"));
				ca.setCategoryID(rs.getInt("CategoryID"));
				ca.setCategoryName(rs.getString("CategoryName"));
				lsCa.add(ca);
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
		return lsCa;
	}
	public int countCa() throws SQLException {
		String sql = "SELECT COUNT(*) FROM Category \r\n"
				+ "";
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
	@Override
	public boolean updateCategory(Category category) throws SQLException {
		String sql = "UPDATE Category\r\n"
				+ "SET [CategoryName] = ?\r\n"
				+ " WHERE CategoryID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, category.getCategoryName());
			ps.setInt(2, category.getCategoryID());			
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
	public boolean deleteCategory(int categoryId) throws SQLException {
		String sql = "DELETE FROM Category WHERE CategoryID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, categoryId);
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row > 0;
	}
	
    public static void main(String[] args) throws SQLException {
    	CategoryDAOImpl ca = new CategoryDAOImpl();
    	List<Category> ls= ca.getListCategory(1);
    	for (Category category : ls) {
			System.out.println(category.toString());
		}
    }
}
