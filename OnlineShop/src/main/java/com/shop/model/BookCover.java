/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.model;
//123
/**
 *
 * @author leduc
 */
public class BookCover {
    private int bookCoverId;
    private String bookCoverName;

    public BookCover() {
    }

    public BookCover(int bookCoverId, String bookCoverName) {
        this.bookCoverId = bookCoverId;
        this.bookCoverName = bookCoverName;
    }

    public int getBookCoverId() {
        return bookCoverId;
    }

    public void setBookCoverId(int bookCoverId) {
        this.bookCoverId = bookCoverId;
    }

    public String getBookCoverName() {
        return bookCoverName;
    }

    public void setBookCoverName(String bookCoverName) {
        this.bookCoverName = bookCoverName;
    }

    @Override
    public String toString() {
        return "BookCover{" + "bookCoverId=" + bookCoverId + ", bookCoverName=" + bookCoverName + '}';
    }
    
}
