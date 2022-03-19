package com.shop.model;


public class OrderAdmin {
	private int stt;
	private String shipper;
	private String customer;
	private String orderDate;
	private String receiptDate;
	private Double total;
	private String status;
	private int orderId;
	
	public OrderAdmin() {
		// TODO Auto-generated constructor stub
	}

	public OrderAdmin(int stt, String shipper, String customer, String orderDate, Double total, String status,
			int orderId) {
		super();
		this.stt = stt;
		this.shipper = shipper;
		this.customer = customer;
		this.orderDate = orderDate;
		this.total = total;
		this.status = status;
		this.orderId = orderId;
	}
	
	

	public OrderAdmin(String shipper, String customer, String orderDate, Double total, String status, int orderId) {
		super();
		this.shipper = shipper;
		this.customer = customer;
		this.orderDate = orderDate;
		this.total = total;
		this.status = status;
		this.orderId = orderId;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public String getShipper() {
		return shipper;
	}

	public void setShipper(String shipper) {
		this.shipper = shipper;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}

	@Override
	public String toString() {
		return "OrderAdmin [stt=" + stt + ", shipper=" + shipper + ", customer=" + customer + ", orderDate=" + orderDate
				+ ", receiptDate=" + receiptDate + ", total=" + total + ", status=" + status + ", orderId=" + orderId
				+ "]";
	}
}
