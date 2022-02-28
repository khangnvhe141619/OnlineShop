package com.shop.model;

import java.sql.Date;
import java.time.LocalDate;

public class Order {
	private int orderId;
	private int shipId;
	private int accountId;
	private LocalDate orderDate;
	private LocalDate EstimateDelivery;
	private Double total;
	private int statusId;

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderId, int shipId, int accountId, LocalDate orderDate, LocalDate estimateDelivery, Double total,
			int statusId) {
		super();
		this.orderId = orderId;
		this.shipId = shipId;
		this.accountId = accountId;
		this.orderDate = orderDate;
		EstimateDelivery = estimateDelivery;
		this.total = total;
		this.statusId = statusId;
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

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public LocalDate getEstimateDelivery() {
		return EstimateDelivery;
	}

	public void setEstimateDelivery(LocalDate estimateDelivery) {
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

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", shipId=" + shipId + ", accountId=" + accountId + ", orderDate="
				+ orderDate + ", EstimateDelivery=" + EstimateDelivery + ", total=" + total + ", statusId=" + statusId
				+ "]";
	}
	


}
