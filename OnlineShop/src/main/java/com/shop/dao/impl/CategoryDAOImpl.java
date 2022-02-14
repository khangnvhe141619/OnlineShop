package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.CategoryDAO;
import com.shop.model.Category;
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

}
