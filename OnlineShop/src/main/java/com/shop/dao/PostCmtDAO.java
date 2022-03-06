package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.PostCmt;

public interface PostCmtDAO {
	public List<PostCmt> getListCmtByPostID(String id) throws SQLException;
	
	public int countTotalCommentByPostID(String id) throws SQLException;
	
	public boolean addCommentToPost(PostCmt postCmt) throws SQLException;
}
