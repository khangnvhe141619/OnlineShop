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
public class Coupon {
    private int couponId;
    private String discountDesc;
    private int discountPercent;
    private int quantity;

    public Coupon() {
    }

    public Coupon(int couponId, String discountDesc, int discountPercent, int quantity) {
        this.couponId = couponId;
        this.discountDesc = discountDesc;
        this.discountPercent = discountPercent;
        this.quantity = quantity;
    }

	public int getCouponId() {
		return couponId;
	}

	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}

	public String getDiscountDesc() {
		return discountDesc;
	}

	public void setDiscountDesc(String discountDesc) {
		this.discountDesc = discountDesc;
	}

	public int getDiscountPercent() {
		return discountPercent;
	}

	public void setDiscountPercent(int discountPercent) {
		this.discountPercent = discountPercent;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Coupon [couponId=" + couponId + ", discountDesc=" + discountDesc + ", discountPercent="
				+ discountPercent + ", quantity=" + quantity + "]";
	}
    
}