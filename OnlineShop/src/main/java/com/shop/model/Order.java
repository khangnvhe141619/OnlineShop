package com.shop.model;


public class Order {
	private int orderId;
	private int shipId;
	private int accountId;
	private String orderDate;
	private String receiptDate;
	private Double total;
	private int statusId;

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderId, int shipId, int accountId, String orderDate, Double total, int statusId) {
		super();
		this.orderId = orderId;
		this.shipId = shipId;
		this.accountId = accountId;
		this.orderDate = orderDate;
		this.total = total;
		this.statusId = statusId;
	}
	
	public Order(int shipId, int accountId, String orderDate, Double total, int statusId) {
		super();
		this.shipId = shipId;
		this.accountId = accountId;
		this.orderDate = orderDate;
		this.total = total;
		this.statusId = statusId;
	}	
	
	public Order(int shipId, int accountId, String orderDate, String receiptDate, Double total, int statusId) {
		super();
		this.shipId = shipId;
		this.accountId = accountId;
		this.orderDate = orderDate;
		this.receiptDate = receiptDate;
		this.total = total;
		this.statusId = statusId;
	}

	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
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

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", shipId=" + shipId + ", accountId=" + accountId + ", orderDate="
				+ orderDate + ", total=" + total + ", statusId=" + statusId + "]";
	}
	
	
	


}
