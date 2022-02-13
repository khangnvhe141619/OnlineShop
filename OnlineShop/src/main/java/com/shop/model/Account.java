package com.shop.model;


public class Account {
	private int accountId;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private int gender;
	private String email;
	private String phonenumber;
	private String avatar;
	private int role;
	private int active;
	private String createedDate;

	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(int accountId, String username, String password, String firstname, String lastname, int gender,
			String email, String phonenumber, String avatar, int role, int active, String createedDate) {
		super();
		this.accountId = accountId;
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.gender = gender;
		this.email = email;
		this.phonenumber = phonenumber;
		this.avatar = avatar;
		this.role = role;
		this.active = active;
		this.createedDate = createedDate;
	}

	public Account(String username, String password, String email, String phonenumber) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phonenumber = phonenumber;
	}

	public Account(String username, String password, String email, String phonenumber, String createedDate) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phonenumber = phonenumber;
		this.createedDate = createedDate;
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

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
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

	public String getCreateedDate() {
		return createedDate;
	}

	public void setCreateedDate(String createedDate) {
		this.createedDate = createedDate;
	}
	
	

}
