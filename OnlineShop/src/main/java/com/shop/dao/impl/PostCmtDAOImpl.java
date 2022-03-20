package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.PostCmtDAO;
import com.shop.model.Account;
import com.shop.model.PostCmt;
import com.shop.utils.DBConnection;
import com.shop.utils.Validation;

public class PostCmtDAOImpl implements PostCmtDAO {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public List<PostCmt> getListCmtByPostID(String id) throws SQLException {
		PostCmt pCmt = null;
		List<PostCmt> lstPostCmt = new ArrayList<PostCmt>();
		
		String sql="SELECT pcmt.PostCommentID, pcmt.PostId,a.Username, a.Avatar, pcmt.Comment, pcmt.CreatedDate\r\n"
				+ "FROM Post p, PostComment pcmt, Account a\r\n"
				+ "WHERE pcmt.PostId = p.PostID\r\n"
				+ "AND pcmt.AccountId = a.AccountID\r\n"
				+ "AND p.PostID = ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				pCmt = new PostCmt();
				pCmt.setPostCmtId(rs.getInt("PostCommentID"));
				pCmt.setPostId(rs.getInt("PostId"));
				Account acc = new Account();
				acc.setUsername(rs.getString("Username"));
				acc.setAvatar(rs.getString("Avatar"));
				pCmt.setAccount(acc);
				pCmt.setComment(rs.getString("Comment"));
				pCmt.setCreateDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
				lstPostCmt.add(pCmt);
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
		return lstPostCmt;
	}

	@Override
	public int countTotalCommentByPostID(String id) throws SQLException {
		String sql = "SELECT COUNT(*)\r\n" + "FROM Post p, PostComment pcmt\r\n" + "WHERE pcmt.PostId = p.PostID \r\n"
				+ "AND p.PostID = ?";
		int count = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
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
	public boolean addCommentToPost(PostCmt postCmt) throws SQLException {
		int row = 0;
		String sql = "INSERT [dbo].[PostComment] ([PostId], [AccountId], [Comment], [CreatedDate]) VALUES (?, ?, ?, ?)";
		try {

			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, postCmt.getPostId());
			ps.setInt(2, postCmt.getAccountId());
			ps.setString(3, postCmt.getComment());
			ps.setString(4, Validation.getStringFromLocalDateTime(postCmt.getCreateDate()));
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row > 0;
	}

}
