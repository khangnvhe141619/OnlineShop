package com.shop.model;

import java.time.LocalDateTime;

public class PostCmt {
	private int postCmtId;
	private int postId;
	private Account account;
	private int accountId;
	private String comment;
	private LocalDateTime createDate;

	public PostCmt() {
		// TODO Auto-generated constructor stub
	}

	public PostCmt(int postCmtId, int postId, Account account, String comment, LocalDateTime createDate) {
		super();
		this.postCmtId = postCmtId;
		this.postId = postId;
		this.account = account;
		this.comment = comment;
		this.createDate = createDate;
	}

	public PostCmt(int postId, int accountId, String comment, LocalDateTime createDate) {
		super();
		this.postId = postId;
		this.accountId = accountId;
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

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "PostCmt [postCmtId=" + postCmtId + ", postId=" + postId + ", account=" + account + ", comment="
				+ comment + ", createDate=" + createDate + "]";
	}	

}
