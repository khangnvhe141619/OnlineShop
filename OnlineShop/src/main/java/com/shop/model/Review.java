package com.shop.model;

public class Review {
	private int reviewid;
	private int productid;
	private Account account;
	private String content;
	private int ratings;
	private String createdate;
	public Review() {
		// TODO Auto-generated constructor stub 123
	}
	
	public Review(int reviewid, int productid, Account account, String content, int ratings, String createdate) {
		super();
		this.reviewid = reviewid;
		this.productid = productid;
		this.account = account;
		this.content = content;
		this.ratings = ratings;
		this.createdate = createdate;
	}

	public Review(int productid, Account account, String content, int ratings, String createdate) {
		super();
		this.productid = productid;
		this.account = account;
		this.content = content;
		this.ratings = ratings;
		this.createdate = createdate;
	}



	public Account getAccount() {
		return account;
	}



	public void setAccount(Account account) {
		this.account = account;
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
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}



	@Override
	public String toString() {
		return "Review [reviewid=" + reviewid + ", productid=" + productid + ", account=" + account + ", content="
				+ content + ", ratings=" + ratings + ", createdate=" + createdate + "]";
	}
	
	
}
