package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.ReviewDAO;
import com.shop.model.Review;
import com.shop.utils.DBConnection;


public  class ReviewDAOImpl implements ReviewDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public List<Review> getReviews(int productid) {
		List<Review> list = new ArrayList<Review>();
		Review rv= null;
		try {
			String sql="select r.ReviewID,r.ProductId,r.AccountId,r.Content,r.Ratings,r.CreatedDate from Review as r, Account as a\r\n"
					+ "where r.AccountId = a.AccountID and productid = ?";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setInt(1,productid);
			rs=ps.executeQuery();
			while (rs.next()) {
				rv= new Review();
				rv.setReviewid(rs.getInt("ReviewID"));
				rv.setProductid(rs.getInt("ProductId"));
				rv.setAccountid(rs.getInt("AccountId"));
				rv.setContent(rs.getString("Content"));
				rv.setRatings(rs.getInt("Ratings"));
				rv.setCreatedate(rs.getDate("CreatedDate"));
				list.add(rv);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args)  {
		ReviewDAOImpl rv = new ReviewDAOImpl();
//		String str= "2017-1-1";
//		Date date = Date.valueOf(str);
//		try {
//			Review a= new Review(1, "cho", 5, date);
//			boolean kq = rv.editReview(a);
//			if(kq==true) {
//				System.out.println("sccc");
//			}else {
//				System.err.println("failes");
//			}
//				
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		List<Review> ls = rv.getReviews(1);
		for (Review review : ls) {
			System.out.println(review.toString());
		}
		
	}

	public boolean addReview(Review review) {
		int row=0;
		try {
			String sql = "INSERT INTO Review (ProductId,AccountId,Content,Ratings,CreatedDate)\r\n"
					+ "VALUES(?,?,?,?,?)";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setInt(1,review.getProductid());
			ps.setInt(2, review.getAccountid());
			ps.setString(3, review.getContent());
			ps.setInt(4, review.getRatings());
			ps.setDate(5, review.getCreatedate());
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row>0;
	}

	@Override
	public boolean editReview(Review review) {
		int row=0;
		try {
			String sql = "Update Review SET Content=?, Ratings=?,CreatedDate=?\r\n"
					+ "WHERE ReviewID=?";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setString(1, review.getContent());
			ps.setInt(2, review.getRatings());
			ps.setDate(3, review.getCreatedate());
			ps.setInt(4, review.getReviewid());
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row>0;
	}

	@Override
	public boolean deleteReview(int reviewid) {
		int row=0;
		try {
			String sql = "DELETE Review\r\n"
					+ "WHERE ReviewID=? ";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setInt(1, reviewid);
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row>0;
	}

}
