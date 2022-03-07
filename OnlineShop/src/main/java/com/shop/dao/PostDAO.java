package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Post;

public interface PostDAO {
	
	public Post getPostInformation(String id) throws SQLException;
	
	public boolean insertPost(Post post) throws SQLException;

	public boolean updatePost(Post post) throws SQLException;

	public boolean deletePost(String postId) throws SQLException;
	
	public boolean blockOrUnBlockPost(int active, String id) throws SQLException;
	
	public List<Post> getAllPost(int row) throws Exception;
	
	public int countTotalPost() throws SQLException;
	
	public List<Post> getListPostByOption(String option, String txt, int row) throws SQLException;
	
	public int countPostByOption(String option, String txt) throws SQLException;
	
	public List<Post> getTop5HotPost() throws SQLException;
	
	public List<Post> getAllBlockedPost(int row) throws Exception;
	
	public int countTotalBlockedPost() throws SQLException;
}
