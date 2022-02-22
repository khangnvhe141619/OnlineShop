/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.model;

import java.sql.Date;

/**
 *
 * @author leduc
 */
public class Post {
    private int postId;
    private int authorId;
    private String tittle;
    //private String shortDesc;
    private String content;
    private Date createdDate;    
    private String shortDesc = content.substring(0, 200) ;
    public Post() {
    }

    public Post(int authorId, String tittle, String shortDesc, String content, Date createdDate) {
        super();
        this.authorId = authorId;
        this.tittle = tittle;
        this.shortDesc = shortDesc;
        this.content = content;
        this.createdDate = createdDate;
    }
    
    
    public Post(int postId, int authorId, String tittle, String shortDesc, String content, Date createdDate) {
        super();
        this.postId = postId;
        this.authorId = authorId;
        this.tittle = tittle;
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

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Post{" + "postId=" + postId + ", authorId=" + authorId + ", tittle=" + tittle + ", shortDesc=" + shortDesc + ", content=" + content + ", createdDate=" + createdDate + '}';
    }
    
    
    
}
