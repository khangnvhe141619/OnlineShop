package com.shop.model;

import java.time.LocalDateTime;

public class Subscriber {
	private String email;
	private LocalDateTime subscribeDate;

	public Subscriber() {
		// TODO Auto-generated constructor stub
	}

	public Subscriber(String email, LocalDateTime subscribeDate) {
		super();
		this.email = email;
		this.subscribeDate = subscribeDate;
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

	@Override
	public String toString() {
		return "Subscriber [email=" + email + ", subscribeDate=" + subscribeDate + "]";
	}

}
