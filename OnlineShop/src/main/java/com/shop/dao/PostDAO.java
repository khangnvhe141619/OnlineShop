package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Post;

public interface PostDAO {
	public List<Post> getAllPost(int row) throws Exception;

	public boolean insertPost(Post post) throws SQLException;

	public boolean updatePost(Post post) throws SQLException;

	public boolean deletePost(int postId) throws SQLException;
}
