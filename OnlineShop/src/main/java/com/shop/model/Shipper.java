package com.shop.model;

public class Shipper {
	private int shipperID;
	private String shipperName;
	private String email;
	private String phone;
	
	public Shipper() {
		// TODO Auto-generated constructor stub
	}

	public Shipper(int shipperID, String shipperName, String email, String phone) {
		super();
		this.shipperID = shipperID;
		this.shipperName = shipperName;
		this.email = email;
		this.phone = phone;
	}

	public Shipper(String shipperName, String email, String phone) {
		super();
		this.shipperName = shipperName;
		this.email = email;
		this.phone = phone;
	}

	public int getShipperID() {
		return shipperID;
	}

	public void setShipperID(int shipperID) {
		this.shipperID = shipperID;
	}

	public String getShipperName() {
		return shipperName;
	}

	public void setShipperName(String shipperName) {
		this.shipperName = shipperName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Shipper [shipperID=" + shipperID + ", shipperName=" + shipperName + ", email=" + email + ", phone="
				+ phone + "]";
	}
}
