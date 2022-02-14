package com.shop.model;

import java.sql.Date;

public class Review {
	private int reviewid;
	private int productid;
	private int accountid;
	private String content;
	private int ratings;
	private Date createdate;
	public Review() {
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewid, int productid, int accountid, String content, int ratings, Date createdate) {
		super();
		this.reviewid = reviewid;
		this.productid = productid;
		this.accountid = accountid;
		this.content = content;
		this.ratings = ratings;
		this.createdate = createdate;
	}
	
	public Review(int productid, int accountid, String content, int ratings, Date createdate) {
		super();
		this.productid = productid;
		this.accountid = accountid;
		this.content = content;
		this.ratings = ratings;
		this.createdate = createdate;
	}
	
	public Review(int reviewid, String content, int ratings, Date createdate) {
		super();
		this.reviewid = reviewid;
		this.content = content;
		this.ratings = ratings;
		this.createdate = createdate;
	}
	public int getReviewid() {
		return reviewid;
	}
	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getAccountid() {
		return accountid;
	}
	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRatings() {
		return ratings;
	}
	public void setRatings(int ratings) {
		this.ratings = ratings;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	@Override
	public String toString() {
		return "Review [reviewid=" + reviewid + ", productid=" + productid + ", accountid=" + accountid + ", content="
				+ content + ", ratings=" + ratings + ", createdate=" + createdate + "]";
	}
	
}
