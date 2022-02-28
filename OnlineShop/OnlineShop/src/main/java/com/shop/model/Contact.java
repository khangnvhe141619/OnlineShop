package com.shop.model;


public class Contact {
	private String email;
	private String phone;
	private String address;

	public Contact() {
		// TODO Auto-generated constructor stub
	}

	public Contact(String email, String phone, String address){
		super();
		this.email = email;
		this.phone = phone;
		this.address = address;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Contact [email=" + email + ", phone=" + phone + ", address=" + address + "]";
	}

}
