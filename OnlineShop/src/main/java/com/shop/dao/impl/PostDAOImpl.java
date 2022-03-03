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

	public List<Post> getAllPost(int row) throws SQLException{
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		String sql="SELECT * FROM Post \r\n"
				+ "ORDER BY PostID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, row);

			rs = ps.executeQuery();
			while (rs.next()) {
				post=new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorName(rs.getString("Author"));
				post.setTittle(rs.getString("Title"));
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
		return list;
	}

	public boolean insertPost(Post post) throws SQLException {
		int row = 0;
		String sql = "INSERT INTO [dbo].[Post]\n" + "           ([Author]\n" + "           ,[Title]\n"
				+ "           ,[ShortDesc]\n" + "           ,[Content]\n" + "           ,[CreatedDate])\n"
				+ "     VALUES\n" + "           (?,?,?,?,?)";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, post.getAuthorName());
			ps.setString(2, post.getTittle());
			ps.setString(3, post.getShortDesc());
			ps.setString(4, post.getContent());
			ps.setString(5, Validation.getStringFromLocalDateTime(post.getCreatedDate()));
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
		String sql = "UPDATE Post SET Author=?, Title=?, ShortDesc=?, Content=?\r\n" + "WHERE PostID=?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, post.getAuthorName());
			ps.setString(2, post.getTittle());
			ps.setString(3, post.getShortDesc());
			ps.setString(4, post.getContent());
			ps.setInt(5, post.getPostId());
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

	public boolean deletePost(int postId) throws SQLException {
		String sql = "DELETE Post " + "WHERE PostID=?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, postId);
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
	public static void main(String[] args) {
		PostDAO pstDao=new PostDAOImpl();
		List<Post> pst;
		try {
			pst = pstDao.getAllPost(1);
			pst.forEach(st->{
				System.out.println(st);
			});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}