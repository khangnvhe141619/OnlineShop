package com.shop.utils;

public class SQLCommand {

	public static final String LOGIN = "SELECT * FROM Account WHERE (Username LIKE ? OR Email LIKE ?) AND Password LIKE ?";
	
	public static final String GET_ACCOUNT_FROM_ACCOUNT = "SELECT * FROM Account WHERE Username like ?";
	
	public static final String GET_ACCOUNT_FROM_EMAIL = "SELECT * FROM Account WHERE Email LIKE ?";
	
	public static final String INSERT_ACCOUNT = "INSERT INTO Account(Username, Password, CreatedDate, Role, Active)\r\n"
			+ "VALUES(?,?,?,1,1)";
	
	public static final String LIST_ACCOUNT = "SELECT * FROM Account";
	
	public static final String UPDATE_ACCOUNT = "UPDATE Account SET Username = ?, FullName = ?, Email = ?, PhoneNumber = ?\r\n"
			+ "WHERE AccountID = ?\r\n";

}
