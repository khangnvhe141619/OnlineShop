/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.model;

/**
 *
 * @author leduc
 */
public class PostTag {
    private int postId;
    private int tagId;

    public PostTag() {
    }

    public PostTag(int postId, int tagId) {
        this.postId = postId;
        this.tagId = tagId;
    }
    
}
