package com.shop.model;

import java.time.LocalDate;

public class PostCmt {
	private int postCmtId;
	private int postId;
	private int accId;
	private String comment;
	private LocalDate createDate;
	public PostCmt() {
		// TODO Auto-generated constructor stub
	}
	
	public PostCmt(int postCmtId, int postId, int accId, String comment, LocalDate createDate) {
		super();
		this.postCmtId = postCmtId;
		this.postId = postId;
		this.accId = accId;
		this.comment = comment;
		this.createDate = createDate;
	}

	public int getPostCmtId() {
		return postCmtId;
	}
	public void setPostCmtId(int postCmtId) {
		this.postCmtId = postCmtId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getAccId() {
		return accId;
	}
	public void setAccId(int accId) {
		this.accId = accId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public LocalDate getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "PostCmt [postCmtId=" + postCmtId + ", postId=" + postId + ", accId=" + accId + ", comment=" + comment
				+ ", createDate=" + createDate + "]";
	}
	
}
