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
public class Discount {
    private int discountId;
    private String discountDesc;
    private int discountPercent;
    private int quantity;

    public Discount() {
    }

    public Discount(int discountId, String discountDesc, int discountPercent, int quantity) {
        this.discountId = discountId;
        this.discountDesc = discountDesc;
        this.discountPercent = discountPercent;
        this.quantity = quantity;
    }
    
}
