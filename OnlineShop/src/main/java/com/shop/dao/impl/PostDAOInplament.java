/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.dao.impl;

import com.shop.model.Post;
import com.shop.utils.DBConnection;
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
public class PostDAOInplament {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    public List<Post> getAllPost(){
        List<Post> list = new ArrayList<Post>();
		Post p= null;
		try {
			String sql="select * from Post";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);	
			rs=ps.executeQuery();
			while (rs.next()) {
				p = new Post();
				p.setPostId(rs.getInt("postId"));
				p.setAuthorId(rs.getInt("authorId"));
				p.setTittle(rs.getString("tittle"));
				p.setContent(rs.getString("content"));
				p.setCreatedDate(rs.getDate("createdDate"));
				
				list.add(p);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    }
    
    public boolean createPost(Post post){
        int row=0;
        try{
            String sql = "NSERT INTO [dbo].[Post]\n" +
"           ([AuthorId]\n" +
"           ,[Title]\n" +
"           ,[Content]\n" +
"           ,[CreatedDate])\n" +
"     VALUES\n" +
"           (?,?,?,?)";
            
            conn = DBConnection.getInstance().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,post.getAuthorId());
            ps.setString(2, post.getTittle());
            ps.setString(3, post.getContent());
            ps.setDate(4, post.getCreatedDate());
            row = ps.executeUpdate();
        }catch(Exception e){
        
        }
        return row>0;
    }
    public boolean editPost(Post post){
        int row=0;
        try {
			String sql = "Update Post SET Tittle=?, Content=?\r\n"
					+ "WHERE PostID=?";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setString(1, post.getTittle());
			ps.setString(2, post.getContent());
			ps.setInt(3, post.getPostId());
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    
        return row>0;
    }
    public boolean deletePost(int postId){
        int row=0;
        try {
			String sql = "Delete Post "
					+ "WHERE PostID=?";
			conn = DBConnection.getInstance().getConnection();
			ps= conn.prepareStatement(sql);;
			ps.setInt(3, postId);
			row = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return row>0;
    
    
    }
}
