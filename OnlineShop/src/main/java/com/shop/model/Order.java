package com.shop.model;

import java.sql.Date;

public class Order {
	private int orderId;
	private int shipId;
	private int accountId;
	private Date orderDate;
	private Date EstimateDelivery;
	private Double total;
	private int statusId;
	private int productId;
	private int quantity;
	public Order() {
		// TODO Auto-generated constructor stub
	}
	


	public Order(int orderId, int accountId, Double total, int productId, int quantity) {
		super();
		this.orderId = orderId;
		this.accountId = accountId;
		this.total = total;
		this.productId = productId;
		this.quantity = quantity;
	}



	public Order(int orderId, int shipId, int accountId, Date orderDate, Date estimateDelivery, Double total,
			int statusId, int productId, int quantity) {
		super();
		this.orderId = orderId;
		this.shipId = shipId;
		this.accountId = accountId;
		this.orderDate = orderDate;
		EstimateDelivery = estimateDelivery;
		this.total = total;
		this.statusId = statusId;
		this.productId = productId;
		this.quantity = quantity;
	}



	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getShipId() {
		return shipId;
	}
	public void setShipId(int shipId) {
		this.shipId = shipId;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getEstimateDelivery() {
		return EstimateDelivery;
	}
	public void setEstimateDelivery(Date estimateDelivery) {
		EstimateDelivery = estimateDelivery;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
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
		return "Order [orderId=" + orderId + ", shipId=" + shipId + ", accountId=" + accountId + ", orderDate="
				+ orderDate + ", EstimateDelivery=" + EstimateDelivery + ", total=" + total + ", statusId=" + statusId
				+ ", productId=" + productId + ", quantity=" + quantity + "]";
	}

}
