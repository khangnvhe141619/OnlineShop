package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.TagDAO;
import com.shop.model.Tag;
import com.shop.utils.DBConnection;

public class TagDAOImpl implements TagDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Tag> getAllTag() throws SQLException {
		List<Tag> list = new ArrayList<Tag>();
		Tag tag = null;
		String sql = "SELECT TOP(5) * FROM Tag";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();
			while (rs.next()) {
				tag = new Tag();
				tag.setTagId(rs.getInt("TagID"));
				tag.setTagName(rs.getString("TagName"));
				list.add(tag);
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
		return list;
	}

}
