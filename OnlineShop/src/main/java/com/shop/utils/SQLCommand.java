package com.shop.utils;

public class SQLCommand {

	public static final String login = "SELECT * FROM Account WHERE (Username LIKE ? OR Email LIKE ?) AND Password LIKE ?";
	
	public static final String checkUsername = "SELECT * FROM Account WHERE Username like ?";
	
	public static final String checkEmail = "SELECT * FROM Account WHERE Email LIKE ?";
	
	public static final String insertAccount = "INSERT INTO Account(Username, Password, Email, PhoneNumber, CreatedDate, Role, Active)\r\n"
			+ "VALUES(?,?,?,?,?,1,1)";
	
	public static final String listAccount = "SELECT * FROM Account";

}
