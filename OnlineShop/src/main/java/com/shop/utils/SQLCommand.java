package com.shop.utils;

public class SQLCommand {

	public static final String LOGIN = "SELECT * FROM Account WHERE (Username LIKE ? OR Email LIKE ?) AND Password LIKE ?";
	
	public static final String GET_ACCOUNT_FROM_USERNAME = "SELECT * FROM Account WHERE Username like ?";
	
	public static final String GET_ACCOUNT_FROM_ACCOUNTID = "SELECT * FROM Account WHERE AccountID like ?";
	
	public static final String GET_ACCOUNT_FROM_ID = "SELECT * FROM Account WHERE AccountID like ?";
	
	public static final String GET_ACCOUNT_FROM_EMAIL = "SELECT * FROM Account WHERE Email LIKE ?";
	
	public static final String GET_CHANGE_PASSWORD = "UPDATE Account SET Password = ? WHERE AccountID = ?";
	
	public static final String GET_BLOCK_ACCOUNT = "UPDATE Account SET Active = 0 WHERE AccountID = ?";
	
	public static final String GET_UNBLOCK_ACCOUNT = "UPDATE Account SET Active = 1 WHERE AccountID = ?";
	
	public static final String GET_CHECK_PASSWORD = "SELECT * FROM Account WHERE Password = ? AND AccountID = ?";
	
	public static final String INSERT_ACCOUNT = "INSERT INTO Account(Username, Password, CreatedDate, Role, Active)\r\n"
			+ "VALUES(?,?,?,1,1)";
	
	public static final String INSERT_Order = "INSERT INTO [Order] VALUES(?, ?, ?, ?, ?)";
	
	public static final String SELECT_Order_MAX = "select max(OrderID)[mx] from [Order]";
	
	public static final String INSERT_OrderDetail = "INSERT INTO OrderDetail VALUES (?,?,?)";
	
	public static final String LIST_ACCOUNT = "SELECT * FROM Account";
	
	public static final String UPDATE_ACCOUNT = "UPDATE Account SET Username = ?, FullName = ?, Email = ?, PhoneNumber = ?, Avatar = ?\r\n"
			+ "WHERE AccountID = ?\r\n";

	public static final String GET_LIST_ORDER = "SELECT O.Total, OS.Description, P.Image, P.ProductName, P.Price, OD.Quantity, P.ProductID\r\n"
			+ "FROM [Order] O JOIN OrderDetail OD \r\n"
			+ "ON O.OrderID = OD.OrderID JOIN OrderStatus OS \r\n"
			+ "ON OS.ID = O.StatusId JOIN Product P\r\n"
			+ "ON P.ProductId = OD.ProductId\r\n"
			+ "WHERE O.AccountId = ?";
	
	public static final String GET_LIST_ORDER_BY_PENDING = "SELECT O.Total, OS.Description, P.Image, P.ProductName, P.Price, OD.Quantity, P.ProductID\r\n"
			+ "FROM [Order] O JOIN OrderDetail OD \r\n"
			+ "ON O.OrderID = OD.OrderID JOIN OrderStatus OS \r\n"
			+ "ON OS.ID = O.StatusId JOIN Product P\r\n"
			+ "ON P.ProductId = OD.ProductId\r\n"
			+ "WHERE O.AccountId = ? AND OS.Description like 'Pending'";
	
	public static final String GET_LIST_ORDER_BY_COMPLETED = "SELECT O.Total, OS.Description, P.Image, P.ProductName, P.Price, OD.Quantity, P.ProductID\r\n"
			+ "FROM [Order] O JOIN OrderDetail OD \r\n"
			+ "ON O.OrderID = OD.OrderID JOIN OrderStatus OS \r\n"
			+ "ON OS.ID = O.StatusId JOIN Product P\r\n"
			+ "ON P.ProductId = OD.ProductId\r\n"
			+ "WHERE O.AccountId = ? AND OS.Description like 'Completed'";
	
	public static final String GET_LIST_DEPARTMENTS = "with x as (select ROW_NUMBER() over (order by [DepartmentID]) as r,\r\n"
			+ "DepartmentID, DepartmentName, DepartmentDesc \r\n"
			+ "from Department)\r\n"
			+ "select x.DepartmentID, x.DepartmentName, x.DepartmentDesc\r\n"
			+ "from x where r between ?*6-5 and ?*6";
	
	public final static String GET_DELETE_DEPARTMENTS = "DELETE Department WHERE DepartmentID = ?";
	
	public final static String GET_DELETE_AccountID = "DELETE Account WHERE AccountID = ?";
	
	public final static String GET_INSERT_DEPARTMENTS = "INSERT INTO Department VALUES(?,?)";
	
	public final static String GET_COUNT_DEPARTMENTS = "SELECT COUNT (*) FROM Department";
	
	public static final String GET_LIST_ACCOUNT = "with x as (select ROW_NUMBER() over (order by [AccountID]) as r,\r\n"
			+ "AccountID, Username, Fullname, Email \r\n"
			+ "from Account Where Active = 1)\r\n"
			+ "select x.AccountID, x.Username, x.Fullname, x.Email\r\n"
			+ "from x where r between ?*6-5 and ?*6";
	
	public static final String GET_LIST_ACCOUNT_BLOCK = "with x as (select ROW_NUMBER() over (order by [AccountID]) as r,\r\n"
			+ "AccountID, Username, Fullname, Email \r\n"
			+ "from Account Where Active = 0)\r\n"
			+ "select x.AccountID, x.Username, x.Fullname, x.Email\r\n"
			+ "from x where r between ?*6-5 and ?*6";
	
	public final static String GET_COUNT_ACCOUNT = "SELECT COUNT (*) FROM Account WHERE Active = 1";
	
	public final static String GET_COUNT_ACCOUNT_BLOCK = "SELECT COUNT (*) FROM Account WHERE Active = 0";
}
