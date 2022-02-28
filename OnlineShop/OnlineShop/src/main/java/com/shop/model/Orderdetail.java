package com.shop.model;

public class Orderdetail {
	private int orderId;
	private int productId;
	private int quantity;
	public Orderdetail() {
		// TODO Auto-generated constructor stub
	}
	public Orderdetail(int orderId, int productId, int quantity) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.quantity = quantity;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Orderdetail [orderId=" + orderId + ", productId=" + productId + ", quantity=" + quantity + "]";
	}
	
}
