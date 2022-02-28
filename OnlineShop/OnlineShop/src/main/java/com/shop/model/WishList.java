package com.shop.model;

public class WishList {
	private int accId;
	private int productId;
	public WishList() {
		// TODO Auto-generated constructor stub
	}
	public WishList(int accId, int productId) {
		super();
		this.accId = accId;
		this.productId = productId;
	}
	public int getAccId() {
		return accId;
	}
	public void setAccId(int accId) {
		this.accId = accId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "WishList [accId=" + accId + ", productId=" + productId + "]";
	}
	
}
