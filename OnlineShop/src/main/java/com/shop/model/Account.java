package com.shop.model;


public class Account {
	private int accountId;
	private String username;
	private String password;
	private String fullname;
	private int gender;
	private String email;
	private String phonenumber;
	private String avatar;
	private int role;
	private int active;
	private String createdDate;
//123
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(int accountId, String username, String password, String fullname, int gender, String email,
			String phonenumber, String avatar, int role, int active, String createdDate) {
		super();
		this.accountId = accountId;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.gender = gender;
		this.email = email;
		this.phonenumber = phonenumber;
		this.avatar = avatar;
		this.role = role;
		this.active = active;
		this.createdDate = createdDate;
	}

	public Account(String username, String password, String createdDate) {
		super();
		this.username = username;
		this.password = password;
		this.createdDate = createdDate;
	}
	
	public Account(int accountId, String username, String fullname, String email) {
		super();
		this.accountId = accountId;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
	}

	public Account(int accountId, String username, String fullname, String email, String phonenumber, String avatar) {
		super();
		this.accountId = accountId;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.avatar = avatar;
	}
	
	

	public Account(int accountId, String username, String fullname, String email, String phonenumber) {
		super();
		this.accountId = accountId;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
	}

	public Account(int accountId, String password) {
		super();
		this.accountId = accountId;
		this.password = password;
	}

	public Account(int accountId, String username, String password) {
		super();
		this.accountId = accountId;
		this.username = username;
		this.password = password;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", username=" + username + ", password=" + password + ", fullname="
				+ fullname + ", gender=" + gender + ", email=" + email + ", phonenumber=" + phonenumber + ", avatar="
				+ avatar + ", role=" + role + ", active=" + active + ", createdDate=" + createdDate + "]";
	}
	
	
}
