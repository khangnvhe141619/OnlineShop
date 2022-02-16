package com.shop.dao;

import java.util.List;
import com.shop.model.Review;


public interface ReviewDAO  {
	List<Review> getReviews(int productid);
	boolean addReview(Review review);
	boolean editReview(Review review);
	boolean deleteReview(int reviewID);
} 
