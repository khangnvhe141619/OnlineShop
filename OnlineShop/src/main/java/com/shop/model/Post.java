/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.model;

import java.sql.Date;
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
    
    public Post() {
    }

	public Post(int postId, String authorName, String title, String shortDesc, String content, LocalDateTime createdDate) {
		super();
		this.postId = postId;
		this.authorName = authorName;
		this.title = title;
		this.shortDesc = shortDesc;
		this.content = content;
		this.createdDate = createdDate;
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

	public String getTittle() {
		return title;
	}

	public void setTittle(String tittle) {
		this.title = tittle;
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

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", authorName=" + authorName + ", title=" + title + ", shortDesc="
				+ shortDesc + ", content=" + content + ", createdDate=" + createdDate + "]";
	}
}
