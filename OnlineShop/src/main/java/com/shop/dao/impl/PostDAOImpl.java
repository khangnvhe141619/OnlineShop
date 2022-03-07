package com.shop.dao.impl;

import com.shop.dao.PostDAO;
import com.shop.model.Post;
import com.shop.utils.DBConnection;
import com.shop.utils.Validation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leduc
 */
public class PostDAOImpl implements PostDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public List<Post> getAllPost(int row) throws SQLException {
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		String sql = "SELECT * FROM Post WHERE Active = 1 ORDER BY CreatedDate DESC "
				+ "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, row);

			rs = ps.executeQuery();
			while (rs.next()) {
				post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorName(rs.getString("Author"));
				post.setTitle(rs.getString("Title"));
				post.setShortDesc(rs.getString("ShortDesc"));
				post.setContent(rs.getString("Content"));
				post.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
				post.setActive(rs.getInt("Active"));
				list.add(post);
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

	public boolean insertPost(Post post) throws SQLException {
		int row = 0;
		String sql = "INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES (?, ?, ?, ?, ?, ?)";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, post.getAuthorName());
			ps.setString(2, post.getTitle());
			ps.setString(3, post.getShortDesc());
			ps.setString(4, post.getContent());
			ps.setString(5, Validation.getStringFromLocalDateTime(post.getCreatedDate()));
			ps.setInt(6, post.getActive());
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

	public boolean updatePost(Post post) throws SQLException {
		String sql = "UPDATE Post SET Author = ?, Title = ?, ShortDesc = ?, Content = ?, Active = ?\r\n" + "WHERE PostID=?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, post.getAuthorName());
			ps.setString(2, post.getTitle());
			ps.setString(3, post.getShortDesc());
			ps.setString(4, post.getContent());
			ps.setInt(5, post.getActive());
			ps.setInt(6, post.getPostId());
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

	public boolean deletePost(String postId) throws SQLException {
		String sql = "DELETE Post " + "WHERE PostID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, postId);
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
	public int countTotalPost() throws SQLException {
		String sql = "SELECT COUNT(*)\r\n" + " FROM Post WHERE Active = 1";
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
	public List<Post> getListPostByOption(String option, String txt, int row) throws SQLException {
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		String sql="SELECT p.PostID, p.Author, p.Title, p.ShortDesc, p.Content, p.CreatedDate FROM Post p";
		if (option.equals("title")) {
			sql += " WHERE p.Active = 1 AND p.Title LIKE ? ";
		} else if (option.equals("author")) {
			sql += " WHERE p.Active = 1 AND p.Author LIKE ? ";
		} else if (option.equals("tag")) {
			sql += "  , Tag t ,PostTag pt\r\n" + " WHERE p.Active = 1 AND p.PostID=pt.PostId AND t.TagID=pt.TagId AND\r\n"
					+ " t.TagName LIKE ?";
		}
		sql+=" ORDER BY PostID OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
		
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + txt + "%");
			ps.setInt(2, row);
						
			rs = ps.executeQuery();
			while (rs.next()) {
				post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorName(rs.getString("Author"));
				post.setTitle(rs.getString("Title"));
				post.setShortDesc(rs.getString("ShortDesc"));
				post.setContent(rs.getString("Content"));
				post.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
				list.add(post);
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

	@Override
	public Post getPostInformation(String id) throws SQLException {
		Post post = null;
		String sql = "SELECT * FROM Post \r\n" + "WHERE PostID LIKE ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			while (rs.next()) {
				post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorName(rs.getString("Author"));
				post.setTitle(rs.getString("Title"));
				post.setShortDesc(rs.getString("ShortDesc"));
				post.setContent(rs.getString("Content"));
				post.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
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
		return post;
	}

	@Override
	public int countPostByOption(String option, String txt) throws SQLException {
		int count = 0;
		String sql = "SELECT COUNT(*) FROM Post ";

		if (option.equals("title")) {
			sql += " WHERE Active = 1 AND Title LIKE ?";
		} else if (option.equals("author")) {
			sql += " WHERE Active = 1 AND Author LIKE ?";
		} else if (option.equals("tag")) {
			sql += "  p, Tag t ,PostTag pt\r\n" + " WHERE p.Active = 1 AND p.PostID=pt.PostId AND t.TagID=pt.TagId AND\r\n"
					+ " t.TagName LIKE ?";
		}
		try {

			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + txt + "%");
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
	public List<Post> getTop5HotPost() throws SQLException {
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		String sql = "SELECT TOP(5) *\r\n"
				+ "FROM Post\r\n"
				+ "WHERE Active = 1 ORDER BY CreatedDate DESC";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorName(rs.getString("Author"));
				post.setTitle(rs.getString("Title"));
				post.setShortDesc(rs.getString("ShortDesc"));
				post.setContent(rs.getString("Content"));
				post.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
				list.add(post);
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

	@Override
	public boolean blockOrUnBlockPost(int active, String id) throws SQLException {
		String sql = "UPDATE Post SET Active = ?\r\n" + "WHERE PostID = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, active);
			ps.setString(2, id);
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
	public List<Post> getAllBlockedPost(int row) throws Exception {
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		String sql = "SELECT * FROM Post WHERE Active = 0 ORDER BY CreatedDate DESC "
				+ "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, row);

			rs = ps.executeQuery();
			while (rs.next()) {
				post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorName(rs.getString("Author"));
				post.setTitle(rs.getString("Title"));
				post.setShortDesc(rs.getString("ShortDesc"));
				post.setContent(rs.getString("Content"));
				post.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
				post.setActive(rs.getInt("Active"));
				list.add(post);
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

	@Override
	public int countTotalBlockedPost() throws SQLException {
		String sql = "SELECT COUNT(*)\r\n" + " FROM Post WHERE Active = 0";
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