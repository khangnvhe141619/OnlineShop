package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Post;

public interface PostDAO {
	public List<Post> getAllPost() throws Exception;
	public boolean createPost(Post post) throws SQLException;
	public boolean editPost(Post post) throws SQLException;
	public boolean deletePost(int postId) throws SQLException;
}
