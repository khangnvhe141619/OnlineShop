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
public class Offer {
    private int productId;
    private int discountId;

    public Offer() {
    }

    public Offer(int productId, int discountId) {
        this.productId = productId;
        this.discountId = discountId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    @Override
    public String toString() {
        return "Offer{" + "productId=" + productId + ", discountId=" + discountId + '}';
    }
    
    
}
