/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//123
package com.shop.model;

/**
 *
 * @author leduc
 */
public class Coupon {
	private int stt;
    private String couponId;
    private String discountDesc;
    private int discountPercent;
    private int quantity;

    public Coupon() {
    }
   

	public Coupon(String discountDesc, int discountPercent, int quantity) {
		super();
		this.discountDesc = discountDesc;
		this.discountPercent = discountPercent;
		this.quantity = quantity;
	}



	public Coupon(String couponId, String discountDesc, int discountPercent, int quantity) {
		super();
		this.couponId = couponId;
		this.discountDesc = discountDesc;
		this.discountPercent = discountPercent;
		this.quantity = quantity;
	}



	public Coupon(int stt, String couponId, String discountDesc, int discountPercent, int quantity) {
		super();
		this.stt = stt;
		this.couponId = couponId;
		this.discountDesc = discountDesc;
		this.discountPercent = discountPercent;
		this.quantity = quantity;
	}



	public int getStt() {
		return stt;
	}



	public void setStt(int stt) {
		this.stt = stt;
	}



	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
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
