/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.model;

import java.time.LocalDateTime;

/**
 *
 * @author leduc
 */
public class Post {
	private int postId;
	private String authorName;
	private String title;
	private String shortDesc;
	private String content;
	private LocalDateTime createdDate;
	private int active;

	public Post() {
	}

	public Post(int postId, String authorName, String title, String shortDesc, String content,
			LocalDateTime createdDate, int active) {
		super();
		this.postId = postId;
		this.authorName = authorName;
		this.title = title;
		this.shortDesc = shortDesc;
		this.content = content;
		this.createdDate = createdDate;
		this.active = active;
	}

	
	public Post(String authorName, String title, String shortDesc, String content, LocalDateTime createdDate,
			int active) {
		super();
		this.authorName = authorName;
		this.title = title;
		this.shortDesc = shortDesc;
		this.content = content;
		this.createdDate = createdDate;
		this.active = 1;
	}



	public Post(int postId, String authorName, String title, String shortDesc, String content, int active) {
		super();
		this.postId = postId;
		this.authorName = authorName;
		this.title = title;
		this.shortDesc = shortDesc;
		this.content = content;
		this.active = active;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", authorName=" + authorName + ", title=" + title + ", shortDesc=" + shortDesc
				+ ", content=" + content + ", createdDate=" + createdDate + ", active=" + active + "]";
	}

}
