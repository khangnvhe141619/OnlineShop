package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.dao.SubscriberDAO;
import com.shop.model.Subscriber;
import com.shop.utils.DBConnection;
import com.shop.utils.Validation;

public class SubscriberDAOImpl implements SubscriberDAO{
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public boolean insertSubscriber(Subscriber subscriber) throws SQLException{
		String sql = "INSERT [dbo].[Subscriber] ([FullName], [Email], [SubscribeDate]) VALUES (?, ?, ?)";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, subscriber.getFullName());
			ps.setString(2, subscriber.getEmail());
			ps.setString(3, Validation.getStringFromLocalDateTime(subscriber.getSubscribeDate()));
			
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
        
    }
}
