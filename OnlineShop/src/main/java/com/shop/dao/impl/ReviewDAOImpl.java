package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.shop.dao.ReviewDAO;
import com.shop.model.Account;
import com.shop.model.Review;
import com.shop.utils.DBConnection;


public  class ReviewDAOImpl implements ReviewDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public boolean isBought(int productid, int accid) {
        try {
            String sql = "select * from OrderDetail as od, [Order] as o \n"
            		+ " where o.orderid = od.orderid and productid = ? and o.AccountId = ?";
            conn = DBConnection.getInstance().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productid);
            ps.setInt(2, accid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ReviewDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
//commit
	public List<Review> getReviews(int productid) {
		List<Review> list = new ArrayList<Review>();
		Review rv= null;
		try {
			String sql="select *\n"
					+ "from Review as r, Account as a					\n"
					+ "where r.AccountId = a.AccountID and productid = ?";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setInt(1,productid);
			rs=ps.executeQuery();
			while (rs.next()) {
				rv= new Review();
				rv.setReviewid(rs.getInt("ReviewID"));
				rv.setProductid(rs.getInt("ProductId"));
				Account acc = new Account();
				acc.setUsername(rs.getString("Username"));
				acc.setAvatar(rs.getString("Avatar"));
				rv.setAccount(acc);
				rv.setContent(rs.getString("Content"));
				rv.setRatings(rs.getInt("Ratings"));
				rv.setCreatedate(rs.getString("CreatedDate"));
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
//		Account a = new Account();
//		a= a.getAccountId("");
//		try {
//			Review a1= new Review(1, a, "abc", 1, date);
//			boolean kq = rv.editReview(a1);
//			if(kq==true) {
//				System.out.println("sccc");
//			}else {
//				System.err.println("failes");
//			}
//				
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		List<Review> ls = rv.getReviews(1);
//		for (Review review : ls) {
//			System.out.println(review.toString());
//		}
//		LocalDate localDate = java.time.LocalDate.now();
//	     String date = localDate.toString();
//	   
//		Boolean kq= rv.addReview(1, 1, "aaaa", 2, date);
//			if(kq==true) {
//		System.out.println("sccc");
//			}else {
//			System.err.println("failes");
//		}
		boolean kq = rv.isBought(1, 2);
		if(kq==true) {
			System.out.println("ok");
		}else {
			System.out.println("fa");
		}
	}

	public boolean addReview(int pId,int accId, String content,int rate,String creatdate) {
		int row=0;
		try {
			String sql = "INSERT INTO Review (ProductId,AccountId,Content,Ratings,CreatedDate)\r\n"
					+ "VALUES(?,?,?,?,?)";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setInt(1,pId);
			
			ps.setInt(2, accId);
			ps.setString(3, content);
			ps.setInt(4, rate);
			ps.setString(5,creatdate);
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
			ps.setString(3, review.getCreatedate());
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
					+ "WHERE ReviewID=?";
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
