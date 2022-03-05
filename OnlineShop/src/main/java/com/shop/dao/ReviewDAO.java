package com.shop.dao;

import java.util.List;
import com.shop.model.Review;

public interface ReviewDAO {
	List<Review> getReviews(int productid);

	boolean addReview(int pId, int accId, String content, int rate, String creatdate);

	boolean editReview(Review review);

	boolean deleteReview(int reviewID);

	boolean isBought(int productid, int accid);
}
