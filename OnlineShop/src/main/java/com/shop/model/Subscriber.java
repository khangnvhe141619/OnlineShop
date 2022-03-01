package com.shop.model;

import java.time.LocalDateTime;

public class Subscriber {
	private int id;
	private String fullName;
	private String email;
	private LocalDateTime subscribeDate;

	public Subscriber() {
		// TODO Auto-generated constructor stub
	}

	public Subscriber(int id, String fullName, String email, LocalDateTime subscribeDate) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.subscribeDate = subscribeDate;
	}

	public Subscriber(String fullName, String email, LocalDateTime subscribeDate) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.subscribeDate = subscribeDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDateTime getSubscribeDate() {
		return subscribeDate;
	}

	public void setSubscribeDate(LocalDateTime subscribeDate) {
		this.subscribeDate = subscribeDate;
	}

}
