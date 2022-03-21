package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shop.dao.ProductDAO;
import com.shop.model.BookCover;
import com.shop.model.Product;
import com.shop.utils.DBConnection;
import com.shop.utils.Validation;

public class ProductDAOImpl implements ProductDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public Product getProductById(int id) throws SQLException {
		String sql = "SELECT * \r\n" + "FROM Product\r\n" + "WHERE ProductID = ?";
		Product product = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
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
				+ "[PublishingCompany] = ?, [Quantity] = ?, [Price] = ?, [NumberPage] = ?\r\n" + " WHERE ProductID = ?";
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
	public boolean deleteProduct(int id) throws SQLException {
		String sql = "DELETE FROM Product WHERE ProductID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row > 0;
	}

	@Override
	public List<Product> getListAllProduct(int index) throws SQLException {
		String sql = "SELECT * FROM PRODUCT\r\n" + "ORDER BY ProductID\r\n" + "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
		Product product = null;
		List<Product> lstProduct = new ArrayList<Product>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, (index - 1) * 3);

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
	public List<Product> getAllProduct() {
		String sql = "SELECT * FROM PRODUCT";
		Product product = null;
		List<Product> lstProduct = new ArrayList<Product>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
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
			e.printStackTrace();
		}
		return lstProduct;
	}

	@Override
	public int countProduct() throws SQLException {
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

	public static void main(String[] args) throws SQLException {
		ProductDAOImpl pd = new ProductDAOImpl();
		List<BookCover> ls = pd.getAllBookcover();
		for (BookCover product : ls) {
			System.out.println(product.toString());
		}
//		int c = pd.countSearch(1, null, 10000, 20000);
//			System.out.println(c);
	}

	public int countSearch(int cateid, String pname, int to, int end) throws SQLException {
		String sql = "SELECT COUNT(*)\r\n" + "FROM Product\r\n" + "WHERE 1=1  ";
		int paramCount = 0;
		HashMap<Integer, Object[]> params = new HashMap<>();
		if (cateid != -1) {
			sql += " AND CategoryId =?";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "INT";
			param[1] = cateid;
			params.put(paramCount, param);
		}
		if (pname != null && pname.trim().length() > 0) {
			sql += " AND ProductName like '%'+?+'%' ";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "STRING";
			param[1] = pname;
			params.put(paramCount, param);
		}
		if (to != -1) {
			sql += " AND Price between ? ";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "DATE";
			param[1] = to;
			params.put(paramCount, param);
		}
		if (end != -1) {
			sql += " AND ?";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "END";
			param[1] = end;
			params.put(paramCount, param);
		}
		int count = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
				Integer index = entry.getKey();
				Object[] value = entry.getValue();
				switch (value[0].toString()) {
				case "INT":
					ps.setInt(index, Integer.parseInt(value[1].toString()));
					break;
				case "STRING":
					ps.setString(index, value[1].toString());
					break;
				case "DATE":
					ps.setInt(index, Integer.parseInt(value[1].toString()));
					break;
				case "END":
					ps.setInt(index, Integer.parseInt(value[1].toString()));
					break;
				default:
					break;
				}
			}

			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("ngu");
		}

		return count;
	}

	@Override
	public List<Product> searchProduct(int index, int cateid, String pname, int to, int end) throws SQLException {
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT ROW_NUMBER() OVER (order by productID) AS stt ,* FROM Product\n" + "WHERE 1=1 ";
		int paramCount = 0;
		HashMap<Integer, Object[]> params = new HashMap<>();
		if (cateid != -1) {
			sql += " AND CategoryId =?";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "INT";
			param[1] = cateid;
			params.put(paramCount, param);
		}
		if (pname != null && pname.trim().length() > 0) {
			sql += " AND ProductName like '%'+?+'%'";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "STRING";
			param[1] = pname;
			params.put(paramCount, param);
		}
		if (to != -1) {
			sql += " AND Price between ? ";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "DATE";
			param[1] = to;
			params.put(paramCount, param);
		}
		if (end != -1) {
			sql += " AND ?";
			paramCount++;
			Object[] param = new Object[2];
			param[0] = "END";
			param[1] = end;
			params.put(paramCount, param);
		}
		sql = " WITH x AS (" + sql + ") SELECT * FROM x WHERE stt BETWEEN ? AND ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
				Integer i = entry.getKey();
				Object[] value = entry.getValue();
				switch (value[0].toString()) {
				case "INT":
					ps.setInt(i, Integer.parseInt(value[1].toString()));
					break;
				case "STRING":
					ps.setString(i, value[1].toString());
					break;
				case "DATE":
					ps.setInt(i, Integer.parseInt(value[1].toString()));
					break;
				case "END":
					ps.setInt(i, Integer.parseInt(value[1].toString()));
					break;
				default:
					break;
				}

			}
			ps.setInt(paramCount + 1, index * 3 - 2);
			ps.setInt(paramCount + 2, index * 3);

			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setStt(rs.getInt("stt"));
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
				list.add(product);
			}
		} catch (Exception e) {
			System.out.println("ngu");
		}

		return list;
	}

	public List<Product> getListProduct(int index) throws SQLException {
		String sql = "WITH x AS (SELECT ROW_NUMBER() OVER (order by [ProductID]) AS stt,p.ProductID,c.CategoryName,ProductName,p.CoverTypeId,Quantity,Price\r\n"
				+ "			FROM Product p JOIN Category c ON p.CategoryId=c.CategoryID)\r\n"
				+ "			SELECT *\r\n" + "			FROM x WHERE stt BETWEEN ?*5-4 AND ?*5";
		Product product = null;
		List<Product> lstProduct = new ArrayList<Product>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, index);

			rs = ps.executeQuery();
			while (rs.next()) {
				product = new Product();
				product.setStt(rs.getInt("stt"));
				product.setProductID(rs.getInt("ProductID"));
				product.setCateName(rs.getString("CategoryName"));
				product.setProductName(rs.getString("ProductName"));
				product.setCoverType(rs.getInt("CoverTypeId"));
				product.setQuantity(rs.getInt("Quantity"));
				product.setPrice(rs.getDouble("Price"));
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
	public boolean decreasedProduct(int amount, int id) throws SQLException {
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareCall("{Call procedure_decrease_product(?,?)}");

			ps.setInt(1, id);
			ps.setInt(2, amount);

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

	public List<BookCover> getAllBookcover() {
		List<BookCover> ls = new ArrayList<BookCover>();
		String sql = "SELECT * FROM BookCover";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				BookCover bk = new BookCover();
				bk.setBookCoverId(rs.getInt(1));
				bk.setBookCoverName(rs.getString(2));
				ls.add(bk);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ls;
	}
}
